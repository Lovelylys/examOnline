package com.zh.service;

import com.github.pagehelper.PageInfo;
import com.zh.pojo.ExamClass;

import java.util.List;

/**
 * @author abs
 * @Date 2019/3/22 - 12:38
 */

public interface ExamclassService {
    ExamClass queryClass(String classid);

    List<ExamClass> queryClassByGradeId(String gradeId);

    PageInfo<ExamClass> findByPage(ExamClass examClass, Integer pageNo, Integer pageSize);

    void delete(int id);

    List<ExamClass> find(ExamClass examClass);

    void insert(ExamClass examClass);

    ExamClass get(int id);

    void update(ExamClass examClass);
}
