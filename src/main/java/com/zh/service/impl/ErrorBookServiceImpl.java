package com.zh.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zh.dto.QuestionDto;
import com.zh.mapper.ErrorBookMapper;
import com.zh.pojo.ErrorBook;
import com.zh.service.ErrorBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ErrorBookServiceImpl implements ErrorBookService {

	@Autowired
	ErrorBookMapper errorBookMapper;
	public List<ErrorBook> find(ErrorBook errorBook) {
		return errorBookMapper.find(errorBook);
	}

	public ErrorBook get(int id) {
		return errorBookMapper.get(id);
	}

	public void insert(ErrorBook errorBook) {
		errorBookMapper.insert(errorBook);
	}

	public void update(ErrorBook errorBook) {
		errorBookMapper.update(errorBook);
	}

	public void delete(int id) {
		errorBookMapper.delete(id);
	}

	public List<ErrorBook> getBookInfo(String userId) {
		return errorBookMapper.getBookInfo(userId);
	}

	@Override
	public PageInfo<ErrorBook> qryErrorBookByCourseAndType(QuestionDto questionDto,int pageSize) {
		Integer pageNo = questionDto.getPage()==null?1:questionDto.getPage();
		PageHelper.startPage(pageNo,pageSize);
		List<ErrorBook> list = errorBookMapper.qryQuestionByCourseAndType(questionDto);
		PageInfo<ErrorBook> page = new PageInfo<>(list);
		return page;
	}

}
