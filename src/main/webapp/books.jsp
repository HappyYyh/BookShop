<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <title>图书库</title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="http://apps.bdimg.com/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <!-- Custom Theme files -->
    <!--theme-style-->
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <!--//theme-style-->

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
                <form action="/Book/Query" method="get" id="Book_query_form">
                    <input value="${condition}" name="condition" type="text" placeholder="搜索">
                    <input type="hidden" id="pn" name="pn">
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
                                    <li><a href="javascript:beforeUpdate()">个人资料</a></li>
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
                    <li><a class="color8" href="/Book/toIndex">首页</a></li>
                    <li class="active grid"><a class="color1" href="/Book/Query">书城</a></li>
                    <li><a class="color6" href="contact.html">联系我们</a></li>
                </ul>
            </div>

            <div class="clearfix"></div>
        </div>
    </div>

</div>


<!--content-->
<!---->
<div class="product">
    <div class="container">
        <div class="col-md-3 product-price">

            <div class=" rsidebar span_1_of_left">
                <div class="of-left">
                    <h3 class="cate">分类</h3>
                </div>
                <ul class="menu">
                    <li class="item1"><a href="#">文艺 </a>
                        <ul class="cute">
                            <li class="subitem1"><a href="detail.jsp">文学 </a></li>
                            <li class="subitem2"><a href="detail.jsp">传记 </a></li>
                            <li class="subitem3"><a href="detail.jsp">艺术 </a></li>
                        </ul>
                    </li>
                    <li class="item2"><a href="#">生活</a>
                        <ul class="cute">
                            <li class="subitem1"><a href="detail.jsp">亲子</a></li>
                            <li class="subitem2"><a href="detail.jsp">家教保健</a></li>
                            <li class="subitem3"><a href="detail.jsp">家居家庭</a></li>
                        </ul>
                    </li>
                    <li class="item4"><a href="#">人文社科</a>
                        <ul class="cute">
                            <li class="subitem1"><a href="detail.jsp">历史</a></li>
                            <li class="subitem2"><a href="detail.jsp">古籍</a></li>
                            <li class="subitem3"><a href="detail.jsp">文化</a></li>
                        </ul>
                    </li>


                </ul>
            </div>
            <!--initiate accordion-->
            <script type="text/javascript">
                $(function () {
                    var menu_ul = $('.menu > li > ul'),
                        menu_a = $('.menu > li > a');
                    menu_ul.hide();
                    menu_a.click(function (e) {
                        e.preventDefault();
                        if (!$(this).hasClass('active')) {
                            menu_a.removeClass('active');
                            menu_ul.filter(':visible').slideUp('normal');
                            $(this).addClass('active').next().stop(true, true).slideDown('normal');
                        } else {
                            $(this).removeClass('active');
                            $(this).next().stop(true, true).slideUp('normal');
                        }
                    });

                });
            </script>
            <!---->


            <!---->
            <div class="product-bottom">
                <div class="of-left-in">
                    <h3 class="best">热销品种</h3>
                </div>
                <div class="product-go">
                    <div class=" fashion-grid">
                        <a href="detail.jsp">
                            <img class="img-responsive " style="height:87px;" src="bookImages/11090598.PNG" alt=""></a>
                    </div>
                    <div class=" fashion-grid1">
                        <h6 class="best2"><a href="detail.jsp">200万粉丝大号“混子曰”创始人二混子的革命性历史作品。
                        </a></h6>
                        <span class=" price-in1">￥40.00</span>
                    </div>

                    <div class="clearfix"></div>
                </div>
                <div class="product-go">
                    <div class=" fashion-grid">
                        <a href="detail.jsp"><img class="img-responsive " src="bookImages/23248697-1_w_17.jpg"
                                                  alt=""></a>

                    </div>
                    <div class="fashion-grid1">
                        <h6 class="best2"><a
                                href="detail.jsp">斩获十二项国际大奖的畅销巨作！卫报年度Zui佳作品。我们身处不同世界，但成长、亲情与人性，却从来没有什么不同。 </a></h6>

                        <span class=" price-in1"> ￥20.00</span>
                    </div>

                    <div class="clearfix"></div>
                </div>

            </div>
            <div class=" per1">
                <a href="detail.jsp"><img class="img-responsive" style="height:278px;" src="bookImages/23822200-1_l.jpg"
                                          alt="">
                    <div class="six1">
                        <h4>折扣</h4>
                        <p>高达</p>
                        <span>30%</span>
                    </div>
                </a>
            </div>
        </div>
        <!--商品列表区-->
        <div class="col-md-9 product1">
            <!--第一行-->
            <c:forEach items="${books.list}" var="book" varStatus="status">
                <c:if test="${status.count%3==1}">
                    <div class=" bottom-product">
                </c:if>
                <form id="form_${status.count}" action="/Cart/Add" method="post">
                <div class="col-md-4 bottom-cd simpleCart_shelfItem">
                    <input type="hidden" name="bookId" value="${book.id}">
                    <input type="hidden" name="num" value="1">
                    <div class="product-at ">
                        <a href="/Book/detail?id=${book.id}"><img class="img-responsive" style="height:250px"
                                                  src="imgs/${book.photo}" alt="">
                            <div class="pro-grid">
                                <span class="buy-in">购买</span>
                            </div>
                        </a>
                    </div>
                    <p class="tun" style="height:64px;">
                        <c:if test="${fn:length(book.introduce)<30}">
                            ${book.introduce}
                        </c:if>
                        <c:if test="${fn:length(book.introduce)>=30}">
                            ${fn:substring(book.introduce,0,30)}...
                        </c:if>
                    </p>
                    <a href="javascript:BooktoCart(${status.count})"  class="item_add"><p class="number item_price"><i> </i>¥${book.nowPrice}</p></a>
                </div>
                </form>
                <c:if test="${status.count%3==0||status.last}">
                    <div class="clearfix"></div>
                    </div>
                </c:if>
            </c:forEach>


            <nav class="in">
                <ul class="pagination">
                    <%--如果已经是首页了，则让其不可点击--%>
                    <c:if test="${books.isFirstPage}">
                        <li class="disabled">
                            <a aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <%--有上一页查询上一页--%>
                    <c:if test="${books.hasPreviousPage}">
                        <li>
                            <a href="javascript:page(${books.prePage})"  aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <%--分页条--%>
                    <c:forEach items="${books.navigatepageNums}" var="ng">
                        <%--如果是当前页让其高亮--%>
                        <c:if test="${ng==books.pageNum}">
                            <li class="active"><a href="javascript:page(${ng})">${ng}
                                <span class="sr-only">(current)</span></a></li>
                        </c:if>
                        <c:if test="${ng!=books.pageNum}">
                            <li ><a href="javascript:page(${ng})">${ng}
                                <span class="sr-only"></span></a></li>
                        </c:if>
                    </c:forEach>

                    <%--如果是最后一页，则让其不能点击--%>
                    <c:if test="${books.isLastPage}">
                        <li class="disabled">
                            <a aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <%--有下一页查询下一页--%>
                    <c:if test="${books.hasNextPage}">
                        <li>
                            <a href="javascript:page(${books.nextPage})"  aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </div>

    </div>

    <!---->
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
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span>
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
                            <input type="text" class="form-control" maxlength="11" name="phone" id="phone"
                                   placeholder="请输入电话">
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
    function page(pn) {
        $("#pn").val(pn);
        $("#Book_query_form").submit();
    }
</script>
</html>
			