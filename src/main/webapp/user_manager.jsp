<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Bess Croft
  Date: 2020/8/8
  Time: 17:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户信息管理</title>
    <base href="<%=request.getContextPath()%>/"/>
    <link rel="stylesheet" href="layui/css/layui.css" />
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

<div class="layui-card" style="margin: 0.625rem 0.625rem 0.625rem 0.625rem;">
    <div class="layui-card-header">用户信息管理</div>
    <div class="layui-card-body">
        <button type="button" class="layui-btn">添加用户</button>
        <table class="layui-table">
            <colgroup>
                <col width="150">
                <col width="200">
                <col>
            </colgroup>
            <thead>
                <tr>
                    <th>用户编号</th>
                    <th>用户名</th>
                    <th>备注</th>
                    <th>人员类型</th>
                    <th>启用状态</th>
                    <th>最后登录时间</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${userList}" var="user">
                <tr>
                    <td>${user.userId}</td>
                    <td>${user.userName}</td>
                    <td>${user.remark}</td>
                    <td>
                        <c:choose>
                            <c:when test="${user.userType == 1}">客服账号</c:when>
                            <c:when test="${user.userType == 2}">管理账号</c:when>
                            <c:when test="${user.userType == 3}">内置账号</c:when>
                            <c:when test="${user.userType == 4}">财务账号</c:when>
                            <c:otherwise>物流账号</c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <c:if test="${user.enabled == 0}">未启用</c:if>
                        <c:if test="${user.enabled == 1}">启用中</c:if>
                    </td>
                    <td>${user.loginTime}</td>
                    <td>
                        <button type="button" class="layui-btn layui-btn-radius layui-btn-danger">修改</button>
                        <button type="button" class="layui-btn layui-btn-radius layui-btn-danger">删除</button>
                        <button type="button" class="layui-btn layui-btn-radius layui-btn-normal">授权</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
<script type="text/javascript" src="layui/layui.all.js"></script>
</body>
</html>
