package com.zh.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zh.dto.AddQuestionDto;
import com.zh.dto.TestPointDto;
import com.zh.mapper.TestPointMapper;
import com.zh.pojo.TestPoint;
import com.zh.service.TestPointService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author abs
 * @Date 2019/3/25 - 16:01
 */
@Service("testPointService")
public class TestPointServiceImpl implements TestPointService {
    @Autowired
    private TestPointMapper testPointMapper;

    @Override
    public PageInfo<TestPoint> findByPage(TestPoint testPoint, Integer pageNo, Integer pageSize) {
        pageNo = pageNo == null?1:pageNo;
        pageSize = pageSize == null?10:pageSize;
        PageHelper.startPage(pageNo,pageSize);
        List<TestPoint> testPoints = testPointMapper.find(testPoint);
        PageInfo<TestPoint> page = new PageInfo<>(testPoints);
        return page;
    }

    @Override
    public PageInfo<TestPoint> qryTestPointByCourseAndGrade(TestPointDto testPointDto, int i) {
        Integer pageNo = testPointDto.getPage()==null?1:testPointDto.getPage();
        PageHelper.startPage(pageNo,i);
        List<TestPoint> testPoints = testPointMapper.qryTestPointByCourseAndGrade(testPointDto);
        PageInfo<TestPoint> page = new PageInfo<>(testPoints);
        return page;
    }

    @Override
    public void delete(int testPointId) {
        testPointMapper.delete(testPointId);
    }

    @Override
    public void insert(TestPoint testPoint) {
        testPointMapper.insert(testPoint);
    }

    @Override
    public TestPoint get(String testPointId) {
        return testPointMapper.get(testPointId);
    }

    @Override
    public void update(TestPoint testPoint) {
        testPointMapper.update(testPoint);
    }

    @Override
    public List<TestPoint> qryFirstTestPointByCourse(String courseId) {
        return testPointMapper.qryFirstTestPointByCourse(courseId);
    }

    @Override
    public List<TestPoint> qrySecondTestPointByFirst(String[] firstTestPoints) {
        return testPointMapper.qrySecondTestPointByFirst(firstTestPoints);
    }

    @Override
    public List<TestPoint> qryThirdTestPointBySecond(String[] secondTestPoints) {
        return testPointMapper.qryThirdTestPointBySecond(secondTestPoints);
    }

    @Override
    public List<TestPoint> qryTestPointByPointNames(AddQuestionDto addQuestionDto) {
        return testPointMapper.qryTestPointByPointNames(addQuestionDto);
    }

    @Override
    public List<TestPoint> qryTestPointByIds(String[] ids) {
        return testPointMapper.qryTestPointByIds(ids);
    }

}
