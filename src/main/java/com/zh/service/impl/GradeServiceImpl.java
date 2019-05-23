package com.zh.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zh.mapper.GradeMapper;
import com.zh.pojo.Grade;
import com.zh.service.GradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GradeServiceImpl implements GradeService {

	@Autowired
	GradeMapper gradeMapper;
	
	public List<Grade> find(Grade grade) {
		return gradeMapper.find(grade);
	}

	public Grade get(int id) {
		return gradeMapper.get(id);
	}

	public void insert(Grade grade) {
		gradeMapper.insert(grade);
	}

	public void update(Grade grade) {
		gradeMapper.update(grade);
	}

	public void delete(int id) {
		gradeMapper.delete(id);
	}

	public PageInfo<Grade> findByPage(Grade grade, Integer pageNo,
                                      Integer pageSize) {
		pageNo = pageNo == null?1:pageNo;
	    pageSize = pageSize == null?10:pageSize;
	    PageHelper.startPage(pageNo, pageSize);
	    List<Grade> list = gradeMapper.find(grade);
	    System.out.println(list.toString());
	    //用PageInfo对结果进行包装
	    PageInfo<Grade> page = new PageInfo<Grade>(list);
	    return page;
	}

}
