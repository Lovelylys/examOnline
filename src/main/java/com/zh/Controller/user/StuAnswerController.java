package com.zh.Controller.user;

import com.github.pagehelper.PageInfo;
import com.zh.dto.AnswerDto;
import com.zh.pojo.Ability;
import com.zh.pojo.Course;
import com.zh.service.AbilityService;
import com.zh.service.CourseService;
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
 * @Date 2019/4/17 - 19:34
 */
@Controller
@RequestMapping("/stuAnswer")
public class StuAnswerController {
    @Autowired
    private AbilityService abilityService;
    @Autowired
    private CourseService courseService;

    /*
        前台学生页面的查询
         */
    @RequestMapping("/toMyAnswerPage.action")
    public String toMyAnswerPage(AnswerDto answerDto, Model model, HttpSession session)
    {
        //根据学生的id，分页找出其所有有过记录的考点能力记录
        String userId = (String)session.getAttribute("userId");
        answerDto.setUserId(userId);
        List<Course> courses = courseService.find(null);
        PageInfo<Ability> pageInfo = abilityService.queryAnswerByCourse(answerDto,5);
        model.addAttribute("course",courses);
        model.addAttribute("pageInfo",pageInfo);
        return "/user/myAnswer.jsp";
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
