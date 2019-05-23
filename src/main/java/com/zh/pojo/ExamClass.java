package com.zh.pojo;

/**
 * @author abs
 * @Date 2019/3/21 - 20:45
 */
public class ExamClass {
    private Integer id;
    private String className;
    private Grade grade;

    public Grade getGrade() {
        return grade;
    }

    public void setGrade(Grade grade) {
        this.grade = grade;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }
}
