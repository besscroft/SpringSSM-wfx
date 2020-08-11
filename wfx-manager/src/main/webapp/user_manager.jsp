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
        <script type="text/html" id="toolbarDemo">
            <input type="button" value="添加用户" class="layui-btn" lay-event="add"/>
        </script>
        <table id="demo" lay-filter="test"></table>

        <script type="text/html" id="btnTpl">
            <input type="button" class="layui-btn layui-btn-warm layui-btn-sm" value="删除" lay-event="del" />
            <input type="button" class="layui-btn layui-btn-primary layui-btn-sm" value="修改" lay-event="update" />
        </script>

    </div>
</div>

<div id="updateDiv" style="height: 400px;display: none; padding: 20px">
    <div class="layui-form-item">
        用户编号：<br><label class="layui-form-label" style="font-weight: bold" id="userId"></label>
    </div>
    <div class="layui-form-item">
        用户名：<input type="text" id="userName" class="layui-input"/>
    </div>
    <div class="layui-form-item">
        密码：<input type="text" id="userPwd" class="layui-input"/>
    </div>
    <div class="layui-form-item">
        备注：<input type="text" id="remark" class="layui-input"/>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">启用状态</label>
        <div class="layui-input-block">
            <select id="enabled" name="enabled" lay-verify="required">
                <option value="1">启用</option>
                <option value="0">未启用</option>
            </select>
        </div>
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
            url: 'user/list', //数据接口
            toolbar:"#toolbarDemo",
            page: true, //开启分页
            cols: [[ //表头
                {field: 'userId', title: '用户编号', width:100, sort: true},
                {field: 'userName', title: '用户名', width:120},
                {field: 'userPwd', title: '密码', width:100},
                {field: 'remark', title: '备注', width:180},
                {field: 'enabled', title: '启用状态', width:120},
                {field: 'loginTime', title: '最后登录时间', width:180},
                {title: '操作',templet:"#btnTpl"}
            ]],
            limit:10,
            limits:[8,12,15]
        });

        // 监听table的tool事件
        table.on("tool(test)",function (obj) {
            if (obj.event == 'del') {
                // 执行删除
                console.log(obj);    // 打印
                // 删除确认提示
                layer.confirm("你确定要删除这条用户信息吗？",function (index) {
                    layer.close(index);  // 关闭弹出层
                    var uid = obj.data.userId;
                    $.post("user/delete",{userId:uid},function (res) {
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
                $("#userId").html(obj.data.userId);
                $("#userName").val(obj.data.userName);
                $("#userPwd").val(obj.data.userPwd);
                $("#remark").val(obj.data.remark);
                $("#enabled").val(obj.data.enabled);
                // 执行修改
                var index = layer.open({
                    type:1,
                    content:$("#updateDiv"),
                    area: '500px',
                    btn:['提交','取消'],
                    btn1:function () {
                        var userId = obj.data.userId;
                        var userName = $("#userName").val();
                        var userPwd = $("#userPwd").val();
                        var remark = $("#remark").val();
                        var enabled = $("#enabled").val();
                        console.log(userId);
                        console.log(userName);
                        console.log(userPwd);
                        console.log(remark);
                        console.log(enabled);
                        // 提交到后台进行修改
                        $.post("user/update",{userId:userId,userName:userName,userPwd:userPwd,remark:remark,enabled:enabled},function (res) {
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
    });
</script>
</body>
</html>
