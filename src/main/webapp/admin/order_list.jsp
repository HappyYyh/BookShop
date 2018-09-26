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
    <style>
        .td{
            display:table-cell;
            vertical-align:middle;
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="panel panel-info">
    <div class="panel-heading">订单列表</div>
    <div class="panel-body">
        <form  class="navbar-form navbar-left" id="page-form" action="/Manager/Orders" method="post">
            <input type="hidden" id="pn" name="pn"/>
            <div class="form-group">
                <input type="text" value="${recName}" name="recName"  class="form-control" placeholder="请输入名称" />&nbsp;

                <button class="btn btn-success" type="submit" style="margin-left: 50px">查询</button>
            </div>
        </form>
    </div>
</div>

<table class="table table-bordered table-striped table-hover">
    <tr class="label-success" >
        <th>序号</th>
        <th>用户</th>
        <th>订单号</th>
        <th>地址</th>
        <th>电话</th>
        <th>订单状态</th>
        <th>发货日期</th>
        <th>下单日期</th>
        <th>操作</th>
    </tr>
    <c:forEach items="${orders.list}" var="order" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${order.recName}</td>
            <td>${order.orderId}</td>
            <td>${order.address}</td>
            <td>${order.phone}</td>
            <td>${order.status==1?'正常':'异常'}</td>
            <td>
                <c:if test="${order.shipDate==null}">
                    未发货
                </c:if>
                <c:if test="${order.shipDate!=null}">
                    <fmt:formatDate value="${order.shipDate}"/>
                </c:if>
            <td>
                <fmt:formatDate value="${order.orderDate}"/>
            </td>
            <td>
                <button class="btn btn-primary">详情</button>
                <button class="btn btn-danger">删除</button>
            </td>
        </tr>
    </c:forEach>

</table>
<div class="row">
    <!--分页文字信息-->
    <div class="col-md-6" id="show_pageInfo">
        <p>
            当前第<Strong>${orders.pageNum}</Strong>页&nbsp;
            总共<Strong>${orders.pages}</Strong>页&nbsp;
            总共<Strong>${orders.total}</Strong>条记录
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
                <c:if test="${orders.isFirstPage}">
                    <li class="disabled">
                       <a aria-label="Previous">
                           <span aria-hidden="true">&laquo;</span>
                       </a>
                    </li>
                </c:if>
                <%--有上一页查询上一页--%>
                <c:if test="${orders.hasPreviousPage}">
                    <li>
                       <a href="javascript:page(${orders.prePage})"  aria-label="Previous">
                           <span aria-hidden="true">&laquo;</span>
                       </a>
                    </li>
                </c:if>
                <%--分页条--%>
                <c:forEach items="${orders.navigatepageNums}" var="ng">
                    <%--如果是当前页让其高亮--%>
                    <c:if test="${ng==orders.pageNum}">
                            <li class="active"><a href="javascript:page(${ng})">${ng}</a></li>
                    </c:if>
                    <c:if test="${ng!=orders.pageNum}">
                        <li ><a href="javascript:page(${ng})">${ng}</a></li>
                    </c:if>
                </c:forEach>

                <%--如果是最后一页，则让其不能点击--%>
                <c:if test="${orders.isLastPage}">
                    <li class="disabled">
                        <a aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>
                <%--有下一页查询下一页--%>
                <c:if test="${orders.hasNextPage}">
                    <li>
                        <a href="javascript:page(${orders.nextPage})"  aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>

                <li>
                    <a href="javascript:page(${orders.pages})">尾页</a>
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
</script>
</html>
