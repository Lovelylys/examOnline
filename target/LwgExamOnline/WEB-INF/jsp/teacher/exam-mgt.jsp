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
<div class="title"><h2>考试管理</h2></div>
<form action="${ctx}/paper/deletePaper.action" method="post" name="myform" id="myform">
<div class="table-operate ue-clear">
	<select id="course.courseId" name="courseId">
		<option value=0>--请选择科目--</option>
		<c:forEach items="${course}" var="obj">
			<option value="${obj.courseId}">${obj.courseName}</option>
		</c:forEach>
	</select>
	<select id="grade.gradeId" name="gradeId">
		<option value=0>--请选择年级--</option>
		<c:forEach items="${grade}" var="obj">
			<option value="${obj.gradeId}">${obj.gradeName}</option>
		</c:forEach>
	</select>
	<a href="#" class="count" onclick="queryByCourseAndGrade()">搜查</a>
</div>
<div class="table-box"  id='myDiv'>
	<table border="1" cellspacing="1" id="myTable">
    	<thead>
        	<tr>
        		<th class="num"></th>
        		<th class="name">试卷编号</th>
                <th class="operate">试卷名称</th>
                <th class="process">年级</th>
                <th class="process">对应科目</th>
                <th class="node">允许时长</th>
				<th class="node">发布班级</th>
                <th class="operate">操作</th>
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
function queryByCourseAndGrade()
{
	var gradeId = $("select[name=gradeId]").val();
	var courseId = $("select[name=courseId]").val();
	var data0 = {
		page:1,
		gradeId:gradeId,
		courseId:courseId
	};
	$.ajax({
		url:"${ctx}/paper/queryPageInfoByCourseAndGrade.action",
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
	var gradeId = $("select[name=gradeId]").val();
	var courseId = $("select[name=courseId]").val();
	var data0 = {
		page:page+1,
		gradeId:gradeId,
		courseId:courseId
	};
	$.ajax({
		url:"${ctx}/paper/queryPaperByCourseAndGrade.action",
		type:"post",
		contentType:"application/json",
		dataType: "json",
		data:JSON.stringify(data0),
		success: function(data){
			var html = "";
			var examClass = '${examClass}';
			html += "<tbody align='center'>";
			for(dataList in data){
				html += "<tr align='center'>";
				html += "<td><input type='checkbox' name='paperId' value='"+data[dataList].paperId+"'/></td>";
				html += "<td>"+data[dataList].paperId+"</td>";
				html += "<td>"+data[dataList].paperName+"</td>";
				html += "<td>"+data[dataList].grade.gradeName+"</td>";
				html += "<td>"+data[dataList].course.courseName+"</td>";
				html += "<td>"+data[dataList].allowTime+"</td>";
				if(data[dataList].classId == null){
                    html += "<td>无</td>";
                }else{
                    for(var i = 0; i < examClass.length; i++)
                    {
                        if(data[dataList].classId == examClass[i].id){
                            html += "<td>"+examClass[i].className+"</td>";
                            break;
                        }
                    }
                }
				if(data[dataList].paperState == 0){
					html += "<td class='operate'><a href='${ctx}/paper/deletePaper.action?paperId="+data[dataList].paperId+"' class='del'>发布</a>&nbsp;";
				}else{
					html += "<td>已发布</td>";
				}
				html += "<a href='${ctx}/paper/qryPaper.action?paperId="+data[dataList].paperId+"' class='del'>查看</a></td>";
				html += "</tr>";
			}
			html += "</tbody>";
			$("tbody [align=center]").remove();
			$("#myTable").append(html);
		}
	});
}
function deletePaper(){
	var ids = "";
	$("input:checkbox[name='paperId']:checked").each(function() {
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

function addUser(){
	document.myform.attributes["action"].value = "${ctx}/paper/toAddPaperPage.action";
	$("form").submit();
}

$("tbody").find("tr:odd").css("backgroundColor","#eff6fa");

showRemind('input[type=text], textarea','placeholder');
</script>
</html>