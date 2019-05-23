package com.zh.mapper;

import java.io.Serializable;
import java.util.List;

/**
 * @Description: 泛型类，基础的DAO接口
 * @CreateDate:	2017-3-11
 */
public interface BaseMapper<T> {
	public List<T> find(T entity);
	public T get(Serializable id);
	public void insert(T entity);
	public void update(T entity);
	public void delete(Serializable id);
	public void delete(Serializable[] ids);
}
