<%-- 
    Document   : Confirmation
    Created on : May 24, 2022, 9:39:47 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Completion</title>
        <%@include file="include/Head.jsp" %>
    </head>
    <body>
        <%@include file="include/Header.jsp" %>
        <!-- Start Banner Area -->
        <section class="banner-area organic-breadcrumb">
            <div class="container">
                <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                    <div class="col-first">
                        <h1>Confirmation</h1>
                        <nav class="d-flex align-items-center">
                            <a href="HomePage">Home<span class="lnr lnr-arrow-right"></span></a>
                            <a href="Confirmation">Confirmation</a>
                        </nav>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Banner Area -->

        <!--================Order Details Area =================-->
        <section class="order_details section_gap">
            <div class="container">
                <h3 class="title_confirmation" style="margin-bottom: 30px">Thank you. Your order has been received.</h3>
                <!--Order tracking progress-->
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
                <div class="container pb-5 mb-sm-4">
                    <!-- Details-->
                    <div class="row mb-3">
                        <div class="col-sm-4 mb-2">
                            <div class="bg-secondary p-4 text-dark text-center"><span class="font-weight-semibold mr-2">Shipped via:</span>${o.getShippingCompany().getCompanyName()}</div>
                        </div>
                        <div class="col-sm-4 mb-2">
                            <div class="bg-secondary p-4 text-dark text-center"><span class="font-weight-semibold mr-2">Status:</span>${o.getStatus().getStatusDescription()}</div>
                        </div>
                        <div class="col-sm-4 mb-2">
                            <div class="bg-secondary p-4 text-dark text-center"><span class="font-weight-semibold mr-2">Expected date:</span>${o.getShipDate()}</div>
                        </div>
                    </div>
                    <!-- Progress-->
                    <h5>Tracking Order</h5>
                    <c:if test = "${stt eq 3}">
                        <div class="steps">
                            <div class="steps-header">
                                <div class="progress">
                                    <div class="progress-bar" role="progressbar" style="width: 100%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                                    <c:if test = "${stt eq 2}">
                                        <div class="progress-bar" role="progressbar" style="width: 66.67%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                                    </c:if>
                                    <c:if test = "${stt eq 1}">
                                        <div class="progress-bar" role="progressbar" style="width: 33.33%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                                    </c:if>
                                </div>
                            </div>
                            <div class="steps-body">
                                <div class="step step-completed">
                                    <span class="step-indicator">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check"><polyline points="20 6 9 17 4 12"></polyline></svg>
                                    </span>
                                    <span class="step-icon">
                                        <svg xmlns="http://www.w3.org/2000/svg"  width="24" height="24" viewBox="0 0 512 512" fill="#777777" stroke="black" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-award"><path d="M232 120C232 106.7 242.7 96 256 96C269.3 96 280 106.7 280 120V243.2L365.3 300C376.3 307.4 379.3 322.3 371.1 333.3C364.6 344.3 349.7 347.3 338.7 339.1L242.7 275.1C236 271.5 232 264 232 255.1L232 120zM256 0C397.4 0 512 114.6 512 256C512 397.4 397.4 512 256 512C114.6 512 0 397.4 0 256C0 114.6 114.6 0 256 0zM48 256C48 370.9 141.1 464 256 464C370.9 464 464 370.9 464 256C464 141.1 370.9 48 256 48C141.1 48 48 141.1 48 256z"/></svg>
                                    </span>Pending
                                </div>
                                <div class="step step-completed">
                                    <span class="step-indicator">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check"><polyline points="20 6 9 17 4 12"></polyline></svg>
                                    </span>
                                    <span class="step-icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-award"><circle cx="12" cy="8" r="7"></circle><polyline points="8.21 13.89 7 23 12 20 17 23 15.79 13.88"></polyline></svg>
                                    </span>Confirmed
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
                                    </span>Completed
                                </div>
                            </div>
                        </div>
                    </c:if>
                    <c:if test = "${stt eq 2}">
                        <div class="steps">
                            <div class="steps-header">
                                <div class="progress">
                                    <div class="progress-bar" role="progressbar" style="width: 66.67%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                            <div class="steps-body">
                                <div class="step step-completed">
                                    <span class="step-indicator">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check"><polyline points="20 6 9 17 4 12"></polyline></svg>
                                    </span>
                                    <span class="step-icon">
                                        <svg xmlns="http://www.w3.org/2000/svg"  width="24" height="24" viewBox="0 0 512 512" fill="#777777" stroke="black" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-award"><path d="M232 120C232 106.7 242.7 96 256 96C269.3 96 280 106.7 280 120V243.2L365.3 300C376.3 307.4 379.3 322.3 371.1 333.3C364.6 344.3 349.7 347.3 338.7 339.1L242.7 275.1C236 271.5 232 264 232 255.1L232 120zM256 0C397.4 0 512 114.6 512 256C512 397.4 397.4 512 256 512C114.6 512 0 397.4 0 256C0 114.6 114.6 0 256 0zM48 256C48 370.9 141.1 464 256 464C370.9 464 464 370.9 464 256C464 141.1 370.9 48 256 48C141.1 48 48 141.1 48 256z"/></svg>
                                    </span>Pending
                                </div>
                                <div class="step step-completed">
                                    <span class="step-indicator">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check"><polyline points="20 6 9 17 4 12"></polyline></svg>
                                    </span>
                                    <span class="step-icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-award"><circle cx="12" cy="8" r="7"></circle><polyline points="8.21 13.89 7 23 12 20 17 23 15.79 13.88"></polyline></svg>
                                    </span>Confirmed
                                </div>
                                <div class="step">
                                    <span class="step-icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check-circle">
                                        <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path>
                                        <polyline points="22 4 12 14.01 9 11.01"></polyline>
                                        </svg>
                                    </span>Completed
                                </div>
                            </div>
                        </div>
                    </c:if>
                    <c:if test = "${stt eq 1}">
                        <div class="steps">
                            <div class="steps-header">
                                <div class="progress">
                                    <div class="progress-bar" role="progressbar" style="width: 33.33%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                            <div class="steps-body">
                                <div class="step step-completed">
                                    <span class="step-indicator">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check"><polyline points="20 6 9 17 4 12"></polyline></svg>
                                    </span>
                                    <span class="step-icon">
                                        <svg xmlns="http://www.w3.org/2000/svg"  width="24" height="24" viewBox="0 0 512 512" fill="#777777" stroke="black" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-award"><path d="M232 120C232 106.7 242.7 96 256 96C269.3 96 280 106.7 280 120V243.2L365.3 300C376.3 307.4 379.3 322.3 371.1 333.3C364.6 344.3 349.7 347.3 338.7 339.1L242.7 275.1C236 271.5 232 264 232 255.1L232 120zM256 0C397.4 0 512 114.6 512 256C512 397.4 397.4 512 256 512C114.6 512 0 397.4 0 256C0 114.6 114.6 0 256 0zM48 256C48 370.9 141.1 464 256 464C370.9 464 464 370.9 464 256C464 141.1 370.9 48 256 48C141.1 48 48 141.1 48 256z"/></svg>
                                    </span>Pending
                                </div>
                                <div class="step step-completed">
                                    <span class="step-icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-award"><circle cx="12" cy="8" r="7"></circle><polyline points="8.21 13.89 7 23 12 20 17 23 15.79 13.88"></polyline></svg>
                                    </span>Confirmed
                                </div>
                                <div class="step">
                                    <span class="step-icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check-circle">
                                        <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path>
                                        <polyline points="22 4 12 14.01 9 11.01"></polyline>
                                        </svg>
                                    </span>Completed
                                </div>
                            </div>
                        </div>
                    </c:if>
                </div>
                <div class="row order_d_inner">
                    <div class="col-lg-6">
                        <div class="details_item">
                            <h4>Order Information</h4>
                            <ul class="list">
                                <li><a href="#"><span>Order number</span> : ${o.getOrderID()}</a></li>
                                <li><a href="#"><span>Date</span> : ${o.getOrderDate()}</a></li>
                                <li><a href="#"><span>Total</span> : ${o.getTotal()}</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="details_item">
                            <h4>Contact Information</h4>
                            <ul class="list">
                                <li><a href="#"><span>Name</span> : ${o.getCustomerName()}</a></li>
                                <li><a href="#"><span>Phone</span> : ${o.getPhoneNumber()}</a></li>
                                <li><a href="#"><span>Address</span> : ${o.getAddress()}</a></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="order_details_table" style="background-color: white;">
                    <h2>Order Details</h2>
                    <div class="table-responsive w-100">
                        <table class="table w-100">
                            <thead>
                                <tr style="color: black;">
                                    <th scope="col"></th>
                                    <th scope="col">Product</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col">Size</th>
                                    <th scope="col">Color</th>
                                    <th scope="col">Discount</th>
                                    <th scope="col">Price</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${ListOrderDetails}" var="l">
                                    <tr>
                                        <td>
                                            <img class="mx-auto d-block" src="img/shoes/${l.getProductDetail().getProduct().getImages().get(0).getUrl()}" style="width: 130px; height:130px " alt=""  >
                                        </td>
                                        <td>
                                            <p >${l.getProductDetail().getProduct().getProductName()}</p>
                                        </td>
                                        <td>
                                            <p>${l.getQuantity()}</p>
                                        </td>
                                        <td>
                                            <p>${l.getProductDetail().getSize()}</p>
                                        </td>
                                        <td>
                                            <p>${l.getProductDetail().getColor()}</p>
                                        </td>
                                        <td>
                                            <p>${l.getDiscount()}%</p>
                                        </td>
                                        <td>
                                            <p>${l.getProductDetail().getProduct().getUnitPrice()}</p>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <tr>
                                    <td>
                                        <h2>Total</h2>
                                    </td>
                                    <td>
                                        <h5></h5>
                                    </td>
                                    <td>
                                        <h5></h5>
                                    </td>
                                    <td>
                                        <h5></h5>
                                    </td>
                                    <td>
                                        <h5></h5>
                                    </td>
                                    <td>
                                        <h5></h5>
                                    </td>
                                    <td>
                                        <p>${o.getTotal()}</p>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="d-flex justify-content-between mt-5">
                        <a class="btn btn-light w-25 py-2 font-weight-bold border" href="Shop">Continue shopping</a>
                        <a class="btn btn-light w-25 py-2 font-weight-bold border" href="ListOrder?cusid=${sessionScope.userLogin.getAccountId()}">View Orders</a>
                    </div>
                </div>
            </div>
        </section>
        <!--================End Order Details Area =================-->
        <%@include file="include/Footer.jsp" %>

    </body>
</html>
