package com.zh.Controller.admin;

import com.github.pagehelper.PageInfo;
import com.zh.Controller.BaseController;
import com.zh.pojo.ExamClass;
import com.zh.pojo.Grade;
import com.zh.pojo.MsgItem;
import com.zh.pojo.User;
import com.zh.service.ExamclassService;
import com.zh.service.GradeService;
import com.zh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 用户管理
 * @author hspcadmin
 *
 */
@Controller
public class AdminController extends BaseController {

	@Autowired
	UserService userService;
	@Autowired
	GradeService gradeService;

	@Autowired
	private ExamclassService classService;

	//跳转到登录页面
	@RequestMapping("/admin/toLogin.action")
	public String toLogin(){
		return "/admin/login.jsp";
	}

	@RequestMapping("/admin/userLogin.action")
	public String checkUser(User user, Model model, HttpSession session){
		//先对user进行检查
		User loginUser = userService.login(user);

		//已经登陆过的，直接登陆进去
		if(session.getAttribute("adminName")!= null){
			return "/admin/index.jsp";
		}

		//不为空就进去
		if(loginUser!=null && loginUser.getUserType() == 2){
			session.setAttribute("adminName", loginUser.getUserName());
			return "/admin/index.jsp";
		}//查不到就是空的，就是假的，或者不是管理员
		else{
			model.addAttribute("message", "用户名或密码输入错误！！！");
			return "/admin/login.jsp";
		}
	}
	
	/**
	 * 判断账户信息是否存在
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/checkAccount.action")
	public String checkAccount(String userId, Model model){
		User userInfo = userService.get(userId);
		if(userInfo!= null){
			model.addAttribute("message", "该账号已经存在");
		}else{
			model.addAttribute("message", "<font color='green'>验证通过</font>");
		}
		model.addAttribute("userId", userId);
		return "/admin/info-reg.jsp";
	}
	
	/**
	 * ajax验证用户账号是否存在
	 * @param userId
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/userRegist.action")
	@ResponseBody
	public MsgItem userRegist(String userId, Model model, HttpSession session){
		MsgItem msgItem = new MsgItem();
		User user = userService.get(userId);
		if(user!=null){
			msgItem.setErrorNo("1");
			msgItem.setErrorInfo("账号已经存在");
		}else{
			msgItem.setErrorNo("0");
			msgItem.setErrorInfo("<font color='green'>验证通过</font>");
		}
		return msgItem;
	} 
	
	//跳转到登录页面
	@RequestMapping("/admin/exitSys.action")
	public String exitSys(User user, Model model, HttpSession session){
		if(session.getAttribute("adminName")!= null){
			session.removeAttribute("adminName");
			session.invalidate();
		}
		return "/admin/login.jsp";			
	}
	
	//跳转到题库录入页面
	@RequestMapping(value="/admin/toQueDep.action",method= RequestMethod.POST)
	public String toQueDep(Model model, HttpSession session){
		return "/admin/info-reg.jsp";			
	}
	
	//获取所有的用户信息
	@RequestMapping("/admin/getAllUser.action")
	public String getAllUserInfo(@RequestParam(value="page", defaultValue="1") int page, Model model, HttpSession session){
//		List<User> dataList = userService.find(user);
		PageInfo<User> pageInfo = userService.findByPage(page, 5);
		//假如是学生，应该可以查询班级命名，有唯一的班级id
		List<User> dataList = pageInfo.getList();
		model.addAttribute("dataList", dataList);
		model.addAttribute("pageInfo", pageInfo);
		return "/admin/info-mgt.jsp";			
	}
	
	//获取所有的用户信息
	@RequestMapping("/admin/qryAllUser.action")
	@ResponseBody
	public List<User> qryAllUser(@RequestParam(value="page", defaultValue="1") int page,
                                 User user, Model model, HttpSession session){
//			List<User> dataList = userService.find(user);
		PageInfo<User> pageInfo = userService.findByPage(page, 5);
		List<User> dataList = pageInfo.getList();
		model.addAttribute("dataList", dataList);
		model.addAttribute("pageInfo", pageInfo);
		return dataList;			
	}
	
	/**
	 * 跳转到添加用户信息页面
	 * @param user
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/toAddUser.action")
	public String toAddUserInfo(User user, Model model){
		//注册用户需要用到这个么？
//		List<User> dataList = userService.find(user);
		model.addAttribute("grade", gradeService.find(new Grade()));
//		model.addAttribute("dataList", dataList);
		return "/admin/info-reg.jsp";			
	}


	/**
	 * 添加用户信息
	 * @param user
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/addUser.action")
	public String addUser(User user, Model model){
		userService.insert(user);
		return "redirect:/admin/getAllUser.action";			
	}
	
	/**
	 * 删除用户信息
	 * @param userId	用户账号，删除多个是，id用逗号分隔开
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/deleteUser.action")
	public String deleteUser(String userId, Model model){
		if(userId != null){
			String ids[] = userId.split(",");
			for(int i=0;i<ids.length;i++){
				userService.delete(ids[i]);
			}
		}
		return "redirect:/admin/getAllUser.action";
	} 
	
	/**
	 * 获取所有待审核信息
	 * @param user
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/getFindPending.action")
	public String findPending(@RequestParam(value="page", defaultValue="1") int page, User user, Model model){
		PageInfo<User> pageInfo = userService.findPendingByPage(user, page, 5);
		List<User> dataList = pageInfo.getList();
		model.addAttribute("dataList", dataList);
		model.addAttribute("pageInfo", pageInfo);
		return "/admin/info-deal.jsp";
	}
	
	//获取所有的用户信息
	@RequestMapping("/admin/qryFindPending.action")
	@ResponseBody
	public List<User> qryFindPending(@RequestParam(value="page", defaultValue="1") int page,
                                     User user, Model model, HttpSession session){
//				List<User> dataList = userService.find(user);
		PageInfo<User> pageInfo = userService.findPendingByPage(user, page, 5);
		List<User> dataList = pageInfo.getList();
		model.addAttribute("dataList", dataList);
		model.addAttribute("pageInfo", pageInfo);
		return dataList;			
	}
	
	/**
	 * 用户身份信息审核(通过)
	 * @param user
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/passinfo.action")
	public String passUserInfo(User user, Model model){
		User us = new User();
		if(user != null){
			String ids[] = user.getUserId().split(",");
			for(int i=0;i<ids.length;i++){
				us.setUserId(ids[i]);
				us.setUserState(1);
				userService.update(us);
			}
		}
		return "redirect:/admin/getFindPending.action";
	}
	
	/**
	 * 用户身份信息审核(不通过)
	 * @param user
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/failinfo.action")
	public String failUserInfo(User user, Model model){
		User us = new User();
		if(user != null){
			String ids[] = user.getUserId().split(",");
			for(int i=0;i<ids.length;i++){
				us.setUserId(ids[i]);
				us.setUserState(2);
				userService.update(us);
			}
		}
		return "redirect:/admin/getFindPending.action";
	}
	
	/**
	 * 跳转到添加用户信息页面
	 * @param user
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/admin/toUpdateUser.action")
	public String toUpdateUser(User user, Model model, HttpSession session){
		String userId = user.getUserId().trim();
		User userInfo = userService.get(userId);
		model.addAttribute("grade", gradeService.find(new Grade()));
		model.addAttribute("user", userInfo);
		return "/admin/info-upd.jsp";			
	}
	
	/**
	 * 用户个人信息查询(信息审核)
	 * @param user
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/admin/toQryUserInfo.action")
	public String toQryUser(User user, Model model, HttpSession session){
		String userId = user.getUserId().trim();
		User userInfo = userService.get(userId);
		model.addAttribute("user", userInfo);
		model.addAttribute("grade", gradeService.find(new Grade()));
		//学生则多返回一个班级信息
		if(userInfo.getUserType() == 0)
		{
			ExamClass examClass = classService.queryClass(userInfo.getClassId());
			model.addAttribute("examClass",examClass);
			return "/admin/info-qrystu.jsp";
		}
		return "/admin/info-qry.jsp";
	}
	
	/**
	 * 用户个人信息查询(信息审核)
	 * @param user
	 * @param model
	 * @param session
	 * @return
	 *//*
	@RequestMapping("/admin/toQryUserInfo.action")
	public String toQryUserInfo(User user, Model model, HttpSession session){
		String userId = user.getUserId().trim();
		User userInfo = userService.get(userId);
		model.addAttribute("user", userInfo);
		model.addAttribute("grade", gradeService.find(new Grade()));
		return "/admin/info-qry.jsp";			
	}*/
	
	/**
	 * 用户个人信息查询(信息管理)
	 * @param user
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/admin/toQryMgUser.action")
	public String toQryMgUser(User user, Model model, HttpSession session){
		String userId = user.getUserId().trim();
		User userInfo = userService.get(userId);
		model.addAttribute("user", userInfo);
		model.addAttribute("grade", gradeService.find(new Grade()));
		return "/admin/info-qry.jsp";			
	}
	
	@RequestMapping("/admin/updateUser.action")
	public String updateUser(User user, Model model){
		userService.update(user);
		return "redirect:/admin/getAllUser.action";			
	}
	
}
