package com.zh.pojo;
/**
 * 错题本
 * @author hspcadmin
 *
 */
public class ErrorBook {

	/**错题编号*/
	private Integer bookId;
	/**用户编号*/
	private String userId;
	/**科目编号*/
	private Integer courseId;
	/**年级编号*/
	private String gradeId;
	/**学生答案*/
	private String userAnswer;
	/**问题编号*/
	private Question question;
	/**题型编号*/
	private String typeId;

	public Integer getBookId() {
		return bookId;
	}

	public void setBookId(Integer bookId) {
		this.bookId = bookId;
	}

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getGradeId() {
		return gradeId;
	}

	public Integer getCourseId() {
		return courseId;
	}

	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}

	public void setGradeId(String gradeId) {
		this.gradeId = gradeId;
	}
	public String getUserAnswer() {
		return userAnswer;
	}
	public void setUserAnswer(String userAnswer) {
		this.userAnswer = userAnswer;
	}
	public String getTypeId() {
		return typeId;
	}
	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}
	public Question getQuestion() {
		return question;
	}
	public void setQuestion(Question question) {
		this.question = question;
	}
	public ErrorBook() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ErrorBook(Integer bookId, String userId, Integer courseId,
			String gradeId, String userAnswer, Question question, String typeId) {
		super();
		this.bookId = bookId;
		this.userId = userId;
		this.courseId = courseId;
		this.gradeId = gradeId;
		this.userAnswer = userAnswer;
		this.question = question;
		this.typeId = typeId;
	}
	@Override
	public String toString() {
		return "ErrorBook [bookId=" + bookId + ", userId=" + userId
				+ ", courseId=" + courseId + ", gradeId=" + gradeId
				+ ", userAnswer=" + userAnswer + ", question=" + question
				+ ", typeId=" + typeId + "]";
	}

	
}
