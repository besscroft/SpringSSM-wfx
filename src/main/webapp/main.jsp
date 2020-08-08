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
    <link rel="stylesheet" href="css/layui.css" />
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
        <iframe src="#" name="main_self_frame" frameborder="0" class="layadmin-iframe" width="100%" style="height: 99.9%"></iframe>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © BessCroft - 底部固定区域
    </div>
</div>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
<script type="text/javascript" src="js/layui.all.js"></script>
<script type="text/javascript" src="layui/lay/modules/element.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;
    });

    // $(function () {
    //     $.get("http://localhost:8080/SpringSSM_wfx/user/twocheck",function(res){
    //         console.log(res);
    //         if (res.code == 200) {
    //             var arr = res.data;
    //             for(var i=0; i < arr.length; i++) {
    //                 var optionStr = "<li class=\"layui-nav-item\">\n" +
    //                     "                    <a class=\"\" href=\"javascript:;\" onclick=\"check('"+arr[i].moduleCode+"')\">"+arr[i].moduleName+"</a>\n" +
    //                     "                    <dl class=\"layui-nav-child\" id=\""+arr[i].moduleCode+"\">\n" +
    //                     "                        \n" +
    //                     "                    </dl>\n" +
    //                     "                </li>";
    //                 $("#jiuzhe").append(optionStr);
    //             }
    //         }
    //     },"json");
    // });

    function check(a){
        var moduleCode = a;
        console.log(moduleCode);
        $("#"+moduleCode).html("<dd><a href=\"javascript:;\" style='display: none'></a></dd>");
        $.post("http://localhost:8080/SpringSSM_wfx/module/check",{parentModule:moduleCode},function(res){
            console.log(res);
            if (res.code == 200) {
                var arr = res.data;
                for(var i=0; i < arr.length; i++) {
                    if (arr[i].leaf == 0) {
                        var optionStr1 = "<dd>\n" +
                            "\t\t\t\t\t\t\t\t\t<li class=\"layui-nav-item layui-nav-itemed\">\n" +
                            "\t\t\t\t\t\t\t\t\t\t<a class=\"\" href=\"javascript:;\">"+arr[i].moduleName+"</a>\n" +
                            "\t\t\t\t\t\t\t\t\t\t<dl class=\"layui-nav-child\">\n" +
                            "\t\t\t\t\t\t\t\t\t\t\t<dd><a href=\"javascript:;\" target=\"main_self_frame\">列表一</a></dd>\n" +
                            "\t\t\t\t\t\t\t\t\t\t</dl>\n" +
                            "\t\t\t\t\t\t\t\t\t</li>\t\n" +
                            "\t\t\t\t\t\t\t\t</dd>";
                        $("#" + moduleCode).append(optionStr1);
                    } else {
                        var optionStr2 = "<dd><a href=\"javascript:;\">"+arr[i].moduleName+"</a></dd>";
                        $("#" + moduleCode).append(optionStr2);
                    }
                }
            }
        },"json");
    }

</script>
</body>
</html>
