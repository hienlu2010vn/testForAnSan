<%-- 
    Document   : userTakeTestPage
    Created on : Jan 27, 2021, 11:26:04 PM
    Author     : hienl
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Take Test</title>
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
                        <li><a href="HomeController">Home Page</a></li>
                        <li class="active"><a href="UserTakeTestPageController">Test</a></li>
                        <li><a href="TestReportController">Test Report</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="LogoutController" class="p-3 mb-2 bg-danger text-white">Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <c:set var="listCategory" value="${requestScope.LIST_CATEGORY}"></c:set>
        <c:if test="${listCategory != null || not empty listCategory}">
        <center>
            <form action="UserTakeTestController" method="POST">
                <select name="category3">
                    <c:forEach var="cate" items="${listCategory}">
                        <option value="${cate.subjectID}">${cate.subjectName}</option>
                    </c:forEach>
                </select>
                <input type="hidden" name="email" value="${user.email}">
                <input type="submit" value="LetGO">
            </form>
        </center>
    </c:if>
    <c:if test="${listCategory == null && empty listCategory}">
        <center>
            <div style="color: red">No Quiz Available</div>
        </center>
    </c:if>
</body>
</html>