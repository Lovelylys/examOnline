package com.zh.dto;

/**
 * @author abs
 * @Date 2019/3/25 - 19:47
 */
public class TestPointDto {
    private Integer courseId;
    private Integer gradeId;
    private Integer page;

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public Integer getGradeId() {
        return gradeId;
    }

    public void setGradeId(Integer gradeId) {
        this.gradeId = gradeId;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }
}
