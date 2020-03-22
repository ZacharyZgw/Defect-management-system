<%--
  Created by IntelliJ IDEA.
  User: zgw25
  Date: 2017/1/3
  Time: 17:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="favicon.ico">
    <link href="static/css/bootstrap.min14ed.css" rel="stylesheet">
    <link href="static/css/main.css" rel="stylesheet">
    <link href="static/css/font-awesome.min93e3.css" rel="stylesheet">
    <link href="static/css/templatemo-style.css" rel="stylesheet">

</head>
<body>
<nav class="templatemo-top-nav col-lg-12 col-md-12">
    <ul class="text-uppercase">
        <li><a href="/index.jsp" class="active">首页</a></li>
        <li><a href="/bugList">缺陷列表</a></li>
        <li><a href="">缺陷添加</a></li>
        <li>${user.username}</li>
    </ul>
</nav>
</body>
</html>
