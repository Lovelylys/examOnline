<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="${ctx}/css/base.css" />
<link rel="stylesheet" href="${ctx}/css/info-mgt.css" />
<link rel="stylesheet" href="${ctx}/css/WdatePicker.css" />
<title>移动办公自动化系统</title>
</head>

<body>
<div class="title"><h2>信息管理</h2></div>
<form action="${ctx}/admin/deleteUser.action" method="post" name="myform" id="myform">
<div class="table-operate ue-clear">
	<a href="#" class="add" onclick="addUser()">添加</a>
    <a href="javascript:;" class="del" onclick="deleteUser()">删除</a>
</div>
<div class="table-box" id="myDiv"></div><%--修改了分页的用法，去掉了原来的form表单，一开始则使用ajax请求去加载页面--%>
<div class="pagination ue-clear"></div>
</form>
</body>
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script type="text/javascript" src="${ctx}/js/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.pagination.js"></script>
<script type="text/javascript">
$(".select-title").on("click",function(){
	$(".select-list").hide();
	$(this).siblings($(".select-list")).show();
	return false;
})
$(".select-list").on("click","li",function(){
	var txt = $(this).text();
	$(this).parent($(".select-list")).siblings($(".select-title")).find("span").text(txt);
})
$(function () {
    InitTable(0);//ajax请求去加载第一页
    InitPager();//开始页面插件用法
})
function InitPager()
{
    $('.pagination').pagination(${pageInfo.total},{
        callback: PageCallback,
        display_msg: true,
        setPageNo: false
    });
}
function PageCallback(index,jq)
{
    InitTable(index);
}
function InitTable(page)
{
    $.ajax({
        url:"${ctx}/admin/qryAllUser.action",
        method:"post",
        dataType: "json",
        data:{page:page+1},
        success: function (data){
            var html = "";
            html += "<table border='1' cellspacing='1'>";
            html += "<thead>";
            html += "<th class='num'></th>";
            html += "<th class='name'>账号</th><th class='operate'>昵称</th>";
            html += "<th class='process'>账户类型</th><th class='process'>账户状态</th><th class='node'>邮箱</th>";
            html += "<th class='time'>联系电话</th><th class='operate'>操作</th>";
            html += "</thead>";
            html += "<tbody align='center'>";
            for(dataList in data){
                html += "<tr align='center'>";
                html += "<td><input type='checkbox' name='userId' value='"+data[dataList].userId+"'/></td>";
                html += "<td>"+data[dataList].userId+"</td>";
                html += "<td>"+data[dataList].userName+"</td>";
                if(data[dataList].userType == 0){
                    html += "<td>学生</td>";
                }else if(data[dataList].userType == 1){
                    html += "<td>老师</td>";
                }else{
                    html += "<td>管理员</td>";
                }
                if(data[dataList].userState == 0){
                    html += "<td><font color='blue'>待审核</font></td>";
                }else if(data[dataList].userState == 1){
                    html += "<td>在用</td>";
                }else if(data[dataList].userState == 2){
                    html += "<td><font color='red'>注销</font></td>";
                }else{
                    html += "<td><font color='red'>审核不通过</font></td>";
                }
                html += "<td>"+data[dataList].email+"</td>";
                html += "<td>"+data[dataList].telephone+"</td>";
                html += "<td class='operate'><a href='${ctx}/admin/deleteUser.action?userId="+data[dataList].userId+"' class='del'>删除</a>&nbsp;";
                html += "<a href='${ctx}/admin/toUpdateUser.action?userId="+data[dataList].userId+"' class='del'>编辑</a>&nbsp;";
                html += "<a href='${ctx}/admin/toQryUserInfo.action?userId="+data[dataList].userId+"' class='del'>查看</a></td>";
                html += "</tr>";
            }
            html += "</tbody>";
            html += "</table>";
            $("#myDiv").html("");
            $("#myDiv").html(html);
        }
    });
}

function deleteUser(){
	//这里仅仅是为了处理是否传的空值
    var ids = "";
	$("input:checkbox[name='userId']:checked").each(function() {
		ids += $(this).val() + ",";
    });
	//判断最后一个字符是否为逗号，若是截取
	var id = ids.substring(ids.length -1, ids.length);
/*	if(id == ","){
		ids = ids.substring(0, ids.length-1);
	}*/
	if(ids == ""){
		alert("请选择要删除的记录！");
		return;
	}
	$("form").submit();
}

function addUser(){
	//  以下三行，随便哪一行都行         
/*	$("#myform").action="${ctx}/admin/toAddUser.action";
 	document.myform.action=‘new_url’;*/
	document.myform.attributes["action"].value = "${ctx}/admin/toAddUser.action"; 
	$("form").submit();
}

function addStu(){
	document.myform.attributes["action"].value = "${ctx}/admin/toAddUser.action";
	$("form").submit();
}

$("tbody").find("tr:odd").css("backgroundColor","#eff6fa");
// $("tbody tr:odd").css("backgroundColor","#eff6fa");
showRemind('input[type=text], textarea','placeholder');
window.onload= initTable(1);
</script>
</html>