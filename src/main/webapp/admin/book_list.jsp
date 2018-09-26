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
    <title>图书列表</title>
    <link rel="stylesheet" href="/admin/bootstrap-3.3.7/css/bootstrap.min.css">
    <script src="admin/js/jquery.js"></script>
    <style>
        .book_photo{
            width: 60px;
            height: 60px;
            cursor: pointer;
            transition: all 1.0s;
        }
        /** 图片动画显示和悬停放大**/
        .book_photo:hover{
            transform: scale(2.6);
        }
    </style>
</head>
<body>
<div class="panel panel-info">
    <div class="panel-heading">书籍列表</div>
    <div class="panel-body">
        <form  class="navbar-form navbar-left" id="page-form" action="/Manager/Books" method="post">
            <%--查询条件回显--%>
            <input type="hidden" id="select_newBook" value="${book.newBook}">
            <input type="hidden" id="select_saleBook" value="${book.saleBook}">
            <input type="hidden" id="select_superType" value="${book.superType}">
            <input type="hidden" id="select_subType" value="${book.subType}">
            <input type="hidden" id="pn" name="pn"/>
            <div class="form-group">
                <input type="text" name="name" value="${book.name}"  class="form-control" placeholder="请输入名称" />&nbsp;
                <select name="superType" id="bigCategory" onchange="QuerySmallCategory()" onclick="QueryBigCategory()" class="form-control">
                    <option value="">请选择大类</option>
                </select>&nbsp;&nbsp;&nbsp;
                <select name="subType" id="smallCategory" class="form-control">
                    <option value="">请选择小类</option>
                </select>&nbsp;&nbsp;&nbsp;
                <select name="newBook" id="newBook" class="form-control">
                    <option value="">是否新书</option>
                    <option value="true">是</option>
                    <option value="FALSE">否</option>
                </select>&nbsp;&nbsp;&nbsp;
                <select name="saleBook" id="saleBook"  class="form-control">
                    <option value="">是否热卖</option>
                    <option value="true">是</option>
                    <option value="false">否</option>
                </select>&nbsp;&nbsp;&nbsp;
                价格 <input type="number" value="${book.startPrice}" name="startPrice" class="form-control"/> -
                <input type="number" value="${book.endPrice}" name="endPrice" class="form-control"/>
                <button class="btn btn-success" type="submit" style="margin-left: 50px">查询</button>
            </div>
        </form>
    </div>
</div>

<table class="table table-bordered table-striped table-hover">
    <tr class="label-success">
        <th width="5%">序号</th>
        <th width="10%">图片</th>
        <th width="12%">书名</th>
        <th width="8%">大类</th>
        <th width="5%">小类</th>
        <th width="10%">ISBN</th>
        <th width="7%">价格</th>
        <th width="13%">出版社</th>
        <th width="10%">作者</th>
        <th width="10%">上架日期</th>
        <th width="10%">操作</th>
    </tr>
    <tbody>
    <c:forEach items="${pageInfo.list }" var="book" varStatus = "status">
        <tr>
            <td align="center">${status.count}</td>
            <td align="center">
                <c:if test="${book.photo==null}">
                    <%--使用了tomcat的虚拟路径--%>
                    <img src="/imgs/all.jpg" class="book_photo">
                </c:if>
                <c:if test="${book.photo!=null}">
                    <img src="/imgs/${book.photo}" class="book_photo">
                </c:if>    
            </td>
            <td align="center">${book.name}</td>
            <td align="center">${book.superType}</td>
            <td align="center">${book.subType}</td>
            <td align="center">${book.isbn}</td>
            <td align="center">${book.nowPrice}</td>
            <td align="center">${book.publisher}</td>
            <td align="center">${book.author }</td>
            <td align="center"><fmt:formatDate value="${book.addDate}"/></td>
            <td><a href="/Manager/BeforeUpdate?id=${book.id}" class="btn btn-primary btn-sm">修改</a>
                <a href="/Manager/BookDelete?id=${book.id}" class="btn btn-danger btn-sm">删除</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="row">
    <!--分页文字信息-->
    <div class="col-md-6" id="show_pageInfo">
        <p>
            当前第<Strong>${pageInfo.pageNum}</Strong>页&nbsp;
            总共<Strong>${pageInfo.pages}</Strong>页&nbsp;
            总共<Strong>${pageInfo.total}</Strong>条记录
        </p>
    </div>

    <!--分页条-->
    <div class="col-md-6" id="show_pageNav">
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <li>
                    <a href="javascript:page(1)" >首页</a>
                </li>
                <%--如果已经是首页了，则让其不可点击--%>
                <c:if test="${pageInfo.isFirstPage}">
                    <li class="disabled">
                       <a aria-label="Previous">
                           <span aria-hidden="true">&laquo;</span>
                       </a>
                    </li>
                </c:if>
                <%--有上一页查询上一页--%>
                <c:if test="${pageInfo.hasPreviousPage}">
                    <li>
                       <a href="javascript:page(${pageInfo.prePage})"  aria-label="Previous">
                           <span aria-hidden="true">&laquo;</span>
                       </a>
                    </li>
                </c:if>
                <%--分页条--%>
                <c:forEach items="${pageInfo.navigatepageNums}" var="ng">
                    <%--如果是当前页让其高亮--%>
                    <c:if test="${ng==pageInfo.pageNum}">
                            <li class="active"><a href="javascript:page(${ng})">${ng}</a></li>
                    </c:if>
                    <c:if test="${ng!=pageInfo.pageNum}">
                        <li ><a href="javascript:page(${ng})">${ng}</a></li>
                    </c:if>
                </c:forEach>

                <%--如果是最后一页，则让其不能点击--%>
                <c:if test="${pageInfo.isLastPage}">
                    <li class="disabled">
                        <a aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>
                <%--有下一页查询下一页--%>
                <c:if test="${pageInfo.hasNextPage}">
                    <li>
                        <a href="javascript:page(${pageInfo.nextPage})"  aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>

                <li>
                    <a href="javascript:page(${pageInfo.pages})">尾页</a>
                </li>
            </ul>
        </nav>
    </div>

</div>
</body>
<script src="/MyJs/common.js"></script>
<script>
    function page(pn) {
        $("#pn").val(pn);
        $("#page-form").submit();
    }
    $(function () {
        //查询条件回显
        var newBook = $("#select_newBook").val();
        var saleBook = $("#select_saleBook").val();
        var superType = $("#select_superType").val();
        var subType = $("#select_subType").val();
        $("#newBook option[value='"+newBook+"']").attr("selected","selected");
        $("#saleBook option[value='"+saleBook+"']").attr("selected","selected");
       /* $("#bigCategory option[value='"+superType+"']").attr("selected","selected");
        $("#smallCategpry option[value='"+subType+"']").attr("selected","selected");*/
    })
</script>
</html>
