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
<div class="title"><h2>题目管理</h2></div>
<form action="${ctx}/question/deleteQuestion.action" method="post" name="myform" id="myform">
<div class="table-operate ue-clear">
	<a href="#" class="add" onclick="addQuestion()">添加</a>
    <a href="javascript:;" class="del" onclick="deleteUser()">删除</a>
    <select id="course.courseId" name="courseId" class="query">
        <option value=0>--请选择科目--</option>
        <c:forEach items="${course}" var="obj">
            <option value="${obj.courseId}">${obj.courseName}</option>
        </c:forEach>
    </select>
    <select id="type.typeId" name="typeId" class="query">
        <option value=0>--请选择题型--</option>
        <c:forEach items="${type}" var="obj">
            <option value="${obj.typeId}">${obj.typeName}</option>
        </c:forEach>
    </select>
    <a href="#" class="count" onclick="queryByCourseAndType()">搜查</a>
</div>
<div class="table-box" id="myDiv">
	<table border="1" cellspacing="1" id="myTable">
    	<thead>
        	<tr>
        		<th class="num"></th>
        		<th class="name">题目编号</th>
                <th class="operate">题目名称</th>
                <th class="process">对应科目</th>
                <th class="process">题型</th>
                <th class="node">难度</th>
                <th class="time">备注</th>
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
	alert(txt);
	$(this).parent($(".select-list")).siblings($(".select-title")).find("span").text(txt);
})
$(function () {
	InitTable(0);
	InitPage('${pageInfo.total}');
})

function InitPage(total)
{
	$('.pagination').pagination(total,{
		callback: InitTable,
		display_msg: true,
		setPageNo: false
	});
}
function queryByCourseAndType()
{
    var typeId = $("select[name=typeId]").val();
    var courseId = $("select[name=courseId]").val();
    var data0 = {
        page:1,
        typeId:typeId,
        courseId:courseId
    };
    $.ajax({
        url:"${ctx}/question/qryPageInfoByCourseAndType.action",
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
function InitTable(page)
{
    var typeId = $("select[name=typeId]").val();
    var courseId = $("select[name=courseId]").val();
    var data0 = {
        page:page+1,
        typeId:typeId,
        courseId:courseId
    };
    $.ajax({
		url:"${ctx}/question/qryQuestionByCourseAndType.action",
		type:"post",
        contentType:"application/json",
		dataType: "json",
		data:JSON.stringify(data0),
		success: function(data){
			var html = "";
			html += "<tbody align='center'>";
			for(dataList in data){
				html += "<tr align='center'>";
				html += "<td><input type='checkbox' name='questionId' value='"+data[dataList].questionId+"'/></td>";
				html += "<td>"+data[dataList].questionId+"</td>";
				html += "<td>"+data[dataList].quesName+"</td>";
				html += "<td>"+data[dataList].course.courseName+"</td>";
				html += "<td>"+data[dataList].type.typeName+"</td>";
				if(data[dataList].difficulty == 1){
					html += "<td>低</td>";
				}else if(data[dataList].difficulty == 2){
					html += "<td>中下</td>";
				}else if(data[dataList].difficulty == 3){
					html += "<td>中等</td>";
				}else if(data[dataList].difficulty == 4){
                    html += "<td>中上</td>";
                }else if(data[dataList].difficulty >= 5){
                    html += "<td>高</td>";
                }

				if(data[dataList].remark==null){
					html += "<td>&nbsp;无&nbsp;</td>";
				}else{
					html += "<td>"+data[dataList].remark+"</td>";
				}
				html += "<td class='operate'><a href='${ctx}/question/delQuestion.action?questionId="+data[dataList].questionId+"' class='del'>删除</a>&nbsp;";
				html += "<a href='${ctx}/question/toUpdQuestion.action?questionId="+data[dataList].questionId+"' class='del'>编辑</a>&nbsp;";
				html += "<a href='${ctx}/question/toQryQuestion.action?questionId="+data[dataList].questionId+"' class='del'>查看</a></td>";
				html += "</tr>";
			}
			html += "</tbody>";
			$("tbody [align=center]").remove();
			$("#myTable").append(html);
		}
	});
}
function callback(ddatalist){
	alert(datalist);
	//todo:根据返回的datalist数据创建html结构展现给用户。
}

function deleteUser(){
	var ids = "";
    $("input:checkbox[name='questionId']:checked").each(function() {
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

function addQuestion(){
	//  以下三行，随便哪一行都行         
	document.myform.attributes["action"].value = "${ctx}/question/toAddQuestion.action";
	$("form").submit();
}

$("tbody").find("tr:odd").css("backgroundColor","#eff6fa");

showRemind('input[type=text], textarea','placeholder');
</script>
</html>