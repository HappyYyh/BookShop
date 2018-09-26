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
    <link rel="stylesheet" href="admin/bootstrap-3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="admin/css/bootstrap-switch.css">
    <script src="admin/js/jquery.js"></script>
    <script src="admin/js/bootstrap-switch.js"></script>
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
    <div class="panel-heading">推送</div>
    <div class="panel-body">
        <form  class="navbar-form navbar-left" id="page-form" action="/Manager/BookManage" method="post">
            <%--查询条件回显--%>
            <input type="hidden" id="select_newBook" value="${book.newBook}">
            <input type="hidden" id="select_saleBook" value="${book.saleBook}">
            <input type="hidden" id="select_specialBook" value="${book.specialBook}">
            <input type="hidden" id="select_recommendBook" value="${book.recommendBook}">
            <input type="hidden" id="pn" name="pn"/>
            <div class="form-group">
                <input type="text" name="name" value="${book.name}"  class="form-control" placeholder="请输入名称" />&nbsp;
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
                <select name="specialBook" id="specialBook"  class="form-control">
                    <option value="">是否特价</option>
                    <option value="true">是</option>
                    <option value="false">否</option>
                </select>&nbsp;&nbsp;&nbsp;
                <select name="recommendBook" id="recommendBook"  class="form-control">
                    <option value="">是否推荐</option>
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
        <th width="5%">小类</th>
        <th width="10%">ISBN</th>
        <th width="7%">价格</th>
        <th width="10%">上架日期</th>
        <th width="5%">新书</th>
        <th width="5%">热卖</th>
        <th width="5%">特价</th>
        <th width="5%">推荐</th>
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

            <td align="center">${book.subType}</td>
            <td align="center">${book.isbn}</td>
            <td align="center">${book.nowPrice}</td>
            <td align="center"><fmt:formatDate value="${book.addDate}"/></td>
            <td align="center" style="display:table-cell;vertical-align:middle;font-weight: bold;" >
<%--
                <div class="switch" data-on="success" data-off="warning">
                    <input type="checkbox" class="newBook_checked" value="${book.newBook}" />
                </div>--%>
                <button class="btn btn-primary" onclick="BookManage(${status.count},1)">${book.newBook==true?'是':'否'}</button>
            </td>
            <td align="center" style="display:table-cell;vertical-align:middle;font-weight: bold;" >
                <button class="btn btn-primary" onclick="BookManage(${status.count},2)">${book.saleBook==true?'是':'否'}</button>
            </td>
            <td align="center" style="display:table-cell;vertical-align:middle;font-weight: bold;" >
                <button class="btn btn-primary" onclick="BookManage(${status.count},3)">${book.specialBook==true?'是':'否'}</button>
            </td>
            <td align="center" style="display:table-cell;vertical-align:middle;font-weight: bold;" >
                <button class="btn btn-primary" onclick="BookManage(${status.count},4)">${book.recommendBook==true?'是':'否'}</button>
            </td>

        </tr>
        <form id="updateByBtn_${status.count}" action="/Manager/UpdateByBtn" method="post">
            <input type="hidden" name="bookId" value="${book.id}">
            <input type="hidden" name="who" id="who_${status.count}" >
        </form>
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
<script>
    function page(pn) {
        $("#pn").val(pn);
        $("#page-form").submit();
    }
    $().ready(function () {
        //查询条件回显
        var newBook = $("#select_newBook").val();
        var saleBook = $("#select_saleBook").val();
        var specialBook = $("#select_specialBook").val();
        var recommendBook = $("#select_recommendBook").val();
        $("#newBook option[value='"+newBook+"']").attr("selected","selected");
        $("#saleBook option[value='"+saleBook+"']").attr("selected","selected");
        $("#specialBook option[value='"+specialBook+"']").attr("selected","selected");
        $("#recommendBook option[value='"+recommendBook+"']").attr("selected","selected");
        //$(".newBook_checked").bootstrapSwitch();
    });

    function BookManage(id,who) {
       /* $.getJSON("/Manager/UpdateByBtn",{bookId:bookid,who:who},function () {
            console.log(who);
            location.href = "/Manager/BookManage"
        })*/
       $("#who_"+id).val(who);
       $("#updateByBtn_"+id).submit();
    }
</script>
</html>
