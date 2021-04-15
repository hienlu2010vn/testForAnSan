<%-- 
    Document   : manage
    Created on : Jan 5, 2021, 2:13:42 PM
    Author     : hienl
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Page</title>
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
                        <li class="active"><a href="MainController?btnAction=HomePage">Admin Home Page</a></li>
                        <li><a href="MainController?btnAction=Search">Search Item</a></li>
                        <li><a href="MainController?btnAction=CreateItemPage">Create Item</a></li>
                        <!--<li><a href="MainController?btnAction=HistoryUpdate">History Update</a></li>-->
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="MainController?btnAction=Logout" class="p-3 mb-2 bg-danger text-white">Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </body>
</html>
