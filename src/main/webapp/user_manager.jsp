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
    <link rel="stylesheet" href="css/bootstrap.min.css" />
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
        <button type="button" class="layui-btn" data-toggle="modal" data-target="#myModalAdd">添加用户</button>
        <table class="layui-table">
            <colgroup>
                <col width="150">
                <col width="200">
                <col>
            </colgroup>
            <thead>
                <tr>
                    <th>用户编号</th>
                    <th>用户名</th>
                    <th>备注</th>
                    <th>人员类型</th>
                    <th>启用状态</th>
                    <th>最后登录时间</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${userList}" var="user">
                <tr>
                    <td>${user.userId}</td>
                    <td>${user.userName}</td>
                    <td>${user.remark}</td>
                    <td>
                        <c:choose>
                            <c:when test="${user.userType == 1}">客服账号</c:when>
                            <c:when test="${user.userType == 2}">管理账号</c:when>
                            <c:when test="${user.userType == 3}">内置账号</c:when>
                            <c:when test="${user.userType == 4}">财务账号</c:when>
                            <c:otherwise>物流账号</c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <c:if test="${user.enabled == 0}">未启用</c:if>
                        <c:if test="${user.enabled == 1}">启用中</c:if>
                    </td>
                    <td>${user.loginTime}</td>
                    <td>
                        <button type="button" class="layui-btn layui-btn-radius layui-btn-danger">修改</button>
                        <button type="button" class="layui-btn layui-btn-radius layui-btn-danger" onclick="deleteUser(this)" value="${user.userId}">删除</button>
                        <button type="button" class="layui-btn layui-btn-radius layui-btn-normal" onclick="addModule(this)" value="${user.userId}" data-toggle="modal" data-target="#myModalAddModule">授权</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <!-- 模态框对应的添加功能 -->
        <div class="modal fade" id="myModalAdd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabelAdd">添加用户</h4>
                    </div>

                    <!-- 模态框主体部分 -->
                    <div class="modal-body">
                        <form class="layui-form" action="user/insertUser">
                            <div class="layui-form-item">
                                <label class="layui-form-label">用户名</label>
                                <div class="layui-input-block">
                                    <input type="text" name="userName" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">登录账户</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="account" required lay-verify="required" placeholder="请输入登录账户" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">密码</label>
                                <div class="layui-input-inline">
                                    <input type="password" name="userPwd" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">备注</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="remark" required lay-verify="required" placeholder="请输入备注" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">选择框</label>
                                <div class="layui-input-block">
                                    <select name="userType" lay-verify="required">
                                        <option value="1">-请选择-</option>
                                        <option value="1">客服账号</option>
                                        <option value="2">管理账号</option>
                                        <option value="3">内置账号</option>
                                        <option value="4">财务账号</option>
                                        <option value="5">物流账号</option>
                                    </select>
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


        <!-- 模态框对应的授权功能 -->
        <div class="modal fade" id="myModalAddModule" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabelAddModule">用户授权</h4>
                    </div>

                    <!-- 模态框主体部分 -->
                    <div class="modal-body">
                        <form class="layui-form" action="user/addModule">
                            <div class="layui-form-item" style="display: none" id="addModule">
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">复选框</label>
                                <div class="layui-input-block">
                                    <input type="checkbox" name="moduleName" value="010101" title="系统配置">
                                    <input type="checkbox" name="moduleName" value="010105" title="财务管理">
                                    <input type="checkbox" name="moduleName" value="010102" title="权限管理">
                                    <input type="checkbox" name="moduleName" value="010107" title="统计报表">
                                    <input type="checkbox" name="moduleName" value="010103" title="业务管理">
                                    <input type="checkbox" name="moduleName" value="010104" title="订单管理">
                                    <input type="checkbox" name="moduleName" value="010106" title="客服订单">
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
</div>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
<script type="text/javascript" src="layui/layui.all.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript">

    function deleteUser(a) {
        var userId = a.value;
        console.log(userId);
        if (confirm("是否要删除用户？")) {
            $.post("user/deleteUser",{userId:userId},function (res) {
                console.log(res);
                if (res.code == 200) {
                    window.location = "user/listUser";
                }
            },"json");
        }
    }

    function addModule(b) {
        var userId = b.value;
        console.log(userId);
        $("#addModule").html("<input type=\"text\" name=\"userId\" value=\""+userId+"\" required  lay-verify=\"required\" autocomplete=\"off\" class=\"layui-input\">");
    }
</script>
</body>
</html>
