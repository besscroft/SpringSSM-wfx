<%--
  Created by IntelliJ IDEA.
  User: Bess Croft
  Date: 2020/8/7
  Time: 19:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>微分销平台管理系统</title>
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
<body class="layui-layout-body">

    <div class="layui-layout layui-layout-admin">
        <!--导航栏-->
        <div class="layui-header">
            <div class="layui-logo">微分销平台管理系统</div>
            <!-- 头部区域（可配合layui已有的水平导航） -->
            <ul class="layui-nav layui-layout-left">
                <li class="layui-nav-item"><a href="">管理系统</a></li>
                <li class="layui-nav-item"><a href="">商户系统</a></li>
                <li class="layui-nav-item"><a href="">自媒体系统</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-container" style="margin-top: 100px;">
        <div class="layui-col-xs12 layui-col-md8">
            <div class="grid-demo grid-demo-bg1">&nbsp;</div>
        </div>
        <div class="layui-col-xs6 layui-col-md4">
            <div class="grid-demo">

                <div class="layui-card">
                    <div class="layui-card-header">登录</div>${tips}
                    <div class="layui-card-body">

                        <form class="layui-form" action="user/login" method="post" style="margin: auto;">
                            <div class="layui-form-item">
                                <label class="layui-form-label">账户</label>
                                <div class="layui-input-block">
                                    <input type="text" name="account" lay-verify="title" autocomplete="off" placeholder="请输入账户名" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">密码</label>
                                <div class="layui-input-block">
                                    <input type="password" name="password" placeholder="请输入密码" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-input-block">
                                    <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                                </div>
                            </div>
                        </form>

                    </div>
                </div>

            </div>
        </div>
    </div>

    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="layui/layui.all.js"></script>
<script>
    //注意：导航 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function(){
        var element = layui.element;

        //…
    });
</script>
</body>
</html>
