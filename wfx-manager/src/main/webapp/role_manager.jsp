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
            <input type="button" class="layui-btn layui-btn-warm layui-btn-sm" value="删除" lay-event="del"/>
            <input type="button" class="layui-btn layui-btn-primary layui-btn-sm" value="修改" lay-event="update" />
        </script>

    </div>
</div>

<div id="updateDiv" style="height: 400px;display: none; padding: 20px">
    <p>
        角色编号：<label style="font-weight: bold" id="rcode"></label>
    </p>
    <p>
        角色名称：<input type="text" id="rname"/>
    </p>
    <p>
        角色描述：<textarea id="rdesc"></textarea>
    </p>
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

        // 监听table的tool事件
        table.on("tool(test)",function (obj) {
            if (obj.event == 'del') {
               // 执行删除
               console.log(obj);    // 打印
               // 删除确认提示
               layer.confirm("你确定要删除这条角色信息吗？",function (index) {
                   layer.close(index);  // 关闭弹出层
                   var rid = obj.data.roleCode;
                   $.post("role/delete",{roleCode:rid},function (res) {
                       console.log(res);
                       if (res.code == 0) {
                           // 1.提示
                           layer.msg(res.msg);
                           // 2.将数据表格中对应的数据删除
                           obj.del();
                       } else {
                           // 提示
                           layer.msg(res.msg);
                       }
                   },"json");
               })
            } else if (obj.event == "update") {
                // 数据回显
                $("#rcode").html(obj.data.roleCode);
                $("#rname").val(obj.data.roleName);
                $("#rdesc").text(obj.data.roleDesc);
                // 执行修改
                var index = layer.open({
                    type:1,
                    content:$("#updateDiv"),
                    btn:['提交','取消'],
                    btn1:function () {
                        var rcode = obj.data.roleCode;
                        var rname = $("#rname").val();
                        var rdesc = $("#rdesc").val();
                        console.log(rname);
                        console.log(rdesc);
                        // 提交到后台进行修改
                        $.post("role/update",{roleCode:rcode,roleName:rname,roleDesc:rdesc},function (res) {
                            if (res.code == 0) {
                                layer.msg(res.msg);
                                obj.update(res.data);
                            } else {
                                layer.msg(res.msg);
                            }
                        },"json");
                        layer.close(index);
                    },
                    btn2:function () {
                        console.log("取消了！！！");
                    }
                });
            }
        });

        // 监听table的toolbar事件
        table.on("toolbar(test)",function (obj) {
            console.log(obj);
        })
    });
</script>
</body>
</html>
