<%-- 
    Document   : itemDetailUser
    Created on : Jan 16, 2021, 1:32:13 PM
    Author     : hienl
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Item Detail</title>
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
                        <li><a href="MainController?btnAction=Search">Search Item</a></li>
                        <li><a href="MainController?btnAction=ViewOrder">Your Cart</a></li>
                        <li><a href="MainController?btnAction=ShoppingHistory">Shopping History</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="MainController?btnAction=Logout" class="p-3 mb-2 bg-danger text-white">Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <c:set var="item" value="${requestScope.ITEM}"></c:set>
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <h1 class="my-4">Hana Shop</h1>
                        <div class="container">
                            <h2>${item.itemID}</h2>
                        <div class="container">
                            <div class="card">
                                <div class="container-fliud">
                                    <div class="wrapper row">
                                        <div class="preview col-md-6">
                                            <div class="preview-pic tab-content">
                                                <div class="tab-pane active" id="pic-1"><img src="${item.img}" style="width:500px;height:400px;" /></div>
                                            </div>
                                        </div>
                                        <div class="details col-md-6">
                                            <h3 class="product-title">${item.itemName}</h3>
                                            <h4 class="product-title">${item.category}</h4>
                                            <p class="product-description">${item.des}</p>
                                            <h4 class="price">current price: <span>$${item.price}</span></h4>
                                            <h4 class="price">Quantity: <span>${item.quantity}</span></h4>
                                            <h5 class="price">create date: <span>${item.createDate}</span></h5>
                                            <form action="MainController" method="POST">
                                                <input type="hidden" name="itemID" value="${item.itemID}">
                                                <input type="hidden" name="pageNum" value="0">
                                                <div class="action">
                                                    <h2><button class="btn btn-lg btn-success" type="submit" name="btnAction" value="OrderItem">Order Item</button></h2>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
