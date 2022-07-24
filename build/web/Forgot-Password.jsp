<%-- 
    Document   : Login
    Created on : May 24, 2022, 9:40:39 AM
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="include/Head.jsp" %>
    </head>
    <body>
        <c:if test="${actionFor == null}">
                    <%@include file="include/Header.jsp" %>
        </c:if>
        <!-- Start Banner Area -->
        <section class="banner-area organic-breadcrumb">
            <div class="container">
                <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                    <div class="col-first">
                        <h1>Forgot Password</h1>
                        <nav class="d-flex align-items-center">
                            <a href="index.html">Forgot Password<span class="lnr lnr-arrow-right"></span></a>
                            <a href="category.html">Home</a>
                        </nav>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Banner Area -->

        <!--================Forgot Password Box Area =================-->
            <c:if test="${status!='success'}">
                <section class="login_box_area section_gap">
                    <div class="container">
                        <div class="row d-flex justify-content-center">
                            <div class="col-lg-6">
                                <div class="login_form_inner py-5">
                                    <h3 class="mb-3" style="font-size: 160%;">FORGOT PASSWORD</h3>  
                                    <p class="mb-4">Please enter your name and email address to have your password reset</p>
                                    <form class="row login_form" action="Forgot_password?keyword=reset" method="post" id="contactForm" novalidate="novalidate">
<!--                                        <div class="col-md-12 form-group">
                                            <input type="text" class="form-control"  name="fullname" placeholder="Full Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Username'">
                                        </div>-->
                                        <div class="col-md-12 form-group">
                                            <input type="email" class="form-control"  name="email" placeholder="Email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password'" >
                                        </div>
                                        <div class="col-md-12 form-group mt-3">
                                            <p >${message}</p>
                                            <button type="submit" value="submit" class="primary-btn">Reset Password</button>
                                            <a href="./Login" class="text-warning text-link">Back to Log In</a>
                                        </div>
                                    </form>    
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </c:if>
            <c:if test="${status=='success'}">
                <section class="login_box_area section_gap">
                    <div class="container">
                        <div class="row d-flex justify-content-center">
                            <div class="col-lg-6">
                                <div class="login_form_inner py-5">
                                    <h3 class="mb-3" style="font-size: 160%;">You have requested to reset your password</h3>  
                                    <div class="border-bottom w-25 pb-3 pt-2" style="margin-left: 200px;"></div>
                                    <p class="mb-3 p-4">${message}</p>
                                        <div class="col-md-12 form-group mt-3">
                                           <a class="mb-3 text-white btn px-4" style="font-size: 110%;background-color: darkorange;" href="Login">Back To Login</a>
                                        </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </c:if>
        

        <%@include file="include/Footer.jsp" %>

    </body>
</html>
