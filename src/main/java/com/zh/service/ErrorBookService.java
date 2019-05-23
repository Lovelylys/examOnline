package com.zh.service;


import com.github.pagehelper.PageInfo;
import com.zh.dto.QuestionDto;
import com.zh.pojo.ErrorBook;

import java.util.List;
import java.util.Map;

public interface ErrorBookService {
	public List<ErrorBook> find(ErrorBook errorBook);
	public ErrorBook get(int id);
	public void insert(ErrorBook errorBook);
	public void update(ErrorBook errorBook);
	public void delete(int id);
	public List<ErrorBook> getBookInfo(String userId);

	PageInfo<ErrorBook> qryErrorBookByCourseAndType(QuestionDto questionDto,int pageSize);
}
