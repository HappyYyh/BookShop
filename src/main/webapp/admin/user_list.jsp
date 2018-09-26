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
    <div class="panel-heading">用户列表</div>
    <div class="panel-body">
        <form  class="navbar-form navbar-left" id="page-form" action="/Manager/Users" method="post">
            <input type="hidden" id="pn" name="pn"/>
            <div class="form-group">
                <input type="text" value="${user.username}" name="username"  class="form-control" placeholder="请输入名称" />&nbsp;
                <select name="status" class="form-control">
                    <c:if test="${user.status==1}">
                        <option value="">请选择状态</option>
                        <option value="1" selected>正常</option>
                        <option value="2">锁定</option>
                    </c:if>
                    <c:if test="${user.status==2}">
                        <option value="">请选择状态</option>
                        <option value="1">正常</option>
                        <option value="2" selected>锁定</option>
                    </c:if>
                    <c:if test="${user.status==null}">
                        <option value="" selected>请选择状态</option>
                        <option value="1">正常</option>
                        <option value="2" >锁定</option>
                    </c:if>
                </select>&nbsp;&nbsp;&nbsp;
                注册日期 <input type="date" value="<fmt:formatDate value='${user.startDate}'/>" name="startDate" class="form-control"/> -
                <input type="date" name="endDate" value="<fmt:formatDate value="${user.endDate}"/>" class="form-control"/>
                <button class="btn btn-success" type="submit" style="margin-left: 50px">查询</button>
            </div>
        </form>
    </div>
</div>

<table class="table table-bordered table-striped table-hover">
    <tr class="label-success" >
        <th>序号</th>
        <th>用户名</th>
        <th>邮箱</th>
        <th>姓名</th>
        <th>性别</th>
        <th>地址</th>
        <th>状态</th>
        <th>电话</th>
        <th>注册日期</th>
        <th>操作</th>
    </tr>
    <c:forEach items="${pageInfo.list }" var="user" varStatus = "status">
        <tr>
            <td>${status.count}</td>
            <td>${user.username }</td>
            <td>${user.email }</td>
            <td>${user.realname }</td>
            <td>
               <c:if test="${user.sex==0}">
                   男
               </c:if>
                <c:if test="${user.sex==1}">
                   女
                </c:if>
            </td>
            <td>${user.address }</td>
            <td>${user.status==1?'正常':'冻结'}</td>
            <td>${user.phone }</td>
            <td><fmt:formatDate value="${user.addDate}"/></td>
            <td><a href="/Manager/UserLock?id=${user.id}" class="btn btn-primary btn-sm">${user.status==1?'冻结':'解锁'}</a>
                <a href="/Manager/UserDel?id=${user.id}" class="btn btn-danger btn-sm">删除</a></td>
        </tr>
    </c:forEach>
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
</script>
</html>
