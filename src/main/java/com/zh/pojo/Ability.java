package com.zh.pojo;

/**
 * @author abs
 * @Date 2019/3/21 - 20:52
 */
public class Ability {
    private Integer id;
    private Float gettedScore;
    private Float score;
    //直接做成id搬抄是为方便insert插入和更新不需要弄匿名类吧new Paper().setPaperId("sj001")这样
    private String studentId;
    private Integer testPointId;
    private Integer classId;
    private Integer courseId;

    private User student;
    private TestPoint testPoint;
    private ExamClass examClass;
    private Course course;

    public User getStudent() {
        return student;
    }

    public void setStudent(User student) {
        this.student = student;
    }

    public TestPoint getTestPoint() {
        return testPoint;
    }

    public void setTestPoint(TestPoint testPoint) {
        this.testPoint = testPoint;
    }

    public ExamClass getExamClass() {
        return examClass;
    }

    public void setExamClass(ExamClass examClass) {
        this.examClass = examClass;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Integer getTestPointId() {
        return testPointId;
    }

    public void setTestPointId(Integer testPointId) {
        this.testPointId = testPointId;
    }

    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
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

    public Float getGettedScore() {
        return gettedScore;
    }

    public void setGettedScore(Float gettedScore) {
        this.gettedScore = gettedScore;
    }

    public Float getScore() {
        return score;
    }

    public void setScore(Float score) {
        this.score = score;
    }
}
