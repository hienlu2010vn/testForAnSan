<%-- 
    Document   : AdminSubjectManege
    Created on : Feb 1, 2021, 9:25:41 PM
    Author     : hienl
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Subject Page</title>
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
                        <li><a href="AdminCreatePageController">Create Question</a></li>
                        <li class="active"><a href="SubjectController">Subject Manage</a></li>
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
                            <c:set var="listCategory" value="${requestScope.LIST_CATEGORY}"></c:set>
                            <c:forEach var="cate" items="${listCategory}">
                                <form action="MultiSubjectController" method="Post">
                                    <div>${cate.subjectID}</div>
                                    <input type="hidden" name="subjectID" value="${cate.subjectID}">
                                    <div><input type="text" placeholder="subjectName" name="subjectName" value="${cate.subjectName}"></div>
                                    <div><input type="text" placeholder="totalQuest" name="totalQuest" value="${cate.totalQuest}"></div>
                                    <div><input type="text" placeholder="time" name="time" value="${cate.time}"></div>
                                    <button class="btn btn-lg btn btn-primary" type="submit" name="btnAction" value="Update">Update</button>
                                    <c:if test="${cate.status}"><button class="btn btn-lg btn-danger" type="submit" name="btnAction" value="Delete" onclick="return confirm('are you sure?')">Delete</button></c:if>
                                    <c:if test="${!cate.status}"><button class="btn btn-lg btn-success" type="submit" name="btnAction" value="Delete">Restore</button></c:if>
                                    </form>
                                    </br>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>                  
        </div>
    </body>
</html>