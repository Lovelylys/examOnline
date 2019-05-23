package com.zh.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zh.dto.PaperDto;
import com.zh.mapper.PaperMapper;
import com.zh.pojo.Paper;
import com.zh.pojo.Question;
import com.zh.pojo.User;
import com.zh.service.PaperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

@Service
public class PaperServiceImpl implements PaperService {

	@Autowired
	PaperMapper paperMapper;
	public List<Paper> find(Paper paper) {
		return paperMapper.find(paper);
	}

	public Paper get(Serializable id) {
		return paperMapper.get(id);
	}

	public void insert(Paper paper) {
		paperMapper.insert(paper);
	}

	public void update(Paper paper) {
		paperMapper.update(paper);
	}

	public void delete(Serializable id) {
		paperMapper.delete(id);
	}

	public void delete(Serializable[] ids) {
		paperMapper.delete(ids);
	}

	public List<Paper> getFinishedUserPaperById(Serializable id) {
		// TODO Auto-generated method stub
		return paperMapper.getFinishedUserPaperById(id);
	}

	public Paper getPaperDetail(Paper paper) {
		// TODO Auto-generated method stub
		return paperMapper.getPaperDetail(paper);
	}

	public void updateUserPaper(Map map) {
		// TODO Auto-generated method stub
		paperMapper.updateUserPaper(map);
	}

	public List<Paper> getUndoPaper(User user) {
		// TODO Auto-generated method stub
		return paperMapper.getUndoPaper(user);
	}

	public List<Paper> qryUndoPaper(User user) {
		// TODO Auto-generated method stub
		return paperMapper.qryUndoPaper(user);
	}

	public PageInfo<Paper> findAllPage(Paper paper, Integer pageNo,
                                       Integer pageSize) {
		pageNo = pageNo == null?1:pageNo;
	    pageSize = pageSize == null?10:pageSize;
	    PageHelper.startPage(pageNo, pageSize);
	    List<Paper> list = paperMapper.find(paper);
	    System.out.println(list.toString());
	    //用PageInfo对结果进行包装
	    PageInfo<Paper> page = new PageInfo<Paper>(list);
	    return page;
	}

    @Override
    public PageInfo<Paper> queryPaperByCourseAndGrade(PaperDto paperDto, int i) {
		Integer pageNo = paperDto.getPage()==null?1:paperDto.getPage();
		PageHelper.startPage(pageNo,i);
		List<Paper> list = paperMapper.queryPaperByCourseAndGrade(paperDto);
		PageInfo<Paper> page = new PageInfo<>(list);
		return page;
    }

}
