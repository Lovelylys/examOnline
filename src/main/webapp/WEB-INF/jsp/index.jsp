<%--
  Created by IntelliJ IDEA.
  User: LWG
  Date: 2019/3/20
  Time: 20:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>1233333</title>
</head>
<body>
<h2>123213213</h2>
<div id="times"></div>
<div id="times2"></div>
<div id="times3"></div>
</body>
<script>
    function getD1() {
        //当前时间
        var date = new Date();
        //格式化
        var d1 = date.toLocaleTimeString();
        var d2 = date.getTime();
        var d3 = d1.getTime();
        //获取div
        var div1 = document.getElementById("times");
        var div2 = document.getElementById("times2");
        var div2 = document.getElementById("times3");
        div1.innerHTML = d1;
        div2.innerHTML = d2;
        div3.innerHTML = d3;
    }

    //使用定时器实现每一秒写一次时间
    setInterval("getD1();",1000);
</script>
</html>
