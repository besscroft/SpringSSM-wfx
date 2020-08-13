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
    <title>角色信息管理</title>
    <base href="<%=request.getContextPath()%>/"/>
    <link rel="stylesheet" href="layui/css/layui.css" media="all" />
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
        <script type="text/html" id="toolbarDemo">
            <input type="button" value="添加角色" class="layui-btn" lay-event="add"/>
        </script>
        <table id="demo" lay-filter="test"></table>

        <script type="text/html" id="btnTpl">
            <input type="button" class="layui-btn layui-btn-warm layui-btn-sm" value="删除" lay-event="del" />
            <input type="button" class="layui-btn layui-btn-primary layui-btn-sm" value="修改" lay-event="update" />
            <input type="button" class="layui-btn layui-btn-sm" value="授权" lay-event="grantPermission"/>
        </script>

    </div>
</div>

<div id="updateDiv" style="height: 400px;display: none; padding: 20px">
    <div class="layui-form-item">
        角色编号：<br><label class="layui-form-label" style="font-weight: bold" id="rcode"></label>
    </div>
    <div class="layui-form-item">
        角色名称：<input type="text" id="rname" class="layui-input"/>
    </div>
    <div class="layui-form-item">
        角色描述：<textarea id="rdesc" class="layui-textarea"></textarea>
    </div>
</div>

<div id="addDiv" style="height: 400px;display: none; padding: 20px">
    <div class="layui-form-item">
        角色编号：<input type="text" id="roleCode"/>
    </div>
    <br/>
    <div class="layui-form-item">
        角色名称：<input type="text" id="roleName"/>
    </div>
    <br/>
    <div class="layui-form-item">
        角色描述：<textarea id="roleDesc"></textarea>
    </div>
</div>
<div id="authTreeDiv" style="display: none;"></div>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
<script type="text/javascript" src="layui/layui.all.js"></script>
<script type="text/javascript">
    layui.use(['table','layer','tree'], function(){
        var table = layui.table;
        var layer = layui.layer;
        var tree = layui.tree;
        //第一个实例
        table.render({
            elem: '#demo',
            height: 500,
            url: 'role/list', //数据接口
            toolbar:"#toolbarDemo",
            page: true, //开启分页
            cols: [[ //表头
                {field: 'roleCode', title: '角色编号', width:'25%', sort: true, fixed: 'left'},
                {field: 'roleName', title: '角色名称', width:'25%'},
                {field: 'roleDesc', title: '角色说明', width:'25%'},
                {title: '操作',templet:"#btnTpl" , width:'25%',fixed:'right'}
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
                    area: '500px',
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
            } else if(obj.event =="grantPermission"){
                //为角色授予权限
                var roleName = obj.data.roleName;
                var rcode = obj.data.roleCode;
                //1.请求权限数据（所有权限）
                var authData = [];
                $.get("module/listall",function(res){
                    console.log(res);
                    if(res.code==0){
                        authData = res.data;
                        //2.渲染权限树
                        tree.render({
                            elem: '#authTreeDiv'
                            ,showCheckbox:true
                            ,data:authData
                            ,oncheck: function(obj){
                                var mid = obj.data.id;          //10100601
                                var s = obj.checked;        //false
                                //ajax交互 ：  roleCode   mid   state  传递到服务器
                                $.post("module/grant",{roleCode:rcode,moduleCode:mid,state:s},function(res){
                                    console.log(res);
                                },"json");
                            }
                        });
                    }
                },"json");

                //3.弹窗显示
                var index = layer.open({
                    type:1
                    ,title:"["+roleName+"]角色授权"
                    ,content:$("#authTreeDiv")
                    ,area:['400px','500px']
                    ,btn: ['确定']
                    ,btn1:function(){
                        layer.close(index);
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
                        dataObj.roleCode = $("#roleCode").val();  $("#roleCode").val();
                        dataObj.roleName = $("#roleName").val();  $("#roleName").val("");
                        dataObj.roleDesc = $("#roleDesc").val();  $("#roleDesc").val("");
                        //通过ajax将数据提交到控制器
                        //ajax提交数据，可以提交json对象  --------------直接对象接收
                        //也可以提交json格式字符串，（需要声明contentType:"application/json"）   --- @RequestBody
                        $.ajax({
                            url:"role/add",
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
