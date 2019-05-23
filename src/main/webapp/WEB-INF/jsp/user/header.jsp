<%--
  Created by IntelliJ IDEA.
  User: LWG
  Date: 2019/4/4
  Time: 0:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="header">
    <div class="container">
        <div class="header-nav">
            <nav class="navbar navbar-default">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <h3><span>欢迎您，<font color="blue">${userName }</font> 同学</span></h3>
                </div>

                <div class="collapse navbar-collapse nav-wil" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li><a class="hvr-overline-from-center button2" href="${ctx}/user/toIndex.action">首页</a></li>
                        <li><a class="hvr-overline-from-center button2" href="${ctx}/user/toUserInfo.action?userId=${userId}">个人中心</a></li>
                        <!-- 							<li><a class="hvr-overline-from-center button2" href="onlinecheck.html">在线考试</a></li> -->
                        <li><a class="hvr-overline-from-center button2" href="${ctx}/stuPaper/toScoreQry.action?userId=${userId}">成绩查询</a></li>
                        <li><a class="hvr-overline-from-center button2" href="${ctx}/errorBook/toMyBooksPage.action?userId=${userId}">我的错题本</a></li>
                        <li><a class="hvr-overline-from-center button2" href="${ctx}/stuAnswer/toMyAnswerPage.action?userId=${userId}">我的能力</a></li>
                        <li><a class="hvr-overline-from-center button2" href="${ctx}/stuPaper/toMyPaperPage.action?userId=${userId}">我的试卷</a></li>
                        <li><a class="hvr-overline-from-center button2" href="${ctx}/user/toAbout.action">关于</a></li>
                    </ul>
                    <div class="search-box">
                        <div id="sb-search" class="sb-search">
                            <span class="sb-icon-search" onclick="exitSystem()"></span>
                        </div>
                    </div>
                </div>
            </nav>
        </div>
    </div>
</div>