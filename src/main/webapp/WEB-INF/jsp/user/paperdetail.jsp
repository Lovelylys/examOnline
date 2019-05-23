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
<link href="${ctx}/css/time.css" rel="stylesheet" type="text/css" media="all" />
	<link rel="stylesheet" href="${ctx}/css/frontPagination.css" />
<script src="${ctx}/js/jquery-1.11.1.min.js"></script>
<script src="${ctx}/js/modernizr.custom.js"></script>
<script type="text/javascript" src="${ctx}/js/move-top.js"></script>
<script type="text/javascript" src="${ctx}/js/easing.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.pagination.js"></script>


</head>
<body>
<jsp:include page="/WEB-INF/jsp/user/header.jsp"></jsp:include>
	<div class="time-item">
		<table class="table">
		  <thead>
			<tr>
				<th>
					<!-- <span id="day_show">0天</span> -->
					<strong id="hour_show">0时</strong>
					<strong id="minute_show">0分</strong>
					<strong id="second_show">0秒</strong>
				</th>
				<th>
					<span class="label label-primary" id="sp_start"></span>
				</th>
			</tr>
		  </thead>
		</table>
	</div>
	 <form action="${ctx}/stuPaper/dealPaper.action" method="post" id="myForm" name="myForm">
<!-- <div class="typrography"> -->
		 <input type="hidden" name="paperId" id="paperId" value="${paper.paperId }"/>
         <input type="hidden" name="beginTime" id="beginTime" value=""/>
         <input type="hidden" name="questionIds" id="questionIds" value=""/>
         <input type="hidden" name="answers" id="answers" value=""/>
	 <div class="container">
	 		<!-- 试卷名称 -->
			<h2 class="bars" align="center" id="paperName"><font color="blue">${paper.paperName }</font></h2>
	 		<div id="myDiv"></div>
		  <h3 class="t-button">
			<a href="javascript:;" onclick="submitPaper()"><span class="label label-success">提交试卷</span></a>&nbsp;&nbsp;
		  </h3>
		 <div class="pagination ue-clear"></div>
	</div>
</form>
<!-- </div> -->
<script src="${ctx}/js/bootstrap.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$().UItoTop({ easingType: 'easeOutQuart' });
	});
</script>
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
	var questionIds = new Array();
	var answers = new Array();

	var beginTime ="";
	var startFalg = true;
	var intDiff = parseInt('${paper.allowTime * 60}');//倒计时总秒数量
	function timer(intDiff){
		window.setInterval(function(){
			var day=0,
					hour=0,
					minute=0,
					second=0;//时间默认值
			if(intDiff > 0){
				startFalg =false;
				day = Math.floor(intDiff / (60 * 60 * 24));
				hour = Math.floor(intDiff / (60 * 60)) - (day * 24);
				minute = Math.floor(intDiff / 60) - (day * 24 * 60) - (hour * 60);
				second = Math.floor(intDiff) - (day * 24 * 60 * 60) - (hour * 60 * 60) - (minute * 60);
			}else{
				startFalg = true;
				submitPaper();
			}
			if (minute <= 9) minute = '0' + minute;
			if (second <= 9) second = '0' + second;
			$('#day_show').html(day+"天");
			$('#hour_show').html('<s id="h"></s>'+hour+'时');
			$('#minute_show').html('<s></s>'+minute+'分');
			$('#second_show').html('<s></s>'+second+'秒');
			intDiff--;
		}, 1000);
	}
	$(function () {
		beginTime= '${startTime}';
		$("#sp_start").html("考试中.....");
		if(startFalg)
			timer(intDiff);
	});

	function submitPaper(){
		getUserAnswer();
		var paperId = $("#paperId").val();
		var data0 = {
			"beginTime":beginTime,
			"paperId":paperId,
			"questionIds":questionIds,
			"answers":answers,
		};
		/*$.ajax({
			url:"${ctx}/stuPaper/dealPaper.action",
            type:"post",
            contentType:"application/json",
            dataType:"json",
            data:JSON.stringify(data0),
            success:function(data){
                alert(data.errorInfo);
				document.myForm.attributes["action"].value = "${ctx}/stuPaper/toScoreQry.action?userId=${userId}";
				$("form").submit();
			},
        });*/
        document.myForm.attributes["action"].value = "${ctx}/stuPaper/dealPaper.action";
        $("input[name='beginTime']").val(beginTime);
        $("input[name='questionIds']").val(questionIds);
        $("input[name='answers']").val(answers);
        $("form").submit();
	}
	/*
    分页用到函数
     */
	$(function () {
		InitTable(0);
		InitPage();
	})
	function InitPage()
	{
		$('.pagination').pagination(${total},{
			callback: InitTable,
			display_msg: false,
			items_per_page : 1, // 每页显示多少条记录
			prev_text : "&lt;&nbsp;上一题",   //上一页的文字
			next_text : "下一题&nbsp;&gt;",	   //下一页的文字
			setPageNo: false
		});
	}

	function InitTable(page)
	{
		var paperId = '${paper.paperId}';
		var userId = '${userId}';
		var data0 = {
			userId:userId,
			paperId:paperId,
			page:page+1
		};
		$.ajax({
			url:"${ctx}/stuPaper/qryPaperDetail.action",
			type:"post",
			dataType: "json",
			contentType:"application/json",
			data:JSON.stringify(data0),
			success: function(data){
				var html = "";
				html += "<div class=\"input-group\">";
				html += "<h4 class=\"bars\" align=\"left\"><font color=\"blue\">" + data.type.typeName + "</font></h4></br>";
				html += "<p><h4 class=\"bars\" align=\"left\">" + data.quesName + "</h4></p>";
				html += "<div class=\"input-group\">";
				if (data.type.typeId == 1) {
					html += "<input name=\"" + data.questionId + "\" type=\"radio\" value=\"A\" checked=\"checked\"/><font size=\"4\">" + data.optionA + "</font></br>";
					html += "<input name=\"" + data.questionId + "\" type=\"radio\" value=\"B\"/><font size=\"4\">" + data.optionB + "</font></br>";
					html += "<input name=\"" + data.questionId + "\" type=\"radio\" value=\"C\"/><font size=\"4\">" + data.optionC + "</font></br>";
					html += "<input name=\"" + data.questionId + "\" type=\"radio\" value=\"D\"/><font size=\"4\">" + data.optionD + "</font></br>";
				}else if(data.type.typeId ==2) {
					html += "<input name=\"" + data.questionId + "\" type=\"checkbox\" value=\"A\" checked=\"checked\"/><font size=\"4\">" + data.optionA + "</font></br>";
					html += "<input name=\"" + data.questionId + "\" type=\"checkbox\" value=\"B\"/><font size=\"4\">" + data.optionB + "</font></br>";
					html += "<input name=\"" + data.questionId + "\" type=\"checkbox\" value=\"C\"/><font size=\"4\">" + data.optionC + "</font></br>";
					html += "<input name=\"" + data.questionId + "\" type=\"checkbox\" value=\"D\"/><font size=\"4\">" + data.optionD + "</font></br>";
				}else if(data.type.typeId == 3){
					html += "<input name=\"" + data.questionId + "\" type=\"radio\" value=\"对\" checked=\"checked\"/><font size=\"4\">对</font></br>";
					html += "<input name=\"" + data.questionId + "\" type=\"radio\" value=\"错\"/><font size=\"4\">错</font></br>";
				} else if ( data.type.typeId ==4 || data.type.typeId ==5){
					html += "<span class='input-group-addon' id='sizing-addon2'>答案：</span>";
					html += "<input type='text' name='"+ data.questionId +"' id = '"+ data.questionId + "' placeholder = '请在此输入答案..'>";
				}
				html += "</div>";
				$("#myDiv").html("");
				$("#myDiv").html(html);
			}
		});

		getUserAnswer();
	}
	function getUserAnswer(){
		/*保存答案和题号*/
		var quesId = $("input[type='radio']:checked").attr("name");
		var answer = $("input[type='radio']:checked").val();
		if(quesId == null || quesId == ""){
			var quesId = $("input[type='text']").attr("name");
			var answer = $("input[type='text']").val();
		}
		if(quesId == null || quesId == ""){
			var quesId = $("input[type='checkbox']").attr("name");
			var ids = "";
			$("input:checkbox:checked").each(function() {
				ids += $(this).val() + ",";
			});
			//判断最后一个字符是否为逗号，若是截取
			var id = ids.substring(ids.length -1, ids.length);
			if(id == ","){
				ids = ids.substring(0, ids.length-1);
			}
			answer = ids;
		}
		questionIds.push(quesId);
		answers.push(answer);
	}
</script>
<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
</body>
</html>
