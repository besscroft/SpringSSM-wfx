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
    <title>菜单信息管理</title>
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
        <script type="text/html" id="toolbarDemo">
            <input type="button" value="添加菜单" class="layui-btn" lay-event="add"/>
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
        菜单编码：<br><label class="layui-form-label" style="font-weight: bold" id="moduleCode"></label>
    </div>
    <div class="layui-form-item">
        功能名称：<input type="text" id="moduleName" class="layui-input"/>
    </div>
    <div class="layui-form-item">
        请求路径：<textarea id="moduleUrl" class="layui-textarea"></textarea>
    </div>
</div>

<div id="addDiv" style="height: 400px;display: none; padding: 20px">
    <div class="layui-form-item">
        菜单编码：<input type="text" id="moduleCodeAdd"/>
    </div>
    <br/>
    <div class="layui-form-item">
        功能名称：<input type="text" id="moduleNameAdd"/>
    </div>
    <br/>
    <div class="layui-form-item">
        请求路径：<input type="text" id="moduleUrlAdd"/>
    </div>
    <br/>
</div>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
<script type="text/javascript" src="layui/layui.all.js"></script>
<script>
    layui.use('table', function(){
        var table = layui.table;
        //第一个实例
        table.render({
            elem: '#demo',
            height: 500,
            url: 'module/list', //数据接口
            toolbar:"#toolbarDemo",
            page: true, //开启分页
            cols: [[ //表头
                {field: 'moduleCode', title: '菜单编码', width:200, sort: true, fixed: 'left'},
                {field: 'moduleName', title: '功能名称', width:280},
                {field: 'moduleUrl', title: '请求路径', width:400, sort: true},
                {title: '操作',templet:"#btnTpl" , fixed:'right'}
            ]],
            limit:12,
            limits:[10,12,15]
        });

        // 监听table的tool事件
        table.on("tool(test)",function (obj) {
            if (obj.event == 'del') {
                // 执行删除
                console.log(obj);    // 打印
                // 删除确认提示
                layer.confirm("你确定要删除这条权限信息吗？",function (index) {
                    layer.close(index);  // 关闭弹出层
                    var moduleCode = obj.data.moduleCode;
                    $.post("module/delete",{moduleCode:moduleCode},function (res) {
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
                $("#moduleCode").html(obj.data.moduleCode);
                $("#moduleName").val(obj.data.moduleName);
                $("#moduleUrl").val(obj.data.moduleUrl);
                // 执行修改
                var index = layer.open({
                    type:1,
                    content:$("#updateDiv"),
                    area: '500px',
                    btn:['提交','取消'],
                    btn1:function () {
                        var moduleCode = obj.data.moduleCode;
                        var moduleName = $("#moduleName").val();
                        var moduleUrl = $("#moduleUrl").val();
                        console.log(moduleCode);
                        console.log(moduleName);
                        console.log(moduleUrl);
                        // 提交到后台进行修改
                        $.post("module/update",{moduleCode:moduleCode,moduleName:moduleName,moduleUrl:moduleUrl},function (res) {
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

        //监听table的toolbar事件
        table.on("toolbar(test)",function (obj) {
            console.log(obj);
            if (obj.event=="add") {
                var index = layer.open({
                    type:1,
                    title:"添加菜单",
                    content:$("#addDiv"),
                    area:['400px','500px'],
                    btn:['提交','取消'],
                    btn1:function () {
                        layer.close(index);
                        // 获取输入的数据
                        var dataObj = {};
                        dataObj.moduleCode = $("#moduleCodeAdd").val();  $("#moduleCodeAdd").val("");
                        dataObj.moduleName = $("#moduleNameAdd").val();  $("#moduleNameAdd").val("");
                        dataObj.moduleUrl = $("#moduleUrlAdd").val();  $("#moduleUrlAdd").val("");
                        console.log(dataObj);
                        //通过ajax将数据提交到控制器
                        //ajax提交数据，可以提交json对象  --------------直接对象接收
                        //也可以提交json格式字符串，（需要声明contentType:"application/json"）   --- @RequestBody
                        $.ajax({
                            url:"module/add",
                            type:"post",
                            contentType:"application/json",
                            data:JSON.stringify(dataObj),
                            success:function(res){
                                if(res.code==0){
                                    layer.msg(res.msg);
                                }else{
                                    layer.msg(res.msg);
                                }
                            }
                        });
                    }
                });
            }
        });

    });

</script>
</body>
</html>
