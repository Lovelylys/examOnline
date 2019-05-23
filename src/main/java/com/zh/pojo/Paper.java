package com.zh.pojo;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 试卷实体
 * @author hspcadmin
 *
 */
public class Paper {
	/**试卷编号*/
	private String paperId;
	/**试卷名称*/
	private String paperName;
	/**对应课程*/
	private String courseId;
	/**适合年级*/
	private String gradeId;
	/**学生编号*/
	private String userId;
	/**问题编号*/
	private String questionId;
	/**开始时间*/
	private String beginTime;
	/**结束时间*/
	//这些时间暂时不进行修改，到学生页面的时候再进行修改
	private String endTime;
	/**允许时长*/
	private Integer allowTime;
	/**分数*/
	private String score;

	private Date deadLine;

	/**试卷状态 0:准备考试1:尚未开始2:已完成*/
	private String paperState;
	private Integer classId;
	private String teacherId;

	private Course course;
	private Grade grade;
	/*
	多加几个pojo说明具体对象，修改2019.4.4
	 */
	private ExamClass examClass;
	private User teacher;
	private User student;

	/*
	flag属性，说明试卷是否已经过了截止日期
	 */
	private boolean flag;

	private Float totalScore;

	public Float getTotalScore() {
		return totalScore;
	}

	public void setTotalScore(Float totalScore) {
		this.totalScore = totalScore;
	}

	public boolean isFlag() {
		return flag;
	}

	public void setFlag(boolean flag) {
		this.flag = flag;
	}

	public ExamClass getExamClass() {
		return examClass;
	}

	public void setExamClass(ExamClass examClass) {
		this.examClass = examClass;
	}

	public User getTeacher() {
		return teacher;
	}

	public void setTeacher(User teacher) {
		this.teacher = teacher;
	}

	public User getStudent() {
		return student;
	}

	public void setStudent(User student) {
		this.student = student;
	}

	public Integer getClassId() {
		return classId;
	}

	public void setClassId(Integer classId) {
		this.classId = classId;
	}

	public String getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
	}

	public Paper() {
		
	}
	public Paper(String paperId, String paperName, String courseId,
			String gradeId, String userId, String questionId, String beginTime,
			String endTime, String allowTime, String score, String paperState) {
		super();
		this.paperId = paperId;
		this.paperName = paperName;
		this.courseId = courseId;
		this.gradeId = gradeId;
		this.userId = userId;
		this.questionId = questionId;
		this.beginTime = beginTime;
		this.endTime = endTime;
		this.score = score;
		this.paperState = paperState;
	}
	public Date getDeadLine() {
		return deadLine;
	}

	public void setDeadLine(Date deadLine) {
		this.deadLine = deadLine;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public Grade getGrade() {
		return grade;
	}

	public void setGrade(Grade grade) {
		this.grade = grade;
	}

	public String getPaperState() {
		return paperState;
	}

	public void setPaperState(String paperState) {
		this.paperState = paperState;
	}
	public String getPaperId() {
		return paperId;
	}
	public void setPaperId(String paperId) {
		this.paperId = paperId;
	}
	public String getPaperName() {
		return paperName;
	}
	public void setPaperName(String paperName) {
		this.paperName = paperName;
	}
	public String getCourseId() {
		return courseId;
	}
	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}
	public String getGradeId() {
		return gradeId;
	}
	public void setGradeId(String gradeId) {
		this.gradeId = gradeId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getQuestionId() {
		return questionId;
	}
	public void setQuestionId(String questionId) {
		this.questionId = questionId;
	}
	public String getBeginTime() {
		return beginTime;
	}
	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getScore() {
		return score;
	}

	public Integer getAllowTime() {
		return allowTime;
	}

	public void setAllowTime(Integer allowTime) {
		this.allowTime = allowTime;
	}

	public void setScore(String score) {
		this.score = score;
	}
	public String getPaperstate() {
		return paperState;
	}
	public void setPaperstate(String paperstate) {
		this.paperState = paperstate;
	}
	@Override
	public String toString() {
		return "Paper [paperId=" + paperId + ", paperName=" + paperName
				+ ", courseId=" + courseId + ", gradeId=" + gradeId
				+ ", userId=" + userId + ", questionId=" + questionId
				+ ", beginTime=" + beginTime + ", endTime=" + endTime
				+ ", allowTime=" + allowTime + ", score=" + score
				+ ", paperstate=" + paperState + "]";
	}
	
}
