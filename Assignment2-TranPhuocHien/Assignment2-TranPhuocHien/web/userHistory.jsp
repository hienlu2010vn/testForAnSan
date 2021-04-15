<%-- 
    Document   : userHistory
    Created on : Jan 28, 2021, 10:37:50 PM
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
        <c:set var="currPage" value="${requestScope.PAGE_NUM}"></c:set>
        <c:set var="list" value="${requestScope.LIST}"></c:set>
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <h1 class="my-4">QUIZ</h1>
                        <div class="container">
                        <c:set var="error" value="${requestScope.ERROR}"></c:set>
                        <c:if test="${error != null}">
                            <center style="color: red">
                                ${error.line3}</br>
                            </center>
                        </c:if>
                        <form action="TestReportController"> 
                            <div class="col">
                                <c:set var="listCategory" value="${requestScope.LIST_CATEGORY}"></c:set>
                                    <select name="category">
                                        <option value=""></option>
                                    <c:forEach var="cate" items="${listCategory}">
                                        <option <c:if test="${cate.subjectID == param.category}">selected</c:if> value="${cate.subjectID}">${cate.subjectName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col">
                                <select name="searchStatus">
                                    <option <c:if test="${param.searchStatus == ''}">selected</c:if> value=""></option>
                                    <option <c:if test="${param.searchStatus == 'pass'}">selected</c:if> value="pass">Pass</option>
                                    <option <c:if test="${param.searchStatus == 'fail'}">selected</c:if> value="fail">Fail</option>
                                    </select>
                                </div>
                                <button class="btn btn-lg btn-success" type="submit">Search</button>
                            </form>                      
                        </div>     
                    <c:forEach var="test" items="${list}">
                        <div class="media">
                            <p class="pull-right"><small>${test.createDate}</small></p>
                            <div class="media-body">
                                <h4 class="media-heading user_name">${test.subject}</h4>
                                <div>Total: ${test.totalCorrect}/${test.totalQuest}</div>
                                <div>
                                    Status: <c:if test="${test.totalCorrect >= test.totalQuest/2}">PASS</c:if><c:if test="${test.totalCorrect < test.totalQuest/2}">FAIL</c:if>
                                    </div>
                                    <div>
                                            <a href="HistoryDetailController?testID=${test.testID}">Detail</a>
                                </div>
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
                    <li class="page-item <c:if test="${currPage == pageNum}">disabled</c:if>"><a class="page-link" href="TestReportController?pageNum=${pageNum}&searchStatus=${param.searchStatus}&category=${param.category}">${pageNum}</a>
                        </li>
                </c:forEach>
            </ul>
        </nav>
    </c:if>
</center>
</body>
</html>