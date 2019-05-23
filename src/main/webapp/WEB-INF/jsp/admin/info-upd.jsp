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
<div class="title"><h2>用户更新</h2></div>
<form action="${ctx}/admin/updateUser.action" method="post" name="myform" id="myform">
<div class="main">
	<p class="short-input ue-clear">
    	<label><span style="color:red">*</span>账号：</label>
        ${user.userId }
        <input type="hidden" placeholder="登录账号" name="userId" id="userId" value="${user.userId }"/>
    </p>
    <p class="short-input ue-clear">
    	<label><span style="color:red">*</span>昵称：</label>
        <input type="text" placeholder="用户昵称" name="userName" id="userName" maxlength="6" value="${user.userName }"/>
    </p>
    <p class="short-input ue-clear">
    	<label><span style="color:red">*</span>密码：</label>
        <input type="password" placeholder="登录密码" name="userPwd" id="userPwd"  value="${user.userPwd }"/>
    </p>
    <div class="long-input select ue-clear">
    	<label><span style="color:red">*</span>年级：</label>
    	<c:forEach items="${grade}" var="cs">
			<input name="grade" type="radio" value="${cs.gradeId}" <c:if test="${user.grade.gradeId eq cs.gradeId}">checked="checked"</c:if>
                   onclick="getClass()"/>${cs.gradeName}
		</c:forEach>
    </div>

    <div class="short-input select ue-clear">
    	<label><span style="color:red">*</span>账号类型：</label>
    	<input name="userType" type="radio" value="0"  <c:if test="${user.userType eq 0}">checked="checked"</c:if> onclick="getClass()"/>学生
    	<input name="userType" type="radio" value="1"  <c:if test="${user.userType eq 1}">checked="checked"</c:if> onclick="notClass()"/>老师
    	<input name="userType" type="radio" value="2" <c:if test="${user.userType eq 2}">checked="checked"</c:if> onclick="notClass()"/>管理员
    </div>
    <p class="short-input ue-clear">
    	<label><span style="color:red">*</span>邮箱：</label>
        <input type="text" onblur="checkEmail()" id="email" name="email"  value="${user.email }"/>
        <span style="color: red" id="emailInfo"></span>
    </p>
    <p class="short-input ue-clear">
    	<label>联系电话：</label>
        <input type="text" onfocus="checkPhone()" id="telephone" name="telephone"  value="${user.telephone }"/>
    </p>
    <p class="long-input ue-clear">
    	<label>地址：</label>
        <input type="text" id="address" name="address" value="${user.address }"/>
    </p>
    <p class="short-input ue-clear">
    	<label>备注：</label>
        <textarea placeholder="请输入内容" id="remark" name="remark">${user.remark }</textarea>
    </p>
    <div class="short-input select ue-clear" id="addClass"></div>
</div>
</form>
<div class="btn ue-clear">
	<a href="javascript:;" class="confirm" onclick="addUser()">确定</a>
    <a href="${ctx}/admin/getAllUser.action" class="clear" >返回</a>
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

function checkEmail(){
	var email = $("#email").val();
	if(email == ""){
		$("#emailInfo").html("请输入邮箱");
		return;
	}
	var req = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
	if(!req.test(email)){
		$("#emailInfo").html("邮箱格式不正确");
		$("#email").focus();
		return;
	}
}

//注册
function addUser(){
	document.myform.attributes["action"].value = "${ctx}/admin/updateUser.action";
	$("form").submit();
}
$(function () {
    var userType = $("input:radio[name=userType]:checked").val();
    if(userType == 0)
    {
        //ajax请求，返回所有的班级name和id，返回class对象组
        getClass();
    }else
    {
        $("#addClass").html("");
    }
})
function notClass()
{
    $("#addClass").html("");
}

function getClass()
{
    var userType = $("input:radio[name=userType]:checked").val();
    var gradeid = $("input:radio[name=grade]:checked").val();
    var examClassId = '${user.classId}';
    $.ajax({
        type: "post",
        url: "${ctx}/examClass/queryClassByGradeId.action",
        data: {gradeId:gradeid},
        dataType: "json",
        success: function(data){
            var html = "";
            if(userType == 0){
                html += "<label><span style=\"color:red\">*</span>班级：</label>";
                for(var i=0; i < data.length; i++)
                {
                    if(examClassId == data[i].id)
                    {
                        html += "<input type='radio'name='classId' checked='checked' value=" + data[i].id + ">" + data[i].className;
                    }else{
                        html += "<input type='radio'name='classId' value=" + data[i].id + ">" + data[i].className;
                    }
                }
            }
            $("#addClass").html("");
            $("#addClass").html(html);
        }
    });
}

showRemind('input[type=text], textarea','placeholder');
</script>
</html>