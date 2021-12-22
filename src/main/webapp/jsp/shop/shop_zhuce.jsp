<%--
  Created by IntelliJ IDEA.
  User: ZAY
  Date: 2021/12/6
  Time: 22:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商家注册界面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/node_modules/bootstrap/dist/css/bootstrap.css" crossorigin="anonymous">
    <script src="${pageContext.request.contextPath}/node_modules/jquery/dist/jquery.js" charset="UTF-8"></script>
    <script src="${pageContext.request.contextPath}/node_modules/@popperjs/core/dist/umd/popper.js"></script>
    <script src="${pageContext.request.contextPath}/node_modules/bootstrap/dist/js/bootstrap.js" charset="UTF-8"></script>
    <script src="${pageContext.request.contextPath}/node_modules/sweetalert/dist/sweetalert.min.js" charset="UTF-8"></script>
</head>
<script>
    function shopZhuCe() {
        let zhuce_sname=document.getElementById("zhuce_sname").value;
        let zhuce_password=document.getElementById("zhuce_password").value;
        let zhuce_realname=document.getElementById("zhuce_realname").value;
        let zhuce_idcard=document.getElementById("zhuce_idcard").value;
        let zhuce_phone=document.getElementById("zhuce_phone").value;
        let zhuce_address=document.getElementById("zhuce_address").value;
        let zhuce_shop={
            "sid": "",
            "sname": zhuce_sname,
            "password": zhuce_password,
            "realname": zhuce_realname,
            "idcard": zhuce_idcard,
            "phone": zhuce_phone,
            "address": zhuce_address
        };
        $.ajax({
            url: "http://localhost:8080/order_system/ShopController/shopZhuCeController",
            data: JSON.stringify(zhuce_shop),
            dataType: "json",
            type: "POST",
            contentType: "application/json; charset:utf-8",
            success: function (json) {
                swal("注册成功!你的SID为:"+json[0].sid+",请记住!");
            }
        });
    }
    function Back() {
        window.location.href="http://localhost:8080/order_system/jsp/index.jsp";
    }
</script>
<body>
<div id="zhu_ce_form">
    <div class="form-group">
        <label for="zhuce_sname">商店名:</label>
        <input type="text" class="form-control" id="zhuce_sname"/>
    </div>
    <div class="form-group">
        <label for="zhuce_password">密码:</label>
        <input type="password" class="form-control" id="zhuce_password"/>
    </div>
    <div class="form-group">
        <label for="zhuce_realname">店主真实姓名:</label>
        <input type="text" class="form-control" id="zhuce_realname"/>
    </div>
    <div class="form-group">
        <label for="zhuce_idcard">身份证号:</label>
        <input type="text" class="form-control" id="zhuce_idcard"/>
    </div>
    <div class="form-group">
        <label for="zhuce_phone">联系电话:</label>
        <input type="text" class="form-control" id="zhuce_phone"/>
    </div>
    <div class="form-group">
        <label for="zhuce_address">商店地址:</label>
        <input type="text" class="form-control" id="zhuce_address"/>
    </div>
    <button class="btn btn-primary" onclick="shopZhuCe()">注册</button>
    <button class="btn btn-secondary" onclick="Back()">取消</button>
</div>
</body>
<style>
    *{
        margin: 0;
        padding: 0;
    }
    body{
        background-color: #FFF8DC;
    }
    #zhu_ce_form{
        position: absolute;
        top: 10px;
        left: 800px;
        padding: 20px;
        height: auto;
        width: 300px;
        border: 1px solid ghostwhite;
        background-color: rgba(0,0,0,0.2);
    }
</style>
</html>
