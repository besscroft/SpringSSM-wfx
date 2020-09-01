<%--
  Created by IntelliJ IDEA.
  User: Bess Croft
  Date: 2020/9/1
  Time: 10:52
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
    <div class="layui-card-header">商品类型管理</div>
    <div class="layui-card-body">
        <script type="text/html" id="toolbarDemo">
            <input type="button" value="添加类型" class="layui-btn" lay-event="add"/>
        </script>
        <table id="demo" lay-filter="test"></table>

        <script type="text/html" id="btnTpl">
            <input type="button" class="layui-btn layui-btn-warm layui-btn-sm" value="删除" lay-event="del"/>
            <input type="button" class="layui-btn layui-btn-primary layui-btn-sm" value="修改" lay-event="update" />
        </script>

    </div>
</div>

<div id="updateDiv" style="height: 400px;display: none; padding: 20px">
    类型编号：<br><label class="layui-form-label" style="font-weight: bold" id="typeId"></label>
    <div class="layui-form-item">
        类型名称：<br><input type="text" id="typeName" class="layui-input"/>
    </div>
</div>

<div id="addDiv" style="height: 400px;display: none; padding: 20px">
    添加商品类型
    <br/>
    <div class="layui-form-item">
        类型名称：<input type="text" id="typeName2"/>
    </div>
</div>
</body>
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
            url: 'goodtype/list', //数据接口
            toolbar:"#toolbarDemo",
            page: true, //开启分页
            cols: [[ //表头
                {field: 'typeId', title: '类型编号', width:120},
                {field: 'typeName', title: '类型名称', width:120},
                {field: 'parentId', title: '上级编号', width:120},
                {field: 'typeTag', title: '类型标签', width:120},
                {field: 'orderNo', title: '排序编号', width:120},
                {field: 'alisaCode', title: '分类助记码', width:120},
                {title: '操作',templet:"#btnTpl" , fixed:'right'}
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
                layer.confirm("你确定要删除这条类型信息吗？",function (index) {
                    layer.close(index);  // 关闭弹出层
                    var typeId = obj.data.typeId;
                    $.post("goodtype/delete",{typeId:typeId},function (res) {
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
                });
            } else if (obj.event == "update") {
                console.log(obj);
                // 数据回显
                $("#typeId").html(obj.data.goodId);
                $("#typeName").val(obj.data.typeName);
                // 执行修改
                var index = layer.open({
                    type:1,
                    content:$("#updateDiv"),
                    area: '500px',
                    btn:['提交','取消'],
                    btn1:function () {
                        var typeId = obj.data.typeId;
                        var typeName = $("#typeName").val();
                        // 提交到后台进行修改
                        $.post("goodtype/update",{typeId:typeId,typeName:typeName},function (res) {
                            console.log(res);
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
                    title:"添加角色信息",
                    content:$("#addDiv"),
                    area:['400px','500px'],
                    btn:['提交','取消'],
                    btn1:function () {
                        layer.close(index);
                        // 获取输入的数据
                        typeName1 = $("#typeName2").val();  $("#typeName2").val();
                        //通过ajax将数据提交到控制器
                        //ajax提交数据，可以提交json对象  --------------直接对象接收
                        //也可以提交json格式字符串，（需要声明contentType:"application/json"）   --- @RequestBody
                        $.ajax({
                            url:"goodtype/add",
                            type:"post",
                            data:{
                                typeName:typeName1
                            },
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
</html>
