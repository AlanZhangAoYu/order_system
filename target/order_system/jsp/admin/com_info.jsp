<%--
  Created by IntelliJ IDEA.
  User: ZAY
  Date: 2021/11/27
  Time: 18:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>菜品信息管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/node_modules/bootstrap/dist/css/bootstrap.css" crossorigin="anonymous">
    <script src="${pageContext.request.contextPath}/node_modules/jquery/dist/jquery.js" charset="UTF-8"></script>
    <script src="${pageContext.request.contextPath}/node_modules/@popperjs/core/dist/umd/popper.js"></script>
    <script src="${pageContext.request.contextPath}/node_modules/bootstrap/dist/js/bootstrap.js" charset="UTF-8"></script>
    <script src="${pageContext.request.contextPath}/node_modules/sweetalert/dist/sweetalert.min.js" charset="UTF-8"></script>
</head>
<script>
    $(document).ready(function(){
        $('[data-toggle="tooltip"]').tooltip();
    });
    $(function () {
        $.ajax({
            url: "http://localhost:8080/order_system/ComController/selectAllComController",
            type: "POST",
            contentType: "application/json; charset:utf-8",
            success: function(json){
                //console.log(json.toString());
                if(json.toString()===''){
                    swal('没有找到符合的数据!');
                }else{
                    $.each(json,function (index){
                        $("#tbody").append(
                            "<tr>"+
                            "<td>"+json[index].cid+"</td>"+"<td>"+json[index].cname+"</td>"+
                            "<td>"+json[index].shop.sid+"</td>"+"<td>"+json[index].shop.sname+"</td>"+
                            "<td>"+json[index].price+"</td>"+ "<td>"+json[index].comType.type+"</td>"+
                            "<td>"+json[index].describe+"</td>"+
                            "<td>"+"<button class='btn btn-info' data-toggle='modal' data-target='#myUpdate' onclick='set_transform("+json[index].cid+")'>修改</button>"+
                            "<button class='btn btn-danger' data-toggle='modal' data-target='#myDelete' onclick='set_transform("+json[index].cid+")'>删除</button>"+"</td>"+
                            "</tr>"
                        );
                    });
                }
            }
        });
    });
    function select() {
        let select_cid=document.getElementById('select_cid').value;
        let select_cname=document.getElementById('select_cname').value;
        let select_sid=document.getElementById('select_sid').value;
        let select_sname=document.getElementById('select_sname').value;
        let select_price=document.getElementById('select_price').value;
        let select_type=document.getElementById('select_type').value;
        let select_com={
            "cid": select_cid,
            "cname": select_cname,
            "sid": select_sid,
            "sname": select_sname,
            "price": select_price,
            "type": select_type,
        };
        let json=JSON.stringify(select_com);
        $.ajax({
            url: "http://localhost:8080/order_system/ComController/selectComByParaController",
            data: json,
            dataType: "json",
            type: "POST",
            contentType: "application/json; charset:utf-8",
            success: function(json){
                //console.log(json.toString());
                if(json.toString()===''){
                    swal('没有找到符合的数据!');
                }else{
                    document.getElementById("tbody").innerHTML="";
                    $.each(json,function (index){
                        $("#tbody").append(
                            "<tr>"+
                            "<td>"+json[index].cid+"</td>"+"<td>"+json[index].cname+"</td>"+
                            "<td>"+json[index].shop.sid+"</td>"+"<td>"+json[index].shop.sname+"</td>"+
                            "<td>"+json[index].price+"</td>"+ "<td>"+json[index].comType.type+"</td>"+
                            "<td>"+json[index].describe+"</td>"+
                            "<td>"+"<button class='btn btn-info' data-toggle='modal' data-target='#myUpdate' onclick='set_transform("+json[index].cid+")'>修改</button>"+
                            "<button class='btn btn-danger' data-toggle='modal' data-target='#myDelete' onclick='set_transform("+json[index].cid+")'>删除</button>"+"</td>"+
                            "</tr>"
                        );
                    });
                }
            }
        });
    }
    function insert() {
        let insert_cid=document.getElementById("insert_cid").value;
        let insert_cname=document.getElementById("insert_cname").value;
        let insert_sid=document.getElementById("insert_sid").value;
        let insert_price=document.getElementById("insert_price").value;
        let ctid=document.getElementById("insert_com_type").value;
        let insert_describe=document.getElementById("insert_describe").value;
        let insert_com={
            "cid": insert_cid,
            "cname": insert_cname,
            "sid": insert_sid,
            "price": insert_price,
            "ctid": ctid,
            "describe": insert_describe
        }
        $.ajax({
            url: "http://localhost:8080/order_system/ComController/insertComController",
            data: JSON.stringify(insert_com),
            dataType: "json",
            type: "POST",
            contentType: "application/json; charset:utf-8",
            success: function(json){
                swal("成功插入了"+json.row+"条信息");
            }
        });
    }
    function update(cid) {
        let update_cname=document.getElementById('update_cname').value;
        let update_sid=document.getElementById('update_sid').value;
        let update_price=document.getElementById('update_price').value;
        let update_com_type=document.getElementById('update_com_type').value;
        let update_describe=document.getElementById('update_describe').value;
        let update_com={
            "cid": cid,
            "cname": update_cname,
            "sid": update_sid,
            "price": update_price,
            "ctid": update_com_type,
            "describe": update_describe,
        };
        $.ajax({
            url: "http://localhost:8080/order_system/ComController/updateComByCidController",
            data: JSON.stringify(update_com),
            dataType: "json",
            type: "POST",
            contentType: "application/json; charset:utf-8",
            success: function(json){
                swal("成功修改了"+json.row+"条信息");
            }
        });
    }
    function Delete(cid) {
        let delete_com={
            "cid": cid
        }
        $.ajax({
            url: "http://localhost:8080/order_system/ComController/deleteComByCidController",
            data: JSON.stringify(delete_com),
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
        document.getElementById("cid_span_update").innerHTML=sid;
        document.getElementById("cid_span_delete").innerHTML=sid;
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
                                CID<input type="number" class="form-control" id="select_cid" value=""/>
                                商品名<input type="text" class="form-control" id="select_cname" value=""/>
                                商家SID<input type="number" class="form-control" id="select_sid" value=""/>
                                商家店名<input type="text" class="form-control" id="select_sname" value=""/>
                                单价<input type="text" class="form-control" id="select_price" value=""/>
                                商品类别<input type="text" class="form-control" id="select_type" value=""/>
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
                                CID<input type="number" class="form-control" id="insert_cid" value=""/>
                                商品名<input type="text" class="form-control" id="insert_cname" value=""/>
                                所属商家SID<input type="number" class="form-control" id="insert_sid" value=""/>
                                单价<input type="text" class="form-control" id="insert_price" value=""/>
                                商品类别
                                <select class="form-control" id="insert_com_type">
                                    <option value="">请选择...</option>
                                    <option value="0">未分类</option>
                                    <option value="1">甜点饮品</option>
                                    <option value="2">超市便利</option>
                                    <option value="3">蔬菜水果</option>
                                    <option value="4">医用药品</option>
                                    <option value="5">早餐</option>
                                    <option value="6">汉堡披萨</option>
                                    <option value="7">面包蛋糕</option>
                                    <option value="8">日韩料理</option>
                                    <option value="9">家常菜</option>
                                    <option value="10">特色小吃</option>
                                    <option value="11">火锅烧烤</option>
                                    <option value="12">米粉面馆</option>
                                </select>
                                描述<input type="text" class="form-control" id="insert_describe" value=""/>
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
                            <h5 class="modal-title">请输入CID为<span id="cid_span_update"></span>的修改信息</h5>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <!-- 模态框主体 -->
                        <div class="modal-body">
                            <label>
                                商品名<input type="text" class="form-control" id="update_cname" value=""/>
                                所属商家ID<input type="number" class="form-control" id="update_sid" value=""/>
                                单价<input type="text" class="form-control" id="update_price" value=""/>
                                商品类别
                                <select class="form-control" id="update_com_type">
                                    <option value="">请选择...</option>
                                    <option value="0">未分类</option>
                                    <option value="1">甜点饮品</option>
                                    <option value="2">超市便利</option>
                                    <option value="3">蔬菜水果</option>
                                    <option value="4">医用药品</option>
                                    <option value="5">早餐</option>
                                    <option value="6">汉堡披萨</option>
                                    <option value="7">面包蛋糕</option>
                                    <option value="8">日韩料理</option>
                                    <option value="9">家常菜</option>
                                    <option value="10">特色小吃</option>
                                    <option value="11">火锅烧烤</option>
                                    <option value="12">米粉面馆</option>
                                </select>
                                描述<input type="text" class="form-control" id="update_describe" value=""/>
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
                            <h3 style="color: red;">是否删除CID为<span id="cid_span_delete"></span>的记录?</h3>
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
                <th>CID</th><th>商品名</th><th>所属商家SID</th><th>所属商家店名</th><th>单价</th><th>商品类别</th><th>描述</th><th>操作</th>
            </tr>
            </thead>
            <tbody id="tbody"></tbody>
        </table>
    </div>
</body>
</html>
