package com.zh.Controller.teacher;

import com.github.pagehelper.PageInfo;
import com.zh.dto.AddPaperDto;
import com.zh.dto.AddQuestionDto;
import com.zh.dto.PaperDto;
import com.zh.pojo.*;
import com.zh.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/paper")
public class PaperController {

	@Autowired
	PaperService paperService;
	@Autowired
	CourseService courseService;
	@Autowired
	TypeService typeService;
	@Autowired
	GradeService gradeService;
	@Autowired
	QuestionService questionService;
	@Autowired
	TestPointService testPointService;
	@Autowired
    ExamclassService examclassService;

	@InitBinder
	public void init(WebDataBinder dataBinder){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		sdf.setLenient(false);
		dataBinder.registerCustomEditor(Date.class,new CustomDateEditor(sdf,false));
	}
	/**
	 * 跳转到试卷管理页面
	 * @param model
	 * @return
	 */
	@RequestMapping("/toPaperPage.action")
	public String toPaperPage(PaperDto paperDto, Model model,HttpSession session){
		String teacherId = (String)session.getAttribute("teacherId");
		paperDto.setTeacherId(teacherId);
		PageInfo<Paper> pageInfo = paperService.queryPaperByCourseAndGrade(paperDto, 5);
		List<Course> courses = courseService.find(null);
		List<Grade> grades = gradeService.find(null);
		model.addAttribute("course",courses);
		model.addAttribute("grade",grades);
		model.addAttribute("pageInfo", pageInfo);
		return "/teacher/paper-mgt.jsp";
	}

	/*
	返回paper查询的pageinfo信息
	 */
	@RequestMapping("/queryPageInfoByCourseAndGrade.action")
	@ResponseBody
	public PageInfo<Paper> queryPageInfoByCourseAndGrade(@RequestBody PaperDto paperDto,HttpSession session)
	{
		String teacherId = (String)session.getAttribute("teacherId");
		paperDto.setTeacherId(teacherId);
		PageInfo<Paper> pageInfo = paperService.queryPaperByCourseAndGrade(paperDto,5);
		return pageInfo;
	}

	/*
	返回paper查询的Question dataList信息
	 */
	@RequestMapping("/queryPaperByCourseAndGrade.action")
	@ResponseBody
	public List<Paper> queryPaperByCourseAndGrade(@RequestBody PaperDto paperDto,HttpSession session)
	{
        String teacherId = (String)session.getAttribute("teacherId");
        paperDto.setTeacherId(teacherId);
		PageInfo<Paper> pageInfo = paperService.queryPaperByCourseAndGrade(paperDto,5);
		List<Paper> dataList = pageInfo.getList();
		return dataList;
	}
	/**
	 * 跳转到新增试卷页面
	 * @param paper
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/toAddPaperPage.action")
	public String toAddPaperPage(Paper paper, Model model, HttpSession session){
		model.addAttribute("course", courseService.find(new Course()));
		model.addAttribute("grade", gradeService.find(new Grade()));
		model.addAttribute("type", typeService.find(new Type()));
		return "/teacher/paper-reg.jsp";
	}
	
	/**
	 * 新增试卷
	 * @param model
	 * @param session
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/addPaper.action")
	public String addPaper(AddPaperDto addPaperDto, Model model, HttpSession session){
		//拿到考核的所有考点信息，编号
		List<TestPoint> testPoints = dealingWithAddAddPaperDto(addPaperDto);
		//针对考点和题目总数量选题
		List<Question> paperList = new ArrayList<>();
		int difficulty = addPaperDto.getDifficulty();
		Integer totalNum = addPaperDto.getQuestionNum();
		int size = testPoints.size();
		//传递参数进去
		if(difficulty == 1){
			//全部都是简单题目，采用第一种取题方式
			//给每个考点分配题目数量，平均分配
			createPaperByEasyQues(paperList, size,totalNum,testPoints);
		}else if(difficulty == 3){
			//先分简单和困难的数量
			Integer diffiTotalNum = totalNum / 3;
			Integer easyTotalNum = totalNum - diffiTotalNum;
			//取得所有得简单题目，
			createPaperByEasyQues(paperList, size,easyTotalNum,testPoints);
			//取得困难的题目
			createPaperByDiffiQues(paperList, size, diffiTotalNum,testPoints);
		}else if(difficulty == 5){
			//先分简单和困难的数量
			Integer diffiTotalNum = totalNum / 2;
			Integer easyTotalNum = totalNum - diffiTotalNum;
			//取得所有得简单题目，
			createPaperByEasyQues(paperList, size,easyTotalNum,testPoints);
			//取得困难的题目
			createPaperByDiffiQues(paperList, size, diffiTotalNum,testPoints);
		}

		String quesId = "";
		Float totalScore = 0.0f;
		for(Question ques : paperList){//拿到每个问题的,统计题目被选上的次数
			quesId+=ques.getQuestionId()+",";
			totalScore += ques.getType().getScore();
			ques.setSelectedCount(ques.getSelectedCount() + 1);
			questionService.update(ques);
		}
		if(!quesId.isEmpty()){
			quesId = removeLast(quesId);
		}
		addPaperDto.setQuestionId(quesId);
		addPaperDto.setPaperstate("0");
		addPaperDto.setTotalScore(totalScore);
		//需要更新总分属性
		//处理题型数目

		paperService.insert(addPaperDto);
		return "redirect:/paper/toPaperPage.action";
	}

	private void createPaperByDiffiQues(List<Question> paperList, int size, Integer diffiTotalNum,List<TestPoint> testPoints) {
		List<Integer> diffiNum = new ArrayList<>();
		Integer baseNum = diffiTotalNum / size;
		Integer remainNum = diffiTotalNum % size;
		for(int i = 0; i < size; i++){
			if(remainNum-- >0){
				diffiNum.add(baseNum + 1);
			}else{
				diffiNum.add(baseNum);
			}
		}
		for(int i = 0; i < size; i++){
			Map<String,Integer> paraMap = new HashMap<>();
			paraMap.put("testPointId",testPoints.get(i).getId());
			paraMap.put("num",diffiNum.get(i));
			List<Question> questions = questionService.createPaperByDiffiQues(paraMap,paperList);
			paperList.addAll(questions);
            //为了解决难题的数量不多的情况？
            //用简单题目再次填充进去
            if(questions.size() < diffiNum.get(i)){
                paraMap.replace("testPointId",testPoints.get(i).getId());
                paraMap.replace("num",diffiNum.get(i)-questions.size());
                //这个时候，考点选择的题目就会重复了，因此需要排除已选的题目了
                List<Question> addQuestions = questionService.createPaperByEasyQues(paraMap,paperList);
                paperList.addAll(addQuestions);
            }
		}
	}

	private void createPaperByEasyQues(List<Question> paperList, int size, Integer easyTotalNum,List<TestPoint> testPoints) {
		List<Integer> easyNum = new ArrayList<>();
		Integer baseNum = easyTotalNum / size;
		Integer remainNum = easyTotalNum % size;
		//添加完简单的题目
		for (int i = 0; i < size; i++) {
			if (remainNum-- > 0) {
				easyNum.add(baseNum + 1);
			} else {
				easyNum.add(baseNum);
			}
		}
		for (int i = 0; i < size; i++) {
			Map<String,Integer> paraMap = new HashMap<>();
			paraMap.put("testPointId",testPoints.get(i).getId());
			paraMap.put("num",easyNum.get(i));
			List<Question> questions = questionService.createPaperByEasyQues(paraMap,null);
			paperList.addAll(questions);
		}
	}

	/**
	 * 删除试卷信息
	 * @param paperId	试卷编号，删除多个是，id用逗号分隔开
	 * @param model
	 * @return
	 */
	@RequestMapping("/deletePaper.action")
	public String deletePaper(String paperId, Model model){
		if(paperId != null){
			String ids[] = paperId.split(",");
			for(int i=0;i<ids.length;i++){
				paperService.delete(ids[i]);
			}
		}
		return "redirect:/paper/toPaperPage.action";
	} 
	
	@RequestMapping("/qryPaper.action")
	public String qryPaper(String paperId, Model model){
		Paper paper = paperService.get(paperId);
		String quesId = paper.getQuestionId();
		//处理题型数目
		Integer singleSelNum=0;
		Integer multipleSelNum = 0;
		Integer inpNum=0;
		Integer jugeNum=0;
		if(quesId != null){
			String ids[] = quesId.split(",");
			for(int i=0;i<ids.length;i++){
				Question question = questionService.get(Integer.parseInt(ids[i]));
				int typeId = question.getType().getTypeId();
				if(typeId==1){
					singleSelNum+=1;
				}
				if(typeId==2)
				{
					multipleSelNum+=1;
				}
				if(typeId==3){
					jugeNum+=1;
				}
				if(typeId==4){
					inpNum+=1;
				}
			}
		}
		Map questionNum = new HashMap<>();
		questionNum.put("singleSelNum",singleSelNum);
		questionNum.put("multipleSelNum",multipleSelNum);
		questionNum.put("jugeNum",jugeNum);
		questionNum.put("inpNum",inpNum);
		model.addAttribute("questionNum",questionNum);
		model.addAttribute("paper", paper);
		return "/teacher/paper-qry.jsp";
	}

	/**
	 * 去掉最后一个逗号
	 * @param str
	 * @return
	 */
	public String removeLast(String str){
		//判断最后一个字符是否为逗号，若是截取
		String newStr = str.substring(str.length() -1, str.length());
		if(",".equals(newStr)){
			newStr = str.substring(0, str.length()-1);
		}else{
			newStr = str;
		}
		return newStr;
	}
    /*
    转移到发布考试的界面
     */
    @RequestMapping("/toExamPlan.action")
    public String examPlan(Paper paper,Model model)
    {
        List<ExamClass> examClasses =  examclassService.find(null);
        Paper paperInfo = paperService.get(paper.getPaperId());
        model.addAttribute("paperInfo",paperInfo);
        model.addAttribute("examClass",examClasses);
        return "/teacher/paper-exam.jsp";
    }
    /*
    发布考试，增加要考试的试卷
     */
    @RequestMapping("/addExam.action")
	public String addExam(Paper paper,Model model)
	{
		Paper newPaper = paperService.get(paper.getPaperId());
		newPaper.setDeadLine(paper.getDeadLine());
		newPaper.setClassId(paper.getClassId());
		if(paper.getUserId().equals("0"))
		{
			newPaper.setUserId(null);
		}else{
			newPaper.setUserId(paper.getUserId());
		}
		newPaper.setPaperstate("1");
		paperService.insert(newPaper);
		return "redirect:/paper/toPaperPage.action";
	}
	/*
	处理试卷的考点信息
	 */
	private List<TestPoint> dealingWithAddAddPaperDto(AddPaperDto addPaperDto) {
		//拿到所有的考点id，放在问题中
		AddQuestionDto addQuestionDto = new AddQuestionDto();
		addQuestionDto.setFirstTestPoints(addPaperDto.getFirstTestPoint().split(","));
		String secondTestPoint = addPaperDto.getSecondTestPoint();
		String thirdTestPoint = addPaperDto.getThirdTestPoint();
		if (secondTestPoint != null) {
			addQuestionDto.setSecondTestPoints(addPaperDto.getSecondTestPoint().split(","));
		}
		if (thirdTestPoint != null) {
			addQuestionDto.setThirdTestPoints(addPaperDto.getThirdTestPoint().split(","));
		}
		List<TestPoint> testPoints = testPointService.qryTestPointByPointNames(addQuestionDto);
		return testPoints;
	}
}
