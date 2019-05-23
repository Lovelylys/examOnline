package com.zh.mapper;

import com.zh.dto.AddQuestionDto;
import com.zh.dto.TestPointDto;
import com.zh.pojo.TestPoint;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author abs
 * @Date 2019/3/25 - 15:33
 */
public interface TestPointMapper extends BaseMapper<TestPoint> {

    List<TestPoint> qryTestPointByCourseAndGrade(TestPointDto testPointDto);

    List<TestPoint> qryFirstTestPointByCourse(@Param("courseId") String courseId);

    List<TestPoint> qrySecondTestPointByFirst(@Param("firstTestPoints") String[] firstTestPoints);

    List<TestPoint> qryThirdTestPointBySecond(@Param("secondTestPoints") String[] secondTestPoints);

    List<TestPoint> qryTestPointByPointNames(AddQuestionDto addQuestionDto);

    List<TestPoint> qryTestPointByIds(@Param("ids") String[] ids);
}
