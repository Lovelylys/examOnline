package com.zh.service;

import com.github.pagehelper.PageInfo;
import com.zh.dto.AddQuestionDto;
import com.zh.dto.QuestionDto;
import com.zh.pojo.Question;
import com.zh.pojo.TestPoint;

import java.util.List;
import java.util.Map;

public interface QuestionService {
	public List<Question> find(Question question);
	public Question get(int id);
	public void insert(AddQuestionDto questionDto);
	public void update(Question question);
	public void delete(int id);
	public List<Question> createPaper(Map map);
	public PageInfo<Question> findByPage(Question question, Integer pageNo, Integer pageSize);

    PageInfo<Question> qryQuestionByCourseAndType(QuestionDto questionDto, int i);

    List<Question> createPaperByEasyQues(Map<String, Integer> paraMap, List<Question> paperList);

	List<Question> createPaperByDiffiQues(Map<String, Integer> paraMap, List<Question> paperList);
}
