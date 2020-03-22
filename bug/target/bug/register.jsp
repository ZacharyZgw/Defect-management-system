<%--
  Created by IntelliJ IDEA.
  User: zgw25
  Date: 2017/1/9
  Time: 17:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>缺陷管理系统注册</title>
    <link rel="shortcut icon" href="favicon.ico">
    <link href="static/css/bootstrap.min.css" rel="stylesheet">
    <link href="static/css/font-awesome.min.css" rel="stylesheet">
    <link href="static/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="static/css/animate.min.css" rel="stylesheet">
    <link href="static/css/mystyle.min.css" rel="stylesheet">
    <script>if(window.top !== window.self){ window.top.location = window.location;}</script>

</head>

<body class="gray-bg">

<div class="middle-box text-center loginscreen  animated fadeInDown">
    <div>
        <div>

            <h1 class="logo-name">ZGW</h1>

        </div>
        <h3>欢迎注册bug log</h3>
        <p>创建一个bug log新账户</p>
        <div class="m-t" role="form">
            <div class="form-group">
                <input type="text" id="newUserName" class="form-control" placeholder="请输入用户名" required="">
            </div>
            <div class="form-group">
                <input type="password" id="password" class="form-control" placeholder="请输入密码" required="">
            </div>
            <div class="form-group">
                <input type="password" id="password2" class="form-control" placeholder="请再次输入密码" required="">
            </div>
            <div class="form-group text-left">
                <div class="checkbox i-checks">
                    <label class="no-padding">
                        <input type="checkbox" id="check" value="agree"><i></i> 我同意注册协议</label>
                </div>
            </div>
            <button type="submit" class="btn btn-primary block full-width m-b" onclick="register()">注 册</button>

            <p class="text-muted text-center"><small>已经有账户了？</small><a href="/login.jsp">点此登录</a>
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
<script type="text/javascript">
    function register() {
        var newUserName = $("#newUserName").val();
        var password = $("#password").val();
        var password2 = $("#password2").val()
        var isagree = $("#check").val()
        if (!newUserName){
            alert("用户名不能为空");
            return;
        }
        if(!password || !password2){
            alert("请填写密码项");
            return;
        }
        if (password != password2){
            alert("两次密码不一致");
            return;
        }
        if(!isagree){
            alert("请同意注册协议");
            return;
        }
        $.ajax({
            type:"post",
            url:"/register",
            data:{"username":newUserName,"password":password,"password2":password2,"isagree":isagree},
            error:function () {
                alert("注册失败，请尝试");
            },
            success:function (data) {
                if (data ==1){
                    if (confirm("注册成功，前往登录页？")){
                        window.location.href = "/login.jsp";
                    }
                }
                if (data == -1){
                    alert("两次密码填写必须一致");
                }
                if (data == -3){
                    alert("用户已存在，请直接登录");
                }
            }
        })

    }
</script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>

