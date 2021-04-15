<%-- 
    Document   : itemDetailAdmin
    Created on : Jan 16, 2021, 1:31:55 PM
    Author     : hienl
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Item Detail</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link href="./css/style.css" rel="stylesheet" media="screen">
        <link href="./css/mobile-style.css" rel="stylesheet" media="screen">
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
                        <li><a href="MainController?btnAction=HomePage">Admin Home Page</a></li>
                        <li><a href="MainController?btnAction=Search">Search Item</a></li>
                        <li><a href="MainController?btnAction=CreateItemPage">Create Item</a></li>
                        <!--<li><a href="MainController?btnAction=HistoryUpdate">History Update</a></li>-->
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="MainController?btnAction=Logout" class="p-3 mb-2 bg-danger text-white">Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <c:set var="error" value="${requestScope.ERROR}"></c:set>
        <c:set var="pic" value="${requestScope.IMG}"></c:set>
        <c:set var="item" value="${requestScope.ITEM}"></c:set>
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <h1 class="my-4">Hana Shop</h1>
                        <div class="container">
                            <form action="MainController" method="POST">
                                <h2>${item.itemID}</h2>
                            <div class="container">
                                <div class="card">
                                    <div class="container-fliud">
                                        <div class="wrapper row">
                                            <div class="preview col-md-6">
                                                <div class="preview-pic tab-content">
                                                    <div class="dropzone">
                                                        <div class="info"></div>
                                                    </div>
                                                    <div id="showPic">
                                                        <c:if test="${not empty pic}">
                                                            <input type="hidden" name="img" class="image-url" value="${item.img}">
                                                            <img class="image-url" src="${item.img}"/>
                                                        </c:if>
                                                    </div>
                                                    <div style="color: red">${error.line7}</div>
                                                </div>
                                            </div>
                                            <div class="details col-md-6">
                                                <h3 class="product-title"><input type="text" name="itemName" placeholder="Item Name" value="${item.itemName}"/></h3><div style="color: red">${error.line2}</div>
                                                <h4 class="product-title"><c:set var="listCategory" value="${requestScope.LIST_CATEGORY2}"></c:set>
                                                        <select name="category">
                                                            <option value=""></option>
                                                        <c:forEach var="cate" items="${listCategory}">
                                                            <option <c:if test="${cate == item.category}">selected</c:if> value="${cate}">${cate}</option>
                                                        </c:forEach>
                                                    </select>
                                                </h4><div style="color: red">${error.line6}</div>
                                                <p class="product-description"><input type="text" name="des" placeholder="Description" value="${item.des}"/></p><div style="color: red">${error.line5}</div>
                                                <h4 class="price"><span><input type="text" name="price" placeholder="Price" value="${item.price}"/><div style="color: red">${error.line4}</div></span></h4>
                                                <h4 class="price"><span><input type="text" name="quantity" placeholder="Quantity" value="${item.quantity}"/><div style="color: red">${error.line3}</div></span></h4>
                                                <h5 class="price">create date: <span>${item.createDate}</span></h5>
                                                <div style="color: red">${error.line1}</div>
                                                <input type="hidden" name="itemID" value="${item.itemID}">
                                                <input type="hidden" name="pageNum" value="0">
                                                <h2><button class="btn btn-lg btn-success" type="submit" name="btnAction" value="UpdateAdmin">Update</button></h2>
                                                <c:if test="${item.status}"><h2><button class="btn btn-lg btn-danger" type="submit" name="btnAction" value="DeleteAdmin">Delete</button></h2></c:if>
                                                <c:if test="${!item.status}"><h2><button class="btn btn-lg btn btn-primary" type="submit" name="btnAction" value="DeleteAdmin">Restore</button></h2></c:if>
                                                <div><a href="MainController?btnAction=HistoryUpdate&name=${item.itemID}">History Update</a></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript" src="./js/imgur.js"></script>
        <script type="text/javascript" src="./js/upload.js"></script>
    </body>
</html>
