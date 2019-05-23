package com.zh.service;

import com.github.pagehelper.PageInfo;
import com.zh.dto.AnswerDto;
import com.zh.pojo.Ability;

import java.util.List;

/**
 * @author abs
 * @Date 2019/4/3 - 11:20
 */
public interface AbilityService {
    PageInfo<Ability> queryAnswerByClassAndCourse(AnswerDto answerDto, int i);

    List<Ability> qryTestPointScoreByCourseAndStudent(Ability ability);

    PageInfo<Ability> queryAnswerByCourse(AnswerDto answerDto, int i);

    Ability qryAnswerByTestPointIdAndStudentId(Ability ability);

    void insert(Ability newAbility);

    void update(Ability ability);
}
