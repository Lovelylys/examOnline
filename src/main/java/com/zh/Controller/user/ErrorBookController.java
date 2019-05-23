package com.zh.Controller.user;

import com.github.pagehelper.PageInfo;
import com.zh.dto.QuestionDto;
import com.zh.pojo.*;
import com.zh.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/errorBook")
public class ErrorBookController {
	@Autowired
	ErrorBookService bookService;
	@Autowired
	GradeService gradeService;
	@Autowired
	CourseService courseService;
	@Autowired
	TypeService typeService;
	@Autowired
	UserService userService;
	//跳转到我的错题本页面
	@RequestMapping("/toMyBooksPage.action")
	public String toMyBooksPage(QuestionDto questionDto, Model model){
		List<Grade> gradeList = gradeService.find(new Grade());
		List<Course> courseList = courseService.find(new Course());
		List<Type> typeList = typeService.find(new Type());

        PageInfo<ErrorBook> pageInfo = bookService.qryErrorBookByCourseAndType(questionDto,3);
		model.addAttribute("course", courseList);
		model.addAttribute("type", typeList);
		model.addAttribute("pageInfo", pageInfo);
		return "/user/mybooks.jsp";			
	}

	@RequestMapping("/qryPageInfoByCourseAndType.action")
	@ResponseBody
	public PageInfo<ErrorBook> qryPageInfoByCourseAndType(@RequestBody QuestionDto questionDto, HttpSession session)
	{
		String userId = (String)session.getAttribute("userId");
		questionDto.setUserId(userId);
		PageInfo<ErrorBook> pageInfo = bookService.qryErrorBookByCourseAndType(questionDto,3);
		return pageInfo;
	}

	@RequestMapping("/qryErrorBookByCourseAndType.action")
	@ResponseBody
	public List<ErrorBook> qryErrorBookByCourseAndType(@RequestBody QuestionDto questionDto,HttpSession session)
	{
		String userId = (String)session.getAttribute("userId");
		questionDto.setUserId(userId);
		PageInfo<ErrorBook> pageInfo = bookService.qryErrorBookByCourseAndType(questionDto,3);
		List<ErrorBook> list = pageInfo.getList();
		return list;
	}

	//跳转到前台登录页面
	//完全不知道这个方法在搞些什么
	@RequestMapping("/getBooks.action")
	public String getBooks(User user, Model model, HttpSession session){
		List<Grade> gradeList = gradeService.find(new Grade());
		List<Course> courseList = courseService.find(new Course());
		List<Type> typeList = typeService.find(new Type());
		model.addAttribute("grade", gradeList);
		model.addAttribute("course", courseList);
		model.addAttribute("type", typeList);
		return "/user/mybooks.jsp";			
	}
	
}
