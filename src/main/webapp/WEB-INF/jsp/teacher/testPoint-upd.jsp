<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="${ctx}/css/base.css" />
<link rel="stylesheet" href="${ctx}/css/info-reg.css" />
<link rel="stylesheet" href="${ctx}/css/jquery.searchableSelect.css" />
<title>移动办公自动化系统</title>
</head>

<body>
<div class="title"><h2>更新考点信息</h2></div>
<form action="${ctx}/type/addType.action" method="post" name="myform" id="myform">
<div class="main">
    <p class="short-input ue-clear">
        <label><span style="color:red">*</span>编号：</label>
        ${testPoint.id }
        <input type="hidden" name="id" id="id" value="${testPoint.id }"/>
    </p>
    <p class="short-input ue-clear">
    	<label><font style="color:red">*</font>第一层考点:</label>
        <input type="text" name="firstTestPoint" id="firstTestPoint" value="${testPoint.firstTestPoint}"/>
    </p>
    <p class="short-input ue-clear">
        <label>细分考点：</label>
        <input type="text" id="secondTestPoint" name="secondTestPoint" value="${testPoint.secondTestPoint}"/>
    </p>
    <p class="short-input ue-clear">
        <label>更细分考点：</label>
        <input type="text" id="thirdTestPoint" name="thirdTestPoint" value="${testPoint.thirdTestPoint}"/>
    </p>
    <div class="long-input select ue-clear">
        <label><span style="color:red">*</span>所属课程：</label>
        <c:forEach items="${course}" var="cs">

            <input name="course.courseId" type="radio" value="${cs.courseId}"
                   <c:if test="${testPoint.course.courseId eq cs.courseId}">checked="checked"</c:if>/>${cs.courseName}
        </c:forEach>
    </div>
    <div class="long-input select ue-clear">
        <label>所属年级：</label>
        <c:forEach items="${grade}" var="cs">
            <input name="grade.gradeId" type="radio" value="${cs.gradeId}"
                   <c:if test="${testPoint.grade.gradeId eq cs.gradeId}">checked="checked"</c:if>/>${cs.gradeName}
        </c:forEach>
    </div>
    <div class="long-input select ue-clear">
        <label>难度：</label>

        <input name="difficulty" type="radio" value="1" <c:if test="${testPoint.difficulty eq 1}">checked="checked"</c:if>/>低
        <input name="difficulty" type="radio" value="2" <c:if test="${testPoint.difficulty eq 2}">checked="checked"</c:if>/>中下
        <input name="difficulty" type="radio" value="3" <c:if test="${testPoint.difficulty eq 3}">checked="checked"</c:if>/>中等
        <input name="difficulty" type="radio" value="4" <c:if test="${testPoint.difficulty eq 4}">checked="checked"</c:if>/>中上
        <input name="difficulty" type="radio" value="5" <c:if test="${testPoint.difficulty eq 5}">checked="checked"</c:if>/>高
    </div>
</div>
</form>
<div class="btn ue-clear">
	<a href="javascript:;" class="confirm" onclick="updTestPoint()">确定</a>
    <a href="${ctx}/testPoint/toTestPointPage.action" class="clear">返回</a>
</div>
</body>
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script type="text/javascript" src="${ctx}/js/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.searchableSelect.js"></script>
<script type="text/javascript">
$(function(){
	$("#grade").searchableSelect();
});
$(".select-title").on("click",function(){
	$(".select-list").toggle();
	return false;
});
$(".select-list").on("click","li",function(){
	var txt = $(this).text();
	$(".select-title").find("span").text(txt);
});

//注册
function updTestPoint(){
	document.myform.attributes["action"].value = "${ctx}/testPoint/updTestPoint.action";
	$("form").submit();
}

showRemind('input[type=text], textarea','placeholder');
</script>
</html>