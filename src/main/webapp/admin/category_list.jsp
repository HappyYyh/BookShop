<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>Title</title>
    <link rel="stylesheet" href="/admin/bootstrap-3.3.7/css/bootstrap.min.css">
    <script src="admin/js/jquery.js"></script>
</head>
<body>
<div class="panel panel-info">
    <div class="panel-heading">类别管理</div>
    <div class="panel-body">
        <form  class="navbar-form navbar-left" id="page-form"  method="post">
            <div class="form-group">
                <label for="bigCategory">大类</label>
                <select class="form-control" id="bigCategory" onclick="QueryBigCategory()" onchange="QuerySmallCategory()">
                    <option value="">请选择大类</option>
                </select>
            </div>
            <div class="form-group">
                <label for="smallCategory">小类</label>
                <select class="form-control" id="smallCategory">
                    <option value="">请选择小类</option>
                </select>
            </div>
            <div class="form-group">
                <button class="btn btn-success" type="submit" style="margin-left: 50px">查询</button>
            </div>
        </form>
    </div>
</div>

<table class="table table-bordered table-striped table-hover">

</table>
</body>
<script src="/MyJs/common.js"></script>
</html>
