package com.zh.mapper;


import com.zh.pojo.User;
import com.zh.pojo.UserWithClass;
import org.apache.ibatis.annotations.Param;

import java.io.Serializable;
import java.util.List;


public interface UserMapper extends BaseMapper<User>{
	public List<User> findPending(User user);
	public User getStu(@Param("userId") String userId);

    List<User> findAllTeacher();

	List<User> findAllStudent();

    List<User> qryStudentsByClassId(@Param("classId") String classId);
}
