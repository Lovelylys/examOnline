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
<jsp:include page="/WEB-INF/jsp/user/header.jsp"></jsp:include>

<div class="about-bottom-last">
	<div class="container">
				<div class="help-info">
					<h3 class="tittle">在线考试系统</h3>
				</div>
				<div class="client-say-grids">
					<div class="col-md-3 client-say-grid">
						<p>At vero eos et accusamus 
						et iusto odio dignissimos ducimus 
						qui blanditiis praesentium voluptatum 
						deleniti atque corrupti quos dolores 
						et quas molestias excepturi sint </p>
						<h4>界面简洁</h4>
					</div>
					<div class="col-md-3 client-say-grid">
						<p>At vero eos et accusamus 
						et iusto odio dignissimos ducimus 
						qui blanditiis praesentium voluptatum 
						deleniti atque corrupti quos dolores 
						et quas molestias excepturi sint </p>
						<h4>操作简单</h4>
					</div>
					<div class="col-md-3 client-say-grid">
						<p>At vero eos et accusamus 
						et iusto odio dignissimos ducimus 
						qui blanditiis praesentium voluptatum 
						deleniti atque corrupti quos dolores 
						et quas molestias excepturi sint </p>
						<h4>响应速度快</h4>
					</div>
					<div class="col-md-3 client-say-grid">
						<p>At vero eos et accusamus 
						et iusto odio dignissimos ducimus 
						qui blanditiis praesentium voluptatum 
						deleniti atque corrupti quos dolores 
						et quas molestias excepturi sint </p>
						<h4>可扩展性高</h4>
					</div>
					<div class="clearfix"></div>
				</div>
	</div>
</div>
<!-- //about -->
<!-- footer -->
<div class="footer">
	<div class="container">
		<div class="footer-grids">
			<div class="col-md-3 footer-grid">
				<h3>简洁美观</h3>
				<ul>
					<li><a href="#">SUMMER CAMPS</a></li>
					<li><a href="#">CELEBRATIONS</a></li>
				</ul>
			</div>
			<div class="col-md-3 footer-grid">
				<h3>联系地址</h3>
				<ul>
					<li><a href="#">福州闽侯上街</a></li>
				</ul>
			</div>
			<div class="col-md-3 footer-grid">
				<h3>联系电话</h3>
				<ul>
					<li><a href="#">+86 183****1234</a></li>
					<li><a href="#">0591 55555555</a></li>
				</ul>
			</div>
			<div class="col-md-3 footer-grid">
				<h3>响应速度快</h3>
				<ul>
					<li><a href="#">PRESENTATIONS</a></li>
					<li><a href="#">SEMINARS</a></li>
				</ul>
			</div>


		</div>
</p>
	</div>
</div>
<!-- //footer -->
<!-- for bootstrap working -->
	<script src="${ctx}/js/bootstrap.js"></script>
<!-- //for bootstrap working -->
<!-- smooth scrolling -->
	<script type="text/javascript">
		$(document).ready(function() {
		/*
			var defaults = {
			containerID: 'toTop', // fading element id
			containerHoverID: 'toTopHover', // fading element hover id
			scrollSpeed: 1200,
			easingType: 'linear' 
			};
		*/								
		$().UItoTop({ easingType: 'easeOutQuart' });
		});
	</script>
	<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
<!-- //smooth scrolling -->

</body>
</html>
