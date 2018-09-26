<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <title>天天商城</title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.js"></script>
    <!-- Custom Theme files -->
    <!--theme-style-->
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <!--//theme-style-->

    <!-- start menu -->
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
                    <c:if test="${null==username}">
                        <li><a href="login.jsp">登陆</a></li>
                        <li><a href="register.jsp">注册</a></li>
                    </c:if>
                    <c:if test="${username!=null}">
                        <li>
                            <div class="btn-group" role="group">
                                <a type="button" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
                                   aria-expanded="false">
                                        ${username}
                                    <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a  href="javascript:beforeUpdate()">个人资料</a></li>
                                    <li><a href="/Order/Query">订单查看</a></li>
                                </ul>
                            </div>

                        </li>
                        <li><a class="lock" href="/User/logout">注销</a></li>
                    </c:if>
                    <li><a class="lock" href="javascript:showModal()">后台管理</a></li>
                </ul>
                <div class="cart box_1">
                    <h3>
                        <div class="total">
                            <c:if test="${null!=price}">
                                <span id="simpleCart_total">￥<span><fmt:formatNumber value="${price.get(1)}" pattern="0.00"/></span></span>
                                (<span id="simpleCart_quantity"><fmt:formatNumber value="${price.get(3)}" pattern="0"/></span>件商品)
                            </c:if>
                        </div>
                        <a href="/Cart/List"><img src="images/cart.png" alt=""/></a>
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

<div class="banner">
    <div class="container">
        <script src="js/responsiveslides.min.js"></script>
        <script>
            $(function () {
                $("#slider").responsiveSlides({
                    auto: true,
                    nav: true,
                    speed: 500,
                    namespace: "callbacks",
                    pager: true,
                });
            });
        </script>
        <div id="top" class="callbacks_container">
            <ul class="rslides" id="slider">
                <li>

                    <div class="banner-text">
                        <h3>用阅读丈量世界</h3>
                        <p>春光无限好正是读书时...</p>
                        <a href="detail.jsp">更多</a>
                    </div>

                </li>
                <li>

                    <div class="banner-text">
                        <h3>满园春色关不住</h3>
                        <p>哈利波特大放送...</p>
                        <a href="detail.jsp">更多</a>

                    </div>

                </li>
                <li>
                    <div class="banner-text">
                        <h3>好书特价,知识无价</h3>
                        <p>精选图书,3折起...</p>
                        <a href="detail.jsp">更多</a>

                    </div>

                </li>
            </ul>
        </div>

    </div>
</div>

<!--content-->
<div class="content">
    <div class="container">
        <div class="content-top">
            <h1>热卖图书</h1>
            <c:forEach var="SaleBook" items="${SaleBook}" varStatus="step">
                <c:if test="${step.count%3==1}">
                   <div class="grid-in">
                </c:if>
                    <div class="col-md-4 grid-top">
                        <a href="/Book/detail?id=${SaleBook.id}" class="b-link-stripe b-animate-go  thickbox">
                            <img class="img-responsive" src="/imgs/${SaleBook.photo}" style="height:356px" alt="">
                            <div class="b-wrapper">
                                <h3 class="b-animate b-from-left b-delay03 ">
                                    <span>${SaleBook.name}</span>
                                </h3>
                            </div>
                        </a>
                        <p><a href="/Book/detail?id=${SaleBook.id}">￥${SaleBook.nowPrice}</a></p>
                    </div>
                <c:if test="${step.count%3==0||step.last}">
                    <div class="clearfix"></div>
                    </div>
                </c:if>
            </c:forEach>

        </div>
        <!----->

        <div class="content-top-bottom">
            <h2>推荐图书</h2>
            <c:forEach items="${RecommendBook}" var="recommend" varStatus="step">
                <c:if test="${step.count==1}">
                    <div class="col-md-6 men">
                        <a href="/Book/detail?id=${recommend.id}" class="b-link-stripe b-animate-go  thickbox">
                            <img class="img-responsive" src="/imgs/${recommend.photo}" style="height:477px" alt="">
                            <div class="b-wrapper">
                                <h3 class="b-animate b-from-top top-in   b-delay03 ">
                                    <span>${recommend.name}</span>
                                </h3>
                            </div>
                        </a>
                    </div>
                </c:if>
                 <c:if test="${step.count==2}">
                  <div class="col-md-6">
                     <div class="col-md1 ">
                         <a href="/Book/detail?id=${recommend.id}" class="b-link-stripe b-animate-go  thickbox">
                             <img class="img-responsive" src="/imgs/${recommend.photo}" style="height:226px" alt="">
                             <div class="b-wrapper">
                                 <h3 class="b-animate b-from-top top-in1   b-delay03 ">
                                     <span>${recommend.name}</span>
                                 </h3>
                             </div>
                         </a>
                     </div>
                 </c:if>
                 <c:if test="${step.count==3}">
                    <div class="col-md2">
                        <div class="col-md-6 men1">
                            <a href="/Book/detail?id=${recommend.id}" class="b-link-stripe b-animate-go  thickbox">
                                <img class="img-responsive" src="/imgs/${recommend.photo}" style="height:200px"
                                     alt="">
                                <div class="b-wrapper">
                                    <h3 class="b-animate b-from-top top-in2   b-delay03 ">
                                        <span>${recommend.name}</span>
                                    </h3>
                                </div>
                            </a>
                        </div>
                 </c:if>
                 <c:if test="${step.count==4}">
                         <div class="col-md-6 men2">
                             <a href="/Book/detail?id=${recommend.id}" class="b-link-stripe b-animate-go  thickbox">
                                <img class="img-responsive" src="/imgs/${recommend.photo}" style="height:200px"
                                      alt="">
                                <div class="b-wrapper">
                                     <h3 class="b-animate b-from-top top-in2   b-delay03 ">
                                        <span>${recommend.name}</span>
                                     </h3>
                                </div>
                             </a>
                         </div>
                    <div class="clearfix"></div>
                   </div>
                 </div>
                 <div class="clearfix"> </div>
                 </c:if>
            </c:forEach>
    </div>
</div>

<%--管理员登陆模态框--%>
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
                        <input type="text" class="form-control" name="username" id="manager_username"
                               placeholder="请输入用户名">
                    </div>
                    <div class="form-group">
                        <label for="manager_password">密码</label>
                        <input type="password" class="form-control" name="password" id="manager_password"
                               placeholder="请输入密码">
                    </div>
                    <p align="center"><span id="show" style="color: red"></span></p>
                    <button type="button" onclick="Manager_login()" class="btn btn-default">登录</button>
                </form>
            </div>
        </div>
    </div>
</div>


<%--个人信息修改模态框--%>
<div class="modal fade " id="User-Update-Modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">个人资料修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="upd-form" action="/User/update" method="post">
                    <input type="hidden" id="userID" name="id">

                    <label for="username" class="col-sm-2 control-label">用户名</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="username" disabled>
                    </div>

                    <label for="email" class="col-sm-2 control-label">邮箱</label>
                    <div class="col-sm-10">
                        <input type="email" class="form-control" name="email" id="email" placeholder="请输入邮箱">
                    </div>

                    <label for="realname" class="col-sm-2 control-label">姓名</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="realname" id="realname" placeholder="请输入姓名">
                    </div>

                    <label class="col-sm-2 control-label">性别</label>
                    <div class="col-sm-3 radio col-lg-offset-2">
                        <input type="radio" name="sex" value="0">男
                    </div>
                    <div class="col-sm-3 radio col-lg-offset-2">
                        <input type="radio" name="sex" value="1">女
                    </div>


                    <label for="birthday" class="col-sm-2 control-label">生日</label>
                    <div class="col-sm-10">
                        <input type="date" class="form-control" name="birthday" id="birthday" placeholder="请输入生日">
                    </div>

                    <label for="address" class="col-sm-2 control-label">地址</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="address" id="address" placeholder="请输入地址">
                    </div>

                    <label for="postcode" class="col-sm-2 control-label">邮编</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="postcode" id="postcode" placeholder="请输入邮编">
                    </div>

                    <label for="phone" class="col-sm-2 control-label">电话</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" maxlength="11" name="phone" id="phone" placeholder="请输入电话">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" id="upd-btn" class="btn btn-primary">修改</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

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
</body>
<script src="MyJs/common.js"></script>

</html>
			