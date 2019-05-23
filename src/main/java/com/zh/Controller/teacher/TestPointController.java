package com.zh.Controller.teacher;

import com.github.pagehelper.PageInfo;
import com.zh.dto.TestPointDto;
import com.zh.pojo.Course;
import com.zh.pojo.Grade;
import com.zh.pojo.TestPoint;
import com.zh.service.CourseService;
import com.zh.service.GradeService;
import com.zh.service.TestPointService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author abs
 * @Date 2019/3/25 - 15:57
 */
@Controller
@RequestMapping("/testPoint")
public class TestPointController {

    @Autowired
    private TestPointService testPointService;
    @Autowired
    private GradeService gradeService;
    @Autowired
    private CourseService courseService;

    @RequestMapping("/toTestPointPage.action")
    public String toTestPointPage(TestPointDto testPointDto,Model model)
    {
        List<Grade> grades = gradeService.find(null);
        List<Course> courses = courseService.find(null);
        model.addAttribute("grade",grades);
        model.addAttribute("course",courses);
        PageInfo<TestPoint> pageInfo = testPointService.qryTestPointByCourseAndGrade(testPointDto,5);
        model.addAttribute("pageInfo",pageInfo);
        return "/teacher/testPoint-mgt.jsp";
    }

    @RequestMapping("/qryTestPointByCourseAndGrade.action")
    @ResponseBody
    public List<TestPoint> qryTestPointByCourseAndGrade(@RequestBody TestPointDto testPointDto, Model model)
    {

        PageInfo<TestPoint> pageInfo = testPointService.qryTestPointByCourseAndGrade(testPointDto,5);
        List<TestPoint> dataList = pageInfo.getList();

        return dataList;
    }

//    这里存在一个问题，正常通过model设置同一个属性pageInfo，不能起到效果，仍然会调用上一个pageInfo的值，所以通过ajax请求的方式返回最新的值
//    为什么ajax的请求，model的这些代码不会起到效果，除此之外，还不能覆盖掉一样的属性
    @RequestMapping("/qryPageInfoByCourseAndGrade.action")
    @ResponseBody
    public PageInfo<TestPoint> qryPageInfoByCourseAndGrade(@RequestBody TestPointDto testPointDto,Model model)
    {

        PageInfo<TestPoint> pageInfo = testPointService.qryTestPointByCourseAndGrade(testPointDto,5);
        return pageInfo;
    }
    /*
    删除单个的考点信息
     */
    @RequestMapping("/delTestPoint.action")
    public String delType(int testPointId){
        testPointService.delete(testPointId);
        return "redirect:/testPoint/toTestPointPage.action";
    }
    /*
    批量删除多个考点信息
     */
    @RequestMapping("/deleteTestPoint.action")
    public String deleteUser(String testPointId){
        if(testPointId != null){
            String ids[] = testPointId.split(",");
            for(int i=0;i<ids.length;i++){
                testPointService.delete(Integer.parseInt(ids[i]));
            }
        }
        return "redirect:/testPoint/toTestPointPage.action";
    }

    @RequestMapping("/toAddTestPoint.action")
    public String toAddTestPoint(Model model)
    {
        List<Grade> grades = gradeService.find(null);
        List<Course> courses = courseService.find(null);
        model.addAttribute("grade",grades);
        model.addAttribute("course",courses);
        return "/teacher/testPoint-reg.jsp";
    }

    /*
    增加考点
     */
    @RequestMapping("/addTestPoint.action")
    public String addTestPoint(TestPoint testPoint)
    {
        testPointService.insert(testPoint);
        return "redirect:/testPoint/toTestPointPage.action";
    }

    /*
    更新考点信息
     */
    @RequestMapping("/toUpdTestPoint.action")
    public String toUpdTestPoint(String testPointId,Model model)
    {
        TestPoint testPoint = testPointService.get(testPointId);
        model.addAttribute("testPoint",testPoint);

        List<Grade> grades = gradeService.find(null);
        List<Course> courses = courseService.find(null);
        model.addAttribute("grade",grades);
        model.addAttribute("course",courses);
        return "/teacher/testPoint-upd.jsp";
    }

    /**
     * 更新考点信息
     * @return
     */
    @RequestMapping("/updTestPoint.action")
    public String updType(TestPoint testPoint){
        testPointService.update(testPoint);
        return "redirect:/testPoint/toTestPointPage.action";
    }
}
