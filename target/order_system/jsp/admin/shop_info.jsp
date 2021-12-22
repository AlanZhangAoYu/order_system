<%--
  Created by IntelliJ IDEA.
  User: ZAY
  Date: 2021/11/27
  Time: 16:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商家信息管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/node_modules/bootstrap/dist/css/bootstrap.css" crossorigin="anonymous">
    <script src="${pageContext.request.contextPath}/node_modules/jquery/dist/jquery.js" charset="UTF-8"></script>
    <script src="${pageContext.request.contextPath}/node_modules/@popperjs/core/dist/umd/popper.js"></script>
    <script src="${pageContext.request.contextPath}/node_modules/bootstrap/dist/js/bootstrap.js" charset="UTF-8"></script>
    <script src="${pageContext.request.contextPath}/node_modules/sweetalert/dist/sweetalert.min.js" charset="UTF-8"></script>
</head>
<script>
    $(function () {
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
                        $("#tbody").append(
                            "<tr>" +
                            "<td>"+json[index].sid+"</td>"+"<td>"+json[index].sname+"</td>"+
                            "<td>"+json[index].password+"</td>"+"<td>"+json[index].realname+"</td>"+
                            "<td>"+json[index].idcard+"</td>"+"<td>"+json[index].phone+"</td>"+
                            "<td>"+json[index].address+"</td>"+
                            "<td>"+"<button class='btn btn-info' data-toggle='modal' data-target='#myUpdate' onclick='set_transform("+json[index].sid+")'>修改</button>"+
                            "<button class='btn btn-danger' data-toggle='modal' data-target='#myDelete' onclick='set_transform("+json[index].sid+")'>删除</button>"+"</td>"+
                            "</tr>"
                        );
                    });
                }
            }
        });
    });
    function select() {
        let select_sid=document.getElementById('select_sid').value;
        let select_sname=document.getElementById('select_sname').value;
        let select_realname=document.getElementById('select_realname').value;
        let select_idcard=document.getElementById('select_idcard').value;
        let select_phone=document.getElementById('select_phone').value;
        let select_address=document.getElementById('select_address').value;
        let select_user={
            "sid": select_sid,
            "sname": select_sname,
            "password": '',
            "realname": select_realname,
            "idcard": select_idcard,
            "phone": select_phone,
            "address": select_address
        };
        let json=JSON.stringify(select_user);
        $.ajax({
            url: "http://localhost:8080/order_system/ShopController/selectShopByParaController",
            data: json,
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
                            "<td>"+json[index].sid+"</td>"+"<td>"+json[index].sname+"</td>"+
                            "<td>"+json[index].password+"</td>"+"<td>"+json[index].realname+"</td>"+
                            "<td>"+json[index].idcard+"</td>"+"<td>"+json[index].phone+"</td>"+
                            "<td>"+json[index].address+"</td>"+
                            "<td>"+"<button class='btn btn-info' data-toggle='modal' data-target='#myUpdate' onclick='set_transform("+json[index].sid+")'>修改</button>"+
                            "<button class='btn btn-danger' data-toggle='modal' data-target='#myDelete' onclick='set_transform("+json[index].sid+")'>删除</button>"+"</td>"+
                            "</tr>"
                        );
                    });
                }
            }
        });
    }
    function insert(){
        let insert_sid=document.getElementById('insert_sid').value;
        let insert_sname=document.getElementById('insert_sname').value;
        let insert_password=document.getElementById('insert_password').value;
        let insert_realname=document.getElementById('insert_realname').value;
        let insert_idcard=document.getElementById('insert_idcard').value;
        let insert_phone=document.getElementById('insert_phone').value;
        let insert_address=document.getElementById('insert_address').value;
        let insert_shop={
            "sid": insert_sid,
            "sname": insert_sname,
            "password": insert_password,
            "realname": insert_realname,
            "idcard": insert_idcard,
            "phone": insert_phone,
            "address": insert_address
        };
        let json=JSON.stringify(insert_shop);
        $.ajax({
            url: "http://localhost:8080/order_system/ShopController/insertShopController",
            data: json,
            dataType: "json",
            type: "POST",
            contentType: "application/json; charset:utf-8",
            success: function(json){
                swal("成功插入了"+json.row+"条信息");
            }
        });
    }
    function update(sid) {
        let update_sname=document.getElementById('update_sname').value;
        let update_password=document.getElementById('update_password').value;
        let update_realname=document.getElementById('update_realname').value;
        let update_idcard=document.getElementById('update_idcard').value;
        let update_phone=document.getElementById('update_phone').value;
        let update_address=document.getElementById('update_address').value;
        let update_shop={
            "sid": sid,
            "sname": update_sname,
            "password": update_password,
            "realname": update_realname,
            "idcard": update_idcard,
            "phone": update_phone,
            "address": update_address
        };
        $.ajax({
            url: "http://localhost:8080/order_system/ShopController/updateShopBySidController",
            data: JSON.stringify(update_shop),
            dataType: "json",
            type: "POST",
            contentType: "application/json; charset:utf-8",
            success: function(json){
                swal("成功修改了"+json.row+"条信息");
            }
        });
    }
    function Delete(sid) {
        let delete_shop={
            "sid": sid
        }
        $.ajax({
            url: "http://localhost:8080/order_system/ShopController/deleteShopBySidController",
            data: JSON.stringify(delete_shop),
            dataType: "json",
            type: "POST",
            contentType: "application/json; charset:utf-8",
            success: function(json){
                swal("成功删除了"+json.row+"条信息");
            }
        });
    }
    function set_transform(sid) {
        document.getElementById("transform").value=sid;
        document.getElementById("sid_span_update").innerHTML=sid;
        document.getElementById("sid_span_delete").innerHTML=sid;
    }
    function get_transform(){
        return document.getElementById("transform").value;
    }
</script>
<body>
    <div id="body">
        <div id="action_region">
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#mySelect">
                点我查询
            </button>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myInsert">
                点我插入
            </button>
            <input type="text" id="transform" style="display: none;"/>
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
                                SID<input type="number" class="form-control" id="select_sid" value=""/>
                                商家名<input type="text" class="form-control" id="select_sname" value=""/>
                                店主真实姓名<input type="text" class="form-control" id="select_realname" value=""/>
                                身份证号<input type="text" class="form-control" id="select_idcard" value=""/>
                                联系电话<input type="text" class="form-control" id="select_phone" value=""/>
                                商店地址<input type="text" class="form-control" id="select_address" value=""/>
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
                                SID<input type="number" class="form-control" id="insert_sid" value=""/>
                                商家名<input type="text" class="form-control" id="insert_sname" value=""/>
                                密码<input type="text" class="form-control" id="insert_password" value=""/>
                                店主真实姓名<input type="text" class="form-control" id="insert_realname" value=""/>
                                身份证号<input type="text" class="form-control" id="insert_idcard" value=""/>
                                联系电话<input type="text" class="form-control" id="insert_phone" value=""/>
                                商家地址<input type="text" class="form-control" id="insert_address" value=""/>
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
            <div class="modal fade" id="myUpdate">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <!-- 模态框头部 -->
                        <div class="modal-header">
                            <h5 class="modal-title">请输入SID为<span id="sid_span_update"></span>的修改信息</h5>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <!-- 模态框主体 -->
                        <div class="modal-body">
                            <label>
                                商家名<input type="text" class="form-control" id="update_sname" value=""/>
                                密码<input type="text" class="form-control" id="update_password" value=""/>
                                店主真实姓名<input type="text" class="form-control" id="update_realname" value=""/>
                                身份证号<input type="text" class="form-control" id="update_idcard" value=""/>
                                联系电话<input type="text" class="form-control" id="update_phone" value=""/>
                                商家地址<input type="text" class="form-control" id="update_address" value=""/>
                            </label>
                        </div>
                        <!-- 模态框底部 -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" onclick="update(get_transform())">修改</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="myDelete">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <!-- 模态框头部 -->
                        <div class="modal-header">
                            <h4 class="modal-title">消息</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <!-- 模态框主体 -->
                        <div class="modal-body">
                            <h3 style="color: red;">是否删除SID为<span id="sid_span_delete"></span>的记录?</h3>
                        </div>
                        <!-- 模态框底部 -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" onclick="Delete(get_transform())">是</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">否</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <table id="user_table" class="table table-bordered">
            <thead>
            <tr>
                <th>SID</th><th>商店名</th><th>密码</th><th>店主姓名</th><th>身份证号</th><th>联系电话</th><th>商家地址</th><th>操作</th>
            </tr>
            </thead>
            <tbody id="tbody"></tbody>
        </table>
    </div>
</body>
</html>
