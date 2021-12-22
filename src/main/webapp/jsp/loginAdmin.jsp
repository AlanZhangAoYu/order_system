<%--
  Created by IntelliJ IDEA.
  User: ZAY
  Date: 2021/11/24
  Time: 21:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录后台管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/node_modules/bootstrap/dist/css/bootstrap.css" crossorigin="anonymous">
    <script src="${pageContext.request.contextPath}/node_modules/jquery/dist/jquery.js" charset="UTF-8"></script>
    <script src="${pageContext.request.contextPath}/node_modules/@popperjs/core/dist/umd/popper.js"></script>
    <script src="${pageContext.request.contextPath}/node_modules/bootstrap/dist/js/bootstrap.js" charset="UTF-8"></script>
    <script src="${pageContext.request.contextPath}/node_modules/sweetalert/dist/sweetalert.min.js" charset="UTF-8"></script>
</head>
<script>
    function login() {
        let admin_id=document.getElementById("admin_id").value;
        let password=document.getElementById("password").value;
        let admin={
            "admin_id": admin_id,
            "password": password
        };
        $.ajax({
            url: "http://localhost:8080/order_system/adminLoginController",
            data: JSON.stringify(admin),
            dataType: "json",
            method: "POST",
            contentType: "application/json; charset:utf-8",
            success: function(data){
                if(data.state==='error'){
                    swal("管理员ID或密码错误!");
                }else{
                    window.location.href="http://localhost:8080/order_system/jsp/admin/index_admin.jsp?admin_name="+data.admin_name;
                }
            }
        });
    }
</script>
<body>
    <div id="login_window">
        <div>
            <label style="font-size: 30px;font-weight: 700; font-family: '黑体'">欢迎登录</label>
        </div>
        <div class="form-group">
            <label for="admin_id">管理员ID</label>
            <input type="text" class="form-control" id="admin_id"/>
        </div>
        <div class="form-group">
            <label for="password">密码</label>
            <input type="password" class="form-control" id="password"/>
        </div>
        <button class="btn btn-primary" onclick="login()">登录</button>
    </div>
</body>
<style type="text/css">
    body{
        height: auto;
        margin: 0;
        padding: 0;
        background-image: url("../image/登录界面背景.png");
    }
    #login_window{
        padding: 10px;
        color: #000000;
        height: 300px;
        width: 400px;
        position: relative;
        top: 250px;
        left: 600px;
        border: 1px solid #ffffff;
        background-color: rgba(255,255,255,0.8);
    }
</style>
</html>
