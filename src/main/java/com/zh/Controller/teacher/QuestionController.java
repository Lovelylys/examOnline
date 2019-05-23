package com.zh.Controller.teacher;

import com.github.pagehelper.PageInfo;
import com.zh.Controller.BaseController;
import com.zh.dto.AddQuestionDto;
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
import java.util.Arrays;
import java.util.List;

/**
 * 题库管理
 * @author hspcadmin
 *
 */
@Controller
@RequestMapping("/question")
public class QuestionController extends BaseController {

	@Autowired
	QuestionService questionService;
	@Autowired
	CourseService courseService;
	@Autowired
	TypeService typeService;
	@Autowired
	GradeService gradeService;
	@Autowired
    TestPointService testPointService;
	/**
	 * 跳转到题库管理页面
	 * @param model
	 * @return
	 */
	@RequestMapping("/toQuestionPage.action")
	public String toQuestionPage(QuestionDto questionDto, Model model){
		List<Course> courses = courseService.find(null);
		List<Type> types = typeService.find(null);
        PageInfo<Question> pageInfo = questionService.qryQuestionByCourseAndType(questionDto,5);
        model.addAttribute("course",courses);
        model.addAttribute("type",types);
		model.addAttribute("pageInfo", pageInfo);
		return "/teacher/question-mgt.jsp";
	}

	/*
	返回题库查询的pageinfo信息
	 */
	@RequestMapping("/qryPageInfoByCourseAndType.action")
	@ResponseBody
	public PageInfo<Question> qryPageInfoByCourseAndType(@RequestBody QuestionDto questionDto,Model model)
	{
		PageInfo<Question> pageInfo = questionService.qryQuestionByCourseAndType(questionDto,5);
		return pageInfo;
	}

	/*
	返回题库查询的Question dataList信息
	 */
	@RequestMapping("/qryQuestionByCourseAndType.action")
	@ResponseBody
	public List<Question> qryQuestionByCourseAndType(@RequestBody QuestionDto questionDto,Model model)
	{
		PageInfo<Question> pageInfo = questionService.qryQuestionByCourseAndType(questionDto,5);
		List<Question> dataList = pageInfo.getList();
		return dataList;
	}

	
	/**
	 * 删除问题信息
	 * @param questionId	问题编号，删除多个是，id用逗号分隔开
	 * @param model
	 * @return
	 */
	@RequestMapping("/deleteQuestion.action")
	public String deleteQuestion(String questionId, Model model){
		if(questionId != null){
			String ids[] = questionId.split(",");
			for(int i=0;i<ids.length;i++){
				questionService.delete(Integer.parseInt(ids[i]));
			}
		}
		return "redirect:/question/toQuestionPage.action";
	} 
	/**
	 * 跳转到添加试题信息页面
	 * @param question
	 * @param model
	 * @return
	 */
	@RequestMapping("/toAddQuestion.action")
	public String toAddQuestion(Question question, Model model){
		//获取问题信息
		List<Question> dataList = questionService.find(question);
		//获取课程信息
		List<Course> courseList = courseService.find(new Course());
		//获取题型信息
		model.addAttribute("type", typeService.find(new Type()));
		model.addAttribute("dataList", dataList);
		model.addAttribute("course", courseList);
		return "/teacher/question-reg.jsp";
	}

	/*
	查询得到第一层的考点信息
	 */
    @RequestMapping("/qryFirstTestPointByCourse.action")
    @ResponseBody
	public List<TestPoint> qryFirstTestPointByCourse(String courseId)
    {
        List<TestPoint> testPoints = testPointService.qryFirstTestPointByCourse(courseId);
        return testPoints;
    }
    /*
    查询得到第二层的考点
     */
    @RequestMapping("/qrySecondTestPointByFirst.action")
    @ResponseBody
    public List<TestPoint> qrySecondTestPointByFirst(String firstTestPoint)
    {
        String[] firstTestPoints = firstTestPoint.trim().split(",");
        List<TestPoint> testPoints = testPointService.qrySecondTestPointByFirst(firstTestPoints);
        return testPoints;
    }
    /*
    查询拿到第三层的考点
     */
    @RequestMapping("/qryThirdTestPointBySecond.action")
    @ResponseBody
    public List<TestPoint> qryThirdTestPointBySecond(String secondTestPoint)
    {
        String[] secondTestPoints = secondTestPoint.trim().split(",");
        List<TestPoint> testPoints = testPointService.qryThirdTestPointBySecond(secondTestPoints);
        return testPoints;
    }
	/**
	 * 添加试题信息
	 * @param model
	 * @return
	 */
	@RequestMapping("/addQuesInfo.action")
	public String addQuesInfo(AddQuestionDto addQuestionDto, Model model){
        //拿到所有的考点id，放在问题中
		addQuestionDto = dealingWithAddQuestionDto(addQuestionDto);
		questionService.insert(addQuestionDto);
		return "redirect:/question/toQuestionPage.action";
	}
	
	/**
	 * 查看问题信息
	 * @param questionId 问题编号
	 * @param model
	 * @return
	 */
	@RequestMapping("/toQryQuestion.action")
	public String toQryQuestion(int questionId, Model model){
		Question questionInfo = questionService.get(questionId);
		String[] ids = questionInfo.getTestPointId().split(",");
		List<TestPoint> testPoints = testPointService.qryTestPointByIds(ids);
		model.addAttribute("testPoints",testPoints);
		model.addAttribute("question", questionInfo);
		return "/teacher/question-qry.jsp";
	}
	
	/**
	 * 跳转到更新题目信息页面
	 * @param model
	 * @return
	 */
	@RequestMapping("/toUpdQuestion.action")
	public String toUpdQuestion(int questionId, Model model){
		Question questionInfo = questionService.get(questionId);
		model.addAttribute("question", questionInfo);
		List<Course>courseList = courseService.find(new Course());
		List<Type> typeList = typeService.find(new Type());
		model.addAttribute("courseList", courseList);
		model.addAttribute("typeList", typeList);
		return "/teacher/question-upd.jsp";
	}
	
	/**
	 * 更新题目信息
	 * @return
	 */
	@RequestMapping("/updQuestion.action")
	public String updQuestion(AddQuestionDto addQuestionDto){
		addQuestionDto = dealingWithAddQuestionDto(addQuestionDto);
		questionService.update(addQuestionDto);
		return "redirect:/question/toQuestionPage.action";
	}

	private AddQuestionDto dealingWithAddQuestionDto(AddQuestionDto addQuestionDto) {
		//拿到所有的考点id，放在问题中
		addQuestionDto.setFirstTestPoints(addQuestionDto.getFirstTestPoint().split(","));
		String secondTestPoint = addQuestionDto.getSecondTestPoint();
		String thirdTestPoint = addQuestionDto.getThirdTestPoint();
		if (secondTestPoint != null) {
			addQuestionDto.setSecondTestPoints(addQuestionDto.getSecondTestPoint().split(","));
		}
		if (thirdTestPoint != null) {
			addQuestionDto.setThirdTestPoints(addQuestionDto.getThirdTestPoint().split(","));
		}
		List<TestPoint> testPoints = testPointService.qryTestPointByPointNames(addQuestionDto);
		//拼接考点，和难度信息，然后新增问题
		String testPointId = "";
		Integer difficulty = 0;
		for (TestPoint t : testPoints) {
			testPointId += t.getId();
			testPointId += ",";
			difficulty += t.getDifficulty();
		}
		testPointId = testPointId.substring(0, testPointId.length() - 1);
		addQuestionDto.setTestPointId(testPointId);
		addQuestionDto.setDifficulty(difficulty);
		return addQuestionDto;
	}

	/**
	 * 删除问题信息
	 * @return
	 */
	@RequestMapping("/delQuestion.action")
	public String delQuestion(int questionId){
		questionService.delete(questionId);
		return "redirect:/question/toQuestionPage.action";
	}
}
