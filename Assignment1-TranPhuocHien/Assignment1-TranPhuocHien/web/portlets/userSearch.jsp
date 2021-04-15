<%-- 
    Document   : userSearch
    Created on : Jan 9, 2021, 3:14:26 PM
    Author     : hienl
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search</title>
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
                        <li><a href="MainController?btnAction=HomePage">Home Page</a></li>
                        <li class="active"><a href="MainController?btnAction=Search">Search Item</a></li>
                        <li><a href="MainController?btnAction=ViewOrder">Your Cart</a></li>
                        <li><a href="MainController?btnAction=ShoppingHistory">Shopping History</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="MainController?btnAction=Logout" class="p-3 mb-2 bg-danger text-white">Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <c:set var="error3" value="${requestScope.ERROR3}"></c:set>
        <c:if test="${error3 != null}">
        <center style="color: red">
            </br>
            </br>
            ${error3.line1}
            ${error3.line2}
            ${error3.line3}
        </center>
    </c:if>
    <c:set var="currPage" value="${requestScope.PAGE_NUM}"></c:set>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <h1 class="my-4">Hana Shop</h1>
                    <div class="container">
                        <br/>
                        <div class="row justify-content-center">
                            <div class="col-12 col-md-10 col-lg-8">
                                <form action="MainController" class="card card-sm">
                                    <div class="card-body row no-gutters align-items-center">
                                        <div class="col-auto">
                                            <i class="fas fa-search h4 text-body"></i>
                                        </div>
                                        <div class="col">
                                            <input type="text" placeholder="Name" name="name" value="${param.name}">
                                    </div>
                                    <div class="col">
                                        <input type="text" placeholder="Max Price" name="priceMax" value="${param.priceMax}">
                                    </div>
                                    <div class="col">
                                        <input type="text" placeholder="Min Price" name="priceMin" value="${param.priceMin}">
                                    </div>
                                    <div class="col">
                                        <c:set var="listCategory" value="${requestScope.LIST_CATEGORY}"></c:set>
                                            <select name="category">
                                                <option value=""></option>
                                            <c:forEach var="cate" items="${listCategory}">
                                                <option <c:if test="${cate == param.category}">selected</c:if> value="${cate}">${cate}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="col-auto">
                                        <button class="btn btn-lg btn-success" type="submit" name="btnAction" value="Search">Search</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <c:set var="list" value="${requestScope.LIST}"></c:set>
                <div class="col-lg-9">
                    <div class="row">
                    <c:forEach var="item" items="${list}">
                        <form action="MainController" method="POST">
                            <div class="col-lg-4 col-md-6 mb-4">
                                <div class="card h-100">
                                    <a href="MainController?btnAction=Detail&itemID=${item.itemID}"><img class="img-responsive" src="${item.img}" style="width:250px;height:200px;"></a>
                                    <div class="card-body">
                                        <h4 class="card-title">
                                            <a href="MainController?btnAction=Detail&itemID=${item.itemID}">${item.itemName}</a>
                                            <input type="hidden" name="itemID" value="${item.itemID}">
                                            <input type="hidden" name="pageNum" value="${currPage}">
                                        </h4>
                                        <h5>$${item.price}</h5>
                                        <p class="card-text">${item.category}</p>
                                        <p class="card-text">Quantity: ${item.quantity}</p>
                                        <input type="hidden" name="name" value="${param.name}"/>
                                        <input type="hidden" name="priceMax" value="${param.priceMax}"/>
                                        <input type="hidden" name="priceMin" value="${param.priceMin}"/>
                                        <input type="hidden" name="category" value="${param.category}"/>
                                        <h2><button class="btn btn-lg btn-success" type="submit" name="btnAction" value="OrderItem">Order Item</button></h2>
                                    </div>
                                </div>
                            </div>
                        </form>
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
                        <li class="page-item <c:if test="${currPage == pageNum}">disabled</c:if>"><a class="page-link" href="MainController?btnAction=Search&pageNum=${pageNum}&priceMax=${param.priceMax}&priceMin=${param.priceMin}&name=${param.name}">${pageNum}</a>
                            </li>
                    </c:forEach>
                </ul>
            </nav>
        </c:if>
    </center>
    <c:set var="error" value="${requestScope.ERROR}"></c:set>
    <c:if test="${error != null}">
        <center style="color: red">
            </br>
            </br>
            ${error.line1}
            ${error.line2}
            ${error.line3}
        </center>
    </c:if>

</body>
</html>
