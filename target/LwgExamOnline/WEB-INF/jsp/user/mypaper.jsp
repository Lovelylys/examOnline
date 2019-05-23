<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
	function exitSystem(){
		window.location.href = "${ctx}/user/exitSys.action"	;
	}
</script>
<link href="${ctx}/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="${ctx}/css/style.css" rel="stylesheet" type="text/css" media="all" />
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
</script>

</head>
<body>
<!-- header -->
<jsp:include page="/WEB-INF/jsp/user/header.jsp"></jsp:include>
<div class="about">
	<div class="container">
            <table class="table table-bordered">
              <thead>
                <tr>
                  <th>试卷名称</th>
                  <th>试卷科目</th>
				  <th>开始时间</th>
				  <th>结束时间</th>
                  <th>最后得分</th>
                  <th>试卷状态</th>
                  <th>截止时间</th>
                </tr>
              </thead>
              <tbody>
              	<c:forEach items="${paper}" var="paper">
              	  <tr>
	                 <td>${paper.paperName}</td>
	                 <td>${paper.course.courseName}</td>
	                 <td>${paper.beginTime}</td>
				  	 <td>${paper.endTime}</td>
					 <td>${paper.score}</td>
					 <td>
						<c:if test="${paper.paperstate==1 && paper.flag == true}">
                            <a href="${ctx}/stuPaper/toPaperDetail.action?paperId=${paper.paperId}&userId=${paper.userId}"><font color="blue">点击开考</font></a>
                        </c:if>
                         <c:if test="${paper.paperstate !=1 || paper.flag == false}">已截止</c:if>
					 </td>
                      <td><fmt:formatDate value="${paper.deadLine }" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
	              </tr>
				</c:forEach>
              </tbody>
            </table>
	</div>
</div>
<script src="${ctx}/js/bootstrap.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
	$().UItoTop({ easingType: 'easeOutQuart' });
	});
</script>
<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>

</body>
</html>