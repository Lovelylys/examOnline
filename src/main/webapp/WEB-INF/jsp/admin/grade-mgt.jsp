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
<div class="title"><h2>年级管理</h2></div>
<form action="${ctx}/grade/deleteGrade.action" method="post" name="myform" id="myform">
<div class="table-operate ue-clear">
	<a href="#" class="add" onclick="addGrade()">添加</a>
    <a href="javascript:;" class="del" onclick="deleteGrade()">删除</a>
</div>
<div class="table-box" id="myDiv"></div><%--同样修改表单，去掉，全由jquery的page插件处理--%>
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
});
$(".select-list").on("click","li",function(){
	var txt = $(this).text();
	$(this).parent($(".select-list")).siblings($(".select-title")).find("span").text(txt);
});
$(function () {
	InitTable(0);
	InitPage();
});
function InitPage()
{
	$('.pagination').pagination(${pageInfo.total},{
		callback: InitTable,
		display_msg: true,
		setPageNo: false
	});
}

function InitTable(page) {
	$.ajax({
		url:"${ctx}/grade/qryAllGrade.action",
		method:"post",
		dataType: "json",
		data:{page:page+1},
		success: function(data){
			var html = "";
			html += "<table border='1' cellspacing='1'>";
			html += "<thead>";
			html += "<th class='num'></th>";
			html += "<th class='name'>年级编号</th><th class='operate'>年级名称</th>";
			html += "<th class='time'>包含课程</th><th class='operate'>操作</th>";
			html += "</thead>";
			html += "<tbody align='center'>";

			for(dataList in data){
				html += "<tr align='center'>";
				html += "<td><input type='checkbox' name='gradeId' value='"+data[dataList].gradeId+"'/></td>";
				html += "<td>"+data[dataList].gradeId+"</td>";
				html += "<td>"+data[dataList].gradeName+"</td>";
				html += "<td>"+data[dataList].courseId+"</td>";
				html += "<td class='operate'><a href='${ctx}/grade/deleteGrade.action?gradeId="+data[dataList].gradeId+"' class='del'>删除</a>&nbsp;";
				html += "<a href='${ctx}/grade/toUpdGrade.action?gradeId="+data[dataList].gradeId+"' class='del'>编辑</a></td>";
				html += "</tr>";
			}
			html += "</tbody>";
			html += "</table>";
			$("#myDiv").html("");
			$("#myDiv").html(html);
		}
	});
}
function deleteGrade(){
	var ids = "";
	$("input:checkbox[name='gradeId']:checked").each(function() {
		ids += $(this).val() + ",";
    });
	//判断最后一个字符是否为逗号，若是截取
	var id = ids.substring(ids.length -1, ids.length);
	if(id == ","){
		ids = ids.substring(0, ids.length-1);
	}
	if(ids == ""){
		alert("请选择要删除的记录！");
		return;
	}
	$("form").submit();
}

function addGrade(){
	document.myform.attributes["action"].value = "${ctx}/grade/toAddGrade.action";
	$("form").submit();
}

$("tbody").find("tr:odd").css("backgroundColor","#eff6fa");

showRemind('input[type=text], textarea','placeholder');
</script>
</html>