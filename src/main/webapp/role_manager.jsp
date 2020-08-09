<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Bess Croft
  Date: 2020/8/9
  Time: 12:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
    <div class="layui-card-header">角色信息管理</div>
    <div class="layui-card-body">
        <button type="button" class="layui-btn">添加用户角色</button>
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
                    <th>角色名称</th>
                    <th>角色描述</th>
                    <th>角色类型</th>
                    <th>角色权限</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${userRoleList}" var="userRole">
                <tr>
                    <td>${userRole.userId}</td>
                    <td>${userRole.userName}</td>
                    <td>${userRole.remark}</td>
                    <td>${userRole.role.roleName}</td>
                    <td>${userRole.role.roleDesc}</td>
                    <td>
                        <c:if test="${userRole.role.roleType == 1}">业务角色</c:if>
                        <c:if test="${userRole.role.roleType == 2}">管理角色</c:if>
                    </td>
                    <td>（扩展留空）</td>
                    <td>
                        <button type="button" class="layui-btn layui-btn-radius layui-btn-danger">修改</button>
                        <button type="button" class="layui-btn layui-btn-radius layui-btn-danger">删除</button>
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
