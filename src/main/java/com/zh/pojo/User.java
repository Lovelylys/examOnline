/**
 * 
 */
package com.zh.pojo;

/**
 * 用户表
 * @author hspcadmin
 * @CreateDate:	2017-3-11
 */
public class User
{
	/**用户账号*/
	private String userId;
	/**用户昵称*/
	private String userName;
	/**用户密码*/
	private String userPwd;
	/**年级*/
	private String gradeId;
	/**账户类型（0：学生，1：老师，2：管理员）*/
	private Integer userType;
	/**账户状态（0：待审核，1：在用，2：注销）*/
	private Integer userState;
	/**邮箱*/
	private String email;
	/**联系电话*/
	private String telephone;
	/**联系地址*/
	private String address;
	/**备注*/
	private String remark;

	private ExamClass examClass;

	private String classId;//改属性是为了日后方便扩展教师有classid属性，存储多个班级id用，来分割的字符串

	private Grade grade;

	public String getGradeId() {
		return gradeId;
	}

	public void setGradeId(String gradeId) {
		this.gradeId = gradeId;
	}
	public Grade getGrade() {
		return grade;
	}

	public void setGrade(Grade grade) {
		this.grade = grade;
	}

	public String getClassId() {
		return classId;
	}

	public void setClassId(String classId) {
		this.classId = classId;
	}

	public ExamClass getExamClass() {
		return examClass;
	}

	public void setExamClass(ExamClass examClass) {
		this.examClass = examClass;
	}

	public Integer getUserType() {
		return userType;
	}

	public void setUserType(Integer userType) {
		this.userType = userType;
	}

	public Integer getUserState() {
		return userState;
	}

	public void setUserState(Integer userState) {
		this.userState = userState;
	}

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	public User() {
		
	}

	public User(String userId, String userName, String userPwd, String gradeId, Integer userType, Integer userState, String email,
				String telephone, String address, String remark, ExamClass examClass, String classId, Grade grade) {
		this.userId = userId;
		this.userName = userName;
		this.userPwd = userPwd;
		this.gradeId = gradeId;
		this.userType = userType;
		this.userState = userState;
		this.email = email;
		this.telephone = telephone;
		this.address = address;
		this.remark = remark;
		this.examClass = examClass;
		this.classId = classId;
		this.grade = grade;
	}

	@Override
	public String toString() {
		return super.toString();
	}
	
}
