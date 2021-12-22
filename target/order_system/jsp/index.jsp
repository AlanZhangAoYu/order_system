<%--
  Created by IntelliJ IDEA.
  User: ZAY
  Date: 2021/12/6
  Time: 21:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>商城主页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/node_modules/bootstrap/dist/css/bootstrap.css" crossorigin="anonymous">
    <script src="${pageContext.request.contextPath}/node_modules/jquery/dist/jquery.js" charset="UTF-8"></script>
    <script src="${pageContext.request.contextPath}/node_modules/@popperjs/core/dist/umd/popper.js"></script>
    <script src="${pageContext.request.contextPath}/node_modules/bootstrap/dist/js/bootstrap.js" charset="UTF-8"></script>
    <script src="${pageContext.request.contextPath}/node_modules/sweetalert/dist/sweetalert.min.js" charset="UTF-8"></script>
</head>
<script>
    function login(){
        let id=document.getElementById("id").value;
        let password=document.getElementById("password").value;
        let character=getRadioButtonCheckedValue("character");
        if(character === "1"){
            let user={
                "uid": id,
                "uname": "",
                "password": password,
                "realname": "",
                "idcard": "",
                "phone": "",
                "address": ""
            }
            $.ajax({
                url: "http://localhost:8080/order_system/UserController/selectUserByPara",
                data: JSON.stringify(user),
                dataType: "json",
                type: "POST",
                contentType: "application/json; charset:utf-8",
                success: function(json){
                    console.log(json);
                    if(json.toString()===''){
                        swal('用户ID或密码错误');
                    }else{
                        window.location.href="http://localhost:8080/order_system/jsp/user/user_index.jsp?uid="+json[0].uid+"&uname="+json[0].uname;
                    }
                }
            });
        }else if(character === "2"){
            let shop={
                "sid": id,
                "sname": "",
                "password": password,
                "realname": "",
                "idcard": "",
                "phone": "",
                "address": ""
            }
            $.ajax({
                url: "http://localhost:8080/order_system/ShopController/selectShopByParaController",
                data: JSON.stringify(shop),
                dataType: "json",
                type: "POST",
                contentType: "application/json; charset:utf-8",
                success: function(json){
                    if(json.toString()===''){
                        swal('商家ID或密码错误');
                    }else{
                        window.location.href="http://localhost:8080/order_system/jsp/shop/shop_index.jsp?sid="+json[0].sid+"&sname="+json[0].sname;
                    }
                }
            });
        }else{
            swal("未选择登录身份");
        }
    }
    function getRadioButtonCheckedValue(name){
        //返回单选框中选中的值
        let radio_tag=document.getElementsByName(name);
        for(let i=0;i<radio_tag.length;i++){
            if(radio_tag[i].checked){
                return radio_tag[i].value;
            }
        }
    }
    function userZhuCe() {
        window.location.href="http://localhost:8080/order_system/jsp/user/user_zhuce.jsp";
    }
    function shopZhuCe() {
        window.location.href="http://localhost:8080/order_system/jsp/shop/shop_zhuce.jsp";
    }
</script>
<body>
    <div id="header" class="bg-dark">
        <span style="margin: 10px; color: #FFFFFF; font-size: 40px; font-family: '幼圆'; font-style: italic;">X&nbsp;X&nbsp;点餐</span>
        <span id="login_logo">
                    <button type="button" class="btn btn-link"><span style="color: #ffffff;">登&nbsp;录</span></button>
                    <img src="../image/登录.png"/>
                </span>
    </div>
    <div style="margin: 20px; width: 150px; height: auto;">
        <div style="font-size: 30px; font-family: '幼圆'; font-style: italic;">商品分类</div>
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link" href="javascript:void(0)">甜点饮品</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="javascript:void(0)">超市便利</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="javascript:void(0)">水果蔬菜</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="javascript:void(0)">医用药品</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="javascript:void(0)">早餐</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="javascript:void(0)">汉堡披萨</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="javascript:void(0)">面包蛋糕</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="javascript:void(0)">日韩料理</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="javascript:void(0)">家常菜</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="javascript:void(0)">特色小吃</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="javascript:void(0)">火锅烧烤</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="javascript:void(0)">米粉面馆</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="javascript:void(0)">...</a>
            </li>
        </ul>
    </div>
    <div id="lun_bo">
        <div id="demo" class="carousel slide" data-ride="carousel">
            <!-- 指示符 -->
            <ul class="carousel-indicators">
                <li data-target="#demo" data-slide-to="0" class="active"></li>
                <li data-target="#demo" data-slide-to="1"></li>
                <li data-target="#demo" data-slide-to="2"></li>
                <li data-target="#demo" data-slide-to="3"></li>
                <li data-target="#demo" data-slide-to="4"></li>
            </ul>
            <!-- 轮播图片 -->
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="../image/轮播1.jpg">
                    <div class="carousel-caption">
                        <h3>第一张图片描述标题</h3>
                        <p>描述文字!</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="../image/轮播2.jpg">
                    <div class="carousel-caption">
                        <h3>第二张图片描述标题</h3>
                        <p>描述文字!</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="../image/轮播3.jpg">
                    <div class="carousel-caption">
                        <h3>第三张图片描述标题</h3>
                        <p>描述文字!</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="../image/轮播4.jpg">
                    <div class="carousel-caption">
                        <h3>第四张图片描述标题</h3>
                        <p>描述文字!</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="../image/轮播5.jpg">
                    <div class="carousel-caption">
                        <h3>第五张图片描述标题</h3>
                        <p>描述文字!</p>
                    </div>
                </div>
            </div>
            <!-- 左右切换按钮 -->
            <a class="carousel-control-prev" href="#demo" data-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#demo" data-slide="next">
                <span class="carousel-control-next-icon"></span>
            </a>
        </div>
    </div>
    <div id="recommend_shop">
        <span>推荐商家</span><br/>
        <div>意思一哈...</div>
    </div>
    <div id="login_form">
        <div class="form-group">
            <label for="id">ID:</label>
            <input type="number" class="form-control" id="id"/>
        </div>
        <div class="form-group">
            <label for="password">密码:</label>
            <input type="password" class="form-control" id="password"/>
        </div>
        <div class="form-check">
                      <span class="radio">
                            <label><input type="radio" name="character" value="1">我是用户</label>
                          </span>
            <span class="radio">
                            <label><input type="radio" name="character" value="2">我是商家</label>
                          </span>
        </div>
        <button class="btn btn-primary" onclick="login()">登&nbsp;录</button>
        <button class="btn btn-secondary" onclick="userZhuCe()">注册用户</button>
        <button class="btn btn-secondary" onclick="shopZhuCe()">注册商家</button>
    </div>
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
        background-color: #FFF8DC;
    }
    #header{
        width: 100%;
        height: 70px;
        position: relative;
    }
    #login_logo{
        position: absolute;
        top: 20px;
        right: 10px;
    }
    #lun_bo{
        height: 390px;
        width: 980px;
        position: absolute;
        top: 80px;
        left: 180px;
    }
    #login_form{
        padding: 20px;
        height: 300px;
        width: 300px;
        border: 1px solid #FFFFFF;
        background-color: rgba(0,0,0,0.2);
        position: absolute;
        top: 100px;
        right: 40px;
    }
</style>
</html>
