<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="${ctx}/css/base.css" />
<link rel="stylesheet" href="${ctx}/css/info-mgt.css" />
    <link rel="stylesheet" href="${ctx}/css/info-reg.css" />
<link rel="stylesheet" href="${ctx}/css/jquery.searchableSelect.css" />
<title>移动办公自动化系统</title>
</head>

<body>
<div class="title"><h2>查看能力评价</h2></div>
<form action="${ctx}/answer/addQuesInfo.action" method="post" name="myform" id="myform">
<div class="table-box"  id='myDiv'>
        <table border="1" cellspacing="1" id="myTable">
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
</form>
<div class="btn ue-clear">
    <a href="${ctx}/answer/toAnswerPage.action" class="confirm">返回</a>
</div>
</body>
<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script type="text/javascript" src="${ctx}/js/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.searchableSelect.js"></script>
<script type="text/javascript">
$(function(){
	$("#grade").searchableSelect();
});
$(".select-title").on("click",function(){
	$(".select-list").toggle();
	return false;
});
$(".select-list").on("click","li",function(){
	var txt = $(this).text();
	$(".select-title").find("span").text(txt);
});

showRemind('input[type=text], textarea','placeholder');
</script>
</html>