package com.zh.mapper;

import com.zh.dto.ResultDto;
import com.zh.pojo.Result;

import java.util.List;

/**
 * @author abs
 * @Date 2019/4/2 - 18:37
 */
public interface ResultMapper extends BaseMapper<Result>{

    List<Result> queryResultByClassAndCourse(ResultDto resultDto);
}
