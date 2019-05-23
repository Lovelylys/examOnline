package com.zh.Controller.teacher;

import com.github.pagehelper.PageInfo;
import com.zh.dto.PaperDto;
import com.zh.pojo.Course;
import com.zh.pojo.ExamClass;
import com.zh.pojo.Grade;
import com.zh.pojo.Paper;
import com.zh.service.CourseService;
import com.zh.service.ExamclassService;
import com.zh.service.GradeService;
import com.zh.service.PaperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author abs
 * @Date 2019/4/1 - 21:05
 */
@RequestMapping("/exam")
@Controller
public class ExamController {

    @Autowired
    private PaperService paperService;
    @Autowired
    GradeService gradeService;
    @Autowired
    CourseService courseService;
    @Autowired
    ExamclassService examclassService;

    /*
    多写一个查询方法，还要查询状态为1的试卷
     */
    @RequestMapping("/toExamPage.action")
    public String toExamPage(PaperDto paperDto, Model model, HttpSession session)
    {
        String teacherId = (String)session.getAttribute("teacherId");
        paperDto.setTeacherId(teacherId);
        PageInfo<Paper> pageInfo = paperService.queryPaperByCourseAndGrade(paperDto, 5);
        List<Course> courses = courseService.find(null);
        List<Grade> grades = gradeService.find(null);
        List<ExamClass> examClasses = examclassService.find(null);
        model.addAttribute("examClass",examClasses);
        model.addAttribute("course",courses);
        model.addAttribute("grade",grades);
        model.addAttribute("pageInfo", pageInfo);
        return "/teacher/exam-mgt.jsp";
    }
}
