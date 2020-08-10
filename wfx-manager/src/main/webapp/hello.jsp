<%--
  Created by IntelliJ IDEA.
  User: Bess Croft
  Date: 2020/8/9
  Time: 18:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <base href="<%=request.getContextPath()%>/"/>
    <link rel="stylesheet" href="layui/css/layui.css" />
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <style type="text/css">
        body{
            background-image: url(img/background.jpg);
            z-index: -1;
            background-size:cover;
            background-repeat:no-repeat;
            background-attachment:fixed;
            background-position:center;
        }
    </style>
</head>
<body>
<div class="layui-card">
    <div class="layui-card-header">欢迎！</div>
    <div class="layui-card-header">公告</div>
    <div class="layui-card-body">
        系统正在火速开发中！
    </div>
</div>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
<script type="text/javascript" src="layui/layui.all.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
</body>
</html>
