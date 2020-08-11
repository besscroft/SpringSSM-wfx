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
        <table id="demo" lay-filter="test"></table>

        <script type="text/html" id="btnTpl">
            <input type="button" class="layui-btn layui-btn-warm layui-btn-sm" value="删除" onclick="doDel('{{d.moduleCode}}')"/>
            <input type="button" class="layui-btn layui-btn-primary layui-btn-sm" value="修改" />
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
            elem: '#demo'
            ,height: 500
            ,url: 'role/list' //数据接口
            ,page: true //开启分页
            ,cols: [[ //表头
                {field: 'roleCode', title: '角色编号', width:'25%', sort: true, fixed: 'left'},
                {field: 'roleName', title: '角色名称', width:'25%'},
                {field: 'roleDesc', title: '角色说明', width:'25%'},
                {title: '操作',templet:"#btnTpl" , width:'25%',fixed:'right'}
            ]]
            ,limit:10
            ,limits:[8,12,15]
        });
    });
</script>
</body>
</html>
