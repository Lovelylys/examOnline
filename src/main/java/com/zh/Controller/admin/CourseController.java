package com.zh.Controller.admin;

import com.github.pagehelper.PageInfo;
import com.zh.pojo.Course;
import com.zh.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/course")
public class CourseController {

	@Autowired
	CourseService courseService;
	
	/**
	 * 跳转到课程页面
	 * @param course
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/toCoursePage.action")
	public String toCoursePage(@RequestParam(value="page", defaultValue="1") int page,
							   Course course, Model model, HttpSession session){
		//List<Course> dataList = courseService.find(course);
		qryCoursePage(page,course,model);
		return "/admin/course-mgt.jsp";
	}
	
	@RequestMapping("/qryCoursePage.action")
	@ResponseBody
	public List<Course> qryCoursePage(@RequestParam(value="page", defaultValue="1") int page,
                                      Course course, Model model){
		//List<Course> dataList = courseService.find(course);
		PageInfo<Course> pageInfo = courseService.findByPage(course, page, 5);
		List<Course> dataList = pageInfo.getList();
		model.addAttribute("dataList", dataList);
		model.addAttribute("pageInfo", pageInfo);
		return dataList;			
	}
	
	/**
	 * 删除课程信息
	 * @param courseId	课程编号，删除多个时，id用逗号分隔开
	 * @param model
	 * @return
	 */
	@RequestMapping("/deleteCourse.action")
	public String deleteCourse(String courseId, Model model){
		if(courseId != null){
			String ids[] = courseId.split(",");
			for(int i=0;i<ids.length;i++){
				courseService.delete(Integer.parseInt(ids[i]));
			}
		}
		return "redirect:/course/toCoursePage.action";
	} 
	/**
	 * 跳转到添加课程信息页面
	 * @param course
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/toAddCourse.action")
	public String toAddType(Course course, Model model, HttpSession session){
		List<Course> dataList = courseService.find(course);
		model.addAttribute("dataList", dataList);
		return "/admin/course-reg.jsp";			
	}
	
	/**
	 * 添加课程信息
	 * @param model
	 * @return
	 */
	@RequestMapping("/addCourse.action")
	public String addType(Course course, Model model){
		course.setCourseState("0");
		courseService.insert(course);
		return "redirect:/course/toCoursePage.action";
	}
	
	/**
	 * 查看题型信息
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/toQryCourse.action")
	public String toQryType(int courseId, Model model, HttpSession session){
		Course courseInfo = courseService.get(courseId);
		model.addAttribute("course", courseInfo);
		return "/admin/course-qry.jsp";			
	}
	
	/**
	 * 跳转到更新题型信息页面
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/toUpdCourse.action")
	public String toUpdType(int courseId, Model model, HttpSession session){
		Course courseInfo = courseService.get(courseId);
		model.addAttribute("course", courseInfo);
		return "/admin/course-upd.jsp";			
	}
	
	/**
	 * 更新题型信息
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/updCourse.action")
	public String updType(Course course, Model model, HttpSession session){
		courseService.update(course);
		return "redirect:/course/toCoursePage.action";
	}
	
	/**
	 * 删除题型信息
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/delCourse.action")
	public String delCourse(int courseId, Model model, HttpSession session){
		courseService.delete(courseId);
		return "redirect:/course/toCoursePage.action";
	}
	
}
