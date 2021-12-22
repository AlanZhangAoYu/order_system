<%--
  Created by IntelliJ IDEA.
  User: ZAY
  Date: 2021/11/30
  Time: 20:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订单管理界面</title>
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
    function select_order_item(ofid) {
        console.log(ofid);
        let json={
            'ofid': ofid
        }
        $.ajax({
            url: "http://localhost:8080/order_system/OrderController/selectOrderItemByOfidController",
            data: JSON.stringify(json),
            dataType: "json",
            type: "POST",
            contentType: "application/json; charset:utf-8",
            success: function(json){
                //console.log(json.toString());
                if(json.toString()===''){
                    swal('没有找到符合的数据!');
                }else{
                    document.getElementById("select_tbody").innerHTML="";
                    $.each(json,function (index){
                        $("#select_tbody").append(
                            "<tr>"+
                            "<td>"+json[index].orderForm.ofid+"</td>"+"<td>"+json[index].com.cid+"</td>"+
                            "<td>"+json[index].com.cname+"</td>"+"<td>"+json[index].num+"</td>"+
                            "<td>"+json[index].price+"</td>"+ "<td>"+json[index].tips+"</td>"+
                            "</tr>"
                        );
                    });
                }
            }
        });
    }
    function select() {
        let select_ofid=document.getElementById("select_ofid").value;
        let select_uid=document.getElementById("select_uid").value;
        let select_uname=document.getElementById("select_uname").value;
        let select_sid=document.getElementById("select_sid").value;
        let select_sname=document.getElementById("select_sname").value;
        let select_date=document.getElementById("select_date").value;
        let select_state=document.getElementById("select_state").value;
        let json={
            "ofid": select_ofid,
            "uid": select_uid,
            "uanme": select_uname,
            "sid": select_sid,
            "sname": select_sname,
            "date": select_date,
            "state": select_state
        }
        $.ajax({
            url: "http://localhost:8080/order_system/OrderController/selectOrderByParaController",
            data: JSON.stringify(json),
            dataType: "json",
            type: "POST",
            contentType: "application/json; charset:utf-8",
            success: function(json){
                console.log(json.toString());
                if(json.toString()===''){
                    swal('没有找到符合的数据!');
                }else{
                    document.getElementById("tbody").innerHTML="";
                    $.each(json,function (index){
                        $("#tbody").append(
                            "<tr>" +
                            "<td><button type='button' class='btn btn-link'>"+json[index].ofid+"</button></td>"+"<td>"+json[index].user.uid+"</td>"+
                            "<td>"+json[index].user.uname+"</td>"+"<td>"+json[index].shop.sid+"</td>"+
                            "<td>"+json[index].shop.sname+"</td>"+"<td>"+getLocalTime(json[index].date)+"</td>"+
                            "<td>"+json[index].price+"</td>"+ "<td>"+json[index].state.stname+"</td>"+
                            "<td>"+"<button class='btn btn-info' data-toggle='modal' data-target='#select_order_item' onclick='select_order_item("+json[index].ofid+")'>订单详情</button>"+
                            "</td>"+
                            "</tr>"
                        );
                    });
                }
            }
        });
    }
    $(function(){
        $.ajax({
            url: "http://localhost:8080/order_system/OrderController/selectAllOrderController",
            type: "POST",
            contentType: "application/json; charset:utf-8",
            success: function(json){
                console.log(json.toString());
                if(json.toString()===''){
                    swal('没有找到符合的数据!');
                }else{
                    $.each(json,function (index){
                        $("#tbody").append(
                            "<tr>" +
                            "<td><button type='button' class='btn btn-link'>"+json[index].ofid+"</button></td>"+"<td>"+json[index].user.uid+"</td>"+
                            "<td>"+json[index].user.uname+"</td>"+"<td>"+json[index].shop.sid+"</td>"+
                            "<td>"+json[index].shop.sname+"</td>"+"<td>"+getLocalTime(json[index].date)+"</td>"+
                            "<td>"+json[index].price+"</td>"+ "<td>"+json[index].state.stname+"</td>"+
                            "<td>"+"<button class='btn btn-info' data-toggle='modal' data-target='#select_order_item' onclick='select_order_item("+json[index].ofid+")'>订单详情</button>"+
                            "</td>"+
                            "</tr>"
                        );
                    });
                }
            }
        });
    });
</script>
<body>
    <div id="body">
        <div id="action_region">
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#mySelect">
                点我查询
            </button>
            <!--<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myInsert">
                点我插入
            </button>-->
            <div class="modal fade" id="mySelect">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <!-- 模态框头部 -->
                        <div class="modal-header">
                            <h4 class="modal-title">请输入查询信息</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <!-- 模态框主体 -->
                        <div class="modal-body">
                            <label>
                                订单号<input type="number" class="form-control" id="select_ofid" value=""/>
                                用户ID<input type="number" class="form-control" id="select_uid" value=""/>
                                用户名<input type="text" class="form-control" id="select_uname" value=""/>
                                商家ID<input type="number" class="form-control" id="select_sid" value=""/>
                                商家店名<input type="text" class="form-control" id="select_sname" value=""/>
                                订单创建日期<input type="date" class="form-control" id="select_date" value=""/>
                                订单状态
                                <select class="form-control" id="select_state">
                                    <option value="">请选择...</option>
                                    <option value="0">已取消</option>
                                    <option value="1">未提交</option>
                                    <option value="2">未付款</option>
                                    <option value="3">未发货</option>
                                    <option value="4">正在派送</option>
                                    <option value="5">已签收</option>
                                </select>
                            </label>
                        </div>
                        <!-- 模态框底部 -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" onclick="select()">查询</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="myInsert">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <!-- 模态框头部 -->
                        <div class="modal-header">
                            <h4 class="modal-title">请输入插入信息</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <!-- 模态框主体 -->
                        <div class="modal-body">
                            <label>
                                订单号<input type="number" class="form-control" id="insert_ofid" value=""/>
                                用户ID<input type="text" class="form-control" id="insert_uid" value=""/>
                                所属商家ID<input type="text" class="form-control" id="insert_sid" value=""/>
                                订单创建日期<input type="date" class="form-control" id="insert_date" value=""/>
                                单价<input type="text" class="form-control" id="insert_price" value=""/>
                                订单状态
                                <select class="form-control" id="insert_state">
                                    <option value="0">已取消</option>
                                    <option value="1">未提交</option>
                                    <option value="2">未付款</option>
                                    <option value="3">未发货</option>
                                    <option value="4">正在派送</option>
                                    <option value="5">已签收</option>
                                </select>
                            </label>
                        </div>
                        <!-- 模态框底部 -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" onclick="insert()">插入</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="select_order_item">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <!-- 模态框头部 -->
                        <div class="modal-header">
                            <h4 class="modal-title">订单详情</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <!-- 模态框主体 -->
                        <div class="modal-body">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>订单号</th><th>菜品ID</th><th>菜品名</th><th>数量</th><th>单项总价</th><th>备注</th>
                                    </tr>
                                </thead>
                                <tbody id="select_tbody"></tbody>
                            </table>
                        </div>
                        <!-- 模态框底部 -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <table id="user_table" class="table table-bordered">
            <thead>
            <tr>
                <th>订单号</th><th>用户ID</th><th>用户名</th><th>商店ID</th><th>商店名</th><th>订单创建日期</th><th>订单总价</th><th>订单状态</th><th>操作</th>
            </tr>
            </thead>
            <tbody id="tbody"></tbody>
        </table>
    </div>
</body>
</html>