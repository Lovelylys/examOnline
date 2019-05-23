package com.zh.Controller.admin;

import com.github.pagehelper.PageInfo;
import com.zh.pojo.Course;
import com.zh.pojo.Grade;
import com.zh.service.CourseService;
import com.zh.service.GradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/grade")
public class GradeController {

	@Autowired
	GradeService gradeService;
	@Autowired
	CourseService courseService;
	
	/**
	 * 跳转到年级页面
	 * @return
	 */
	@RequestMapping("/toGradePage.action")
	public String toGradePage(@RequestParam(value="page", defaultValue="1") int page,Grade grade,Model model){
		qryAllGrade(page,grade,model);
		return "/admin/grade-mgt.jsp";
	}
	
	@RequestMapping("/qryAllGrade.action")
	@ResponseBody
	public List<Grade> qryAllGrade(@RequestParam(value="page", defaultValue="1") int page,
                                   Grade grade, Model model){
//		List<Grade> dataList = gradeService.find(grade);
		PageInfo<Grade> pageInfo = gradeService.findByPage(grade, page, 5);
		List<Grade> dataList = pageInfo.getList();
		Course course=null;
		for(Grade g : dataList){
			String courseName= "";
			String id = g.getCourseId();
			if(id != null){
				String ids[] = id.split(",");
				for(int i=0;i<ids.length;i++){
					course = courseService.get(Integer.parseInt(ids[i]));
					courseName+=course.getCourseName()+",";
				}
			}
			//判断最后一个字符是否为逗号，若是截取
			String str = courseName.substring(courseName.length() -1, courseName.length());
			if(",".equals(str)){
				str = courseName.substring(0, courseName.length()-1);
			}else{
				str = courseName;
			}
			g.setCourseId(str);
		}
		model.addAttribute("dataList", dataList);
		model.addAttribute("pageInfo", pageInfo);
		return dataList;			
	}
	
	/**
	 * 删除年级信息
	 * @param gradeId	年级编号，删除多个是，id用逗号分隔开
	 * @param model
	 * @return
	 */
	@RequestMapping("/deleteGrade.action")
	public String deleteGrade(String gradeId, Model model){
		if(gradeId != null){
			String ids[] = gradeId.split(",");
			for(int i=0;i<ids.length;i++){
				gradeService.delete(Integer.parseInt(ids[i]));
			}
		}
		return "redirect:/grade/toGradePage.action";
	} 
	/**
	 * 跳转到添加年级信息页面
	 * @param model
	 * @return
	 */
	@RequestMapping("/toAddGrade.action")
	public String toAddGrade(Course course, Model model){
		List<Course> dataList = courseService.find(course);
		model.addAttribute("dataList", dataList);
		return "/admin/grade-reg.jsp";			
	}
	
	/**
	 * 添加年级信息
	 * @param model
	 * @return
	 */
	@RequestMapping("/addGrade.action")
	public String addType(Grade grade, Model model){
		gradeService.insert(grade);
		return "redirect:/grade/toGradePage.action";
	}

	/**
	 * 跳转到更新年级信息页面
	 * @param model
	 * @return
	 */
	@RequestMapping("/toUpdGrade.action")
	public String toUpdGrade(int gradeId, Model model){
		Grade gradeInfo = gradeService.get(gradeId);
		List<Course> dataList = courseService.find(null);
		model.addAttribute("dataList", dataList);
		model.addAttribute("grade", gradeInfo);
		return "/admin/grade-upd.jsp";			
	}
	
	/**
	 * 更新年级信息
	 * @return
	 */
	@RequestMapping("/updGrade.action")
	public String updGrade(Grade grade){
		gradeService.update(grade);
		return "redirect:/grade/toGradePage.action";
	}
	
	/**
	 * 删除年级信息
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/delGrade.action")
	public String delGrade(int gradeId, Model model, HttpSession session){
		gradeService.delete(gradeId);
		return "redirect:/grade/toGradePage.action";
	}
}
