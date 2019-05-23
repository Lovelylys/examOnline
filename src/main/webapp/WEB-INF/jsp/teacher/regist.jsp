<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="${ctx}/css/base.css" />
    <link rel="stylesheet" href="${ctx}/css/info-reg.css" />
    <link rel="stylesheet" href="${ctx}/css/jquery.searchableSelect.css" />
    <title>在线考试系统</title>
</head>

<body>
<div class="title"><h2>教师注册</h2></div>
<form action="${ctx}/teacher/addUserInfo.action" method="post" name="myform" id="myform">
    <input type="hidden" name="userType" value="1"/>
    <div class="main">
        <p class="short-input ue-clear">
            <label><span style="color:red">*</span>账号：</label>
            <input type="text" placeholder="登录账号" name="userId" id="userId" onblur="checkUserId()"/>
            <span style="color: red" id="tipInfo">${message }</span>
        </p>
        <p class="short-input ue-clear">
            <label><span style="color:red">*</span>昵称：</label>
            <input type="text" placeholder="用户昵称" name="userName" id="userName" maxlength="6"/>
        </p>
        <p class="short-input ue-clear">
            <label><span style="color:red">*</span>密码：</label>
            <input type="password" placeholder="登录密码" name="Pwd" id="Pwd"/>
        </p>
        <p class="short-input ue-clear">
            <label><span style="color:red">*</span>确认密码：</label>
            <input type="password" placeholder="确认密码" name="userPwd" id="userPwd" onblur="checkPwd()"/>
        </p>
        <div class="long-input select ue-clear">
            <label><span style="color:red">*</span>年级：</label>
            <c:forEach items="${grade}" var="cs">
                <input name="gradeId" type="radio" value="${cs.gradeId}" checked="checked" onclick="getClass()"/>${cs.gradeName}
            </c:forEach>
        </div>

        <p class="short-input ue-clear">
            <label><span style="color:red">*</span>邮箱：</label>
            <input type="text" onblur="checkEmail()" id="email" name="email"/>
            <span style="color: red" id="emailInfo"></span>
        </p>
        <p class="short-input ue-clear">
            <label>联系电话：</label>
            <input type="text" onfocus="checkPhone()" id="telephone" name="telephone"/>
        </p>
        <p class="long-input ue-clear">
            <label>地址：</label>
            <input type="text" id="address" name="address"/>
        </p>
        <div class="short-input select ue-clear" id="addClass"></div>
    </div>
</form>
<div class="btn ue-clear">
    <a href="javascript:;" class="confirm" onclick="regist()">确定</a>
</div>
<div align="center">我已经有一个账号，我要 <a href="${ctx}/teacher/toLogin.action" target="_self">登录</a></div>
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

    function checkUserId(){
        var userId = $("#userId").val();
        var tipInfo = $("#tipInfo").val();
        if(userId == ""){
            $("#tipInfo").html("请输入账号");
            $("#userId").focus();
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
        document.myform.attributes["action"].value = "${ctx}/teacher/addUserInfo.action";
        $("form").submit();
    }

    function checkPwd(){
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

    }
    layui.use('form', function () {
        var form = layui.form;
        form.render('radio');
    });
    showRemind('input[type=text], textarea','placeholder');
</script>
</html>