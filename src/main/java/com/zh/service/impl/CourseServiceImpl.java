package com.zh.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zh.mapper.CourseMapper;
import com.zh.pojo.Course;
import com.zh.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CourseServiceImpl implements CourseService {

	@Autowired
	CourseMapper courseMapper;
	public List<Course> find(Course course) {
		return courseMapper.find(course);
	}

	public Course get(int id) {
		return courseMapper.get(id);
	}

	public void insert(Course course) {
		courseMapper.insert(course);
	}

	public void update(Course course) {
		courseMapper.update(course);
	}

	public void delete(int id) {
		courseMapper.delete(id);
	}

	public PageInfo<Course> findByPage(Course course, Integer pageNo,
                                       Integer pageSize) {
		pageNo = pageNo == null?1:pageNo;
	    pageSize = pageSize == null?10:pageSize;
	    PageHelper.startPage(pageNo, pageSize);
	    List<Course> list = courseMapper.find(course);
	    System.out.println(list.toString());
	    //用PageInfo对结果进行包装
	    PageInfo<Course> page = new PageInfo<Course>(list);
	    return page;
	}

}
