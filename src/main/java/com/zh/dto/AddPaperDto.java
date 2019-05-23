package com.zh.dto;

import com.zh.pojo.Paper;

/**
 * @author abs
 * @Date 2019/4/1 - 16:16
 */
public class AddPaperDto extends Paper {
    private Integer questionNum;
    private Integer difficulty;
    private String firstTestPoint;
    private String secondTestPoint;
    private String thirdTestPoint;
    private String[] firstTestPoints;
    private String[] secondTestPoints;
    private String[] thirdTestPoints;

    public Integer getQuestionNum() {
        return questionNum;
    }

    public void setQuestionNum(Integer questionNum) {
        this.questionNum = questionNum;
    }

    public Integer getDifficulty() {
        return difficulty;
    }

    public void setDifficulty(Integer difficulty) {
        this.difficulty = difficulty;
    }

    public String getFirstTestPoint() {
        return firstTestPoint;
    }

    public void setFirstTestPoint(String firstTestPoint) {
        this.firstTestPoint = firstTestPoint;
    }

    public String getSecondTestPoint() {
        return secondTestPoint;
    }

    public void setSecondTestPoint(String secondTestPoint) {
        this.secondTestPoint = secondTestPoint;
    }

    public String getThirdTestPoint() {
        return thirdTestPoint;
    }

    public void setThirdTestPoint(String thirdTestPoint) {
        this.thirdTestPoint = thirdTestPoint;
    }

    public String[] getFirstTestPoints() {
        return firstTestPoints;
    }

    public void setFirstTestPoints(String[] firstTestPoints) {
        this.firstTestPoints = firstTestPoints;
    }

    public String[] getSecondTestPoints() {
        return secondTestPoints;
    }

    public void setSecondTestPoints(String[] secondTestPoints) {
        this.secondTestPoints = secondTestPoints;
    }

    public String[] getThirdTestPoints() {
        return thirdTestPoints;
    }

    public void setThirdTestPoints(String[] thirdTestPoints) {
        this.thirdTestPoints = thirdTestPoints;
    }
}
