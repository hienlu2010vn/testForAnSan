<%-- 
    Document   : historyAdmin
    Created on : Jan 18, 2021, 3:11:21 PM
    Author     : hienl
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update History</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    </head>
    <body>

        <c:set var="user" value="${sessionScope.LOGIN_USER}"></c:set>
            <nav class="navbar navbar-default" role="navigation">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="#">${user.userName}</a>
                </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li><a href="MainController?btnAction=HomePage">Admin Home Page</a></li>
                        <li><a href="MainController?btnAction=Search">Search Item</a></li>
                        <li><a href="MainController?btnAction=CreateItemPage">Create Item</a></li>
                        <!--<li class="active"><a href="MainController?btnAction=HistoryUpdate">History Update</a></li>-->
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="MainController?btnAction=Logout" class="p-3 mb-2 bg-danger text-white">Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <c:set var="currPage" value="${requestScope.PAGE_NUM}"></c:set>
        <c:set var="list" value="${requestScope.LIST}"></c:set>
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <h1 class="my-4">Hana Shop</h1>
                        <div class="container">
                            <form action="MainController"> 
                                <input type="hidden" placeholder="Name" name="name" value="${param.name}">
                            <div class="col">
                                <input type="date" placeholder="Date" name="searchDate" value="${param.searchDate}">
                            </div>
                            <button class="btn btn-lg btn-success" type="submit" name="btnAction" value="HistoryUpdate">Search</button>
                        </form>
                        <c:forEach var="item" items="${list}">
                            <div class="media">
                                <p class="pull-right"><small>${item.updateDate}</small></p>
                                <div class="media-body">
                                    <h4 class="media-heading user_name">${item.userID}</h4>
                                    ${item.updateContent}
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>                  
            </div>
        </div>
        <c:set var="totalPage" value="${requestScope.TOTAL_PAGE}"></c:set>
        <center>
        <c:if test="${totalPage > 1}">
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <c:forEach begin="1" end="${totalPage}" var="pageNum">
                        <li class="page-item <c:if test="${currPage == pageNum}">disabled</c:if>"><a class="page-link" href="MainController?btnAction=HistoryUpdate&pageNum=${pageNum}&name=${param.name}&searchDate=${param.searchDate}">${pageNum}</a>
                            </li>
                    </c:forEach>
                </ul>
            </nav>
        </c:if>
    </center>
    <c:set var="error" value="${requestScope.ERROR}"></c:set>
    <c:if test="${error != null}">
        <center style="color: red">
            ${error.line1}</br>
            ${error.line2}</br>
            ${error.line3}</br>
        </center>
    </c:if>


</body>
</html>