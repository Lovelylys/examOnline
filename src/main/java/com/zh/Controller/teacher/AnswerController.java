package com.zh.Controller.teacher;

import com.github.pagehelper.PageInfo;
import com.zh.dto.AnswerDto;
import com.zh.pojo.*;
import com.zh.service.AbilityService;
import com.zh.service.CourseService;
import com.zh.service.ExamclassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author abs
 * @Date 2019/4/2 - 18:29
 */
@RequestMapping("/answer")
@Controller
public class AnswerController {
    @Autowired
    private AbilityService abilityService;
    @Autowired
    private ExamclassService examclassService;
    @Autowired
    private CourseService courseService;

    @RequestMapping("/toAnswerPage.action")
    public String toResultPage(AnswerDto answerDto, Model model, HttpSession session)
    {
        PageInfo<Ability> pageInfo = abilityService.queryAnswerByClassAndCourse(answerDto,5);
        List<ExamClass> examClasses = examclassService.find(null);
        List<Course> courses = courseService.find(null);
        model.addAttribute("course",courses);
        model.addAttribute("examClass",examClasses);
        model.addAttribute("pageInfo",pageInfo);
        return "/teacher/answer-mgt.jsp";
    }


    /*
	返回paper查询的pageinfo信息
	 */
    @RequestMapping("/queryPageInfoByClassAndCourse.action")
    @ResponseBody
    public PageInfo<Ability> queryPageInfoByClassAndCourse(@RequestBody AnswerDto answerDto)
    {
        PageInfo<Ability> pageInfo = abilityService.queryAnswerByClassAndCourse(answerDto,5);
        return pageInfo;
    }

    /*
    返回paper查询的Question dataList信息
     */
    @RequestMapping("/queryAnswerByClassAndCourse.action")
    @ResponseBody
    public List<Ability> queryAnswerByClassAndCourse(@RequestBody AnswerDto answerDto)
    {
        PageInfo<Ability> pageInfo = abilityService.queryAnswerByClassAndCourse(answerDto,5);
        List<Ability> dataList = pageInfo.getList();
        return dataList;
    }

    @RequestMapping("/qryTestPointScoreByCourseAndStudent.action")
    public String qryTestPointScoreByCourseAndStudent(Ability ability, Model model)
    {
        //根据科目，和用户id，查询其所有考点的得分率，展示在页面上，拿到所有的考点，多表联合查询
        List<Ability> abilities = abilityService.qryTestPointScoreByCourseAndStudent(ability);
        model.addAttribute("answer", abilities);
        return "/teacher/answer-qry.jsp";
    }


    /*
   返回paper查询的pageinfo信息
    */
    @RequestMapping("/queryPageInfoByCourse.action")
    @ResponseBody
    public PageInfo<Ability> queryPageInfoByCourse(@RequestBody AnswerDto answerDto)
    {
        PageInfo<Ability> pageInfo = abilityService.queryAnswerByCourse(answerDto,5);
        return pageInfo;
    }

    /*
    返回paper查询的Question dataList信息
     */
    @RequestMapping("/queryAnswerByCourse.action")
    @ResponseBody
    public List<Ability> queryAnswerByCourse(@RequestBody AnswerDto answerDto)
    {
        PageInfo<Ability> pageInfo = abilityService.queryAnswerByCourse(answerDto,5);
        List<Ability> dataList = pageInfo.getList();
        return dataList;
    }

    @RequestMapping("/qryTestPointScoreByCourseAndStudentFront.action")
    public String qryTestPointScoreByCourseAndStudentFront(Ability ability, Model model){
        //根据科目，和用户id，查询其所有考点的得分率，展示在页面上，拿到所有的考点，多表联合查询
        List<Ability> abilities = abilityService.qryTestPointScoreByCourseAndStudent(ability);
        model.addAttribute("answer", abilities);
        return "/user/answer-qry.jsp";
    }

}
