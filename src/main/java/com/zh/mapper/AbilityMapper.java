package com.zh.mapper;

import com.zh.dto.AnswerDto;
import com.zh.pojo.Ability;

import java.util.List;

/**
 * @author abs
 * @Date 2019/4/3 - 10:34
 */
public interface AbilityMapper extends BaseMapper<Ability> {
    List<Ability> queryAnswerByClassAndCourse(AnswerDto answerDto);

    List<Ability> qryTestPointScoreByCourseAndStudent(Ability ability);

    List<Ability> queryAnswerByCourse(AnswerDto answerDto);

    Ability qryAnswerByTestPointIdAndStudentId(Ability ability);
}
