package com.zh.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zh.mapper.TypeMapper;
import com.zh.pojo.Type;
import com.zh.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TypeServiceImpl implements TypeService {

	@Autowired
	TypeMapper typeMapper;
	
	public List<Type> find(Type type) {
		return typeMapper.find(type);
	}

	public Type get(int id) {
		return typeMapper.get(id);
	}

	public void insert(Type type) {
		typeMapper.insert(type);
	}

	public void update(Type type) {
		typeMapper.update(type);
	}

	public void delete(int id) {
		typeMapper.delete(id);
	}

	public PageInfo<Type> findByPage(Type type, Integer pageNo, Integer pageSize) {
		pageNo = pageNo == null?1:pageNo;
	    pageSize = pageSize == null?10:pageSize;
	    PageHelper.startPage(pageNo, pageSize);
	    List<Type> list = typeMapper.find(type);
	    //用PageInfo对结果进行包装
	    PageInfo<Type> page = new PageInfo<Type>(list);
	    return page;
	}

}
