<%-- 
    Document   : shoping
    Created on : Jan 5, 2021, 2:12:43 PM
    Author     : hienl
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
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
                        <li class="active"><a href="MainController?btnAction=ViewOrder">Your Cart</a></li>
                        <li><a href="MainController?btnAction=ShoppingHistory">Shopping History</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="MainController?btnAction=Logout" class="p-3 mb-2 bg-danger text-white">Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <c:set var="currPage" value="${requestScope.PAGE_NUM}"></c:set>
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <h1 class="my-4">Hana Shop</h1>
                    </div>
                </div>
            <c:set var="list" value="${sessionScope.CART.listItem}"></c:set>
                <table class="table table-striped table-condensed">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Item ID</th>
                            <th>Item Name</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Total</th>
                            <th>Update</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:set var="total" value="${sessionScope.CART.totalPrice}"/>
                    <c:forEach items="${list}" var="cart" varStatus="counter">
                    <form action="MainController" method="POST">
                        <tr>
                            <td>${counter.count}</td>
                            <td>${cart.itemID}</td>
                            <td>${cart.itemName}</td>
                            <td><input name="quantity" type="text" value="${cart.quantity}"></td>
                            <td>${cart.price}</td>
                            <td>${cart.price*cart.quantity}</td>
                            <td><input type="hidden" name="itemID" value="${cart.itemID}"/>
                                <button class="btn btn-lg btn btn-primary" type="submit" name="btnAction" value="UpdateOrder">Update</button>
                            </td>
                            <td>
                                <button class="btn btn-lg btn-danger" type="submit" name="btnAction" value="DeleteOrderItem" onclick="return confirm('are you sure?')">Delete</button>
                            </td>
                        </tr>
                    </form>
                </c:forEach>
                </tbody>
            </table>
            <h4>Total: ${total} $</h4>
            <div><h3><a href="MainController?btnAction=ConfirmOrder">Confirm Order</a></h3></div>
            <c:set var="error" value="${requestScope.ERROR}"></c:set>
            <c:if test="${error != null}">
                <center style="color: red">
                    ${error.line1}
                </center>
            </c:if>
        </div>
    </div>

</body>
</html>
