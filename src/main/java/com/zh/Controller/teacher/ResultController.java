package com.zh.Controller.teacher;

import com.github.pagehelper.PageInfo;
import com.zh.dto.ResultDto;
import com.zh.pojo.Course;
import com.zh.pojo.ExamClass;
import com.zh.pojo.Paper;
import com.zh.pojo.Result;
import com.zh.service.CourseService;
import com.zh.service.ExamclassService;
import com.zh.service.ResultService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author abs
 * @Date 2019/4/2 - 18:29
 */
@RequestMapping("/result")
@Controller
public class ResultController {
    @Autowired
    private ResultService resultService;
    @Autowired
    private ExamclassService examclassService;
    @Autowired
    private CourseService courseService;

    @RequestMapping("/toResultPage.action")
    public String toResultPage(ResultDto resultDto,Model model, HttpSession session)
    {
        String teacherId = (String)session.getAttribute("teacherId");
        resultDto.setTeacherId(teacherId);
        PageInfo<Paper> pageInfo = resultService.queryResultByClassAndCourse(resultDto,5);
        List<ExamClass> examClasses = examclassService.find(null);
        List<Course> courses = courseService.find(null);
        model.addAttribute("course",courses);
        model.addAttribute("examClass",examClasses);
        model.addAttribute("pageInfo",pageInfo);
        return "/teacher/result-mgt.jsp";
    }


    /*
	返回paper查询的pageinfo信息
	 */
    @RequestMapping("/queryPageInfoByClassAndCourse.action")
    @ResponseBody
    public PageInfo<Paper> queryPageInfoByClassAndCourse(@RequestBody ResultDto resultDto, HttpSession session)
    {
        String teacherId = (String)session.getAttribute("teacherId");
        resultDto.setTeacherId(teacherId);
        PageInfo<Paper> pageInfo = resultService.queryResultByClassAndCourse(resultDto,5);
        return pageInfo;
    }

    /*
    返回paper查询的Question dataList信息
     */
    @RequestMapping("/queryResultByClassAndCourse.action")
    @ResponseBody
    public List<Paper> queryResultByClassAndCourse(@RequestBody ResultDto resultDto,HttpSession session)
    {
        String teacherId = (String)session.getAttribute("teacherId");
        resultDto.setTeacherId(teacherId);
        PageInfo<Paper> pageInfo = resultService.queryResultByClassAndCourse(resultDto,5);
        List<Paper> dataList = pageInfo.getList();
        return dataList;
    }

}
