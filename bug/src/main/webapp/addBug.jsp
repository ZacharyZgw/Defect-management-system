<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zgw25
  Date: 2017/1/4
  Time: 11:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>缺陷登记</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="favicon.ico">
    <link href="static/css/bootstrap.min.css" rel="stylesheet">
    <link href="static/css/font-awesome.min.css" rel="stylesheet">
    <link href="static/css/templatemo-style.css" rel="stylesheet">

</head>
<body>
<c:if test="${empty user}"><jsp:forward page="login.jsp"></jsp:forward></c:if>
<jsp:include page="common/left.jsp"></jsp:include>
<div class="templatemo-content col-1 light-gray-bg" style="height: 110%">
    <div class="templatemo-top-nav-container">
        <div class="row">
            <nav class="templatemo-top-nav col-lg-12 col-md-12">
                <ul class="text-uppercase">
                    <li><a href="/index.jsp">首页</a></li>
                    <li><a href="/bugList">缺陷列表</a></li>
                    <li><a href="/addBug.jsp" class="active">缺陷添加</a></li>
                    <li><i class="fa fa-user"></i>&nbsp;&nbsp;${user.username}</li>
                </ul>
            </nav>
            <div class="col-md-10 " style="margin-top: 60px">
                <div class="panel panel-default">
                    <!-- Default panel contents -->
                    <div class="panel-heading">缺陷登记</div>
                    <div class="panel-body">
                        <div>
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
                                <label style="margin-right: 20px;">优先级别</label>
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
<script src="static/js/jquery.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<script src="static/js/Validform_v5.3.2_min.js"></script>
<script src="static/js/plugins/layer/laydate/laydate.js"></script>
<script type="text/javascript">
    laydate({elem:"#hello",event:"focus"});var start={elem:"#start",format:"YYYY/MM/DD hh:mm:ss",min:laydate.now(),max:"2099-06-16 23:59:59",istime:true,istoday:false,choose:function(datas){end.min=datas;end.start=datas}};var end={elem:"#end",format:"YYYY/MM/DD hh:mm:ss",min:laydate.now(),max:"2099-06-16 23:59:59",istime:true,istoday:false,choose:function(datas){start.max=datas}};laydate(start);laydate(end);
</script>
<script>
    function insert() {
        var status = $('#status').val();
        var level = $("input[name='level']").val();
        var worktime = $('#worktime').val();
        var taskName = $('#task').val();
        var testdate = $('#testDate').val();
        var deadtime = $('#deadLine').val();
        /*alert(status+" "+level+" "+worktime+" "+taskName+" "+testdate+" "+deadtime);*/
        $.ajax({
            type:"post",
            url:"/addBug",
            data:{"status":status,"level":level,"workTime":worktime,"taskName":taskName,"testdate":testdate,"deadtime":deadtime},
            error:function () {
                alert("请检查表单填写，选项不能为空");

            },
            success:function (data) {
                if (data == "-1"){
                    alert("存在数据项为空");
                }else {
                    alert("成功插入数据");
                    $('#task').val("");
                    $('#testDate').val("");
                    $('#deadLine').val("");
                }
            }

        });

    }
</script>
</body>
</html>