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
<div class="title"><h2>成绩管理</h2></div>
<form action="${ctx}/result/deletePaper.action" method="post" name="myform" id="myform">
<div class="table-operate ue-clear">
	<select id="classId" name="classId" class="query">
		<option value=0>--请选择班级--</option>
		<c:forEach items="${examClass}" var="obj">
			<option value="${obj.id}">${obj.className}</option>
		</c:forEach>
	</select>
	<select id="courseId" name="courseId" class="query">
		<option value=0>--请选择科目--</option>
		<c:forEach items="${course}" var="obj">
			<option value="${obj.courseId}">${obj.courseName}</option>
		</c:forEach>
	</select>
	<a href="#" class="count" onclick="queryByClassAndCourse()">搜查</a>
</div>
<div class="table-box"  id='myDiv'>
	<table border="1" cellspacing="1" id="myTable">
    	<thead>
        	<tr>
        		<th class="name">学生名称</th>
                <th class="operate">试卷名称</th>
                <th class="process">得分</th>
				<th class="process">总分</th>
                <th class="process">班级</th>
                <th class="node">试卷创建教师</th>
            </tr>
        </thead>
    </table>
</div>
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
	InitTable(0);
	InitPage('${pageInfo.total}');
});
function queryByClassAndCourse()
{
	var classId = $("select[name=classId]").val();
	var courseId = $("select[name='courseId']").val();
	var data0 = {
		page:1,
		classId:classId,
		courseId:courseId,
	};
	$.ajax({
		url:"${ctx}/result/queryPageInfoByClassAndCourse.action",
		type:"post",
		contentType:"application/json",
		dataType:"json",
		data:JSON.stringify(data0),
		success:function(data){
			var total = data.total;
			$("tbody [align=center]").remove();
			InitTable(0);
			InitPage(total);
		}
	});
}
function InitPage(total)
{
	$('.pagination').pagination(total,{
		callback: InitTable,
		display_msg: true,
		setPageNo: false
	});
}
function InitTable(page)
{
	var classId = $("select[name=classId]").val();
	var courseId = $("select[name='courseId']").val();
	var data0 = {
		page:page+1,
		classId:classId,
		courseId:courseId,
	};
	$.ajax({
		url:"${ctx}/result/queryResultByClassAndCourse.action",
		type:"post",
		contentType:"application/json",
		dataType: "json",
		data:JSON.stringify(data0),
		success: function(data){
			var html = "";
			html += "<tbody align='center'>";
			for(dataList in data){
				html += "<tr align='center'>";
				html += "<td>"+data[dataList].student.userName+"</td>";
				html += "<td>"+data[dataList].paperName+"</td>";
				html += "<td><font color='blue'>"+data[dataList].score+"</font></td>";
				html += "<td><font color='blue'>"+data[dataList].totalScore+"</font></td>";
				html += "<td>"+data[dataList].examClass.className+"</td>";
				html += "<td>"+data[dataList].teacher.userName+"</td>";
				html += "</tr>";
			}
			html += "</tbody>";
			$("tbody [align=center]").remove();
			$("#myTable").append(html);
		}
	});
}

$("tbody").find("tr:odd").css("backgroundColor","#eff6fa");

showRemind('input[type=text], textarea','placeholder');
</script>
</html>