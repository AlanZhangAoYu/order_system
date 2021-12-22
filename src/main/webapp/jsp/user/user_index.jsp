<%--
  Created by IntelliJ IDEA.
  User: ZAY
  Date: 2021/12/6
  Time: 21:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>欢迎使用</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/node_modules/bootstrap/dist/css/bootstrap.css" crossorigin="anonymous">
    <script src="${pageContext.request.contextPath}/node_modules/jquery/dist/jquery.js" charset="UTF-8"></script>
    <script src="${pageContext.request.contextPath}/node_modules/@popperjs/core/dist/umd/popper.js"></script>
    <script src="${pageContext.request.contextPath}/node_modules/bootstrap/dist/js/bootstrap.js" charset="UTF-8"></script>
    <script src="${pageContext.request.contextPath}/node_modules/sweetalert/dist/sweetalert.min.js" charset="UTF-8"></script>
</head>
<script>
    function getLocalTime(nS) {
        //将时间戳转换为看得懂的日期格式
        let date=new Date(nS);
        let Y=date.getFullYear()+'-';
        let M=(date.getMonth()+ 1 < 10 ? '0' + (date.getMonth()+1):date.getMonth()+1)+'-';
        let D=date.getDate()+' ';
        let h=date.getHours()+':';
        let m=date.getMinutes()+':';
        let s=date.getSeconds();
        return Y+M+D+h+m+s;
    }
    function notFound() {
        let img = event.srcElement;
        img.src = "${pageContext.request.contextPath}/image/error.jpg";
        img.onerror = null; //解绑onerror事件
    }
    $(function(){
        $.ajax({
            url: "http://localhost:8080/order_system/ShopController/selectAllShopController",
            type: "POST",
            contentType: "application/json; charset:utf-8",
            success: function(json){
                console.log(json.toString());
                if(json.toString()===''){
                    swal('没有找到符合的数据!');
                }else{
                    $.each(json,function (index){
                        $("#shop_recommend").append(
                            "<div class='shop_recommend_item'>"+
                                "<div class='card' style='height:460px; width:400px;'>"+
                                    "<img class='card-img-top' src='${pageContext.request.contextPath}/image/shop_"+json[index].sid+".jpg"+"' alt='Card image' width='398px' height='265px' onerror='notFound()'/>"+
                                        "<div class='card-body'>"+
                                            "<h4 class='card-title'>"+json[index].sname+"</h4>"+
                                            "<p class='card-text'>"+json[index].address+"</p>"+
                                            "<a href='javascript:void(0)' class='btn btn-primary' onclick='browseShop("+json[index].sid+")'>进店看看</a>"+
                                        "</div>"+
                                "</div>"+
                            "</div>"
                        );
                    });
                }
            }
        });
    });
    function browseShop(sid) {
        window.location.href="http://localhost:8080/order_system/jsp/user/user_browse_shop.jsp?uid="+'${param.uid}'+"&uname="+'${param.uname}'+"&sid="+sid;
    }
    function EXIT() {
        window.location.href="http://localhost:8080/order_system/jsp/index.jsp";
    }
    function Receive(ofid) {
        let order={
            "ofid": ofid,
            "uid": '',
            "sid": '',
            "date": '',
            "price": '',
            "stid": 5
        };
        $.ajax({
            url: "http://localhost:8080/order_system/OrderController/updateOrderStateByOfidController",
            type: "POST",
            contentType: "application/json; charset:utf-8",
            data: JSON.stringify(order),
            dataType: "json",
            success: function () {
                select_now();
            }
        });
    }
    function select_now(){
        let order_now={
            "ofid": '',
            "uid": ${param.uid},
            "sid": '',
            "date": '',
            "price": '',
            "stid": 5
        };
        $.ajax({
            url: "http://localhost:8080/order_system/OrderController/selectOrderNotFinishByParaController",
            type: "POST",
            contentType: "application/json; charset:utf-8",
            data: JSON.stringify(order_now),
            dataType: "json",
            success: function (json) {
                document.getElementById("order_tbody_now").innerHTML="";
                $.each(json,function (index) {
                    $('#order_tbody_now').append(
                        "<tr>" +
                        "<td>"+json[index].ofid+"</td>"+"<td>"+json[index].user.uid+"</td>"+
                        "<td>"+json[index].user.uname+"</td>"+"<td>"+json[index].shop.sid+"</td>"+
                        "<td>"+json[index].shop.sname+"</td>"+"<td>"+getLocalTime(json[index].date)+"</td>"+
                        "<td>"+json[index].price+"</td>"+ "<td style='color: #fd7e14;'>"+json[index].state.stname+"</td>"+
                        "<td>"+"<button class='btn btn-danger' onclick='Receive("+json[index].ofid+")'>已签收</button>"+"</td>"+
                        "</tr>"
                    );
                });
            }
        });
    }
    function select_history() {
        let order_history={
            "ofid": '',
            "uid": ${param.uid},
            "sid": '',
            "date": '',
            "price": '',
            "state": 5
        };
        $.ajax({
            url: "http://localhost:8080/order_system/OrderController/selectOrderByParaController",
            type: "POST",
            contentType: "application/json; charset:utf-8",
            data: JSON.stringify(order_history),
            dataType: "json",
            success: function (json) {
                document.getElementById("order_tbody_history").innerHTML="";
                $.each(json,function (index) {
                    $('#order_tbody_history').append(
                        "<tr>" +
                        "<td>"+json[index].ofid+"</td>"+"<td>"+json[index].user.uid+"</td>"+
                        "<td>"+json[index].user.uname+"</td>"+"<td>"+json[index].shop.sid+"</td>"+
                        "<td>"+json[index].shop.sname+"</td>"+"<td>"+getLocalTime(json[index].date)+"</td>"+
                        "<td>"+json[index].price+"</td>"+ "<td>"+json[index].state.stname+"</td>"+
                        "</tr>"
                    );
                });
            }
        });
    }
    function update(uid) {
        let update_name=document.getElementById('update_name').value;
        let update_password=document.getElementById('update_password').value;
        let update_realname=document.getElementById('update_realname').value;
        let update_idcard=document.getElementById('update_idcard').value;
        let update_phone=document.getElementById('update_phone').value;
        let update_address=document.getElementById('update_address').value;
        let update_user={
            "uid": uid,
            "uname": update_name,
            "password": update_password,
            "realname": update_realname,
            "idcard": update_idcard,
            "phone": update_phone,
            "address": update_address
        };
        $.ajax({
            url: "http://localhost:8080/order_system/UserController/updateUserByUidController",
            data: JSON.stringify(update_user),
            dataType: "json",
            type: "POST",
            contentType: "application/json; charset:utf-8",
            success: function(json){
                swal("成功修改了"+json.row+"条信息");
                window.location.href="http://localhost:8080/order_system/jsp/index.jsp";
            }
        });
    }
    function set_transform(uid) {
        document.getElementById("transform").value=uid;
        document.getElementById("uid_span_update").innerHTML=uid;
    }
    function get_transform(){
        return document.getElementById("transform").value;
    }
</script>
<body>
    <div class="modal fade" id="OrderListNow">
        <div class="modal-dialog">
            <div class="modal-content" style="width: 800px">
                <!-- 模态框头部 -->
                <div class="modal-header">
                    <h4 class="modal-title">当前进行中订单</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <!-- 模态框主体 -->
                <div class="modal-body">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>订单号</th><th>用户ID</th><th>用户名</th><th>商店ID</th><th>商店名</th><th>订单创建日期</th><th>订单总价</th><th>订单状态</th><th>操作</th>
                            </tr>
                        </thead>
                        <tbody id="order_tbody_now"></tbody>
                    </table>
                </div>
                <!-- 模态框底部 -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="OrderListHistory">
        <div class="modal-dialog">
            <div class="modal-content" style="width: 700px">
                <!-- 模态框头部 -->
                <div class="modal-header">
                    <h4 class="modal-title">历史已完成订单</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <!-- 模态框主体 -->
                <div class="modal-body">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>订单号</th><th>用户ID</th><th>用户名</th><th>商店ID</th><th>商店名</th><th>订单创建日期</th><th>订单总价</th><th>订单状态</th>
                            </tr>
                        </thead>
                        <tbody id="order_tbody_history"></tbody>
                    </table>
                </div>
                <!-- 模态框底部 -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="myUpdate">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- 模态框头部 -->
                <div class="modal-header">
                    <h4 class="modal-title">修改UID为<span id="uid_span_update"></span>的信息</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <!-- 模态框主体 -->
                <div class="modal-body">
                    <label>
                        用户名<input type="text" class="form-control" id="update_name" value=""/>
                        密码<input type="text" class="form-control" id="update_password" value=""/>
                        真实姓名<input type="text" class="form-control" id="update_realname" value=""/>
                        身份证号<input type="text" class="form-control" id="update_idcard" value=""/>
                        联系电话<input type="text" class="form-control" id="update_phone" value=""/>
                        收货地址<input type="text" class="form-control" id="update_address" value=""/>
                    </label>
                </div>
                <!-- 模态框底部 -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="update(get_transform())">修改</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>
    <input type="number" id="transform" style="display: none;"/>
    <div id="header" class="bg-dark">
        <span style="margin: 10px; color: #FFFFFF; font-size: 40px; font-family: '幼圆'; font-style: italic;">X&nbsp;X&nbsp;点餐</span>
        <span><button class="btn btn-primary" data-toggle="modal" data-target="#OrderListNow" onclick="select_now()">当前进行中订单</button></span>
        <span><button class="btn btn-primary" data-toggle="modal" data-target="#OrderListHistory" onclick="select_history()">历史已完成订单</button></span>
        <span><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myUpdate" onclick="set_transform('${param.uid}')">修改用户信息</button></span>
        <span><button class="btn btn-primary" onclick="EXIT()">退出登录</button></span>
        <span id="welcome" style="color: #FFFFFF; font-size: 20px;">欢迎你&nbsp;&nbsp;${param.uname}</span>
    </div>
    <div id="shop_recommend"></div>
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
    #shop_recommend{
        margin: 10px;
        height: auto;
        width: 1400px;
        position: absolute;
        top: 80px;
        left: 100px;
    }
    .shop_recommend_item{
        margin: 20px;
        float: left;
        height: 460px;
        position: relative;
    }
</style>
</html>
