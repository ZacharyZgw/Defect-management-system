<%--
  Created by IntelliJ IDEA.
  User: zgw25
  Date: 2017/1/3
  Time: 20:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="static/css/bootstrap.min.css">
    <link href="static/css/font-awesome.min.css" rel="stylesheet">
    <link href="static/css/templatemo-style.css" rel="stylesheet">
</head>
<body>
    <div class="templatemo-flex-row" style="float: left">
    <div class="templatemo-sidebar">
        <header class="templatemo-site-header">
            <div class="square"></div>
            <h1>缺陷管理系统</h1>
        </header>
        <div class="profile-photo-container">
            <img src="static/iamge/profile-photo.jpg" alt="Profile Photo" class="img-responsive">
            <div class="profile-photo-overlay"></div>
        </div>
        <div class="mobile-menu-icon">
            <i class="fa fa-bars"></i>
        </div>
        <nav class="templatemo-left-nav">
            <ul style="margin-top: 20px">
                <li><a href="/index.jsp"><i class="fa fa-home fa-fw"></i>首页</a></li>
                <li><a href="/bugList"><i class="fa fa-bar-chart fa-fw"></i>缺陷列表</a></li>
                <li><a href="/addBug.jsp"><i class="fa fa-database fa-fw"></i>缺陷登记</a></li>
                <li><a href="/loginout"><i class="fa fa-power-off"></i>注销</a></li>
            </ul>
        </nav>
    </div>
    </div>

</body>
</html>
