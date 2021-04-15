<%-- 
    Document   : AdminCreatePage
    Created on : Jan 27, 2021, 9:20:17 PM
    Author     : hienl
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Create Page</title>
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
                        <li><a href="AdminSearchController">Question Bank</a></li>
                        <li class="active"><a href="AdminCreatePageController">Create Question</a></li>
                        <li><a href="SubjectController">Subject Manage</a></li>
                        <li><a href="SubjectCreatePageController">Subject Create</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="LogoutController" class="p-3 mb-2 bg-danger text-white">Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <h1 class="my-4">Quiz</h1>
                    <div class="container">
                        <c:set var="error" value="${requestScope.ERROR}"></c:set>
                        <c:if test="${error != null}">
                            <center style="color: red">
                                ${error.line1}</br>
                                ${error.line2}</br>
                                ${error.line3}</br>
                            </center>
                        </c:if>
                        <div class="media">
                            <form action="AdminCreateController" method="Post">
                                <p class="pull-right"><small></small></p>
                                <div class="media-body">
                                    <h4 class="media-heading user_name"></h4>
                                    <h5 class="media-heading user_name">
                                        <c:set var="listCategory" value="${requestScope.LIST_CATEGORY}"></c:set>
                                            <select name="category3">
                                            <c:forEach var="cate" items="${listCategory}">
                                                <option <c:if test="${cate.subjectID == param.category3}">selected</c:if> value="${cate.subjectID}">${cate.subjectName}</option>
                                            </c:forEach>
                                        </select>
                                    </h5>
                                    <h4><input type="text" name="questContent" value="${param.questContent}"></h4>
                                    </br>
                                    <div> <input type="radio" name="check2" value="ans1" 
                                                 <c:if test="${'ans1' == param.check2}">checked</c:if>> 
                                        <input type="text" name="ans1" value="${param.ans1}">
                                    </div>
                                    <div> <input type="radio" name="check2" value="ans2" 
                                                 <c:if test="${'ans2' == param.check2}">checked</c:if>>
                                        <input type="text" name="ans2" value="${param.ans2}">
                                    </div>
                                    <div> <input type="radio" name="check2" value="ans3" 
                                                 <c:if test="${'ans3' == param.check2}">checked</c:if>> 
                                        <input type="text" name="ans3" value="${param.ans3}">
                                    </div>
                                    <div> <input type="radio" name="check2" value="ans4" 
                                                 <c:if test="${'ans4' == param.check2}">checked</c:if>> 
                                        <input type="text" name="ans4" value="${param.ans4}">
                                    </div>
                                </div>
                                <input type="hidden" name="email" value="${user.email}">
                                <button class="btn btn-lg btn btn-primary" type="submit">Create</button>
                            </form>
                        </div>
                    </div>
                </div>                  
            </div>
        </div>
    </body>
</html>