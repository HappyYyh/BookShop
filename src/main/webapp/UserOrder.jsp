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
    <title>购物车</title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>

    <script src="http://apps.bdimg.com/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <!-- Custom Theme files -->
    <!--theme-style-->
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <!--//theme-style-->

    <link href='http://fonts.useso.com/css?family=Lato:100,300,400,700,900' rel='stylesheet' type='text/css'>
    <link href='http://fonts.useso.com/css?family=Roboto:400,100,300,500,700,900' rel='stylesheet' type='text/css'>
    <!--//fonts-->
    <!-- start menu -->
    <link href="css/memenu.css" rel="stylesheet" type="text/css" media="all"/>
    <script type="text/javascript" src="js/memenu.js"></script>
    <script>$(document).ready(function () {
        $(".memenu").memenu();
    });</script>
    <script src="js/simpleCart.min.js"></script>
    <script src="js/cart.js"></script>
    <style>
        .tdCen{


        }
    </style>
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
                    <li><a class="lock" href="javascript:showModal()">后台管理</a>
                </ul>
                <div class="cart box_1">
                    <h3>
                        <div class="total">
                           <c:if test="${null!=username}">
                            <span id="simpleCart_total">￥<span><fmt:formatNumber value="${price.get(1)}" pattern="0.00"/></span></span>
                            (<span id="simpleCart_quantity"><fmt:formatNumber value="${price.get(3)}" pattern="0"/></span>件商品)
                           </c:if>
                        </div>
                        <a href="cart.jsp">
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


<div class="container">
    <p>
        <h2 style="font-family: 华文楷体">我的订单:</h2>
    </p>
    <table class="table table-bordered table-striped table-hover" style="margin-top: 50px">
        <tr class="label-success" >
            <th>订单号</th>
            <th>书名</th>
            <th>图片</th>
            <th>数量</th>
            <th>价格</th>
            <th>姓名</th>
            <th>地址</th>
            <th>电话</th>
            <th>下单日期</th>
        </tr>
        <c:forEach items="${orders}" var="o" varStatus="status">
            <tr>
                <td colspan="8"><h4></h4></td>
            </tr>
            <c:forEach items="${o.orderDetails }" var="od" varStatus = "status">
                <tr>
                    <c:if test="${status.count==1}">
                        <td style="display:table-cell;vertical-align:middle;font-weight: bold;" align="center"
                            rowspan="${o.orderDetails.size()}">${o.orderId}</td>
                    </c:if>

                    <td align="center">${od.book.name}</td>
                    <td align="center"><img src="/imgs/${od.book.photo}" style="width: 50px;height: 50px"></td>
                    <td align="center">${od.num}</td>
                    <td align="center">${od.book.nowPrice}</td>
                    <c:if test="${status.count==1}">
                        <td style="display:table-cell;vertical-align:middle;font-weight: bold;" align="center"
                            rowspan="${o.orderDetails.size()}">${o.recName}</td>
                    </c:if>
                    <c:if test="${status.count==1}">
                        <td style="display:table-cell;vertical-align:middle;font-weight: bold;" align="center"
                            rowspan="${o.orderDetails.size()}">${o.address}</td>
                    </c:if>
                    <c:if test="${status.count==1}">
                        <td style="display:table-cell;vertical-align:middle;font-weight: bold;" align="center"
                            rowspan="${o.orderDetails.size()}">${o.phone}</td>
                    </c:if>
                    <c:if test="${status.count==1}">
                        <td style="display:table-cell;vertical-align:middle;font-weight: bold;" align="center"
                            rowspan="${o.orderDetails.size()}">
                                <fmt:formatDate value="${o.orderDate}"/></td>
                    </c:if>
                </tr>
            </c:forEach>

        </c:forEach>
    </table>

<%--    <div style="float: left;margin-top: 30px">
            <span>
                本次购物合计￥
                <strong style="font-size: 18px">
                <fmt:formatNumber value="${price.get(1)}" pattern="0.00"/></strong>元
            </span>
            <span>
                为您优惠了
                <strong style="font-size: 18px">
                <fmt:formatNumber value="${price.get(0)-price.get(1)}" pattern="0.00"/>
                </strong>元，打了
                <strong style="font-size: 18px">
                <fmt:formatNumber value="${price.get(2)*10}" pattern="0.00"/></strong>折
            </span>
    </div>
    <div style="float: right;margin-top: 60px">
        <form action="/Order/Add" method="post">
            <input name="orderId" type="hidden" value="${OrderInfo.orderId}">
            <input name="recName" type="hidden" value="${OrderInfo.forOrder.get(0).user.realname}">
            <input name="address" type="hidden" value="${OrderInfo.forOrder.get(0).user.address}">
            <input name="phone" type="hidden" value="${OrderInfo.forOrder.get(0).user.phone}">
            <button type="submit" class="btn-success btn-lg btn" style="width: 200px">下单</button>
        </form>
    </div>--%>
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
</body>
<script src="MyJs/common.js"></script>
</html>
			