package com.zh.service;

import com.github.pagehelper.PageInfo;
import com.zh.pojo.User;

import java.io.Serializable;
import java.util.List;

public interface UserService {
	public List<User> find(User user);
	/**查询所有待审核记录*/
	public List<User> findPending(User user);
	public User get(Serializable id);
	public void insert(User user);
	public void update(User user);
	public void delete(Serializable id);
	public void delete(Serializable[] ids);
	public User login(User user);
	/**查询学生信息*/
	public User getStu(String userId);

	/**分页查询所有用户信息，修改*/
	public PageInfo<User> findByPage(Integer pageNo, Integer pageSize);
	/**分页查询待审核记录*/
	public PageInfo<User> findPendingByPage(User user, Integer pageNo, Integer pageSize);

	public List<User> findAllTeacher();

	public List<User> findAllStudent();

    List<User> qryStudentsByClassId(String classId);
}
