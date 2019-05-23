package com.zh.Controller.teacher;

import com.zh.pojo.Grade;
import com.zh.pojo.Paper;
import com.zh.pojo.User;
import com.zh.service.GradeService;
import com.zh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author abs
 * @Date 2019/3/21 - 19:48
 */
@Controller
@RequestMapping("/teacher")
public class TeacherController {

    @Autowired
    private UserService userService;
    @Autowired
    private GradeService gradeService;

    @RequestMapping("/toLogin.action")
    private String toLogin(HttpSession session)
    {
        if(session.getAttribute("teacherName")!=null)
        {
            return "/teacher/main.jsp";
        }
        return "/teacher/login.jsp";
    }

    @RequestMapping("/userLogin.action")
    private String login(User user, HttpSession session, Model model)
    {
        //先对user进行检查
        User loginUser = userService.login(user);

        //已经登陆过的，直接登陆进去
        if(session.getAttribute("teacherName")!= null){
            return "/teacher/index.jsp";
        }

        //不为空就进去
        if(loginUser!=null && loginUser.getUserType() == 1){
            session.setAttribute("teacherName", loginUser.getUserName());
            session.setAttribute("teacherId", loginUser.getUserId());
            return "/teacher/index.jsp";
        }//查不到就是空的，就是假的，或者不是教师
        else{
            model.addAttribute("message", "用户名或密码输入错误！！！");
            return "/teacher/login.jsp";
        }
    }

    @RequestMapping("/toRegistPage.action")
    public String toRegistPage(Model model, HttpSession session){
        List<Grade> list = gradeService.find(new Grade());
        model.addAttribute("grade", list);
        return "/teacher/regist.jsp";
    }

    /**
     * 添加用户信息
     * @param user
     * @param model
     * @return
     */
    @RequestMapping("/addUserInfo.action")
    public String addUserInfo(User user, Model model, HttpSession session){
        userService.insert(user);
        return "redirect:/teacher/toLogin.action";
    }

    //跳转到登录页面
    @RequestMapping("/exitSys.action")
    public String exitSys(User user, Model model, HttpSession session){
        if(session.getAttribute("teacherName")!= null){
            session.removeAttribute("teacherName");
            session.removeAttribute("teacherId");
            session.invalidate();
        }
        return "/teacher/login.jsp";
    }

    //根据班级id查询所有的用户，即学生
    @RequestMapping("/qryStudentsByClassId.action")
    @ResponseBody
    public List<User> qryStudentsByClassId(@RequestParam("classId")String classId)
    {
        List<User> students= userService.qryStudentsByClassId(classId);
        return students;
    }
}
