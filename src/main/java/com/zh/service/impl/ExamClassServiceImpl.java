package com.zh.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zh.mapper.ExamClassMapper;
import com.zh.pojo.ExamClass;
import com.zh.service.ExamclassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author abs
 * @Date 2019/3/22 - 12:39
 */
@Service("examclassService")
public class ExamClassServiceImpl implements ExamclassService {
    @Autowired
    private ExamClassMapper examClassMapper;

    @Override
    public ExamClass queryClass(String classid) {
        return examClassMapper.get(classid);
    }

    @Override
    public List<ExamClass> queryClassByGradeId(String gradeId) {
        return examClassMapper.queryClassByGradeId(gradeId);
    }

    @Override
    public PageInfo<ExamClass> findByPage(ExamClass examClass, Integer pageNo, Integer pageSize) {
        pageNo = pageNo == null?1:pageNo;
        pageSize = pageSize == null?10:pageSize;
        PageHelper.startPage(pageNo, pageSize);
        List<ExamClass> list = examClassMapper.find(examClass);
        System.out.println(list.toString());
        //用PageInfo对结果进行包装
        PageInfo<ExamClass> page = new PageInfo<ExamClass>(list);
        return page;
    }

    @Override
    public void delete(int id) {
        examClassMapper.delete(id);
    }

    @Override
    public List<ExamClass> find(ExamClass examClass) {
        return examClassMapper.find(examClass);
    }

    @Override
    public void insert(ExamClass examClass) {
        examClassMapper.insert(examClass);
    }

    @Override
    public ExamClass get(int id) {
        return examClassMapper.get(id);
    }

    @Override
    public void update(ExamClass examClass) {
        examClassMapper.update(examClass);
    }
}
