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
	addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); }
</script>
<link href="${ctx}/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="${ctx}/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="${ctx}/css/frontPagination.css" />
	<link rel="stylesheet" href="${ctx}/css/info-reg.css" />
<script src="${ctx}/js/jquery-1.11.1.min.js"></script>
<script src="${ctx}/js/modernizr.custom.js"></script>
<script type="text/javascript" src="${ctx}/js/move-top.js"></script>
<script type="text/javascript" src="${ctx}/js/easing.js"></script>
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
<div class="about">
<div class="container">
	${msgItem.errorInfo}
	<table class="table table-bordered" id="myTable">
		<thead>
		<tr>
			<th class="name">考点</th>
			<th class="name">细分考点</th>
			<th class="name">更细分考点</th>
			<th class="operate">得分率</th>
		</tr>
		</thead>
		<tbody align='center'>
		<c:forEach items="${answer}" var="obj" varStatus="index">
			<tr align='center'>
				<td>${obj.testPoint.firstTestPoint}
				<td>
					<c:if test="${obj.testPoint.thirdTestPoint == null}">
						无</c:if>
						${obj.testPoint.secondTestPoint}
				</td>
				<td>
					<c:if test="${obj.testPoint.thirdTestPoint == null}">
						无</c:if>
						${obj.testPoint.thirdTestPoint}
				</td>
				<td><font color='blue'>${obj.gettedScore / obj.score * 100}%</font></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
	<div class="btn ue-clear">
		<a href="${ctx}/stuAnswer/toMyAnswerPage.action" class="confirm">返回</a>
	</div>
</div>


<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>

</body>
<script src="${ctx}/js/bootstrap.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$().UItoTop({ easingType: 'easeOutQuart' });
	});
</script>
</html>
