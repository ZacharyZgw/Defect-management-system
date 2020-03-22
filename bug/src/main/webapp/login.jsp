<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="common/taglib.jsp"%>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="favicon.ico">
    <link href="static/css/bootstrap.min.css" rel="stylesheet">
    <link href="static/css/font-awesome.min.css" rel="stylesheet">
    <link href="static/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="static/css/animate.min.css" rel="stylesheet">
    <%--<link href="static/css/templatemo-style.css">--%>
    <link href="static/css/login.min.css">
    <link href="static/css/mystyle.min.css" rel="stylesheet">
    <script>
        if (window.top != window.self){
            window.top.location = window.location;
        }
    </script>
</head>
<body class="gray-bg">
    <div class="middle-box text-center loginscreen animated fadeInDown">
        <div>
            <div>
                <h1 class="logo-name">Zgw</h1>
            </div>
            <h3>欢迎使用Bug Log</h3>
            <div class="m-t">
                <div class="form-group">
                    <input type="text" class="form-control" id="username" placeholder="请输入用户名" required="" value="">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" id="password" placeholder="请输入密码" required="">
                </div>
                <button type="submit" class="btn btn-primary block full-width m-b" onclick="login()">登录</button>
                <p class="text-muted text-center"><small>没有账户？</small><a href="/register.jsp">注册一个新账号</a>
                </p>
            </div>
        </div>
    </div>
    <script src="static/js/jquery.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
    <script src="static/js/plugins/iCheck/icheck.min.js"></script>
    <script>
        $(document).ready(function(){$(".i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green",})});
    </script>
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
    <script type="text/javascript">
        function login() {
            var username = $("#username").val();
            if (username == null || username == ""){
                alert("用户名不能为空");
                $("#username").focus();
                return false;
            }
            var password = $("#password").val();
            if (password == null || password == ""){
                alert("密码不能为空");
                $("#password").focus();
                return false;
            }
            $.ajax({
                type:"post",
                url:"/login",
                data:{"username":username,"password":password},
                error:function () {
                    alert("登录出错");
                },
                success:function (data) {
                    console.log(data);
                    if (data == -1) {
                        alert("用户不存在");
                    }else if (data == -2){
                        alert("用户名或密码错误");
                    }else{
                        window.location.href = "/index.jsp";
                    }
                }

            });
        }
    </script>
</body>
</html>
