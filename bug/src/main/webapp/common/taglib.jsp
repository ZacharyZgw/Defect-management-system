<%--
  Created by IntelliJ IDEA.
  User: zgw25
  Date: 2017/1/3
  Time: 10:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<%
    String path = request.getContextPath();
    int port = request.getServerPort();
    String basePath = null;
    if(port == 80){
        basePath = request.getScheme()+"://"+request.getServerName()+path;
    }else
    {
        basePath = request.getScheme()+"://"+request.getServerName()+":"+port+path;
    }
    request.setAttribute("basePath",basePath);
%>
</body>
</html>
