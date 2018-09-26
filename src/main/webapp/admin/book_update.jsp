<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<!DOCTYPE html>
<html lang="en">
<head>
	<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>书籍修改</title>
    <link rel="stylesheet" href="admin/bootstrap-3.3.7/css/bootstrap.css">
    <script src="admin/js/jquery.js"></script>
</head>
<body>
<div class="panel panel-info">
    <div class="panel-heading">
        <h3 class="panel-title">修改</h3>
    </div>
    <div class="panel-body">
        <form class="form-horizontal" action="/Manager/BookUpdate" method="post" >
            <input type="hidden" name="id" value="${book.id}" />
            <div class="form-group">
                <label class="col-sm-2 control-label" for="book_name">书名</label>
                <div class="col-sm-4">
                    <input class="form-control" name="name" value="${book.name}" id="book_name" type="text" placeholder="请输入书籍名称"/>
                </div>
                <label class="col-sm-2 control-label" for="book_isbn">ISBN</label>
                <div class="col-sm-4">
                    <input class="form-control" name="isbn" value="${book.isbn}" id="book_isbn"  placeholder="请输入ISBN编号"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="bigCategory">大类</label>
                <div class="col-sm-4">
                    <select class="form-control" onclick="QueryBigCategory()" onchange="QuerySmallCategory()" name="superType" id="bigCategory">
                         <option value="${book.superType}">${book.superType}</option>
                    </select>
                </div>
                <label class="col-sm-2 control-label" for="smallCategory">小类</label>
                <div class="col-sm-4">
                    <select class="form-control" name="subType" id="smallCategory">
                        <option value="${book.subType}">${book.subType}</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="book_price">原价</label>
                <div class="col-sm-4">
                    <input class="form-control" name="price" value="${book.price}"  id="book_price" type="number" placeholder="请输入原价"/>
                </div>
                <label class="col-sm-2 control-label" for="book_nowPrice">现价</label>
                <div class="col-sm-4">
                    <input class="form-control" type="number" value="${book.nowPrice}" name="nowPrice" id="book_nowPrice"  placeholder="请输入现价"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="book_pages">页数</label>
                <div class="col-sm-4">
                    <input class="form-control" name="pages" value="${book.pages}" id="book_pages"  placeholder="请输入页数"/>
                </div>
                <label class="col-sm-2 control-label" for="book_publisher">出版社</label>
                <div class="col-sm-4">
                    <input class="form-control" name="publisher" value="${book.publisher}" id="book_publisher"  placeholder="请输入出版社"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="book_author">作者</label>
                <div class="col-sm-4">
                    <input class="form-control" name="author" value="${book.author}" id="book_author"  placeholder="请输入作者"/>
                </div>
                <label class="col-sm-2 control-label" for="book_addDate">上架日期</label>
                <div class="col-sm-4">
                    <input class="form-control" type="date" value="<fmt:formatDate value='${book.addDate}'/>" name="addDate" id="book_addDate" />
                </div>
            </div>
             <div class="form-group">
                <label class="col-sm-2 control-label" for="book_introduce">简介</label>
                <div class="col-sm-10">
                   <textarea name="introduce" id="book_introduce" value="${book.introduce}" rows="3" cols="150">${book.introduce}</textarea>
                </div>
            </div>
 			<div class="form-group" style="text-align: center">
            	<button  class="btn-info btn-lg">提交</button>        	
        	</div>
    </form>
    </div>
</div>
</body>
<script src="bootstrap-3.3.7/js/jquery-1.11.1.min.js"></script>
<script src="bootstrap-3.3.7/js/bootstrap.js"></script>
<script src="/MyJs/common.js"></script>
</html>