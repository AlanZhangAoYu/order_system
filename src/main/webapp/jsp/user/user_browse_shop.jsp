<%--
  Created by IntelliJ IDEA.
  User: ZAY
  Date: 2021/12/8
  Time: 13:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商家详情</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/node_modules/bootstrap/dist/css/bootstrap.css" crossorigin="anonymous">
    <script src="${pageContext.request.contextPath}/node_modules/jquery/dist/jquery.js" charset="UTF-8"></script>
    <script src="${pageContext.request.contextPath}/node_modules/@popperjs/core/dist/umd/popper.js"></script>
    <script src="${pageContext.request.contextPath}/node_modules/bootstrap/dist/js/bootstrap.js" charset="UTF-8"></script>
    <script src="${pageContext.request.contextPath}/node_modules/sweetalert/dist/sweetalert.min.js" charset="UTF-8"></script>
</head>
<script>
    let shop_car={
        "uid": ${param.uid},
        "sid": ${param.sid},
        "date": "",
        "price": 0,
        "stid": 3
    };
    let order_list=[];
    function insertShopCar(cid,cname,price) {
        let com={
            "ofid": '',
            "cid": cid,
            "cname": cname,
            "num": 1,
            "price_single": price,
            "price": price,
            "tips": ""
        };
        order_list.push(com);
        swal("添加成功!");
    }
    function Delete(cid) {
        for(let i=0;i<order_list.length;i++){
            if(order_list[i].cid===cid){
                order_list.splice(i,1);
                calculateAllPrice();
                selectShopCar();
                return;
            }
        }
    }
    function ReduceNum(index) {
        order_list[index].num=order_list[index].num-1;
        order_list[index].price=order_list[index].price-order_list[index].price_single;
        order_list[index].price=Math.floor(order_list[index].price*100)/100;
        calculateAllPrice();
        //console.log("num"+order_list[index].num+"price"+order_list[index].price);
        $('#order_item_tbody').find('input').eq(index*2).val(order_list[index].num);
        $('#order_item_tbody').find('span').eq(index).text(order_list[index].price);
    }
    function AddNum(index) {
        order_list[index].num=order_list[index].num+1;
        order_list[index].price=order_list[index].price+order_list[index].price_single;
        order_list[index].price=Math.floor(order_list[index].price*100)/100;
        calculateAllPrice();
        //console.log("num"+order_list[index].num+"price"+order_list[index].price);
        $('#order_item_tbody').find('input').eq(index*2).val(order_list[index].num);
        $('#order_item_tbody').find('span').eq(index).text(order_list[index].price);
    }
    function selectShopCar(){
        document.getElementById("order_item_tbody").innerHTML="";
        for(let i in order_list){
            $("#order_item_tbody").append(
                "<tr>"+
                    "<td>"+order_list[i].cid+"</td>"+"<td>"+order_list[i].cname+"</td>"+
                    "<td>"+"<a href='javascript:void(0)' class='btn btn-secondary' onclick='ReduceNum("+i+")'>-</a>"+
                    "<input style='width: 40px' type='number' value='1'/>"+
                    "<a href='javascript:void(0)' class='btn btn-secondary' onclick='AddNum("+i+")'>+</a>"+"</td>"+
                    "<td>"+"<span style='color: #fd7e14'>"+order_list[i].price+"</span>"+"</td>"+
                    "<td>"+"<input width='50px' class='form-control' type='text' value=''/>"+"</td>"+
                    "<td>"+"<button class='btn btn-link' onclick='Delete("+order_list[i].cid+")'>移除</button>"+"</td>"+
                "</tr>"
            );
            calculateAllPrice();
        }
    }
    function calculateAllPrice() {
        //计算当前订单表中的订单项总价
        shop_car.price=0;
        for(let i in order_list){
            shop_car.price=shop_car.price+order_list[i].price;
        }
        $('#all_price').text(shop_car.price);
    }
    function notFound() {
        let img = event.srcElement;
        img.src = "${pageContext.request.contextPath}/image/error.jpg";
        img.onerror = null; //解绑onerror事件
    }
    function Submit() {
        $.ajax({
            url: "http://localhost:8080/order_system/OrderController/insertOrderController",
            data: JSON.stringify(shop_car),
            dataType: "json",
            type: "POST",
            contentType: "application/json; charset:utf-8",
            success:function (json) {
                for(let i in order_list){
                    order_list[i].ofid=json[0].ofid;
                }
                for(let i in order_list){
                    $.ajax({
                        url: "http://localhost:8080/order_system/OrderController/insertOrderItemController",
                        data: JSON.stringify(order_list[i]),
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json; charset:utf-8",
                        success:function (json) {}
                    });
                }
                swal("支付成功!");
            }
        });
    }
    $(function (){
        let shop={
            "sid": ${param.sid},
            "sname": "",
            "password": "",
            "realname": "",
            "idcard": "",
            "phone": "",
            "address": ""
        };
        let com={
            "cid": "",
            "cname": "",
            "sid": ${param.sid},
            "sname": "",
            "price": "",
            "type": ""
        };
        $.ajax({
            url: "http://localhost:8080/order_system/ShopController/selectShopByParaController",
            data: JSON.stringify(shop),
            dataType: "json",
            type: "POST",
            contentType: "application/json; charset:utf-8",
            success: function (json) {
                $("#sname").append("<span style='font-size: 40px'>"+json[0].sname+"</span>");
            }
        });
        $.ajax({
            url: "http://localhost:8080/order_system/ComController/selectComByParaController",
            data: JSON.stringify(com),
            dataType: "json",
            type: "POST",
            contentType: "application/json; charset:utf-8",
            success: function (json) {
                $.each(json,function (index){
                    $("#com_table").append(
                        "<div style='margin: 10px; float: left; width: 600px; position: relative;' class='card'>"+
                            "<div class='card-body'>"+
                                "<h4 class='card-title' style='font-style: italic'>"+json[index].cname+"</h4>"+
                                "<p class='card-text'>"+json[index].describe+"</p>"+
                                "<p class='card-text' style='color: #6c757d; font-size: 5px'>"+json[index].comType.type+"</p>"+
                                "<p class='card-text'><span style='color: orangered; font-size: 20px'>"+json[index].price+"</span>元/份</p>"+
                                "<a href='javascript:void(0)' class='btn btn-primary' onclick='insertShopCar("+json[index].cid+","+"\""+json[index].cname+"\""+","+json[index].price+")'>"+"加入购物车"+"</a>"+
                            "</div>"+
                            "<img style='margin: 5px; position: absolute; top: 5px;right: 5px' height='230px' width='350px' src='${pageContext.request.contextPath}/image/"+json[index].imagePath+"' onerror='notFound()'/>"+
                        "</div>"
                    );
                });
            }
        });
    });
</script>
<body>
    <div class="modal fade" id="shopCar">
        <div class="modal-dialog">
            <div class="modal-content" style="width: 800px">
                <!-- 模态框头部 -->
                <div class="modal-header">
                    <h4 class="modal-title">我的购物车</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <!-- 模态框主体 -->
                <div class="modal-body">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>菜品ID</th><th>菜品名</th><th>数量</th><th>单项总价</th><th>备注</th><th>操作</th>
                        </tr>
                        </thead>
                        <tbody id="order_item_tbody"></tbody>
                    </table>
                </div>
                <!-- 模态框底部 -->
                <div class="modal-footer">
                    <span style="font-size: 15px">总价:</span><span id="all_price" style="color: #fd7e14;font-size: 15px"></span>
                    <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="Submit()">支付</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>
    <div id="header" class="bg-dark">
        <span style="margin: 10px; color: #FFFFFF; font-size: 40px; font-family: '幼圆'; font-style: italic;">X&nbsp;X&nbsp;点餐</span>
        <span id="shop_car_btn"><button class="btn btn-primary" data-toggle="modal" data-target="#shopCar" onclick="selectShopCar()">查看购物车</button></span>
        <span id="welcome" style="color: #FFFFFF; font-size: 20px;">欢迎你&nbsp;&nbsp;${param.uname}</span>
    </div>
    <div id="sname"></div>
    <div id="com_table"></div>
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
    #shop_car_btn{
        position: absolute;
        top: 20px;
        right: 200px;
    }
    #welcome{
        position: absolute;
        top: 20px;
        right: 10px;
    }
    #sname{
        width: 600px;
        height: auto;
        position: relative;
        left: 400px;
    }
    #com_table{
        height: auto;
        width: 1400px;
        position: relative;
        left: 50px;
    }
</style>
</html>