package com.zh.Controller.user;

import com.zh.dto.DealPaperDto;
import com.zh.dto.DetailPaperDto;
import com.zh.pojo.*;
import com.zh.service.*;
import com.zh.util.Computeclass;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 学生系统试卷综合管理
 * @author hspcadmin
 *
 */
@Controller
@RequestMapping("/stuPaper")
public class PaperMgController {

	@Autowired
	UserService userService;
	@Autowired
	GradeService gradeService;
	@Autowired
	PaperService paperService;
	@Autowired
	CourseService courseService;
	@Autowired
	QuestionService questionService;
	@Autowired
	ErrorBookService bookService;
	@Autowired
    AbilityService abilityService;
	@Autowired
	TestPointService testPointService;
	
	//跳转到成绩查询页面
	@RequestMapping("/toScoreQry.action")
	public String toScoreQry(User user, Model model){
		List<Paper> paper = paperService.getFinishedUserPaperById(user.getUserId());
		model.addAttribute("paper", paper);
		return "/user/scorequery.jsp";			
	}
	
	/**
	 * 查看试卷详情
	 * @param model
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("/qrypaper.action")
	public String qrypaper(Paper paper,Model model){
	    paper = paperService.getPaperDetail(paper);
		Question question = null;
		String []ids = paper.getQuestionId().split(",");
		List<Question> selList = new ArrayList<Question>();
		List<Question> inpList = new ArrayList<Question>();
		List<Question> desList = new ArrayList<Question>();
		for(int i = 0;i<ids.length;i++){
			question = questionService.get(Integer.parseInt(ids[i]));
			if("1".equals(question.getTypeId())){//单选
				selList.add(question);
			}
			if("4".equals(question.getTypeId())){//填空
				inpList.add(question);
			}
			if("5".equals(question.getTypeId())){//简答题
				desList.add(question);
			}
		}
		
		if(selList.size()>0){
			model.addAttribute("selectQ", "单项选择题（每题5分）");
			model.addAttribute("selList", selList);
		}
		
		if(inpList.size()>0){
			model.addAttribute("inpQ", "填空题（每题5分）");
			model.addAttribute("inpList", inpList);
		}
		
		if(desList.size()>0){
			model.addAttribute("desQ", "简答题（每题5分）");
			model.addAttribute("desList", desList);
		}
		
		model.addAttribute("paper", paper);
		return "/user/qrypaper.jsp";			
	}
	
	/**
	 * 自动评分
	 * @param model
	 * @param session
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping("/dealPaper.action")
	public String dealPaper(DealPaperDto dealPaperDto, Model model, HttpSession session) throws UnsupportedEncodingException{
		String paperId = dealPaperDto.getPaperId();
		//拿到答案进行存储
		Map<String,String> ansMap = new HashMap<>();
		String[] answers = dealPaperDto.getAnswers();
		String[] questionIds = dealPaperDto.getQuestionIds();
		Integer length = questionIds.length;
		for(int i = 0; i < length; i++){
			if(questionIds[i] != null && !questionIds[i].equals("")){
				if(ansMap.containsKey(questionIds[i])){
					ansMap.replace(questionIds[i],answers[i]);
				}else{
					ansMap.put(questionIds[i],answers[i]);
				}
			}
		}

		//拿到当前的试卷详细信息
		Map map = new HashMap();
		String userId = (String) session.getAttribute("userId");
		map.put("paperId", paperId);
		map.put("userId",userId);
		Paper newPaper = new Paper();
        newPaper.setPaperId(paperId);
		newPaper.setUserId(userId);
		Paper paperInfo = paperService.getPaperDetail(newPaper);

		//拿到所有的问题题号
		String[] ids = paperInfo.getQuestionId().split(",");
		Question ques = null;
		int endScore = 0;
		//准备记录错题
		ErrorBook book = new ErrorBook();
		book.setUserId(userId);
		//准备记录考点得分
		Map<String, Ability> resultMap = new HashMap<>();

		//2019.4.21修改，为了防止截止时间到了，还有问题没有回答而提交，传过来的答案明显少了几个，默认答案为空字符串
		for(int i = 0 ; i < ids.length; i++){
			//题号
			String str1 = ids[i];
			ques = questionService.get(Integer.parseInt(str1));
			//数据库对应的答案
			String trueAnswer = ques.getAnswer();
			//学生的答案
            String stuAnswer = "";//没有答案的情况默认为空
            if(ansMap.get(str1) != null){
                 stuAnswer = ansMap.get(str1);
            }

			//拿到所有的考点，方便统计分数
			String[] testPointIds = ques.getTestPointId().split(",");
            Float tempScore = ques.getType().getScore();
			Float testPointScore = tempScore / testPointIds.length;
			if(ques.getType().getTypeId() != 5){//判断不是简答题
				if(stuAnswer.equals(trueAnswer)){//如果用户答案和数据库中的答案一致
					endScore += tempScore;
					//对考点得分信息增添
					for(String id : testPointIds){
						if(resultMap.containsKey(id)){
							Ability tempAbility = resultMap.get(id);
                            tempAbility.setScore(tempAbility.getScore() + testPointScore);
                            tempAbility.setGettedScore(tempAbility.getGettedScore() + testPointScore);
							resultMap.replace(id, tempAbility);
						}else{
						    Ability tempAbility = new Ability();
                            tempAbility.setScore(testPointScore);
                            tempAbility.setGettedScore(testPointScore);
							tempAbility.setClassId(paperInfo.getClassId());
							tempAbility.setCourseId(Integer.parseInt(paperInfo.getCourseId()));
							tempAbility.setStudentId(paperInfo.getUserId());
							tempAbility.setTestPointId(Integer.parseInt(id));
                            resultMap.put(id, tempAbility);
                        }
					}
				}else{//插入错题本
					book.setQuestion(ques);
					book.setCourseId(ques.getCourse().getCourseId());
					book.setGradeId(ques.getGradeId());
					book.setUserAnswer(stuAnswer);
					bookService.insert(book);
					//题目错误次数加1
					ques.setWrongCount(ques.getWrongCount() + 1);
					questionService.update(ques);
					//考点得分的统计
                    for(String id : testPointIds){
                        if(resultMap.containsKey(id)){
                            Ability tempAbility = resultMap.get(id);
                            tempAbility.setScore(tempAbility.getScore() + testPointScore);
                            resultMap.replace(id, tempAbility);
                        }else{
                            Ability tempAbility = new Ability();
                            tempAbility.setScore(testPointScore);
							tempAbility.setGettedScore(0.0f);
                            tempAbility.setClassId(paperInfo.getClassId());
                            tempAbility.setCourseId(Integer.parseInt(paperInfo.getCourseId()));
                            tempAbility.setStudentId(paperInfo.getUserId());
                            tempAbility.setTestPointId(Integer.parseInt(id));
                            resultMap.put(id, tempAbility);
                        }
                    }
				}
			}
			if("5".equals(ques.getTypeId())){//为简答题的时候
				String strA = trueAnswer;
				String strB = URLDecoder.decode(stuAnswer, "UTF-8");//转码
				//计算相似
				double d = Computeclass.SimilarDegree(strA, strB);
				BigDecimal bg = new BigDecimal(d*5).setScale(1, RoundingMode.DOWN);
				d = bg.doubleValue();
				endScore+=d;
				if(d<=2){//如果小于2分，认定错误
					book.setQuestion(ques);
					book.setCourseId(ques.getCourse().getCourseId());
					book.setGradeId(ques.getGradeId());
					book.setUserAnswer(stuAnswer);
					bookService.insert(book);
				}
			}
		}
		//数据库更新记录信息

        //增加考点记录
        Set<String> testIds = resultMap.keySet();
        //这个临时的记录实在是不知道怎么展示了
        List<Ability> testPointAbilities = new ArrayList<Ability>();
        int tempInt = 0;
        for(String id : testIds){
			Ability ability = new Ability();
			ability.setStudentId(userId);
			ability.setTestPointId(Integer.parseInt(id));
			ability = abilityService.qryAnswerByTestPointIdAndStudentId(ability);
            Ability newAbility = resultMap.get(id);

            //记录临时考点，转发到页面上，2019.4.23新增
            TestPoint testPoint = testPointService.get(id);
            Ability tempAbility = new Ability();
            tempAbility.setScore(newAbility.getScore());
            tempAbility.setGettedScore(newAbility.getGettedScore());
            tempAbility.setTestPoint(testPoint);
            testPointAbilities.add(tempAbility);

            if(ability != null){//库中已经有过记录，更新
				newAbility.setScore(ability.getScore() + newAbility.getScore());
				newAbility.setGettedScore(ability.getGettedScore() + newAbility.getGettedScore());
            	abilityService.update(newAbility);
            }else{//没有则插入
                abilityService.insert(newAbility);
            }
        }

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date currentTime = new Date();//得到当前系统时间  
		String endTime = formatter.format(currentTime); //将日期时间格式化  
		map.put("beginTime", dealPaperDto.getBeginTime());
		map.put("endTime", endTime);
		map.put("score", endScore);
		//将考试的试卷状态改为2
		map.put("paperState", "2");
		paperService.updateUserPaper(map);
		MsgItem msgItem = new MsgItem();
		msgItem.setErrorNo("1");
		msgItem.setErrorInfo("试卷提交成功，本次考试得分："+endScore +"分" + "，本次试卷详细考点得分为以下列表：");
		model.addAttribute("msgItem",msgItem);
		model.addAttribute("answer",testPointAbilities);
		return "/user/answer-qry.jsp";
	}
	
	/*
	去考试页面
	 */
	@RequestMapping("/toPaperDetail.action")
    public String toPaperDetail(Paper paper,Model model)
    {
        paper = paperService.getPaperDetail(paper);
        String[] ids = paper.getQuestionId().split(",");
		/*
		计算倒计时的时间，根据截止时间，计算允许的时间
		 */
		Long deadTime = paper.getDeadLine().getTime();
		Date startDate = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String startTime = formatter.format(startDate); //将日期时间格式化
		Long nowTime = startDate.getTime();
		Integer allowTime = paper.getAllowTime();
		if(nowTime + 1000*60*allowTime > deadTime){//如果允许的时间已经不足，那么就要按照截止时间减少
			Long allowMin = (deadTime - nowTime)/1000/60;
			paper.setAllowTime(allowMin.intValue());
		}
        Question question = questionService.get(Integer.parseInt(ids[0]));
		model.addAttribute("paper",paper);
		model.addAttribute("startTime",startTime);
        model.addAttribute("question",question);
        model.addAttribute("total",ids.length);
        return "/user/paperdetail.jsp";
    }
	/**
	 * 考试页面
	 * @param model
	 * @return
	 */
	@RequestMapping("/qryPaperDetail.action")
    @ResponseBody
	public Question qryPaperDetail(@RequestBody DetailPaperDto detailPaperDto, Model model){
		Paper paper = new Paper();
		paper.setUserId(detailPaperDto.getUserId());
		paper.setPaperId(detailPaperDto.getPaperId());
        paper = paperService.getPaperDetail(paper);
        String[] ids = paper.getQuestionId().split(",");
        Question question = questionService.get(Integer.parseInt(ids[detailPaperDto.getPage()-1]));
		return question;
	}

	/**
	 * 获取未考试试卷，并将为考试的试卷添加用户信息
	 * @param user
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/toMyPaperPage.action")
	public String toMyPaperPage(User user, Model model, HttpSession session){
	    user = userService.get(user.getUserId());
		List<Paper> paper1 = paperService.getUndoPaper(user);
		for(Paper p : paper1){
			p.setUserId(user.getUserId());
			paperService.insert(p);
		}
		List<Paper> paper = paperService.qryUndoPaper(user);
		Date now = new Date();
		Long time = now.getTime();
		for(Paper p:paper){
            if(p.getDeadLine() != null) {
                Long tempTime = p.getDeadLine().getTime();
                if (time > tempTime) {
                    p.setFlag(false);//试卷就截止作答
                } else {
                    p.setFlag(true);//试卷可以作答
                }
            }
        }
		model.addAttribute("paper", paper);
		return "/user/mypaper.jsp";
	}
}
