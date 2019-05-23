package com.zh.pojo;

/**
 * @author abs
 * @Date 2019/3/21 - 20:59
 */
public class TestPoint {
    private Integer id;
    private String firstTestPoint;
    private String secondTestPoint;
    private String thirdTestPoint;
    private Grade grade;
    private Course course;
    private Integer difficulty;

    public Integer getDifficulty() {
        return difficulty;
    }

    public void setDifficulty(Integer difficulty) {
        this.difficulty = difficulty;
    }

    public Grade getGrade() {
        return grade;
    }

    public void setGrade(Grade grade) {
        this.grade = grade;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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


}
