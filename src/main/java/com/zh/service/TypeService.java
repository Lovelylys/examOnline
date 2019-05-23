package com.zh.service;

import com.github.pagehelper.PageInfo;
import com.zh.pojo.Type;

import java.util.List;

public interface TypeService {
	public List<Type> find(Type type);
	public Type get(int id);
	public void insert(Type type);
	public void update(Type type);
	public void delete(int id);
	public PageInfo<Type> findByPage(Type type, Integer pageNo, Integer pageSize);
}
