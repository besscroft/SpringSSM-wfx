<%--
  Created by IntelliJ IDEA.
  User: Bess Croft
  Date: 2020/9/1
  Time: 0:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品信息管理</title>
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
    <div class="layui-card-header">商品信息管理</div>
    <div class="layui-card-body">
        <table id="demo" lay-filter="test"></table>

        <script type="text/html" id="btnTpl">
            <input type="button" class="layui-btn layui-btn-normal layui-btn-sm" value="审核" lay-event="state"/>
            <input type="button" class="layui-btn layui-btn-normal layui-btn-sm" value="推荐" lay-event="toped" />
            <input type="button" class="layui-btn layui-btn-normal layui-btn-sm" value="置顶" lay-event="recomed" />
        </script>

    </div>
</div>

<div id="stateDiv" style="height: 400px;display: none; padding: 20px">
    商品id：<br><label class="layui-form-label" style="font-weight: bold" id="goodId1"></label>
    <div class="layui-form-item">
        上架：<br><label class="layui-form-label">是否有效</label>
        <div class="layui-input-block">
            <select id="state" lay-verify="required">
                <option value="0">待审核</option>
                <option value="1">已上架</option>
                <option value="2">已下架</option>
            </select>
        </div>
    </div>
</div>

<div id="topedDiv" style="height: 400px;display: none; padding: 20px">
    商品id：<br><label class="layui-form-label" style="font-weight: bold" id="goodId2"></label>
    <div class="layui-form-item">
        上架：<br><label class="layui-form-label">是否置顶</label>
        <div class="layui-input-block">
            <select id="toped" lay-verify="required">
                <option value="0">取消置顶</option>
                <option value="1">置顶</option>
            </select>
        </div>
    </div>
</div>

<div id="recomedDiv" style="height: 400px;display: none; padding: 20px">
    商品id：<br><label class="layui-form-label" style="font-weight: bold" id="goodId3"></label>
    <div class="layui-form-item">
        上架：<br><label class="layui-form-label">是否推荐</label>
        <div class="layui-input-block">
            <select id="recomed" lay-verify="required">
                <option value="0">否</option>
                <option value="1">是</option>
            </select>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
<script type="text/javascript" src="layui/layui.all.js"></script>
<script type="text/javascript">
    layui.use('table', function() {
        var table = layui.table;
        //第一个实例
        table.render({
            elem: '#demo',
            height: 500,
            url: 'good/list', //数据接口
            toolbar:"#toolbarDemo",
            page: true, //开启分页
            cols: [[ //表头
                {field: 'goodId', title: '商品id', hide:true},
                {field: 'goodName', title: '商品名称',width: '8%'},
                {field: 'goodPic1', title: '商品图片',width: '8%'},
                {field: 'promoteDesc', title: '推广说明',width: '8%'},
                {field: 'copyDesc', title: '文案说明',width: '8%'},
                {field: 'forwardLink', title: '跳转链接',width: '8%'},
                {field: 'goodType.typeName', title: '商品分类',width: '8%'},
                {field: 'state', title: '是否有效',width: '4%'},
                {field: 'toped', title: '是否置顶',width: '4%'},
                {field: 'recomed', title: '是否推荐',width: '4%'},
                {field: 'sellNum', title: '作弊值',width: '8%'},
                {field: 'website', title: '产品网址',width: '8%'},
                {field: 'kfqq', title: '客服QQ',width: '8%'},
                {title: '操作',templet:"#btnTpl",fixed:"right",width: '16%'}
            ]],
            limit:10,
            limits:[8,12,15]
        });

        // 监听table的tool事件
        table.on("tool(test)",function (obj) {
            if (obj.event == 'state') {
                console.log(obj);
                // 数据回显
                $("#goodId1").html(obj.data.goodId);
                $("#state").val(obj.data.state);
                // 执行修改
                var index = layer.open({
                    type:1,
                    content:$("#stateDiv"),
                    area: '500px',
                    btn:['提交','取消'],
                    btn1:function () {
                        var goodId = obj.data.goodId;
                        var state = $("#state").val();
                        // 提交到后台进行修改
                        $.post("good/updateState",{goodId:goodId,state:state},function (res) {
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
            } else if (obj.event == "toped") {
                console.log(obj);
                // 数据回显
                $("#goodId2").html(obj.data.goodId);
                $("#toped").val(obj.data.toped);
                // 执行修改
                var index = layer.open({
                    type:1,
                    content:$("#topedDiv"),
                    area: '500px',
                    btn:['提交','取消'],
                    btn1:function () {
                        var goodId = obj.data.goodId;
                        var toped = $("#toped").val();
                        // 提交到后台进行修改
                        $.post("good/updateToped",{goodId:goodId,toped:toped},function (res) {
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
            } else if (obj.event == "recomed") {
                console.log(obj);
                // 数据回显
                $("#goodId3").html(obj.data.goodId);
                $("#recomed").val(obj.data.recomed);
                // 执行修改
                var index = layer.open({
                    type:1,
                    content:$("#recomedDiv"),
                    area: '500px',
                    btn:['提交','取消'],
                    btn1:function () {
                        var goodId = obj.data.goodId;
                        var recomed = $("#recomed").val();
                        // 提交到后台进行修改
                        $.post("good/updateRecomed",{goodId:goodId,recomed:recomed},function (res) {
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
    });
</script>
</html>
