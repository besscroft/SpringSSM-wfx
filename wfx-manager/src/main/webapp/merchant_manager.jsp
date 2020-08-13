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

<div id="updateDiv" style="height: 400px;display: none; padding: 20px">
    角色id：<br><label class="layui-form-label" style="font-weight: bold" id="customerId"></label>
    <div class="layui-form-item">
        商户名称：<br><input type="text" id="customerName" class="layui-input"/>
    </div>
    <div class="layui-form-item">
        商户QQ：<input type="text" id="qq" class="layui-input"/>
    </div>
    <div class="layui-form-item">
        商户微信：<input type="text" id="wxh" class="layui-input"/>
    </div>
    <div class="layui-form-item">
        商户电话：<input type="text" id="phone" class="layui-input"/>
    </div>
    <div class="layui-form-item">
        登录账户：<input type="text" id="loginName" class="layui-input"/>
    </div>
</div>

<div id="addDiv" style="height: 400px;display: none; padding: 20px">
    <div class="layui-form-item">
        商户名称：<input type="text" id="customerNameAdd"/>
    </div>
    <br/>
    <div class="layui-form-item">
        商户QQ：<input type="text" id="qqAdd"/>
    </div>
    <br/>
    <div class="layui-form-item">
        商户微信：<input type="text" id="wxhAdd"/>
    </div>
    <div class="layui-form-item">
        商户电话：<input type="text" id="phoneAdd"/>
    </div>
    <div class="layui-form-item">
        登录账户：<input type="text" id="loginNameAdd"/>
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
            url: 'merchant/list', //数据接口
            toolbar:"#toolbarDemo",
            page: true, //开启分页
            cols: [[ //表头
                {field: 'customerName', title: '商户名称', width:120},
                {field: 'qq', title: '商户QQ', width:100},
                {field: 'wxh', title: '商户微信', width:100},
                {field: 'phone', title: '商户电话', width:120},
                {field: 'createTime', title: '创建时间', width:140},
                {field: 'loginName', title: '登录账户', width:100},
                {field: 'state', title: '是否有效', width:50},
                {field: 'level', title: '商户等级', width:50, sort: true},
                {field: 'updateTime', title: '最后登录时间', width:140},
                {field: 'website', title: '商户网址', width:100},
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
                layer.confirm("你确定要删除这条商户信息吗？",function (index) {
                    layer.close(index);  // 关闭弹出层
                    var cid = obj.data.customerId;
                    $.post("merchant/delete",{customerId:cid},function (res) {
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
                $("#customerId").html(obj.data.customerId);
                $("#customerName").val(obj.data.customerName);
                $("#qq").val(obj.data.qq);
                $("#wxh").val(obj.data.wxh);
                $("#phone").val(obj.data.phone);
                $("#loginName").val(obj.data.loginName);
                // 执行修改
                var index = layer.open({
                    type:1,
                    content:$("#updateDiv"),
                    area: '500px',
                    btn:['提交','取消'],
                    btn1:function () {
                        var customerId = obj.data.customerId;
                        var customerName = $("#customerName").val();
                        var qq = $("#qq").val();
                        var wxh = $("#wxh").val();
                        var phone = $("#phone").val();
                        var loginName = $("#loginName").val();
                        console.log(customerId);
                        console.log(customerName);
                        console.log(qq);
                        console.log(wxh);
                        console.log(phone);
                        console.log(loginName);
                        // 提交到后台进行修改
                        $.post("merchant/update",{customerId:customerId,customerName:customerName,qq:qq,wxh:wxh,phone:phone,loginName:loginName},function (res) {
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
                        var dataObj = {};
                        dataObj.customerName = $("#customerNameAdd").val();  $("#customerNameAdd").val();
                        dataObj.qq = $("#qqAdd").val();  $("#qqAdd").val("");
                        dataObj.wxh = $("#wxhAdd").val();  $("#wxhAdd").val("");
                        dataObj.phone = $("#phoneAdd").val();  $("#phoneAdd").val("");
                        dataObj.loginName = $("#loginNameAdd").val();  $("#loginNameAdd").val("");
                        //通过ajax将数据提交到控制器
                        //ajax提交数据，可以提交json对象  --------------直接对象接收
                        //也可以提交json格式字符串，（需要声明contentType:"application/json"）   --- @RequestBody
                        $.ajax({
                            url:"merchant/add",
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
