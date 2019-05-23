<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en" class="no-js">
<head>
<meta charset="utf-8">
<title>在线考试系统</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet" href="${ctx}/css/reset.css">
<link rel="stylesheet" href="${ctx}/css/supersized.css">
<link rel="stylesheet" href="${ctx}/css/userlogin.css">
<script src="${ctx}/js/jquery-1.8.2.min.js"></script>
<script src="${ctx}/js/supersized.3.2.7.min.js"></script>
<script src="${ctx}/js/supersized-init.js"></script>
<script src="${ctx}/js/scripts.js"></script>
<script type="text/javascript">
    var ctx = '${ctx}';
	function regist(){
		var Pwd = $("#Pwd").val();
		var userPwd =$("#userPwd").val();
		if(Pwd ==""){
			alert("登录密码不能为空");
			return;
		}
		if(userPwd ==""){
			alert("确认密码不能为空");
			return;
		}
		if(Pwd!=userPwd){
			alert("两次密码不一致，请重新输入！");
			return;
		}
		document.myform.attributes["action"].value = "${ctx}/user/addUserInfo.action";
		$("form").submit();
	}
	
	function checkUserId(){
		var userId = $("#userId").val();
		var tipInfo = $("#tipInfo").val();
		if(userId == ""){
			$("#tipInfo").html("请输入账号");
			$("#userId").focus();
			return;
		}
        if(/.*[\u4e00-\u9fa5]+.*/.test(userId)){
            $("#tipInfo").html("不能含有中文,数字or字母，ok？");
            return;
        }

	 	$.ajax({
	        type: "post",
	        url: "${ctx}/admin/userRegist.action",
	        data: {userId:userId},
	        dataType: "json",
	        success: function(data){
	        	$("#tipInfo").html(data.errorInfo);
	        }
	    });
	}
	
	function checkPwd(){
		var Pwd = $("#Pwd").val();
		var userPwd =$("#userPwd").val();
		if(Pwd!=userPwd && Pwd !="" && userPwd != ""){
			alert("两次密码不一致，请重新输入！");
			return;
		}
		
	}
$(function () {
    getClass();
})
    function getClass()
    {
        var gradeid = $("input:radio[name=gradeId]:checked").val();
        $.ajax({
            type: "post",
            url: "${ctx}/examClass/queryClassByGradeId.action",
            data: {gradeId:gradeid},
            dataType: "json",
            success: function(data){
                var html = "";
                    html += "<label><font style=\"color: red\">*</font>班级：</label>";
                    for(var i=0; i < data.length; i++)
                    {
                        html += "<input type='radio'name='classId' class='radio' checked='checked' value=" + data[i].id + ">" + data[i].className;
                    }
                    $("#classDiv").html("");
                    $("#classDiv").html(html);
            }
        });
    }

</script>
</head>
<body>
    <div class="page-container">
        <h1>用户注册</h1>
        <form action="${ctx}/user/toIndex.action" method="post" name="myform" id="myform">
            <input type="text" name="userId" id="userId" class="username" placeholder="用户账号" onblur="checkUserId()"><br><span style="color: red" id="tipInfo">${message }</span><br>
            <input type="text" name="userName" id="userName" placeholder="用户昵称">
            <input type="hidden" value="0" name="userType">
            <input type="password" name="Pwd" id="Pwd" class="password" placeholder="登录密码">
            <input type="password" name="userPwd" id="userPwd" class="password" placeholder="确认密码" onblur="checkPwd()"><br/>
            <label><font style="color: red">*</font>年级：</label>
            <c:forEach items="${grade}" var="grade">
				<input type="radio" checked="checked" name="gradeId" id="gradeId" value="${grade.gradeId }"
					class="radio" onclick="getClass()"/>${grade.gradeName } &nbsp;
			</c:forEach>
            <div id="classDiv"></div>
            <input type="text" name="email" id="email" class="username" placeholder="邮箱">
            <input type="text" name="telphone" id="telphone" placeholder="联系电话">
            <input type="text" name="address" id="address" placeholder="联系地址">
            <button type="button" onclick="regist()">注册</button>
            <div class="error"><span>${message }</span></div>
        </form>
        <div class="connect"></div>
    </div>
    <div align="center">我已经有一个账号，我要 <a href="${ctx}/user/toLogin.action" target="_self">登录</a></div>
</body>

</html>
