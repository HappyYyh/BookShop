<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <title>登陆</title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.js"></script>
    <!-- Custom Theme files -->
    <!--theme-style-->
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <!-- start menu -->
    <link href="css/memenu.css" rel="stylesheet" type="text/css" media="all"/>
    <script type="text/javascript" src="js/memenu.js"></script>
    <script>$(document).ready(function () {
        $(".memenu").memenu();
    });</script>
    <script src="js/simpleCart.min.js"></script>
    <script src="MyJs/common.js"></script>
</head>
<body>
<!--header-->
<div class="header">
    <div class="header-top">
        <div class="container">
            <div class="search">
                <form action="/Book/Query" method="get" >
                    <input type="text" name="condition" placeholder="搜索">
                    <input type="submit" value="Go">
                </form>
            </div>
            <div class="header-left">
                <ul>
                    <c:if test="${null==username}">
                        <li><a href="login.jsp">登陆</a></li>
                        <li><a href="register.jsp">注册</a></li>
                    </c:if>
                    <c:if test="${username!=null}">
                        <li><a class="lock" href="#">${username}</a></li>
                        <li><a class="lock" href="/User/logout">注销</a></li>
                    </c:if>
                    <li><a class="lock" href="javascript:showModal()">后台管理</a></li>
                </ul>
                <div class="cart box_1">
                    <h3>
                        <div class="total">

                        </div>
                        <a href="/Cart/List">
                            <img src="images/cart.png" alt=""/></a>
                    </h3>
                    <c:if test="${null!=price}">
                        <p><a href="/Cart/deleteAll" class="simpleCart_empty">清空购物车</a></p>
                    </c:if>

                </div>
                <div class="clearfix"></div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <div class="container">
        <div class="head-top">
            <div class="logo">
                <a href="/Book/toIndex"><img src="images/logo1.png" alt=""></a>
            </div>
            <div class=" h_menu4">
                <ul class="memenu skyblue">
                    <li class="active grid"><a class="color8" href="/Book/toIndex">首页</a></li>
                    <li><a class="color1" href="/Book/Query">书城</a></li>
                    <li><a class="color6" href="contact.html">联系我们</a></li>
                </ul>
            </div>

            <div class="clearfix"></div>
        </div>
    </div>

</div>


<!--content-->
<div class="container">
    <div class="account">
        <h1>帐户</h1>
        <div class="account-pass">
            <div class="col-md-8 account-top">
                <form>
                    <span style="color: red">${msg}</span>
                    <div>
                        <span>用户名/邮箱</span>
                        <input type="text" name="condition" id="condition">
                    </div>
                    <div>
                        <span>密码</span>
                        <input type="password" id="password">
                    </div>
                    <p align="center"><span style="color: red" id="user-show"></span></p>
                    <input type="button" id="User-login-btn" value="登录">
                </form>
            </div>
            <div class="col-md-4 left-account ">
                <a href="detail.jsp"><img class="img-responsive " src="bookImages/23752765-1_u_2.jpg" alt=""></a>
                <div class="five">
                    <h2>25% </h2><span>discount</span>
                </div>
                <a href="register.jsp" class="create">创建帐户</a>
                <div class="clearfix"></div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>

    <%--模态框--%>
    <div id="modal" class="modal " tabindex="-1">
        <!-- 窗口声明 -->
        <div class="modal-dialog">
            <!-- 内容声明 -->
            <div class="modal-content">
                <div class="modal-header">
                    <button id="close" onclick="hideModal()" class="close" data-dismiss="modal">
                        <span>&times;</span>
                    </button>
                    <h4 class="modal-title">管理员登陆</h4>
                </div>
                <div class="modal-body">
                    <form action="" method="post">
                        <div class="form-group">
                            <label for="manager_username">用户名</label>
                            <input type="text" class="form-control" name="username" id="manager_username" placeholder="请输入用户名">
                        </div>
                        <div class="form-group">
                            <label for="manager_password">密码</label>
                            <input type="password" class="form-control" name="password" id="manager_password" placeholder="请输入密码">
                        </div>
                        <p align="center"><span id="show" style="color: red"></span></p>
                        <button type="button" onclick="Manager_login()" class="btn btn-default">登录</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!--//content-->
<div class="footer">
    <div class="container">
        <div class="footer-top-at">

            <div class="col-md-4 amet-sed">
                <h4>更多</h4>
                <ul class="nav-bottom">
                    <li><a href="#">怎样订购</a></li>
                    <li><a href="#">FAQ</a></li>
                    <li><a href="contact.html">地点</a></li>
                    <li><a href="#">运费</a></li>
                    <li><a href="#">会员</a></li>
                </ul>
            </div>
            <div class="col-md-4 amet-sed ">
                <h4>联系我们</h4>

                <p>江苏省</p>
                <p>南京市</p>
                <p>办公电话: +025 995 0792</p>
                <ul class="social">
                    <li><a href="#"><i> </i></a></li>
                    <li><a href="#"><i class="twitter"> </i></a></li>
                    <li><a href="#"><i class="rss"> </i></a></li>
                    <li><a href="#"><i class="gmail"> </i></a></li>

                </ul>
            </div>
            <div class="col-md-4 amet-sed">
                <h4>时适订阅</h4>
                <p>加入我们得到最新讯信</p>
                <form>
                    <input type="text" value="" onfocus="this.value='';"
                           onblur="if (this.value == '') {this.value ='';}">
                    <input type="submit" value="订阅">
                </form>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <div class="footer-class">
        <p>Copyright &copy; 2017.天天商城 All rights reserved.</p>
    </div>
</div>
</div>
</body>
<script>
    $("#User-login-btn").click(function () {
        $("#user-show").html("");
        var condition = $("#condition").val();
        var password =$("#password").val();
        var url = "/User/login";
        var show = "";
        $.getJSON(url,{condition:condition,password:password},function (result) {
            if(result.status==4){//登陆成功
                location.href = "/Book/toIndex";
            }else {
                //登陆失败
                show +=result.msg;
                $("#user-show").append(show);
                console.log(show);
            }
        })
    })
</script>
</html>
			