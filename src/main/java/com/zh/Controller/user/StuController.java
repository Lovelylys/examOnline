package com.zh.Controller.user;

import com.zh.pojo.Grade;
import com.zh.pojo.MsgItem;
import com.zh.pojo.User;
import com.zh.service.GradeService;
import com.zh.service.UserService;
import com.zh.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/user")
public class StuController {
    @Autowired
    UserService userService;
    @Autowired
    GradeService gradeService;
    //跳转到前台登录页面
    @RequestMapping("/toLogin.action")
    public String toUserLogin( HttpSession session){
        if(session.getAttribute("userName")!= null){
            return "/user/index.jsp";
        }
        return "/user/login.jsp";
    }

    /**
     * 前台用户登录
     * @param session
     * @return
     */
    @RequestMapping("/toIndex.action")
    public String toIndex(HttpSession session){
        if(session.getAttribute("userName")!= null){
            return "/user/index.jsp";
        }else{
            return "forward:/user/toLogin.action";
        }
    }

    /**
     * 用户账号密码检查
     * @param user
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/checkPwd.action")
    @ResponseBody
    public MsgItem checkPwd(User user, Model model, HttpSession session){
        MsgItem item = new MsgItem();
        User loginUser = userService.login(user);
        if(loginUser!=null && loginUser.getUserType() ==0){//type为0是学生
            if(loginUser.getUserState()==0 ){
                item.setErrorNo("1");
                item.setErrorInfo("该账号尚未通过审核!");
            }else{
                item.setErrorNo("0");
                item.setErrorInfo("登录成功!");
                session.setAttribute("userName", loginUser.getUserName());
                session.setAttribute("userId", loginUser.getUserId());
            }
        }else{
            item.setErrorNo("1");
            item.setErrorInfo("账号不存在或用户名密码错误!");
        }
        return item;
    }

    @RequestMapping("/toRegistPage.action")
    public String toRegistPage(Model model){
        List<Grade> list = gradeService.find(new Grade());
        model.addAttribute("grade", list);
        return "/user/regist.jsp";
    }

    /**
     * 添加用户信息
     * @param user
     * @return
     */
    @RequestMapping("/addUserInfo.action")
    public String addUserInfo(User user){
        userService.insert(user);
        return "redirect:/user/toLogin.action";
    }

    //跳转到前台登录页面
    @RequestMapping("/toUserInfo.action")
    public String toUserInfo(User user, Model model, HttpSession session){
        String userId = (String) session.getAttribute("userId");
        user = userService.getStu(userId);
        model.addAttribute("user", user);
        return "/user/userinfo.jsp";
    }

    /**
     * 更新学生信息
     * @param user
     * @return
     */
    @RequestMapping("/updateUserInfo.action")
    public String updateUserInfo(String newPwd,User user){
        if(!newPwd.trim().isEmpty()){
            user.setUserPwd(newPwd);
        }
        userService.update(user);
        return "redirect:/user/toIndex.action";
    }

    //跳转到登录页面
    @RequestMapping("/exitSys.action")
    public String exitSystem(HttpSession session){
        if(session.getAttribute("userName")!= null){
            session.removeAttribute("userName");
            session.removeAttribute("userId");
            session.invalidate();
        }
        return "redirect:/user/toLogin.action";
    }

    //跳转到前台登录页面
    @RequestMapping("/toAbout.action")
    public String toAbout(){
        return "/user/about.jsp";
    }
}
