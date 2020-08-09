<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Bess Croft
  Date: 2020/8/9
  Time: 14:02
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
    <div class="layui-card-header">菜单信息管理</div>
    <div class="layui-card-body">
        <button type="button" class="layui-btn">添加菜单选项</button>
        <table class="layui-table" lay-size="sm">
            <colgroup>
                <col width="150">
                <col width="200">
                <col>
            </colgroup>
            <thead>
                <tr>
                    <th>菜单编号</th>
                    <th>菜单编码</th>
                    <th>功能名称</th>
                    <th>请求路径</th>
                    <th>排序编号</th>
                    <th>上级功能</th>
                    <th>权限描述</th>
                    <th>是否展开</th>
                    <th>是否叶子节点</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${moduleList}" var="module">
                <tr>
                    <td>${module.moduleId}</td>
                    <td>${module.moduleCode}</td>
                    <td>${module.moduleName}</td>
                    <td>${module.linkUrl}</td>
                    <td>${module.moduleOrder}</td>
                    <td>${module.parentModule}</td>
                    <td>${module.moduleDesc}</td>
                    <td>
                        <c:if test="${module.expanded == 1}">是</c:if>
                        <c:if test="${module.expanded == 0}">否</c:if>
                    </td>
                    <td>
                        <c:if test="${module.leaf == 0}">否</c:if>
                        <c:if test="${module.leaf == 1}">是</c:if>
                    </td>
                    <td>
                        <c:if test="${module.moduleCode == '0101'}">
                            <button type="button" class="layui-btn layui-btn-radius layui-btn-disabled">修改</button>
                            <button type="button" class="layui-btn layui-btn-radius layui-btn-disabled">删除</button>
                        </c:if>
                        <c:if test="${module.moduleCode != '0101'}">
                            <button type="button" class="layui-btn layui-btn-radius layui-btn-danger">修改</button>
                            <button type="button" class="layui-btn layui-btn-radius layui-btn-danger">删除</button>
                        </c:if>
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
