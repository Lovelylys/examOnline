package com.zh.mapper;


import com.zh.dto.QuestionDto;
import com.zh.pojo.Question;
import com.zh.pojo.TestPoint;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface QuestionMapper extends BaseMapper<Question> {

	public List<Question> createPaper(Map map);

    List<Question> qryQuestionByCourseAndType(QuestionDto questionDto);

    List<Question> createPaperByEasyQues(@Param("paraMap") Map<String, Integer> paraMap, @Param("paperList") List<Question> paperList);

    List<Question> createPaperByDiffiQues(@Param("paraMap") Map<String, Integer> paraMap, @Param("paperList") List<Question> paperList);
}
