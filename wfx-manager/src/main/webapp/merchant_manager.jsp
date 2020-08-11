<%--
  Created by IntelliJ IDEA.
  User: Bess Croft
  Date: 2020/8/11
  Time: 16:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商户信息管理</title>
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
    <div class="layui-card-header">商户信息管理</div>
    <div class="layui-card-body">
        <script type="text/html" id="toolbarDemo">
            <input type="button" value="添加商户" class="layui-btn" lay-event="add"/>
        </script>
        <table id="demo" lay-filter="test"></table>

        <script type="text/html" id="btnTpl">
            <input type="button" class="layui-btn layui-btn-warm layui-btn-sm" value="删除" lay-event="del"/>
            <input type="button" class="layui-btn layui-btn-primary layui-btn-sm" value="修改" lay-event="update" />
        </script>

    </div>
</div>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
<script type="text/javascript" src="layui/layui.all.js"></script>
<script type="text/javascript">
    layui.use('table', function(){
        var table = layui.table;
        //第一个实例
        table.render({
            elem: '#demo',
            height: 500,
            url: 'customer/list', //数据接口
            toolbar:"#toolbarDemo",
            page: true, //开启分页
            cols: [[ //表头
                {field: 'customerName', title: '商户名称', width:120},
                {field: 'qq', title: '商户QQ', width:100},
                {field: 'wxh', title: '商户微信', width:100},
                {field: 'phone', title: '商户电话', width:120},
                {field: 'createTime', title: '创建时间', width:140},
                {field: 'loginName', title: '登录账户', width:100},
                {field: 'state', title: '是否有效', width:30},
                {field: 'level', title: '商户等级', width:30, sort: true},
                {field: 'updateTime', title: '最后登录时间', width:140},
                {field: 'website', title: '商户网址', width:180},
                {title: '操作',templet:"#btnTpl" , fixed:'right'}
            ]],
            limit:10,
            limits:[8,12,15]
        });
    });
</script>
</body>
</html>
