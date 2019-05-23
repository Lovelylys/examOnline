package com.zh.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zh.mapper.UserMapper;
import com.zh.pojo.User;
import com.zh.service.UserService;
import com.zh.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserMapper userMapper;
	
	public List<User> find(User user) {
		// TODO Auto-generated method stub
		return userMapper.find(user);
	}

	public User get(Serializable id) {
		// TODO Auto-generated method stub
		return userMapper.get(id);
	}

	public void insert(User user) {
		String userPwd = user.getUserPwd();
		//默认是激活状态
		user.setUserState(1);
		//密码加密
		userPwd = MD5Util.getData(userPwd);
		user.setUserPwd(userPwd);
		userMapper.insert(user);
	}

	public void update(User user) {
		// TODO Auto-generated method stub
		//密码加密，密码更新了，对其加密
		User originalUser = get(user.getUserId());
		if(!originalUser.getUserPwd().equals(user.getUserPwd())){
			String userPwd = user.getUserPwd();
			userPwd = MD5Util.getData(userPwd);
			user.setUserPwd(userPwd);
		}
		userMapper.update(user);
	}

	public void delete(Serializable id) {
		// TODO Auto-generated method stub
		userMapper.delete(id);
	}

	public void delete(Serializable[] ids) {
		// TODO Auto-generated method stub
		
	}

	public User login(User user) {
		// TODO Auto-generated method stub
		User u = get(user.getUserId());
		if(u!=null){
			String userPwd = MD5Util.getData(user.getUserPwd());
			if(userPwd.equals(u.getUserPwd())){
				return u;
			}
		}
		return null;
	}

	public List<User> findPending(User user) {
		// TODO Auto-generated method stub
		return userMapper.findPending(user);
	}

	public User getStu(String userId) {
		// TODO Auto-generated method stub
		return userMapper.getStu(userId);
	}

	public PageInfo<User> findByPage(Integer pageNo, Integer pageSize) {
		// TODO Auto-generated method stub
		pageNo = pageNo == null?1:pageNo;
	    pageSize = pageSize == null?10:pageSize;
	    PageHelper.startPage(pageNo, pageSize);
	    List<User> list = userMapper.find(null);
	    System.out.println(list.toString());
	    //用PageInfo对结果进行包装
	    PageInfo<User> page = new PageInfo<User>(list);
	    return page;
	}

	public PageInfo<User> findPendingByPage(User user, Integer pageNo,
                                            Integer pageSize) {
		pageNo = pageNo == null?1:pageNo;
	    pageSize = pageSize == null?10:pageSize;
	    PageHelper.startPage(pageNo, pageSize);
	    List<User> list = userMapper.findPending(user);
	    //用PageInfo对结果进行包装
	    PageInfo<User> page = new PageInfo<User>(list);
	    return page;
	}

	public List<User> findAllTeacher()
	{
		return userMapper.findAllTeacher();
	}

	@Override
	public List<User> findAllStudent() {
		return userMapper.findAllStudent();
	}

    @Override
    public List<User> qryStudentsByClassId(String classId) {
        return userMapper.qryStudentsByClassId(classId);
    }
}
