package com.zh.mapper;


import com.zh.dto.QuestionDto;
import com.zh.pojo.ErrorBook;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface ErrorBookMapper extends BaseMapper<ErrorBook> {
	public List<ErrorBook> getBookInfo(@Param("userId") String userId);

    List<ErrorBook> qryQuestionByCourseAndType(QuestionDto questionDto);
}
