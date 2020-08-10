<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Bess Croft
  Date: 2020/8/7
  Time: 20:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>微分销平台管理系统</title>
    <base href="<%=request.getContextPath()%>/"/>
    <link rel="stylesheet" href="layui/css/layui.css" />
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">微分销平台管理系统</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">管理系统</a></li>
            <li class="layui-nav-item"><a href="">商户系统</a></li>
            <li class="layui-nav-item"><a href="">自媒体系统</a></li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="https://www.52bess.com/uploads/avatar.png" class="layui-nav-img">
                    ${user.userName}
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <c:forEach items="${modules}" var="m1">
                    <c:forEach items="${m1.moduleList}" var="m2">
                        <li class="layui-nav-item">
                            <a class="" href="javascript:;">${m2.moduleName}</a>
                            <dl class="layui-nav-child">
                                <c:forEach items="${m2.moduleList}" var="m3">
                                    <dd><a href="${m3.moduleUrl}" target="main_self_frame">${m3.moduleName}</a></dd>
                                </c:forEach>
                            </dl>
                        </li>
                    </c:forEach>
                </c:forEach>

            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <iframe src="hello.jsp" name="main_self_frame" frameborder="0" class="layadmin-iframe" width="100%" style="height: 99.9%"></iframe>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © BessCroft - 底部固定区域
    </div>
</div>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
<script type="text/javascript" src="layui/layui.all.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
</script>
</body>
</html>
