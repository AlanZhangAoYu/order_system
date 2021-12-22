<%--
  Created by IntelliJ IDEA.
  User: ZAY
  Date: 2021/11/26
  Time: 13:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>点餐后台管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/node_modules/bootstrap/dist/css/bootstrap.css" crossorigin="anonymous">
    <script src="${pageContext.request.contextPath}/node_modules/jquery/dist/jquery.js" charset="UTF-8"></script>
    <script src="${pageContext.request.contextPath}/node_modules/@popperjs/core/dist/umd/popper.js"></script>
    <script src="${pageContext.request.contextPath}/node_modules/bootstrap/dist/js/bootstrap.js" charset="UTF-8"></script>
</head>
<body>
    <%%>
    <div id="web_body" style="margin: 0;padding: 0;">
        <div id="top_nav" class="bg-dark" >
            <span class="logo navbar-brand" style="margin: 8px;"><h2 style="color: #ffffff;">点餐后台管理系统</h2></span>
            <span style="color: #ffffff; position: absolute;right: 5px;margin: 15px;">
                        欢迎你&nbsp;${param.admin_name}&nbsp;登录系统<button class="btn btn-primary" onclick="EXIT()">退出登录</button></span>
        </div>
        <div id="left_nav">
            <nav class="bg-light flex-column">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="javascript:void(0)" onclick="userInfo()"><span style="margin: 30px;">用户信息管理</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="javascript:void(0)" onclick="shopInfo()"><span style="margin: 30px;">商家信息管理</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="javascript:void(0)" onclick="comInfo()"><span style="margin: 30px;">商品信息管理</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="javascript:void(0)" onclick="orderForm()"><span style="margin: 30px;">订单信息管理</span></a>
                    </li>
                </ul>
            </nav>
        </div>
        <iframe id="admin_body" src="http://localhost:8080/order_system/jsp/admin/user_info.jsp"></iframe>
    </div>
</body>
<script type="text/javascript">
    function userInfo(){
        document.getElementById("admin_body").src="http://localhost:8080/order_system/jsp/admin/user_info.jsp";
    }
    function shopInfo(){
        document.getElementById("admin_body").src="http://localhost:8080/order_system/jsp/admin/shop_info.jsp";
    }
    function comInfo(){
        document.getElementById("admin_body").src="http://localhost:8080/order_system/jsp/admin/com_info.jsp";
    }
    function orderForm(){
        document.getElementById("admin_body").src="http://localhost:8080/order_system/jsp/admin/order_form.jsp";
    }
    function EXIT() {
        window.location.href="http://localhost:8080/order_system/jsp/loginAdmin.jsp"
    }
</script>
<style type="text/css">
    body{
        margin: 0;
        padding: 0;
    }
    #web_body{
        position: relative;
        width: 100%;
    }
    #left_nav{
        height: auto;
        width: 180px;
    }
    #top_nav{
        position: relative;
    }
    #admin_body{
        height: 700px;
        width: 1339.2px;
        position: absolute;
        left: 180px;
        top: 72.4px;
        border: 0;
    }
    .resp-container {
        /*position: relative;*/
        overflow: hidden;
        padding-top: 56.25%;
    }
    .resp-iframe {
        position: absolute;
        top: 0;
        left: 0;
    }
</style>
</html>
