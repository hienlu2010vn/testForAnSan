<%-- 
    Document   : itemDetail
    Created on : Jan 16, 2021, 1:22:45 PM
    Author     : hienl
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Item Detail</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <body>
        <nav class="navbar navbar-default" role="navigation">
            <div class="container-fluid">
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li><a href="MainController?btnAction=HomePage">Home Page</a></li>
                        <li><a href="MainController?btnAction=Search">Search Item</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="MainController?btnAction=LoginPage" class="p-3 mb-2 bg-danger text-white">Login</a></li>
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

