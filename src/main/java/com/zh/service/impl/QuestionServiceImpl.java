package com.zh.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zh.dto.AddQuestionDto;
import com.zh.dto.QuestionDto;
import com.zh.mapper.QuestionMapper;
import com.zh.pojo.Question;
import com.zh.pojo.TestPoint;
import com.zh.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class QuestionServiceImpl implements QuestionService {

	@Autowired
	QuestionMapper questionMapper;
	
	public List<Question> find(Question question) {
		return questionMapper.find(question);
	}

	public Question get(int id) {
		return questionMapper.get(id);
	}

	public void insert(AddQuestionDto questionDto) {
		questionMapper.insert(questionDto);
	}

	public void update(Question question) {
		questionMapper.update(question);
	}

	public void delete(int id) {
		questionMapper.delete(id);
	}

	public List<Question> createPaper(Map map) {
		// TODO Auto-generated method stub
		return questionMapper.createPaper(map);
	}

	public PageInfo<Question> findByPage(Question question, Integer pageNo,
                                         Integer pageSize) {
		
		pageNo = pageNo == null?1:pageNo;
	    pageSize = pageSize == null?10:pageSize;
	    PageHelper.startPage(pageNo, pageSize);
	    List<Question> list = questionMapper.find(question);
	    System.out.println(list.toString());
	    //用PageInfo对结果进行包装
	    PageInfo<Question> page = new PageInfo<Question>(list);
	    return page;
	}

    @Override
    public PageInfo<Question> qryQuestionByCourseAndType(QuestionDto questionDto, int i) {
		Integer pageNo = questionDto.getPage()==null?1:questionDto.getPage();
		PageHelper.startPage(pageNo,i);
		List<Question> list = questionMapper.qryQuestionByCourseAndType(questionDto);
		PageInfo<Question> page = new PageInfo<>(list);
		return page;
    }

    @Override
    public List<Question> createPaperByEasyQues(Map<String, Integer> paraMap, List<Question> paperList) {
        return questionMapper.createPaperByEasyQues(paraMap,paperList);
    }

	@Override
	public List<Question> createPaperByDiffiQues(Map<String, Integer> paraMap, List<Question> paperList) {
		return questionMapper.createPaperByDiffiQues(paraMap,paperList);
	}

}
