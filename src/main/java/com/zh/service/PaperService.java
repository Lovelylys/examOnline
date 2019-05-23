package com.zh.service;

import com.github.pagehelper.PageInfo;
import com.zh.dto.PaperDto;
import com.zh.pojo.Paper;
import com.zh.pojo.Question;
import com.zh.pojo.User;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

public interface PaperService {
	public List<Paper> find(Paper paper);
	public Paper get(Serializable id);
	public void insert(Paper paper);
	public void update(Paper paper);
	public void delete(Serializable id);
	public void delete(Serializable[] ids);
	/**通过学生编号获取所有其已经考过的试卷*/
	public List<Paper> getFinishedUserPaperById(Serializable id);
	/**查看试卷详情*/
	public Paper getPaperDetail(Paper paper);
	/**更新用户试卷信息*/
	public void updateUserPaper(Map map);
	/**查询教师已经发布给自己的试卷，加入到自己的待考试卷当中*/
	public List<Paper> getUndoPaper(User user);
	/**查询学生未考试的试卷*/
	public List<Paper> qryUndoPaper(User user);
	public PageInfo<Paper> findAllPage(Paper paper, Integer pageNo, Integer pageSize);

    PageInfo<Paper> queryPaperByCourseAndGrade(PaperDto paperDto, int i);
}
