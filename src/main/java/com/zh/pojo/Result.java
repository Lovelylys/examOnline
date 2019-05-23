package com.zh.pojo;

/**
 * @author abs
 * @Date 2019/3/21 - 20:46
 */
public class Result {
    private Integer id;
    private String studentId;
    private String paperId;
    private Integer objectScore;
    private Integer subjectScore;
    private Integer classId;
    private String teacherId;

    private ExamClass examClass;
    private User teacher;
    private User student;
    private Paper paper;

    public User getTeacher() {
        return teacher;
    }

    public void setTeacher(User teacher) {
        this.teacher = teacher;
    }

    public ExamClass getExamClass() {
        return examClass;
    }

    public void setExamClass(ExamClass examClass) {
        this.examClass = examClass;
    }


    public User getStudent() {
        return student;
    }

    public void setStudent(User student) {
        this.student = student;
    }

    public Paper getPaper() {
        return paper;
    }

    public void setPaper(Paper paper) {
        this.paper = paper;
    }

    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }

    public String getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getPaperId() {
        return paperId;
    }

    public void setPaperId(String paperId) {
        this.paperId = paperId;
    }

    public Integer getObjectScore() {
        return objectScore;
    }

    public void setObjectScore(Integer objectScore) {
        this.objectScore = objectScore;
    }

    public Integer getSubjectScore() {
        return subjectScore;
    }

    public void setSubjectScore(Integer subjectScore) {
        this.subjectScore = subjectScore;
    }
}
