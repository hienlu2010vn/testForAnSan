<%-- 
    Document   : testPage
    Created on : Jan 27, 2021, 11:37:07 PM
    Author     : hienl
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Test Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <style>
            .qPanel{    
                position: fixed;
                top: 150px;
                right: 39px;
                z-index: 98;
                padding: 21px;
                color: #fff;
                display: block;
                border-radius: 10px;
                width: 180px;

            } 
            .super{
                display: inline;
                list-style-type: none;
                width: 30px;
                margin: 10px;
            }
        </style>
    </head>
    <body>
        <script>
            function cal(timer) {
                var minutes = parseInt(timer / 60, 10);
                var seconds = parseInt(timer % 60, 10);

                minutes = minutes < 10 ? "0" + minutes : minutes;
                seconds = seconds < 10 ? "0" + seconds : seconds;

                document.querySelector('#timer').textContent = minutes + ":" + seconds;

            }

            function startTimer(duration) {
                var timer = duration;
                cal(timer);
                var intervalCount = setInterval(function () {
                    cal(timer);

                    if (--timer < 0) {
                        document.getElementById('end').submit();
                        clearInterval(intervalCount);
                    }

                }, 1000);
            }

            window.onload = function () {
                var endTime = ${sessionScope.QUIZ.endTime.time};
                var curTime = new Date().getTime();
                var diff = Math.round((endTime - curTime) / 1000);
                var fiveMinutes = diff;
                startTimer(fiveMinutes);
            }

        </script>
        <c:set var="user" value="${sessionScope.LOGIN_USER}"></c:set>
            <nav class="navbar navbar-default" role="navigation">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="#">${user.userName}</a>
                </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <form id="end" action="EndController">
                            <li><button class="p-3 mb-2 bg-danger text-white" onclick="return confirm('are you sure?')">End</button></li>
                        </form>
                    </ul>
                </div>
            </div>
        </nav>

        <h1>${sessionScope.QUIZ.subject}</h1>
        <div class="row text-center">
            <div>
                Time left: <span id="timer"></span>
            </div>
            <br>
        </div>
        <c:set var="totalPage" value="${sessionScope.TOTAL_PAGE}"></c:set>
        <c:set var="currPage" value="${requestScope.page}"></c:set>
            <div class="qPanel pagination">
            <c:forEach begin="1" end="${totalPage}" var="pageNum">
                <div class="page-item super <c:if test="${currPage == pageNum}">disabled</c:if>"><a class="page-link" href="ToTestController?page=${pageNum}">${pageNum}</a>
                    </div>
            </c:forEach>
        </div>
        <c:set var="student" value="${sessionScope.STUDENT.answer}"></c:set>
        <c:set var="quest" value="${sessionScope.QUIZ_DETAIL}"></c:set>
            <div class="media">
                <form id="Power" action="ToTestController" method="Post">
                    <center>
                        <div class="media-body">
                            <h4>${quest.questContent}</h4>
                        </br>
                        <div> <input type="radio" name="ans" value="ans1" onclick="document.getElementById('Power').submit();" <c:if test="${'ans1' == student.get(quest.questID)}">checked</c:if>>${quest.ans1}</div>
                        <div> <input type="radio" name="ans" value="ans2" onclick="document.getElementById('Power').submit();" <c:if test="${'ans2' == student.get(quest.questID)}">checked</c:if>>${quest.ans2}</div>
                        <div> <input type="radio" name="ans" value="ans3" onclick="document.getElementById('Power').submit();" <c:if test="${'ans3' == student.get(quest.questID)}">checked</c:if>>${quest.ans3}</div>
                        <div> <input type="radio" name="ans" value="ans4" onclick="document.getElementById('Power').submit();" <c:if test="${'ans4' == student.get(quest.questID)}">checked</c:if>>${quest.ans4}</div>
                        </div>
                        <input type="hidden" name="questID" value="${quest.questID}">
                    <input type="hidden" name="page" value="${currPage}">
                </center>
            </form>
        </div>
    <center>
        <c:if test="${totalPage > 1}">
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <c:if test="${currPage > 1}">
                        <li class="page-item"><a class="page-link" href="ToTestController?page=${currPage - 1}">Previous</a>
                        </li>
                    </c:if>

                    <c:if test="${currPage < totalPage}">
                        <li class="page-item"><a class="page-link" href="ToTestController?page=${currPage + 1}">Next</a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </c:if>
    </body>
</html>
