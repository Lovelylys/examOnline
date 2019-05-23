package com.zh.service;

import com.github.pagehelper.PageInfo;
import com.zh.pojo.Course;

import java.util.List;

public interface CourseService {
	public List<Course> find(Course course);
	public Course get(int id);
	public void insert(Course course);
	public void update(Course course);
	public void delete(int id);
	public PageInfo<Course> findByPage(Course course, Integer pageNo, Integer pageSize);
}
