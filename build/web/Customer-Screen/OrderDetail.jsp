<%-- 
    Document   : Confirmation
    Created on : May 24, 2022, 9:39:47 AM
    Author     : ADMIN
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="../include/Head.jsp" %>
        <style>
            body{margin-top:20px;}

            .steps {
                border: 1px solid #e7e7e7
            }

            .steps-header {
                padding: .375rem;
                border-bottom: 1px solid #e7e7e7
            }

            .steps-header .progress {
                height: .25rem
            }

            .steps-body {
                display: table;
                table-layout: fixed;
                width: 100%
            }

            .step {
                display: table-cell;
                position: relative;
                padding: 1rem .75rem;
                -webkit-transition: all 0.25s ease-in-out;
                transition: all 0.25s ease-in-out;
                border-right: 1px dashed #dfdfdf;
                color: rgba(0, 0, 0, 0.65);
                font-weight: 600;
                text-align: center;
                text-decoration: none
            }

            .step:last-child {
                border-right: 0
            }

            .step-indicator {
                display: block;
                position: absolute;
                top: .75rem;
                left: .75rem;
                width: 1.5rem;
                height: 1.5rem;
                border: 1px solid #e7e7e7;
                border-radius: 50%;
                background-color: #fff;
                font-size: .875rem;
                line-height: 1.375rem
            }

            .has-indicator {
                padding-right: 1.5rem;
                padding-left: 2.375rem
            }

            .has-indicator .step-indicator {
                top: 50%;
                margin-top: -.75rem
            }

            .step-icon {
                display: block;
                width: 1.5rem;
                height: 1.5rem;
                margin: 0 auto;
                margin-bottom: .75rem;
                -webkit-transition: all 0.25s ease-in-out;
                transition: all 0.25s ease-in-out;
                color: #888
            }

            .step:hover {
                color: rgba(0, 0, 0, 0.9);
                text-decoration: none
            }

            .step:hover .step-indicator {
                -webkit-transition: all 0.25s ease-in-out;
                transition: all 0.25s ease-in-out;
                border-color: transparent;
                background-color: #f4f4f4
            }

            .step:hover .step-icon {
                color: rgba(0, 0, 0, 0.9)
            }

            .step-active,
            .step-active:hover {
                color: rgba(0, 0, 0, 0.9);
                pointer-events: none;
                cursor: default
            }

            .step-active .step-indicator,
            .step-active:hover .step-indicator {
                border-color: transparent;
                background-color: #5c77fc;
                color: #fff
            }

            .step-active .step-icon,
            .step-active:hover .step-icon {
                color: #5c77fc
            }

            .step-completed .step-indicator,
            .step-completed:hover .step-indicator {
                border-color: transparent;
                background-color: rgba(51, 203, 129, 0.12);
                color: #33cb81;
                line-height: 1.25rem
            }

            .step-completed .step-indicator .feather,
            .step-completed:hover .step-indicator .feather {
                width: .875rem;
                height: .875rem
            }

            @media (max-width: 575.98px) {
                .steps-header {
                    display: none
                }
                .steps-body,
                .step {
                    display: block
                }
                .step {
                    border-right: 0;
                    border-bottom: 1px dashed #e7e7e7
                }
                .step:last-child {
                    border-bottom: 0
                }
                .has-indicator {
                    padding: 1rem .75rem
                }
                .has-indicator .step-indicator {
                    display: inline-block;
                    position: static;
                    margin: 0;
                    margin-right: 0.75rem
                }
            }

            .bg-secondary {
                background-color: #f7f7f7 !important;
            }
        </style>
    </head>
    <body>
        <%@include file="../include/Header.jsp" %>
        <!-- Start Banner Area -->
        <section class="banner-area organic-breadcrumb">
            <div class="container">
                <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                    <div class="col-first">
                        <h1>Confirmation</h1>
                        <nav class="d-flex align-items-center">
                            <a href="HomePage">Home<span class="lnr lnr-arrow-right"></span></a>
                            <a href="">Order Details</a>
                        </nav>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Banner Area -->

        <!--================Order Details Area =================-->
        <section class="order_details section_gap">
            <div class="container">
                <h5>Tracking Order</h5>
                <div class="steps">
                    <div class="steps-header">
                        <div class="progress">
                            <c:if test = "${stt eq 4}">
                                <div class="progress-bar" role="progressbar" style="width: 100%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                            </c:if>
                            <c:if test = "${stt eq 3}">
                                <div class="progress-bar" role="progressbar" style="width: 75%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                            </c:if>
                            <c:if test = "${stt eq 2}">
                                <div class="progress-bar" role="progressbar" style="width: 50%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                            </c:if>
                            <c:if test = "${stt eq 1}">
                                <div class="progress-bar" role="progressbar" style="width: 25%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                            </c:if>
                        </div>
                    </div>
                    <div class="steps-body">
                        <div class="step">
                            <span class="step-icon">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-truck"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path><polyline points="9 22 9 12 15 12 15 22"></polyline></svg>
                            </span>Order received
                        </div>
                        <div class="step step-completed">
                            <span class="step-indicator">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check"><polyline points="20 6 9 17 4 12"></polyline></svg>
                            </span>
                            <span class="step-icon">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check-circle">
                                <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path>
                                <polyline points="22 4 12 14.01 9 11.01"></polyline>
                                </svg>
                            </span>Order placed
                        </div>
                        <div class="step">
                            <span class="step-icon">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-award"><circle cx="12" cy="8" r="7"></circle><polyline points="8.21 13.89 7 23 12 20 17 23 15.79 13.88"></polyline></svg>
                            </span>Order completed
                        </div>
                        <div class="step">
                            <span class="step-icon"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-home"><rect x="1" y="3" width="15" height="13"></rect><polygon points="16 8 20 8 23 11 23 16 16 16 16 8"></polygon><circle cx="5.5" cy="18.5" r="2.5"></circle><circle cx="18.5" cy="18.5" r="2.5"></circle></svg>
                            </span>Order cancel
                        </div>      
                    </div>
                </div>

                <div class="order_details_table" style="background-color: white;">
                    <h2>Order Details</h2>
                    <div class="table-responsive">
                        <table class="table">
                            <thead >
                                <tr style="color: black;">
                                    <th scope="col" colspan="2"></th>
                                    <th scope="col" colspan="3">Product</th>
                                    <th scope="col" colspan="2" class="text-center">Quantity</th>
                                    <th scope="col" colspan="2">Discount</th>
                                    <th scope="col" colspan="2" class="pl-5"> Price</th>
                                </tr>
                            </thead>
                            <tbody >
                                <c:forEach items="${ListOrderDetails}" var="l">
                                    <tr class="py-2">
                                        <td colspan="2">
                                            <img class="mx-auto d-block" src="img/shoes/${l.getProductDetail().getProduct().getImages().get(0).getUrl()}" style="width: 130px; height:130px " alt=""  >
                                        </td>
                                        <td colspan="3">
                                            <p class="font-weight-bold h6 mt-3">${l.getProductDetail().getProduct().getProductName()}</p>
                                            <p class="py-2">Color: ${l.getProductDetail().getColor()}</p>
                                            <p >Size: ${l.getProductDetail().getSize()}</p>
                                        </td>
                                        <td colspan="2" class="text-center">
                                            <p  class="mt-3 text-dark">${l.getQuantity()}</p>
                                        </td>
                                        <c:set var="price" value="${l.getQuantity() * l.getPrice()}" />
                                        <c:set var="discount" value="${l.getPrice() - l.getPrice()*(l.getDiscount()/100)}" />
                                        <td colspan="2">
                                            <p class="mt-3 text-dark">${l.getDiscount()}%</p>
                                        </td>
                                        <td style="display: flex" colspan="2">
                                            <p style="text-decoration: line-through; padding-right:  10px" class="mt-3"> <fmt:formatNumber
                                                    value="${l.getPrice()}"
                                                    type="number"/>
                                                &dstrok;</p>
                                            <br>
                                            <p class="mt-3 text-dark"> <fmt:formatNumber
                                                    value="${discount}"
                                                    type="number"/>
                                                &dstrok;</p>
                                        </td>
                                        <c:set var="total" value="${total + discount} " />
                                    </tr>
                                </c:forEach>

                            </tbody>
                        </table>
                        <div class="d-flex justify-content-end border">
                            <div class="d-flex h6 mt-1 py-3 " style="margin-right: 130px;">
                                <p class="font-weight-bold h6 mt-1">Total:</p>  <p class="font-weight-bold h6 mt-1 ml-3" >
                                    <fmt:formatNumber
                                        value="${total}"
                                        type="number"/>
                                    &dstrok;</p></div>
                        </div>

                    </div>
                </div>
            </div>
        </section>
        <!--================End Order Details Area =================-->
        <%@include file="../include/Footer.jsp" %>

    </body>
</html>
