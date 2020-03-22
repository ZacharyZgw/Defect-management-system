<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%--
  Created by IntelliJ IDEA.
  User: zgw25
  Date: 2017/1/4
  Time: 17:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="favicon.ico">
    <link href="static/css/bootstrap.min.css" rel="stylesheet">
    <link href="static/css/font-awesome.min.css" rel="stylesheet">
    <link href="static/css/templatemo-style.css" rel="stylesheet">
    <link href="static/css/mystyle.min.css" rel="stylesheet">
    <style>
        .margin-top-100{
            margin-top: 100px;
        }
    </style>
</head>
<body>
<c:if test="${empty user}"><jsp:forward page="login.jsp"></jsp:forward></c:if>
<jsp:include page="common/left.jsp"></jsp:include>
<div class="templatemo-content col-1 light-gray-bg" style="height: 100%">
    <div class="templatemo-top-nav-container">
        <nav class="templatemo-top-nav col-lg-12 col-md-12">
            <ul class="text-uppercase">
                <li><a href="/index.jsp" >首页</a></li>
                <li><a href="/bugList" class="active">缺陷列表</a></li>
                <li><a href="/addBug.jsp">缺陷添加</a></li>
                <li><i class="fa fa-user"></i>&nbsp;&nbsp;${user.username}</li>
            </ul>
        </nav>
        <div class="row">
            <div class="col-md-10 " style="margin-top: 60px">
                <div class="panel panel-default">
                    <!-- Default panel contents -->
                    <div class="panel-heading"><span>缺陷列表</span>
                        <div role="presentation" class="dropdown" style="width:100px;float: right;top: -5px">
                            <button class=" btn btn-primary block full-width m-b dropdown-toggle " data-toggle="dropdown" href="#">
                                每页显示<span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu " role="menu" >
                                <li><a href="/bugList?count=5">5条记录</a></li>
                                <li><a href="/bugList?count=6">6条记录</a></li>
                                <li><a href="/bugList?count=7">7条记录</a></li>
                                <li><a href="/bugList?count=8">8条记录</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="panel-body">
                        <table class="table table-striped table-hover ">
                            <thead>
                            <th class="text-center">记录</th>
                            <th class="text-center">状态</th>
                            <th class="text-center">优先级</th>
                            <th class="text-center">工作量</th>
                            <th class="text-center">任务名称</th>
                            <th class="text-center">测试时间</th>
                            <th class="text-center">预计完成时间</th>
                            <th class="text-center">操作</th>
                            </thead>
                            <tbody>
                            <c:forEach items="${bugList}" var="bug" varStatus="st">
                                <tr>
                                    <th class="text-center">${bug.id}</th>
                                    <td class="text-center">${bug.status}</td>
                                    <td class="text-center">${bug.level}</td>
                                    <td class="text-center">${bug.worktime}</td>
                                    <td class="text-center">${bug.taskName}</td>
                                    <td class="text-center">${bug.testDate}</td>
                                    <td class="text-center">${bug.deadDate}</td>
                                    <td>
                                        <div>
                                            <input type="hidden" name="bugid" value="${bug.id}">
                                            <div role="presentation" class="dropdown">
                                                <button class=" btn btn-primary block full-width m-b dropdown-toggle " data-toggle="dropdown" href="#">
                                                    操作<span class="caret"></span>
                                                </button>
                                                <ul class="dropdown-menu " role="menu" >
                                                    <li><a href="/bugHandle?bugid=${bug.id}&method=delete" onclick="return confirm('确认删除?')">删除</a></li>
                                                    <li><a href="/bugHandle?bugid=${bug.id}&method=modify">修改</a>
                                                    </li>
                                                    <li></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                        <div class="right">
                            <a class="btn btn-link" href="/bugList?start=0&count=${count}">首页</a>
                            <a class="btn btn-link" href="/bugList?start=${pre}&count=${count}">上一页</a>
                            <a class="btn btn-link" href="/bugList?start=${next}&count=${count}">下一页</a>
                            <a class="btn btn-link" href="/bugList?start=${last}&count=${count}">尾页</a>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="col-md-10 ">
                    <div class="panel panel-default">
                        <!-- Default panel contents -->
                        <div class="panel-heading">缺陷登记</div>
                        <div class="panel-body">
                            <div>
                                <div class="form-group">
                                    <label for="bugid">缺陷编号</label>
                                    <input class="form-control" id="bugid" type="text" name="selectbugid" placeholder="${bud.id}" value="${bug.id}">
                                </div>
                                <div class="form-group">
                                    <label for="status" class="control-label">状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态</label>
                                    <select class="form-control" id="status">
                                        <option value="待修改">待修改</option>
                                        <option selected="selected" value="不合格">不合格</option>
                                        <option value="已验收">已验收</option>
                                        <option value="待修改">待修改</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">优先级别</label>
                                    <label class="radio-inline">
                                        <input style="display:inline-block " type="radio" name="level" id="inlineRadio1" value="高" checked> 高
                                    </label>
                                    <label class="radio-inline">
                                        <input style="display: inline-block" type="radio" name="level" id="inlineRadio2" value="中"> 中
                                    </label>
                                    <label class="radio-inline">
                                        <input style="display: inline-block" type="radio" name="level" id="inlineRadio3" value="低"> 低
                                    </label>
                                </div>
                                <div class="form-group">
                                    <label for="worktime">工&nbsp;作&nbsp;量</label>
                                    <select class="form-control" id="worktime">
                                        <option value="1">|</option>
                                        <option selected="selected" value="2">||</option>
                                        <option value="3">|||</option>
                                        <option value="4">||||</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="task">任务名称</label>
                                    <input type="text" class="form-control" id="task" datatype="s5-16" placeholder="请填写任务名称">

                                </div>
                                <div class="form-group">
                                    <label for="testDate">测试时间</label>
                                    <input type="text" class="form-control" id="testDate" placeholder="请填写测试时间:YYYY-MM-DD hh:mm:ss" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" >
                                </div>
                                <div class="form-group">
                                    <label for="deadLine">预计完成时间</label>
                                    <input type="text" class="form-control " id="deadLine" placeholder="请填写预计完成时间:YYYY-MM-DD hh:mm:ss" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})">
                                </div>
                                <div style="height: 20px"></div>
                                <button type="submit" class="btn btn-primary block full-width m-b" onclick="insert()">提交</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="static/js/jquery.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<%--<script type="text/javascript">
    function handleDelete() {
        var
    }
</script>--%>
<%--<script type="text/javascript">
    function handleModify()
    {
        var method = $("#modify").val();
        if (method == "修改"){
            method = "modify"
            alert(method);
        }

    }
    function handleDelete() {
        var bugid = $(this).parent().prev().val();
        var method = $("#delete").val();
        if (method == "删除"){
            method="delete";
        }
        alert(bugid+" "+method);
        if (confirm("确认删除")){
            $.ajax({
               type:"get",
                url:"/bugHandle",
                data:{"bugid":bugid,"method":method},
                error:function () {
                    alert("出现未知错误，请再次尝试");
                },
                success:function (data) {
                    if (data == 1);
                    alert("数据传递成功");
                }
            });
        }
    }

</script>--%>
</body>
</html>
