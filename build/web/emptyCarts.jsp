<%-- 
    Document   : emptyCarts
    Created on : Jun 14, 2022, 7:08:09 PM
    Author     : vietd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="include/Head.jsp" %>
    </head>
    <body>
        <%@include file="include/Header.jsp" %>
        <div class="container" style="margin-bottom: 100px;margin-top: 200px;">
            <h3 class="font-weight-bold text-center">Shopping Cart</h3>
            <div class="d-flex justify-content-center">
                <img src="img/empty_cart.JPG">
            </div>
            <h6 class="text-center mt-3 ">Sorry, there are currently no products in your cart!</h6>
            <p class="text-center">Please come back to the store to continue shopping with us !</p>
            <div class="d-flex justify-content-center">
                <a href="./Shop" class="btn btn-outline-dark py-2  px-5" style="border-radius: 7px;">Back to shop</a>
            </div>

        </div>
        <%@include file="include/Footer.jsp" %>
    </body>
</html>
