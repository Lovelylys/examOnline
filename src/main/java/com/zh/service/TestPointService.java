package com.zh.service;

import com.github.pagehelper.PageInfo;
import com.zh.dto.AddQuestionDto;
import com.zh.dto.TestPointDto;
import com.zh.pojo.TestPoint;

import java.util.List;

/**
 * @author abs
 * @Date 2019/3/25 - 16:00
 */
public interface TestPointService {
    PageInfo<TestPoint> findByPage(TestPoint testPoint, Integer pageNo, Integer pageSize);

    PageInfo<TestPoint> qryTestPointByCourseAndGrade(TestPointDto testPointDto, int i);

    void delete(int testPointId);

    void insert(TestPoint testPoint);

    TestPoint get(String testPointId);

    void update(TestPoint testPoint);

    List<TestPoint> qryFirstTestPointByCourse(String courseId);

    List<TestPoint> qrySecondTestPointByFirst(String[] firstTestPoints);

    List<TestPoint> qryThirdTestPointBySecond(String[] secondTestPoints);

    List<TestPoint> qryTestPointByPointNames(AddQuestionDto addQuestionDto);

    List<TestPoint> qryTestPointByIds(String[] ids);
}
