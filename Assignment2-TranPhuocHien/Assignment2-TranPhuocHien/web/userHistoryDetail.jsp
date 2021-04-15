<%-- 
    Document   : userHistoryDetail
    Created on : Jan 30, 2021, 3:59:16 PM
    Author     : hienl
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>History</title>
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
                        <li><a href="UserTakeTestPageController">Test</a></li>
                        <li class="active"><a href="TestReportController">Test Report</a></li>
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
                    <h1 class="my-4">QUIZ</h1>
                    <div class="container">

                        <c:forEach var="quest" items="${requestScope.LIST}">
                            <div class="media">
                                <div class="media-body">
                                    <h4 class="media-heading user_name">${quest.questID}</h4>
                                    <h4>${quest.questContent}</h4>
                                    </br>
                                    <div <c:if test="${'ans1' == quest.correctAns}"> style="color: red" </c:if>> <input disabled="true" type="radio" <c:if test="${'ans1' == quest.subject}">checked</c:if>>${quest.ans1}</div>
                                    <div <c:if test="${'ans2' == quest.correctAns}"> style="color: red" </c:if>> <input disabled="true" type="radio" <c:if test="${'ans2' == quest.subject}">checked</c:if>>${quest.ans2}</div>
                                    <div <c:if test="${'ans3' == quest.correctAns}"> style="color: red" </c:if>> <input disabled="true" type="radio" <c:if test="${'ans3' == quest.subject}">checked</c:if>>${quest.ans3}</div>
                                    <div <c:if test="${'ans4' == quest.correctAns}"> style="color: red" </c:if>> <input disabled="true" type="radio" <c:if test="${'ans4' == quest.subject}">checked</c:if>>${quest.ans4}</div>
                                    </div>
                                </div>
                        </c:forEach>
                    </div>     
                </div>
            </div>                  
        </div>
    </body>
</html>