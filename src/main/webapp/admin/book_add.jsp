<%@ page language="java" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<!DOCTYPE html>
<html lang="en">
<head>
	<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>书籍添加</title>
    <link rel="stylesheet" href="admin/bootstrap-3.3.7/css/bootstrap.css">
    <script src="admin/js/jquery.js"></script>
    <script src="bootstrap-3.3.7/js/bootstrap.js"></script>
</head>
<body>
<div class="panel panel-info">
    <div class="panel-heading">
        <h3 class="panel-title">新增</h3>
    </div>
    <div class="panel-body">
        <form class="form-horizontal" action="/Manager/BookAdd" method="post" enctype="multipart/form-data">

            <div class="form-group">
                <label class="col-sm-2 control-label" for="book_name">书名</label>
                <div class="col-sm-4">
                    <input class="form-control" name="name" id="book_name" type="text" placeholder="请输入书籍名称"/>
                </div>
                <label class="col-sm-2 control-label" for="book_isbn">ISBN</label>
                <div class="col-sm-4">
                    <input class="form-control" name="isbn" id="book_isbn"  placeholder="请输入ISBN编号"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="bigCategory">大类</label>
                <div class="col-sm-4">
                    <select class="form-control" name="superType" onclick="QueryBigCategory()" onchange="QuerySmallCategory()" id="bigCategory">
                         <option value="">请选择大类</option>
                    </select>
                </div>
                <label class="col-sm-2 control-label" for="smallCategory">小类</label>
                <div class="col-sm-4">
                    <select class="form-control" name="subType" id="smallCategory">
                        <option value="">请选择小类</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="book_price">原价</label>
                <div class="col-sm-4">
                    <input class="form-control" name="price" id="book_price" type="number" placeholder="请输入原价"/>
                </div>
                <label class="col-sm-2 control-label" for="book_nowPrice">现价</label>
                <div class="col-sm-4">
                    <input class="form-control" type="number" name="nowPrice" id="book_nowPrice"  placeholder="请输入现价"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="book_pages">页数</label>
                <div class="col-sm-4">
                    <input class="form-control" name="pages" id="book_pages"  placeholder="请输入页数"/>
                </div>
                <label class="col-sm-2 control-label" for="book_publisher">出版社</label>
                <div class="col-sm-4">
                    <input class="form-control" name="publisher" id="book_publisher"  placeholder="请输入出版社"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="book_author">作者</label>
                <div class="col-sm-4">
                    <input class="form-control" name="author" id="book_author"  placeholder="请输入作者"/>
                </div>
                <label class="col-sm-2 control-label" for="book_addDate">上架日期</label>
                <div class="col-sm-4">
                    <input class="form-control" type="date" name="addDate" id="book_addDate" />
                </div>
            </div>
             <div class="form-group">
                <label class="col-sm-2 control-label" for="book_introduce">简介</label>
                <div class="col-sm-10">
                   <textarea name="introduce" id="book_introduce" rows="3" cols="150"></textarea>
                </div>
            </div>
             <div class="form-group">
                <label class="col-sm-2 control-label" for="file">照片</label>
                <div class="col-sm-10">
                   <input type="file" id="file" name="File">
                </div>
            </div>
 			<div class="form-group" style="text-align: center">
            	<button  class="btn-info btn-lg">提交</button>        	
        	</div>
    </form>
    </div>
</div>
</body>
<script src="/MyJs/common.js"></script>
</html>