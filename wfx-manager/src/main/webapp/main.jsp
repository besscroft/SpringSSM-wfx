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
        <div class="layui-logo">layui 后台布局</div>
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
            <ul class="layui-nav layui-nav-tree" id="jiuzhe" lay-filter="test">
                <c:forEach items="${moduleList}" var="module" varStatus="xh">
<%--                    <c:if test="${xh.index == 0}">--%>
<%--                        <li class="layui-nav-item layui-nav-itemed">--%>
<%--                    </c:if>--%>
<%--                    <c:if test="${xh.index != 0}">--%>
<%--                        <li class="layui-nav-item">--%>
<%--                    </c:if>--%>
                    <li class="layui-nav-item">
                        <a class="" href="javascript:;" onclick="check('${module.moduleCode}')">${module.moduleName}</a>
                        <dl class="layui-nav-child" id="${module.moduleCode}">

                        </dl>
                    </li>
                </c:forEach>
<%--                <li class="layui-nav-item">--%>
<%--                    <a class="" href="javascript:;">所有商品</a>--%>
<%--                    <dl class="layui-nav-child">--%>

<%--                    </dl>--%>
<%--                </li>--%>

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
        // var $ = layui.jquery;
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
        element.render();
        // element.render('nav', 'layui-nav-item');
        // element.render('nav', 'test2');
        // element.render('nav', 'test3');
    });

    function check(a){
        var element = layui.element;
        var moduleCode = a;
        console.log(moduleCode);
        $("#"+moduleCode).html("");
        $.post("module/check",{parentModule:moduleCode},function(res){
            console.log(res);
            if (res.code == 200) {
                var arr = res.data;
                for(var i=0; i < arr.length; i++) {
                    if (arr[i].leaf == 0) {
                        var optionStr1 = "<dd><li class=\"layui-nav-item\" lay-filter=\"test2\"><a class=\"\" href=\"javascript:;\" target=\"main_self_frame\" onclick=\"check2('"+arr[i].moduleCode+"')\">"+arr[i].moduleName+"</a><dl class=\"layui-nav-child\" lay-filter=\"test3\" id=\""+arr[i].moduleCode+"\"><dd><a href=\"javascript:;\" target=\"main_self_frame\">三级菜单（伪代码）</a></dd></dl></li></dd>";
                        $("#" + moduleCode).append(optionStr1);
                        element.render(moduleCode);
                    } else {
                        var optionStr2 = "<dd><a href=\""+arr[i].linkUrl+"\" target=\"main_self_frame\">"+arr[i].moduleName+"</a></dd>";
                        $("#" + moduleCode).append(optionStr2);
                    }
                }
            }
        },"json");
    }

    function check2(b){
        var element = layui.element;
        var moduleCode2 = b;
        console.log(b);
        $("#"+b).html("");
        $.post("module/check",{parentModule:moduleCode2},function(res){
            console.log(res);
            if (res.code == 200) {
                var arr = res.data;
                for(var i=0; i < arr.length; i++) {
                    $("#" + moduleCode2).append("<dd><a href=\""+arr[i].linkUrl+"\" target=\"main_self_frame\">"+arr[i].moduleName+"</a></dd>");
                    element.render(moduleCode2);
                    // console.log("完成");
                }
            }
        },"json");
    }
</script>
</body>
</html>
