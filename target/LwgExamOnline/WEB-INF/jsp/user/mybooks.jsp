<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>在线考试系统</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> 
	addEventListener("load", function() { 
		setTimeout(hideURLbar, 0); 
	}, false);
	function hideURLbar(){ 
		window.scrollTo(0,1); 
	} 
</script>
<link href="${ctx}/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="${ctx}/css/style.css" rel="stylesheet" type="text/css" media="all" />
	<link rel="stylesheet" href="${ctx}/css/frontPagination.css" />
<script src="${ctx}/js/jquery-1.11.1.min.js"></script>
<script src="${ctx}/js/modernizr.custom.js"></script>
<script type="text/javascript" src="${ctx}/js/move-top.js"></script>
<script type="text/javascript" src="${ctx}/js/easing.js"></script>
	<script type="text/javascript" src="${ctx}/js/jquery.pagination.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
	function exitSystem(){
		window.location.href = "${ctx}/user/exitSys.action"	;
	}
</script>

</head>
<body>
<jsp:include page="/WEB-INF/jsp/user/header.jsp"></jsp:include>
 <div class="container">
				<div class="grid_5 grid_3">
				<div>按条件搜索错题：</div>
				<div>
				<select id="course.courseId" name="courseId">
					<option value=0>--请选择科目--</option>
					<c:forEach items="${course}" var="obj">
						<option value="${obj.courseId}">${obj.courseName}</option>
					</c:forEach>
				</select>
				<select id="type.typeId" name="typeId">
					<option value=0>--请选择题型--</option>
					<c:forEach items="${type}" var="obj">
						<option value="${obj.typeId}">${obj.typeName}</option>
					</c:forEach>
				</select>
			  <span class="typ1 t-button">
					<button class="label label-success" onclick="queryByCourseAndType()">搜索</button>
			  </span>
				</div>
	 		</div>
			<div class="progress">
				 <div class="progress-bar progress-bar-success" style="width: 35%"><span class="sr-only">35% Complete (success)</span></div>
				 <div class="progress-bar progress-bar-warning" style="width: 20%"><span class="sr-only">20% Complete (warning)</span></div>
				 <div class="progress-bar progress-bar-danger" style="width: 10%"><span class="sr-only">10% Complete (danger)</span></div>
			</div>
			<!-- 选择题 -->
			<div id="myDiv">
            </div>
	 <div class="pagination ue-clear"></div>
</div>
<!-- </div> -->
<script src="${ctx}/js/bootstrap.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$().UItoTop({ easingType: 'easeOutQuart' });
	});

	$(function () {
		InitTable(0);
		InitPage('${pageInfo.total}');
	});

	function InitPage(total)
	{
		$('.pagination').pagination(total,{
			callback: InitTable,
			display_msg: true,
			setPageNo: false,
			items_per_page : 3, // 每页显示多少条记录
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
			url:"${ctx}/errorBook/qryPageInfoByCourseAndType.action",
			type:"post",
			contentType:"application/json",
			dataType:"json",
			data:JSON.stringify(data0),
			success:function(data){
				var total = data.total;
                $("#myDiv").html("");
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
			url:"${ctx}/errorBook/qryErrorBookByCourseAndType.action",
			type:"post",
			contentType:"application/json",
			dataType: "json",
			data:JSON.stringify(data0),
			success: function(data){
				var html = "";
				for(dataList in data){
					html += "<p><h4 class='bars' align='left'>" + data[dataList].question.quesName + "</h4></p>";
                if(data[dataList].question.typeId == 1|| data[dataList].question.typeId ==2){
                    html += "<div class=\"input-group\">";
                    html += "<input name=\"userType\" type=\"radio\" value=\"1\"/><font size=\"4\">" + data[dataList].question.optionA  + "</font></br>";
                    html += "<input name=\"userType\" type=\"radio\" value=\"1\"/><font size=\"4\">" + data[dataList].question.optionB  + "</font></br>";
                    html += "<input name=\"userType\" type=\"radio\" value=\"1\"/><font size=\"4\">"+ data[dataList].question.optionC  + "</font></br>";

                    html += "<input name=\"userType\" type=\"radio\" value=\"1\"/><font size=\"4\">" + data[dataList].question.optionD  + "</font></br>";
                    html += "<p><h4 class=\"bars\"><font color=\"blue\">我的答案：" + data[dataList].userAnswer  + "</font></h4></p>";
                    html += "<p><h4 class=\"bars\">标准答案：" + data[dataList].question.answer  + "（ " + data[dataList].question.answerDetail  + "）</h4></p>";
                    html += "<p><h4 class=\"bars\"><font color=\"red\">解析：" + data[dataList].question.remark  + "</font></h4></p>";
                    html += "</div>"
                }else if(data[dataList].question.typeId == 5|| data[dataList].question.typeId ==3 || data[dataList].question.typeId ==4){
                    html += "<div class=\"input-group\">";
                    html += "<p><h4 class=\"bars\"><font color=\"blue\">我的答案：" + data[dataList].userAnswer  + " </font></h4></p>";
                    html += "<p><h4 class=\"bars\">标准答案：" + data[dataList].question.answer  + "（ " + data[dataList].question.answerDetail  + "）</h4></p>";
                    html += "<p><h4 class=\"bars\"><font color=\"red\">解析：" + data[dataList].question.remark  + "</font></h4></p>";
                    html += "</div>";
                }
				}
				$("#myDiv").html("");
				$("#myDiv").html(html);
			}
		});
	}
</script>
<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
</body>
</html>
