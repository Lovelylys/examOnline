package com.zh.mapper;


import com.zh.dto.PaperDto;
import com.zh.dto.ResultDto;
import com.zh.pojo.Paper;
import com.zh.pojo.User;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

public interface PaperMapper extends BaseMapper<Paper> {
	/**
	 * 通过学生编号获取所有已经考过的试卷
	 * @param id
	 * @return
	 */
	public List<Paper> getFinishedUserPaperById(Serializable id);
	/**查看试卷详情*/
	public Paper getPaperDetail(Paper paper);
	
	/**更新用户试卷信息*/
	public void updateUserPaper(Map map);
	/**查询教师发布给自己的试卷，加入到自己的待考试卷当中*/
	public List<Paper> getUndoPaper(User user);
	/**查询学生未考试的试卷*/
	public List<Paper> qryUndoPaper(User user);

    List<Paper> queryPaperByCourseAndGrade(PaperDto paperDto);

    List<Paper> queryResultByClassAndCourse(ResultDto resultDto);
}
