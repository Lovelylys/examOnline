package com.zh.mapper;

import com.zh.pojo.ExamClass;
import org.apache.ibatis.annotations.Param;

import java.io.Serializable;
import java.util.List;

/**
 * @author abs
 * @Date 2019/3/22 - 12:33
 */
public interface ExamClassMapper extends BaseMapper<ExamClass>{


    List<ExamClass> queryClassByGradeId(@Param("gradeId") String gradeId);
}
