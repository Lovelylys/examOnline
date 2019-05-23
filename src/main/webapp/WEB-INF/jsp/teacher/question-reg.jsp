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
<div class="title"><h2>题目录入</h2></div>
<form action="${ctx}/question/addQuesInfo.action" method="post" name="myform" id="myform">
<div class="main">
    <div class="long-input select ue-clear">
    	<label><span style="color:red">*</span>科目：</label>
    	<c:forEach items="${course}" var="cs">
			<input name="course.courseId" type="radio" value="${cs.courseId}" onclick="courseOnclick()"/>${cs.courseName}
		</c:forEach>
    </div>
    <div class="long-input select ue-clear">
    	<label><span style="color:red">*</span>题型：</label>
    	<c:forEach items="${type}" var="cs">
			<input name="type.typeId" type="radio" value="${cs.typeId}" checked="checked" onclick="typeOnclick()"/>${cs.typeName}
		</c:forEach>
    </div>
    <p class="long-input ue-clear">
    	<label>名称：</label>
        <input type="text" placeholder="请输入问题名称" name="quesName" id="quesName" />
        <span style="color: red" id="tipInfo">${message }</span>
    </p>
    <p class="long-input ue-clear" id="pa">
    	<label>选项A：</label>
        <input type="text" placeholder="选项A" name="optionA" id="optionA" value="${userId }"/>
        <span style="color: red" id="tipInfo">${message }</span>
    </p>
    <p class="long-input ue-clear" id="pb">
    	<label>选项B：</label>
        <input type="text" placeholder="选项B" name="optionB" id="optionB"  value="${userId }"/>
        <span style="color: red" id="tipInfo">${message }</span>
    </p>
    <p class="long-input ue-clear" id="pc">
    	<label>选项C：</label>
        <input type="text" placeholder="选项C" name="optionC" id="optionC"  value="${userId }"/>
        <span style="color: red" id="tipInfo">${message }</span>
    </p>
    <p class="long-input ue-clear" id="pd">
    	<label>选项D：</label>
        <input type="text" placeholder="选项D" name="optionD" id="optionD"  value="${userId }"/>
        <span style="color: red" id="tipInfo">${message }</span>
    </p>
    <p class="long-input ue-clear">
    	<label>答案：</label>
        <input type="text" placeholder="请输入答案" id="answer" name="answer"/>
    </p>
    <p class="long-input ue-clear">
    	<label>详解：</label>
        <input type="text"id="answerDetail" placeholder="请输入详解" name="answerDetail"/>
    </p>
    <p class="long-input ue-clear">
    	<label>备注：</label>
        <input type="text" id="remark" name="remark" placeholder="请输入备注信息"/>
    </p>
    <div class="long-input select ue-clear" id="testPointDiv">
    </div>
    <div class="long-input select ue-clear" id="secondTestPointDiv">
    </div>
    <div class="long-input select ue-clear" id="thirdTestPointDiv">
    </div>
</div>
</form>
<div class="btn ue-clear">
	<a href="javascript:;" class="confirm" onclick="addQuestion()">确定</a>
    <a href="${ctx}/question/toQuestionPage.action" class="clear">返回</a>
</div>
</body>
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script type="text/javascript" src="${ctx}/js/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.searchableSelect.js"></script>
<script type="text/javascript" src="${ctx}/static/custom/DynamicTestPoint.js"></script>
<script type="text/javascript">
    var ctx = '${ctx}';
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

function checkUserId(){
	var questionId = $("#questionId").val();
	if(questionId == ""){
		$("#tipInfo").html("请输入题目名称");
		$("#questionId").focus();
		return;
	}else{
		$("#tipInfo").html("");
	}
}

//注册
function addQuestion(){
	document.myform.attributes["action"].value = "${ctx}/question/addQuesInfo.action";
	$("form").submit();
}

function typeOnclick(){
	var typeId = $("input[name='type.typeId']:checked").val();
	if(typeId == "1" || typeId == "2"){//选择题就显示
		showOp();
	}else{
		hideOp();
	}
}

//隐藏选择题选项
function hideOp(){
	$("#pa").hide();
	$("#pb").hide();
	$("#pc").hide();
	$("#pd").hide();
}

//显示选择题选项
function showOp(){
	$("#pa").show();
	$("#pb").show();
	$("#pc").show();
	$("#pd").show();
}

showRemind('input[type=text], textarea','placeholder');
</script>
</html>