package com.zh.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zh.dto.ResultDto;
import com.zh.mapper.PaperMapper;
import com.zh.pojo.Paper;
import com.zh.service.ResultService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author abs
 * @Date 2019/4/2 - 19:02
 */
@Service("resultService")
public class ResultServiceImpl implements ResultService {
    @Autowired
    private PaperMapper paperMapper;


    @Override
    public PageInfo<Paper> queryResultByClassAndCourse(ResultDto resultDto, int i) {
        Integer pageNum = resultDto.getPage()==null?1:resultDto.getPage();
        PageHelper.startPage(pageNum,i);
        List<Paper> results = paperMapper.queryResultByClassAndCourse(resultDto);
        PageInfo<Paper> pageInfo = new PageInfo<>(results);
        return pageInfo;
    }
}
