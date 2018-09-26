<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>注册</title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.js"></script>
    <!-- Custom Theme files -->
    <!--theme-style-->
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>

    <link href="css/memenu.css" rel="stylesheet" type="text/css" media="all"/>
    <script type="text/javascript" src="js/memenu.js"></script>
    <script>$(document).ready(function () {
        $(".memenu").memenu();
    });</script>
    <script src="js/simpleCart.min.js"></script>
</head>
<body>
<!--header-->
<div class="header">
    <div class="header-top">
        <div class="container">
            <div class="search">
                <form action="/Book/Query" method="get">
                    <input type="text" name="condition" placeholder="搜索">
                    <input type="submit" value="Go">
                </form>
            </div>
            <div class="header-left">
                <ul>
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
<div class=" container">
    <div class=" register">
        <h1>注册</h1>
        <form id="UserAdd-form" action="/User/Register" method="post">
            <div class="col-md-6 register-top-grid">
                <h3>个人信息</h3>
                <div>
                    <span>姓名</span>
                    <input type="text" onchange="validRealName()" name="realname" id="realname"
                           placeholder="请输入中文姓名">
                    <span id="realnameMsg"></span>
                </div>

                <div>
                    <span>用户名</span>
                    <input type="text" id="username" onchange="validUsername()" name="username"
                           placeholder="请输入4-10位的中文、数字、下划线">
                    <span id="usernameMsg"></span>
                </div>
                <div>
                    <span>Email</span>
                    <input type="text" id="email" onchange="validEmail()" name="email"
                           placeholder="请输入邮箱">
                    <span id="emailMsg"></span>
                </div>
                <a class="news-letter" href="#">
                    <label class="checkbox"><input type="checkbox"  checked=""><i> </i>订阅新闻</label>
                </a>
            </div>
            <div class="col-md-6 register-bottom-grid">
                <h3>登录信息</h3>
                <div>
                    <span>密码</span>
                    <input type="password" onchange="validPassword()" name="password" id="password"
                           placeholder="请输入4-10位的中文、数字、下划线">
                    <span id="passwordMsg"></span>
                </div>
                <div>
                    <span>再次确认</span>
                    <input type="password" onchange="validRePassword()" id="repassword"
                          placeholder="请再次输入密码">
                    <span id="repasswordMsg"></span>
                </div>

                <input type="button" id="add-btn" value="提交">

            </div>
            <div class="clearfix"></div>
        </form>
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
<script src="MyJs/common.js"></script>
<script>

    function validRealName() {
        $("#realnameMsg").html("");
        var re =  /^([a-zA-Z0-9\u4e00-\u9fa5\·]{2,10})$/;
        var realname = $("#realname").val();
        if (!re.test(realname)){
            $("#realnameMsg").html("<p align='center'><font color='#a52a2a'>请输入正确的姓名</font></p>");
            return false;
        }
        return true;
    }

    function validEmail() {
        $("#emailMsg").html("");
        var re =  /^([\w\_\-]+)@([\w\-]+[\.]?)*[\w]+\.[a-zA-Z]{2,4}$/;
        var email = $("#email").val();
        if (!re.test(email)){
            $("#emailMsg").html("<p align='center'><font color='#a52a2a'>请输入正确的邮箱格式</font></p>");
            return false;
        }
        return true;
    }
    function validUsername() {
        $("#usernameMsg").html("");
        var reg = /^[A-Za-z0-9_-]{4,10}$/;
        var username = $("#username").val();
        if(!reg.test(username)){
            $("#usernameMsg").html("<p align='center'><font color='#a52a2a'>请输入正确的用户名</font></p>");
            return false;
        }else {
            $.getJSON("User/beforeAdd",{username:username},function (result) {
                if(result.status===404){
                    $("#usernameMsg").html("<p align='center'><font color='#a52a2a'>"+result.msg+"</font></p>");
                    $("#add-btn").attr("ajax-va","error");
                }else {
                    $("#add-btn").attr("ajax-va","success");
                }
            })
        }
        return true;
    }

    function validPassword() {
        $("#passwordMsg").html("");
        var reg = /^[A-Za-z0-9_-]{4,10}$/;
        var pwd = $("#password").val();
        if(!reg.test(pwd)){
            $("#passwordMsg").html("<p align='center'><font color='#a52a2a'>请输入正确的密码</font></p>");
            return false;
        }
        return true;
    }

    function validRePassword() {
        $("#repasswordMsg").html("");
        var pwd = $("#password").val();
        var repwd = $("#repassword").val();
        if(pwd!=repwd){
            $("#repasswordMsg").html("<p align='center'><font color='#a52a2a'>两次密码不一致</font></p>");
            return false;
        }
        return true;
    }

    $("#add-btn").click(function () {
        if(!validRealName()) return false;
        if(!validUsername()||$(this).attr("ajax-va")=="error") return false;
        if(!validEmail()) return false;
        if(!validPassword()) return false;
        if(!validRePassword()) return false;
        $("#UserAdd-form").submit();
    })
</script>
</html>
			