<%--
  Created by IntelliJ IDEA.
  User: zgw25
  Date: 2017/1/3
  Time: 16:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="favicon.ico">
    <link href="static/css/bootstrap.min.css" rel="stylesheet">
    <link href="static/css/font-awesome.min.css" rel="stylesheet">
    <link href="static/css/templatemo-style.css" rel="stylesheet">

</head>
<body>
<c:if test="${empty user}"><jsp:forward page="login.jsp"></jsp:forward></c:if>
<jsp:include page="common/left.jsp"></jsp:include>
<div class="templatemo-content col-1 light-gray-bg" style="height: 100%">
    <div class="templatemo-top-nav-container">
        <nav class="templatemo-top-nav col-lg-12 col-md-12">
            <ul class="text-uppercase">
                <li><a href="#" class="active">首页</a></li>
                <li><a href="/bugList">缺陷列表</a></li>
                <li><a href="/addBug.jsp">缺陷添加</a></li>
                <li><i class="fa fa-user"></i>&nbsp;&nbsp;${user.username}</li>
            </ul>
        </nav>
        <div class="row">
            <div class="col-md-10 " style="margin-top: 60px">
                <div class="panel panel-default">
                    <!-- Default panel contents -->
                    <div class="panel-heading">项目目标</div>
                    <div class="panel-body">
                        <p>...</p>
                    </div>

                    <!-- List group -->
                    <ul class="list-group">
                        <li class="list-group-item">仿真实现一个基于B/S的书籍库存登记系统</li>
                        <li class="list-group-item">增量式开发，循序渐进完成项目</li>
                        <li class="list-group-item">掌握Web应用程序编程和调试技巧</li>
                        <li class="list-group-item">主要涉及以下主要知识点：</li>
                        <li class="list-group-item">
                            <ul class="list-group">
                                <li class="list-group-item">Model 2架构的实现</li>
                                <li class="list-group-item">使用Servlet实现控制器，JSP实现视图</li>
                                <li class="list-group-item">表单的各种组件的处理</li>
                                <li class="list-group-item">使用DAO模式，通过DataSource访问数据</li>
                                <li class="list-group-item">在Web应用程序中整合Oracle数据库</li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    </div>
<script src="static/js/jquery.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>

</body>
</html>
