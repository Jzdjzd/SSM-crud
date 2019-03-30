<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/7 0007
  Time: 15:03
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>客户管理-BootCRM</title>
<%   pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
<!-- 引入css样式文件 -->


<!--不以/开始的相对路径，找资源以当前路径的资源为基准，经常容易出问题
以/开始的相对路径，找资源，以服务器的路径为基准（http：//localhost：3306），需要加上项目名
 http://localhost：3306/crud-%>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<head>
    <title>顾客列表</title>
</head>
<body>
<%--显示页面--%>
<div class="container">
    <%--标题行--%>
    <div class="row">
        <div class="col-md-12">
            <h1>JZD客户管理</h1>
        </div>
    </div>
        <%--按钮--%>
    <div class="row">
        <div class="col-md-3 col-md-offset-9">
            <!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
            <button type="button" class="btn btn-primary">新建</button>
            <!-- Indicates a dangerous or potentially negative action -->
            <button type="button" class="btn btn-danger">删除</button>
        </div>
    </div>
        <%--表格--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover">
                <tr>
                    <th>ID</th>
                    <th>名字</th>
                    <th>信息来源</th>
                    <th>工作种类</th>
                    <th>客户级别</th>
                    <th>手机</th>
                    <th>电话</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${pageInfo.list}" var="customer">
                    <tr>
                        <%--区分男女--%>
                        <%--<th>${customer.sex=="m"?"男":"女"}</th>--%>
                        <th>${customer.custId}</th>
                        <th>${customer.custName}</th>
                        <th>${customer.custSource}</th>
                        <th>${customer.custIndustry}</th>
                        <th>${customer.custLevel}</th>
                        <th>${customer.custPhone}</th>
                        <th>${customer.custMobile}</th>
                        <th>
                            <button class="btn btn-info btn-sm" >
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                编辑
                            </button>
                            <button class="btn btn-warning btn-sm">
                                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                删除
                            </button>
                        </th>
                    </tr>
                </c:forEach>

            </table>
        </div>
    </div>
        <%--分页信息--%>
    <div class="row">
        <%--分页信息--%>
        <div class="col-md-6">
            当前${pageInfo.pageNum}页，总页数${pageInfo.pages},总记录数${pageInfo.total}
        </div>
        <%--分页--%>
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <%--分页显示逻辑判断 上一页 下一页 首页 尾页--%>
                        <li><a href="${APP_PATH}/customer?pn=1">首页</a></li>
                    <c:if test="${pageInfo.hasPreviousPage}">
                        <li>
                            <a href="${APP_PATH}/customer?pn=${page_Num-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>


                    <c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
                        <c:if test="${page_Num==pageInfo.pageNum}">
                        <li class="active"><a href="#">${page_Num}</a></li>
                        </c:if>
                        <c:if test="${page_Num!=pageInfo.pageNum}">
                            <li><a href="${APP_PATH}/customer?pn=${page_Num}">${page_Num}</a></li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${pageInfo.hasNextPage}">
                        <li>
                            <a href="${APP_PATH}/customer?pn=${page_Num+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                    </c:if>

                    </li>
                    <li><a href="${APP_PATH}/customer?pn=${pageInfo.pages}">尾页</a></li>
                </ul>
            </nav>
        </div>
    </div>



</div>


</body>
</html>
