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
<div class="title"><h2>考试安排</h2></div>
<form action="${ctx}/paper/addExam.action" method="post" name="myform" id="myform">
    <input type="hidden"  id="paperId" name="paperId" value="${paperInfo.paperId }"/>
<div class="main">
	<p class="short-input ue-clear newstyle">
    	<label>试卷编号：</label><span style="color:blue" size="3">${paperInfo.paperId }</span>
    </p>
    <p class="short-input ue-clear newstyle">
    	<label>试卷名称：</label><span style="color:blue" size="3">${paperInfo.paperName }</span>
    </p>
    <p class="short-input ue-clear newstyle">
    	<label>允许时长：</label><span style="color:blue" size="3">${paperInfo.allowTime }分钟</span>
    </p>
    <p class="short-input ue-clear newstyle">
        <label>创建人：</label><span style="color:blue" size="3">${teacherName }</span>
    </p>
    <p class="short-input ue-clear newstyle">
        <label>截止时间：</label>
        <input type="text" placeholder="格式：2019-10-11 08:00" name="deadLine" id="deadLine"/>
    </p>
    <p class="short-input ue-clear newstyle">
        <label>发布班级：</label>
    <select id="classId" name="classId" onchange="classIdChange()">
        <option value=0>--请选择班级--</option>
        <c:forEach items="${examClass}" var="obj">
            <option value="${obj.id}">${obj.className}</option>
        </c:forEach>
    </select>
    </p>
    <p class="short-input ue-clear newstyle">
        <label>发布学生：</label>
    <select id="userId" name="userId">
    </select>
    </p>
</div>
</form>
<div class="btn ue-clear">
    <a href="javascript:;" class="confirm" onclick="addExam()">安排考试</a>
    <a href="${ctx}/paper/toPaperPage.action" class="confirm">返回</a>
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

function classIdChange()
{
    //联动ajax请求得到这个班级的学生id
    var classId = $("select[name='classId']").val();
    $.ajax({
       url:"${ctx}/teacher/qryStudentsByClassId.action",
       type:"post",
       dataType:"json",
       data:{
           classId:classId,
       },
       success:function (data) {
           html = "";
           html += " <option value=0>--可以不选学生--</option>";
           for(dataList in data){
                html += "<option value="+data[dataList].userId+">"+data[dataList].userName+"</option>"
           }
           $("select[name='userId']").html("");
           $("select[name='userId']").html(html);
       }
    });
}

//注册
function addExam(){
	document.myform.attributes["action"].value = "${ctx}/paper/addExam.action";
	$("form").submit();
}

function typeOnclick(){
	var typeId = $("input[name='typeId']:checked").val();
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

//情况所有
function clearAll(){
}

showRemind('input[type=text], textarea','placeholder');
</script>
</html>