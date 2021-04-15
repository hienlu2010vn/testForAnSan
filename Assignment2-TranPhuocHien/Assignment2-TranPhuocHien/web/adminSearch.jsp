<%-- 
    Document   : adminSearch
    Created on : Jan 25, 2021, 11:21:08 PM
    Author     : hienl
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Search Page</title>
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
                        <li class="active"><a href="AdminSearchController">Question Bank</a></li>
                        <li><a href="AdminCreatePageController">Create Question</a></li>
                        <li><a href="SubjectController">Subject Manage</a></li>
                        <li><a href="SubjectCreatePageController">Subject Create</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="LogoutController" class="p-3 mb-2 bg-danger text-white">Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <c:set var="currPage" value="${requestScope.PAGE_NUM}"></c:set>
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <h1 class="my-4">Quiz</h1>
                        <div class="container">
                        <c:set var="error" value="${requestScope.ERROR}"></c:set>
                        <c:if test="${error != null}">
                            <center style="color: red">
                                ${error.line3}</br>
                            </center>
                        </c:if>
                        <c:set var="error2" value="${requestScope.ERROR2}"></c:set>
                        <c:if test="${error2 != null}">
                            <center style="color: red">
                                ${error2.line1}</br>
                                ${error2.line2}</br>
                                ${error2.line3}</br>
                            </center>
                        </c:if>
                        <c:set var="error3" value="${requestScope.ERROR3}"></c:set>
                        <c:if test="${error3 != null}">
                            <center style="color: red">
                                ${error3.line1}</br>
                            </center>
                        </c:if>
                        <form action="AdminSearchController"> 
                            <div class="col">
                                <input type="text" placeholder="Content" name="name" value="${param.name}">
                            </div>
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
                                <select name="check">
                                    <option <c:if test="${param.check == 'True'}">selected</c:if> value="True">True</option>
                                    <option <c:if test="${param.check == 'False'}">selected</c:if> value="False">False</option>
                                    </select>
                                </div>

                                <div class="col">
                                    <select name="gogo">
                                        <option <c:if test="${param.gogo == 'go1'}">selected</c:if> value="go1">Search by content</option>
                                    <option <c:if test="${param.gogo == 'go2'}">selected</c:if> value="go2">Search by status</option>
                                    <option <c:if test="${param.gogo == 'go3'}">selected</c:if> value="go3">Search by subject</option>
                                    </select>
                                </div>
                                <button class="btn btn-lg btn-success" type="submit">Search</button>
                            </form>
                        </div>     
                    <c:forEach var="wawa" items="${requestScope.WAWAWA}">
                        <h2 style="color: red"> ${wawa.key} </h2>
                        <c:forEach var="quest" items="${requestScope.LIST}">
                            <c:if test="${wawa.key == quest.subject}">
                                <div class="media">
                                    <form action="MultiTaskController" method="Post">
                                        <p class="pull-right"><small>${quest.createDate}</small></p>
                                        <div class="media-body">
                                            <h4 class="media-heading user_name">${quest.email}</h4>
                                            <h5 class="media-heading user_name">
                                                <select name="category2">
                                                    <c:forEach var="cate2" items="${listCategory}">
                                                        <option <c:if test="${cate2.subjectID == quest.subject}">selected</c:if> value="${cate2.subjectID}">${cate2.subjectName}</option>
                                                    </c:forEach>
                                                </select>
                                            </h5>
                                            <h4><input type="text" name="questContent" value="${quest.questContent}"></h4>
                                            </br>
                                            <div> <input type="radio" name="check1" value="ans1" <c:if test="${'ans1' == quest.correctAns}">checked</c:if>> <input type="text" name="ans1" value="${quest.ans1}"></div>
                                            <div> <input type="radio" name="check1" value="ans2" <c:if test="${'ans2' == quest.correctAns}">checked</c:if>> <input type="text" name="ans2" value="${quest.ans2}"></div>
                                            <div> <input type="radio" name="check1" value="ans3" <c:if test="${'ans3' == quest.correctAns}">checked</c:if>> <input type="text" name="ans3" value="${quest.ans3}"></div>
                                            <div> <input type="radio" name="check1" value="ans4" <c:if test="${'ans4' == quest.correctAns}">checked</c:if>> <input type="text" name="ans4" value="${quest.ans4}"></div>
                                            </div>
                                            <input type="hidden" name="questID" value="${quest.questID}">
                                        <input type="hidden" name="name" value="${param.name}">
                                        <input type="hidden" name="category" value="${param.category}">
                                        <input type="hidden" name="check" value="${param.check}">
                                        <input type="hidden" name="gogo" value="${param.gogo}">
                                        <input type="hidden" name="pageNum" value="${currPage}">
                                        <button class="btn btn-lg btn btn-primary" type="submit" name="btnAction" value="Update">Update</button>
                                        <c:if test="${quest.check}"><button class="btn btn-lg btn-danger" type="submit" name="btnAction" value="Delete" onclick="return confirm('are you sure?')">Delete</button></c:if>
                                        <c:if test="${!quest.check}"><button class="btn btn-lg btn-success" type="submit" name="btnAction" value="Delete">Restore</button></c:if>
                                        </form>
                                        <a class="page-link" href="HistoryUpdateController?name=${quest.questID}">Update History</a>
                                </div>
                            </c:if>
                        </c:forEach>
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
                    <li class="page-item <c:if test="${currPage == pageNum}">disabled</c:if>"><a class="page-link" href="AdminSearchController?pageNum=${pageNum}&name=${param.name}&check=${param.check}&category=${param.category}&gogo=${param.gogo}">${pageNum}</a>
                        </li>
                </c:forEach>
            </ul>
        </nav>
    </c:if>
</center>
</body>
</html>
