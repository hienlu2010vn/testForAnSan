<%-- 
    Document   : homePage
    Created on : Jan 7, 2021, 9:58:32 PM
    Author     : hienl
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <body>
        <nav class="navbar navbar-default" role="navigation">
            <div class="container-fluid">
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="MainController?btnAction=HomePage">Home Page</a></li>
                        <li><a href="MainController?btnAction=Search">Search Item</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="MainController?btnAction=LoginPage" class="p-3 mb-2 bg-danger text-white">Login</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </body>
</html>
