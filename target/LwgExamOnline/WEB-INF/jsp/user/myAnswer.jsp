<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>在线考试系统</title>
<!-- for-mobile-apps -->
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
			<span class="typ1 t-button">
					<button class="label label-success" onclick="queryAnswerByCourse()">搜索</button>
			  </span>
		</div>
		</div>
			<table class="table table-bordered" id="myTable">
              <thead>
                <tr>
                  <th>科目名称</th>
                  <th>操作</th>
                </tr>
              </thead>
            </table>
	<div class="pagination ue-clear"></div>
</div>
<script src="${ctx}/js/bootstrap.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$().UItoTop({ easingType: 'easeOutQuart' });
	});
	$(function () {
		InitTable(0);
		InitPage('${pageInfo.total}');
	});
	function queryAnswerByCourse()
	{
		var userId = '${userId}';
		var courseId = $("select[name=courseId]").val();
		var data0 = {
			page:1,
			courseId:courseId,
			userId:userId,
		};
		$.ajax({
			url:"${ctx}/stuAnswer/queryPageInfoByCourse.action",
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
		var userId = '${userId}';
		var courseId = $("select[name=courseId]").val();
		var data0 = {
			page:page+1,
			userId:userId,
			courseId:courseId,
		};
		$.ajax({
			url:"${ctx}/stuAnswer/queryAnswerByCourse.action",
			type:"post",
			contentType:"application/json",
			dataType: "json",
			data:JSON.stringify(data0),
			success: function(data){
				var html = "";
				html += "<tbody align='center'>";
				for(dataList in data){
					html += "<tr align='center'>";
					html += "<td>"+data[dataList].course.courseName+"</td>";
					html += "<td class='operate'><a href='${ctx}/stuAnswer/qryTestPointScoreByCourseAndStudentFront.action?studentId="+userId+"&courseId="+
							data[dataList].course.courseId+"' class='del'>查看本科目能力掌握</a></td>";
					html += "</tr>";
				}
				html += "</tbody>";
				$("tbody [align=center]").remove();
				$("#myTable").append(html);
			}
		});
	}
</script>
<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>

</body>
</html>
