<%-- 
    Document   : itemCreatePage
    Created on : Jan 13, 2021, 10:11:28 PM
    Author     : hienl
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Item Create Page</title>
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
                        <li class="active"><a href="MainController?btnAction=CreateItemPage">Create Item</a></li>
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
        <center><div class="container" id="wrap">
                <form form action="MainController" method="POST">
                    <div class="row">
                        <div class="col-md-6 col-md-offset-3">
                            <div class="row">
                                <div class="dropzone">
                                    <div class="info"></div>
                                </div>
                                <div id="showPic">
                                <c:if test="${not empty pic}">
                                    <input type="hidden" name="img" class="image-url" value="${param.img}">
                                    <img class="image-url" src="${param.img}"/>
                                </c:if>
                            </div>
                            <div style="color: red">${error.line7}</div>
                            <div class="col">
                                <input type="text" name="itemID" class="form-control input-lg" placeholder="Item ID" value="${param.itemID}"/><div style="color: red">${error.line1}</div></div>
                            <div class="col">
                                <input type="text" name="itemName" class="form-control input-lg" placeholder="Item Name" value="${param.itemName}"/><div style="color: red">${error.line2}</div></div>
                            <div class="col">
                                <input type="text" name="quantity" class="form-control input-lg" placeholder="Quantity" value="${param.quantity}"/><div style="color: red">${error.line3}</div></div>
                            <div class="col">
                                <input type="text" name="price" class="form-control input-lg" placeholder="Price" value="${param.price}"/><div style="color: red">${error.line4}</div></div>
                            <div class="col">
                                <input type="text" name="des" class="form-control input-lg" placeholder="Description" value="${param.des}"/><div style="color: red">${error.line5}</div></div>
                            <div class="col">    
                                <c:set var="listCategory" value="${requestScope.LIST_CATEGORY}"></c:set>
                                    <select name="category">
                                        <option value=""></option>
                                    <c:forEach var="cate" items="${listCategory}">
                                        <option <c:if test="${cate == param.category}">selected</c:if> value="${cate}">${cate}</option>
                                    </c:forEach>
                                </select>
                                <div style="color: red">${error.line6}</div>
                            </div>   
                        </div>
                    </div>
                </div> 
                <div><button class="btn btn-primary stretched-link" type="submit" name="btnAction" value="CreateItem">Create Item</button></div> 
            </form>        
        </div>
    </div>            
</div>
</center>
<script type="text/javascript" src="./js/imgur.js"></script>
<script type="text/javascript" src="./js/upload.js"></script>
</body>
</html>
