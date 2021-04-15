<%-- 
    Document   : userCreatePage
    Created on : Jan 24, 2021, 2:49:28 PM
    Author     : hienl
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Create Page</title>
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    </head>
    <body>
        <c:set var="error" value="${requestScope.ERROR}"></c:set>
        <center><div class="container" id="wrap">
                <br>
                <br>
                <br>
                <br>
                <div class="row">
                    <div class="col-md-6 col-md-offset-3">
                        <form form action="CreateUserController" method="POST">
                            <div class="row">
                                <div class="col-xs-12 col-md-12">
                                    <input type="text" name="email" class="form-control input-lg" placeholder="Email" value="${param.email}"/><div style="color: red">${error.line1}</div></div>
                            <div class="col-xs-12 col-md-12">
                                <input type="text" name="userName" class="form-control input-lg" placeholder="User Name" value="${param.userName}"/><div style="color: red">${error.line2}</div></div>
                            <div class="col-xs-12 col-md-12">
                                <input type="password" name="userPass" class="form-control input-lg" placeholder="Password" value="${param.userPass}"/><div style="color: red">${error.line3}</div></div>
                            <div class="col-xs-12 col-md-12">
                                <input type="password" name="rePass" class="form-control input-lg" placeholder="re-Password" value="${param.rePass}"/><div style="color: red">${error.line4}</div></div>
                        </div>
                        <button class="btn btn-primary stretched-link" type="submit">Create User</button>
                    </form>       
                    <div style="color: red">${error.line5}</div>
                </div>
            </div>            
        </div>
        <div><a href="LoginPageController" class="btn btn-primary stretched-link">login</a></div></center>
</body>
</html>
