<%-- 
    Document   : userOrderDetail
    Created on : Jan 19, 2021, 9:57:31 AM
    Author     : hienl
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Detail</title>
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

        <c:set var="list" value="${requestScope.LIST}"></c:set>
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <h1 class="my-4">Hana Shop</h1>
                        <div class="container">
                            <table class="table table-striped table-condensed">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Item ID</th>
                                        <th>Item Name</th>
                                        <th>Quantity</th>
                                        <th>Price</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:set var="total" value="${requestScope.TOTAL}"/>
                                <c:forEach items="${list}" var="cart" varStatus="counter">
                                <form action="MainController" method="POST">
                                    <tr>
                                        <td>${counter.count}</td>
                                        <td>${cart.itemID}</td>
                                        <td>${cart.itemName}</td>
                                        <td>${cart.quantity}</td>
                                        <td>${cart.price}</td>
                                    </tr>
                                </form>
                            </c:forEach>
                            </tbody>
                        </table>
                        <h4>Total: ${total} $</h4>
                    </div>
                </div>                  
            </div>
        </div>
    </body>
</html>
