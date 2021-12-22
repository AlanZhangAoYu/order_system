<%--
  Created by IntelliJ IDEA.
  User: ZAY
  Date: 2021/12/6
  Time: 21:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商家管理界面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/node_modules/bootstrap/dist/css/bootstrap.css" crossorigin="anonymous">
    <script src="${pageContext.request.contextPath}/node_modules/jquery/dist/jquery.js" charset="UTF-8"></script>
    <script src="${pageContext.request.contextPath}/node_modules/@popperjs/core/dist/umd/popper.js"></script>
    <script src="${pageContext.request.contextPath}/node_modules/bootstrap/dist/js/bootstrap.js" charset="UTF-8"></script>
    <script src="${pageContext.request.contextPath}/node_modules/sweetalert/dist/sweetalert.min.js" charset="UTF-8"></script>
</head>
<script>
    function com_control() {
        document.getElementById("body").innerHTML="";
        $('#body').append(
            "<iframe src='http://localhost:8080/order_system/jsp/shop/com_control.jsp?sid="+'${param.sid}'+"' style='width: 1520px; height: 700px'></iframe>"
        );
    }
    function order_control() {
        document.getElementById("body").innerHTML="";
        $('#body').append(
            "<iframe src='http://localhost:8080/order_system/jsp/shop/order_control.jsp?sid="+'${param.sid}'+"' style='width: 1520px; height: 700px'></iframe>"
        );
    }
    function EXIT() {
        window.location.href="http://localhost:8080/order_system/jsp/index.jsp";
    }
</script>
<body>
    <div id="header" class="bg-dark">
        <span style="margin: 10px; color: #FFFFFF; font-size: 40px; font-family: '幼圆'; font-style: italic;">X&nbsp;X&nbsp;点餐</span>
        <span><button class="btn btn-primary" onclick="order_control()">订单管理</button></span>
        <span><button class="btn btn-primary" onclick="com_control()">商品管理</button></span>
        <span><button class="btn btn-primary" onclick="EXIT()">退出登录</button></span>
        <span id="welcome" style="color: #FFFFFF; font-size: 20px;">欢迎你&nbsp;&nbsp;${param.sname}</span>
    </div>
    <div id="body"></div>
</body>
<style>
    *{
        margin: 0;
        padding: 0;
    }
    body{
        margin: 0 auto;
        height: auto;
        width: 100%;
        background-color: #FFFFFF;
    }
    #header{
        width: 100%;
        height: 70px;
        position: relative;
    }
    #welcome{
        position: absolute;
        top: 20px;
        right: 10px;
    }
</style>
</html>
