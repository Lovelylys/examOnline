package com.zh.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zh.dto.AnswerDto;
import com.zh.mapper.AbilityMapper;
import com.zh.pojo.Ability;
import com.zh.service.AbilityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author abs
 * @Date 2019/4/3 - 11:20
 */
@Service("answerService")
public class AbilityServiceImpl implements AbilityService {

    @Autowired
    private AbilityMapper abilityMapper;

    @Override
    public PageInfo<Ability> queryAnswerByClassAndCourse(AnswerDto answerDto, int i) {
        Integer pageNum = answerDto.getPage() == null ? 1 : answerDto.getPage();
        PageHelper.startPage(pageNum, i);
        List<Ability> abilities = abilityMapper.queryAnswerByClassAndCourse(answerDto);
        PageInfo<Ability> pageInfo = new PageInfo<>(abilities);
        return pageInfo;
    }

    @Override
    public List<Ability> qryTestPointScoreByCourseAndStudent(Ability ability) {
        return abilityMapper.qryTestPointScoreByCourseAndStudent(ability);
    }

    @Override
    public PageInfo<Ability> queryAnswerByCourse(AnswerDto answerDto, int i) {
        Integer pageNum = answerDto.getPage() == null ? 1 : answerDto.getPage();
        PageHelper.startPage(pageNum, i);
        List<Ability> abilities = abilityMapper.queryAnswerByCourse(answerDto);
        PageInfo<Ability> pageInfo = new PageInfo<>(abilities);
        return pageInfo;
    }

    @Override
    public Ability qryAnswerByTestPointIdAndStudentId(Ability ability) {
        return abilityMapper.qryAnswerByTestPointIdAndStudentId(ability);
    }

    @Override
    public void insert(Ability newAbility) {
        abilityMapper.insert(newAbility);
    }

    @Override
    public void update(Ability ability) {
        abilityMapper.update(ability);
    }
}
