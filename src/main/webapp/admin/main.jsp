<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<!DOCTYPE html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html lang="zh-cn">
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>后台管理中心</title>
    <link rel="stylesheet" href="admin/css/pintuer.css">
    <link rel="stylesheet" href="admin/css/admin.css">
    <script src="admin/js/jquery.js"></script>
</head>
<body style="background-color:#f2f9fd;">
<div class="header bg-main">
    <div class="logo margin-big-left fadein-top">
        <h1><img src="admin/images/y.jpg" class="radius-circle rotate-hover" height="50" alt=""/>后台管理中心</h1>
    </div>
    <div class="head-l"><a class="button button-little bg-green" href="index.jsp"><span class="icon-home"></span>
        前台首页</a>&nbsp;&nbsp;&nbsp;&nbsp;
        <a class="button button-little bg-red" href="/Manager/logout"><span class="icon-power-off"></span>
        退出登录</a>
    </div>
</div>
<div class="leftnav">
    <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
    <h2><span class="icon-user"></span>用户管理</h2>
    <ul style="display:block">
        <li><a href="/Manager/Users" target="right"><span class="icon-caret-right"></span>用户管理</a></li>
    </ul>
    <h2><span class="icon-user"></span>类别管理</h2>
    <ul style="display:block">
        <li><a href="/admin/category_list.jsp" target="right"><span class="icon-caret-right"></span>类别管理</a></li>
    </ul>
    <h2><span class="icon-user"></span>书籍管理</h2>
    <ul style="display:block">
        <li><a href="/Manager/Books" target="right"><span class="icon-caret-right"></span>图书列表</a></li>
        <li><a href="admin/book_add.jsp" target="right"><span class="icon-caret-right"></span>添加书籍</a></li>
        <li><a href="/Manager/BookManage" target="right"><span class="icon-caret-right"></span>推送管理</a></li>
    </ul>
    <h2><span class="icon-user"></span>订单管理</h2>
    <ul style="display:block">
        <li><a href="/Manager/Orders" target="right"><span class="icon-caret-right"></span>订单管理</a></li>
    </ul>


</div>
<script type="text/javascript">
    $(function () {
        $(".leftnav h2").click(function () {
            $(this).next().slideToggle(200);
            $(this).toggleClass("on");
        })
        $(".leftnav ul li a").click(function () {
            $("#a_leader_txt").text($(this).text());
            $(".leftnav ul li a").removeClass("on");
            $(this).addClass("on");
        })
    });
</script>

<div class="admin">
    <iframe scrolling="auto" rameborder="0" src="admin/info.jsp" name="right" width="100%" height="100%"></iframe>
</div>

</body>
</html>