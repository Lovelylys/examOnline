package com.zh.service;

import com.github.pagehelper.PageInfo;
import com.zh.dto.ResultDto;
import com.zh.pojo.Paper;

/**
 * @author abs
 * @Date 2019/4/2 - 19:02
 */
public interface ResultService {
    PageInfo<Paper> queryResultByClassAndCourse(ResultDto resultDto, int i);
}
