package com.zh.dto;

/**
 * @author abs
 * @Date 2019/4/8 - 20:41
 */
public class DealPaperDto {
    private String paperId;
    private String paperName;
    private String beginTime;
    private String[] questionIds;
    private String[] answers;

    public String getPaperId() {
        return paperId;
    }

    public void setPaperId(String paperId) {
        this.paperId = paperId;
    }

    public String getPaperName() {
        return paperName;
    }

    public void setPaperName(String paperName) {
        this.paperName = paperName;
    }

    public String getBeginTime() {
        return beginTime;
    }

    public void setBeginTime(String beginTime) {
        this.beginTime = beginTime;
    }

    public String[] getQuestionIds() {
        return questionIds;
    }

    public void setQuestionIds(String[] questionIds) {
        this.questionIds = questionIds;
    }

    public String[] getAnswers() {
        return answers;
    }

    public void setAnswers(String[] answers) {
        this.answers = answers;
    }
}
