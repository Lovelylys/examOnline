package com.zh.Controller.admin;

import com.github.pagehelper.PageInfo;
import com.zh.pojo.ExamClass;
import com.zh.pojo.Grade;
import com.zh.service.ExamclassService;
import com.zh.service.GradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author abs
 * @Date 2019/3/24 - 11:35
 */
@Controller
@RequestMapping("/examClass")
public class ClassController{

    @Autowired
    private ExamclassService examclassService;

    @Autowired
    private GradeService gradeService;

    @RequestMapping("/queryClassByGradeId")
    @ResponseBody
    private List<ExamClass> queryClassByGradeId(String gradeId)
    {
        return examclassService.queryClassByGradeId(gradeId);
    }

    @RequestMapping("/toClassPage")
    private String toClassPage(@RequestParam(value="page", defaultValue="1") int page,
                                ExamClass examClass, Model model){
        //List<Course> dataList = courseService.find(course);
        qryClassPage(page,examClass,model);
        return "/admin/examClass-mgt.jsp";
    }

    @RequestMapping("/qryClassPage.action")
    @ResponseBody
    public List<ExamClass> qryClassPage(@RequestParam(value="page", defaultValue="1") int page,
                                         ExamClass examClass, Model model){
        //List<Course> dataList = courseService.find(course);
        PageInfo<ExamClass> pageInfo = examclassService.findByPage(examClass, page, 5);
        List<ExamClass> dataList = pageInfo.getList();
        model.addAttribute("dataList", dataList);
        model.addAttribute("pageInfo", pageInfo);
        return dataList;
    }

    /**
     * 删除班级信息
     */
    @RequestMapping("/deleteClass.action")
    public String deleteCourse(String id, Model model){
        if(id != null){
            String ids[] = id.split(",");
            for(int i=0;i<ids.length;i++){
                examclassService.delete(Integer.parseInt(ids[i]));
            }
        }
        return "redirect:/examClass/toClassPage.action";
    }
    /**
     * 跳转到添加班级信息页面
     * @param model
     * @return
     */
    @RequestMapping("/toAddClass.action")
    public String toAddType(ExamClass examClass, Model model){
        List<Grade> dataList = gradeService.find(null);
        model.addAttribute("dataList", dataList);
        return "/admin/examClass-reg.jsp";
    }

    /**
     * 添加班级信息
     * @return
     */
    @RequestMapping("/addClass.action")
    public String addType(ExamClass examClass){
        examclassService.insert(examClass);
        return "redirect:/examClass/toClassPage.action";
    }

    /**
     * 跳转到更新班级信息页面
     * @param model
     * @return
     */
    @RequestMapping("/toUpdClass.action")
    public String toUpdType(int id, Model model){
        List<Grade> dataList = gradeService.find(null);
        ExamClass examClass = examclassService.get(id);
        model.addAttribute("examClass", examClass);
        model.addAttribute("dataList",dataList);
        return "/admin/examClass-upd.jsp";
    }

    /**
     * 更新题型信息
     * @param model
     * @return
     */
    @RequestMapping("/updClass.action")
    public String updType(ExamClass examClass, Model model){
        examclassService.update(examClass);
        return "redirect:/examClass/toClassPage.action";
    }

    /**
     * 删除题型信息
     * @param model
     * @return
     */
    @RequestMapping("/delClass.action")
    public String delCourse(int id, Model model){
        examclassService.delete(id);
        return "redirect:/examClass/toClassPage.action";
    }
}
