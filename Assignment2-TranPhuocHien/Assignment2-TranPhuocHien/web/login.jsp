<%-- 
    Document   : login
    Created on : Jan 5, 2021, 1:54:31 PM
    Author     : hienl
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="https://www.google.com/recaptcha/api.js"></script>
    </head>
    <body>
        <c:set var="error" value="${requestScope.ERROR}"></c:set>
            <div class="container">
                <br>
                <br>
                <br>
                <br>
                <div class="row">
                    <div class="col-md-4 col-md-offset-4">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Login</h3>
                            </div>
                            <div class="panel-body">
                                <form action="LoginController" method="POST">
                                    <fieldset>
                                        <div class="form-group">
                                            <input class="form-control" type="text" name="email" placeholder="Email">
                                        </div>
                                        <div class="form-group">
                                            <input class="form-control" type="password" name="userPass" placeholder="Password">
                                        </div>
                                        <button class="btn btn-lg btn-success btn-block" type="submit">Login</button>
                                    </fieldset>
                                </form>
                                <hr/>
                                <center><h4>OR</h4></center>
                                <div class="row justify-content-center">
                                    <div class="col-md-12">
                                        <center><a href="CreateUserPageController" class="btn btn-primary stretched-link">Create User</a></center>
                                    </div>
                                </div>
                            </div>
                            <div style="color: red">
                            ${error.line1}
                            ${error.line5}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>

</html>

