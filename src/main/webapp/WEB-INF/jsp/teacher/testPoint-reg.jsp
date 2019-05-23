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
<div class="title"><h2>新增考点</h2></div>
<form action="${ctx}/type/addType.action" method="post" name="myform" id="myform">
<div class="main">
    <p class="short-input ue-clear">
    	<label><font style="color:red">*</font>第一层考点：</label>
        <input type="text" name="firstTestPoint" id="firstTestPoint" maxlength="10"/>
    </p>
    <p class="short-input ue-clear">
        <label>细分考点：</label>
        <input type="text" id="secondTestPoint" name="secondTestPoint"/>
    </p>
    <p class="short-input ue-clear">
        <label>更细分考点：</label>
        <input type="text" id="thirdTestPoint" name="thirdTestPoint"/>
    </p>
    <div class="long-input select ue-clear">
        <label><span style="color:red">*</span>所属课程：</label>
        <c:forEach items="${course}" var="cs">
            <input name="course.courseId" type="radio" value="${cs.courseId}" checked="checked"/>${cs.courseName}
        </c:forEach>
    </div>
    <div class="long-input select ue-clear">
        <label>所属年级：</label>
        <c:forEach items="${grade}" var="cs">
            <input name="grade.gradeId" type="radio" value="${cs.gradeId}" checked="checked"/>${cs.gradeName}
        </c:forEach>
    </div>
    <div class="long-input select ue-clear">
        <label>难度：</label>
        <input name="difficulty" type="radio" value="1"/>低
        <input name="difficulty" type="radio" value="2"/>中下
        <input name="difficulty" type="radio" value="3"/>中等
        <input name="difficulty" type="radio" value="4"/>中上
        <input name="difficulty" type="radio" value="5"/>高
    </div>
</div>
</form>
<div class="btn ue-clear">
	<a href="javascript:;" class="confirm" onclick="addTestPoint()">确定</a>
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
function addTestPoint(){
	document.myform.attributes["action"].value = "${ctx}/testPoint/addTestPoint.action";
	$("form").submit();
}

showRemind('input[type=text], textarea','placeholder');
</script>
</html>