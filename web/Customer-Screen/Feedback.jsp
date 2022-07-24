<%-- 
    Document   : Feedback
    Created on : Jun 23, 2022, 6:39:06 PM
    Author     : vietd
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Feedback Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <%@include file="../include/Head.jsp" %>
        <style>
            .fas {
                font-size: 30px;
            }

            .star-wrapper {
                color: rgb(0 0 0 / 10%);
            }

            .star-wrapper a:hover {
                color: gold;
                transform: scale(1.3);
            }
        </style>
        <style type="text/css">
            .nice-select {
                line-height: 24px;
            }

            .form-style-9 {
                /*background: #FAFAFA;*/
                padding: 30px;
                margin: 50px auto;
                box-shadow: 1px 1px 25px rgba(0, 0, 0, 0.35);
                border-radius: 10px;
            }

            .form-style-9 ul {
                padding: 0;
                margin: 0;
                list-style: none;
            }

            .form-style-9 ul li {
                display: block;
                margin-bottom: 20px;
                min-height: 35px;
            }

            .form-style-9 ul li .field-style {
                box-sizing: border-box;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                padding: 8px;
                outline: none;
                border: 1px solid #B0CFE0;
                -webkit-transition: all 0.30s ease-in-out;
                -moz-transition: all 0.30s ease-in-out;
                -ms-transition: all 0.30s ease-in-out;
                -o-transition: all 0.30s ease-in-out;

            }

            .form-style-9 ul li .field-style:focus {
                box-shadow: 0 0 5px #ff9933;
                border: 1px solid #ff9933;
            }

            .form-style-9 ul li .field-split {
                width: 49%;
            }

            .form-style-9 ul li .field-full {
                width: 100%;
            }

            .form-style-9 ul li input.align-left {
                float: left;
            }

            .form-style-9 ul li input.align-right {
                float: right;
            }

            .form-style-9 ul li textarea {
                width: 100%;
                height: 100px;
            }

            .form-style-9 ul li input[type="button"],
            .form-style-9 ul li input[type="submit"] {
                -moz-box-shadow: inset 0px 1px 0px 0px #ff9933;
                -webkit-box-shadow: inset 0px 1px 0px 0px #ff9933;
                box-shadow: inset 0px 1px 0px 0px #ff9933;
                background-color: #ff9933;
                border: 1px solid #ff9933;
                display: inline-block;
                cursor: pointer;
                color: #FFFFFF;
                padding: 8px 18px;
                text-decoration: none;
                font: 12px Arial, Helvetica, sans-serif;
            }

            .form-style-9 ul li input[type="button"]:hover,
            .form-style-9 ul li input[type="submit"]:hover {
                background: linear-gradient(to bottom, #ffcc66 5%, #ffcc66 100%);
                background-color: #ffcc66;
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
                        <h1>Feedback</h1>
                        <nav class="d-flex align-items-center">
                            <a href="HomePage">Home<span class="lnr lnr-arrow-right"></span></a>
                            <a href="">Feedback</a>
                        </nav>
                    </div>
                </div>
            </div>
        </section>
        <section class="checkout_area section_gap">
            <div class="container">
                <form class="form-style-9">
                    <div class="billing_details">
                        <div class="row d-flex justify-content-center">
                            <div class="col-lg-11">
                                <h3>Feedback</h3>
                                <c:forEach items="${feedbacks}" var="feedback">
                                    <div class="row py-3 border-bottom">
                                        <div class="col-md-2">
                                            <img src="img/shoes/${feedback.getOrderDetails().getProductDetail().getProduct().getImages().get(0).getUrl()}"
                                                 width="120px" height="120px">
                                        </div>
                                        <div class="col-md-8">
                                            <h6 class="mt-3 font-weight-bold"><a class="text-dark" href="product_details?productId=${feedback.getOrderDetails().getProductDetail().getProduct().getProductId()}">${feedback.getOrderDetails().getProductDetail().getProduct().getProductName()}</a></h6>
                                            <p>Color: ${feedback.getOrderDetails().getProductDetail().getColor()} ,
                                                Size: ${feedback.getOrderDetails().getProductDetail().getSize()}</p>
                                            <p>x${feedback.getOrderDetails().getQuantity()}</p>
                                        </div>
                                        <div class="col-md-2">
                                            <p class="my-2" style="text-decoration-line:line-through;color: #929292; ">
                                                <fmt:formatNumber value="${feedback.getOrderDetails().getPrice()}"
                                                                  type="number"/>
                                                &dstrok;
                                            </p>
                                            <p class="font-weight-bold">
                                                <fmt:formatNumber
                                                    value="${feedback.getOrderDetails().getPrice() - feedback.getOrderDetails().getPrice()*(feedback.getOrderDetails().getDiscount() / 100)}"
                                                    type="number"/>
                                                &dstrok;
                                            </p>
                                        </div>
                                        <c:if test="${feedback.getFeedbackId() !=0}">
                                            <span class="text-success font-weight-bold">Reviewed the product</span>
                                            <div class="d-flex justify-content-center w-100">
                                                <button type="button" class="btn btn-link text-dark" data-toggle="modal"
                                                        data-target="#exampleModal${feedback.getOrderDetails().getOrderDetailsId()}">
                                                    View feedback
                                                </button>
                                            </div>
                                            <div class="modal fade bd-example-modal-lg "
                                                 id="exampleModal${feedback.getOrderDetails().getOrderDetailsId()}"
                                                 tabindex="-1"
                                                 role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog modal-lg" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel">Feedback</h5>
                                                            <button type="button" class="close" data-dismiss="modal"
                                                                    aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="card card-body " style="border: 1px solid white;"
                                                                 id="viewF_${feedback.getFeedbackId()}">
                                                                <div class="row border-bottom pb-3">
                                                                    <div class="col-md-2">
                                                                        <img src="img/shoes/${feedback.getOrderDetails().getProductDetail().getProduct().getImages().get(0).getUrl()}"
                                                                             width="100px" height="100px">
                                                                    </div>
                                                                    <div class="col-md-8">
                                                                        <p class="font-weight-bold"><a class="text-dark" href="product_details?productId=${feedback.getOrderDetails().getProductDetail().getProduct().getProductId()}">${feedback.getOrderDetails().getProductDetail().getProduct().getProductName()}</a></p>
                                                                        <p>
                                                                            Color: ${feedback.getOrderDetails().getProductDetail().getColor()}
                                                                            ,
                                                                            Size: ${feedback.getOrderDetails().getProductDetail().getSize()}</p>
                                                                    </div>
                                                                </div>
                                                                <div class=" ml-5 mt-4"
                                                                     id="viewFeedback_${feedback.getFeedbackId()}">
                                                                    <div class="d-flex">
                                                                        <img src="img/user (1).png" height="35px" width="35px"
                                                                             class="mr-3">
                                                                        <div>
                                                                            <p class="py-0 my-0">${userLogin.getUsername()}</p>
                                                                            <c:forEach begin="1"
                                                                                       end="${feedback.getRating()}"
                                                                                       var="r">
                                                                                <a class="fas fa-star " value="r"
                                                                                   style="color: gold;font-size: 13px;"></a>
                                                                            </c:forEach>
                                                                            <p>${feedback.getCreatedAt()}</p>
                                                                        </div>
                                                                    </div>
                                                                    <div class="text-dark"
                                                                         style="margin-left: 50px;">${feedback.getComment()}</div>
                                                                    <div class="d-flex justify-content-end">
                                                                        <a class="btn py-0 mt-3"
                                                                           style="border: 1px solid #ff00005c;color:#ff0000bf;"
                                                                           onclick="editFeeback(${feedback.getFeedbackId()},
                                                                           ${feedback.getRating()}, ${feedback.getOrderDetails().getOrderDetailsId()},
                                                                                           '${feedback.getComment()} ')">edit</a>
                                                                    </div>
                                                                </div>
                                                                <div class="w-100" id="ratingForm_${feedback.getFeedbackId()}"
                                                                     style="display: none;">
                                                                    <div class="pt-2" style="margin-left: 260px;">
                                                                        <div class="star-wrapper d-flex">
                                                                            <c:forEach begin="1" end="5" var="i">
                                                                                <c:if test="${i <= feedback.getRating()}">
                                                                                    <a class="fas fa-star s${i} ${feedback.getOrderDetails().getOrderDetailsId()}"
                                                                                       value="${i}"
                                                                                       onclick="getRating(${i}, ${feedback.getOrderDetails().getOrderDetailsId()})"
                                                                                       style="color: gold;"></a>
                                                                                </c:if>
                                                                                <c:if test="${i >  feedback.getRating()}">
                                                                                    <a class="fas fa-star s${i} ${feedback.getOrderDetails().getOrderDetailsId()}"
                                                                                       value="${i}"
                                                                                       onclick="getRating(${i}, ${feedback.getOrderDetails().getOrderDetailsId()})"></a>
                                                                                </c:if>
                                                                            </c:forEach>
                                                                        </div>
                                                                        <script src="https://kit.fontawesome.com/5ea815c1d0.js"></script>
                                                                    </div>
                                                                    <div class=" mt-4 w-100">
                                                                        <div id="rating_1_${feedback.getOrderDetails().getOrderDetailsId()}"
                                                                             style="display: none;">
                                                                            <div>
                                                                                <div class="btn btn-light px-4"
                                                                                     style="border: 1px solid rgba(0,0,0,.09);border-radius:13px;font-size: 95%;margin-left: 75px;"
                                                                                     onclick="getComment(this, ${feedback.getOrderDetails().getOrderDetailsId()})"
                                                                                     name="rating1">Poor product quality.
                                                                                </div>
                                                                                <div class="btn btn-light px-4 ml-3"
                                                                                     style="border: 1px solid rgba(0,0,0,.09);border-radius: 13px;font-size: 95%;"
                                                                                     onclick="getComment(this, ${feedback.getOrderDetails().getOrderDetailsId()})"
                                                                                     name="rating1">Slow delivery time.
                                                                                </div>
                                                                                <div class="btn btn-light px-4 ml-3"
                                                                                     style="border: 1px solid rgba(0,0,0,.09);border-radius: 13px;font-size: 95%;"
                                                                                     onclick="getComment(this, ${feedback.getOrderDetails().getOrderDetailsId()})"
                                                                                     name="rating1">Poor service shop.
                                                                                </div>
                                                                            </div>
                                                                            <div class="w-100 d-flex justify-content-center">
                                                                                <div class="mt-4" style="width: 100%;">
                                                                                    <textarea class="form-control"
                                                                                              onchange="showMessage(this)"
                                                                                              id="comment_${feedback.getOrderDetails().getOrderDetailsId()}_rating1"
                                                                                              rows="4"
                                                                                              style="border: 1px solid rgba(0,0,0,.14);"
                                                                                              placeholder="Share what you like about this product"></textarea>

                                                                                    <div class="d-flex justify-content-between py-2">
                                                                                        <a class="btn btn-danger border px-4 text-white"
                                                                                           onclick="cancelRating(${feedback.getFeedbackId()}, '1', ${feedback.getRating()}, ${feedback.getOrderDetails().getOrderDetailsId()}, '${feedback.getComment()}')">Cancel</a>
                                                                                        <a class="btn btn-success border px-4 text-white"
                                                                                           onclick="edit(${feedback.getOrderDetails().getOrderDetailsId()}, '1',${feedback.getRating()}, ${feedback.getFeedbackId()})">Edit</a>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div id="rating_2_${feedback.getOrderDetails().getOrderDetailsId()}"
                                                                             class="w-100" style="display: none;">
                                                                            <div>
                                                                                <div class="btn btn-light px-4 "
                                                                                     style="border: 1px solid rgba(0,0,0,.09);border-radius:13px;font-size: 95%;margin-left: 75px;"
                                                                                     onclick="getComment(this, ${feedback.getOrderDetails().getOrderDetailsId()})"
                                                                                     name="rating2">Poor product quality.
                                                                                </div>
                                                                                <div class="btn btn-light px-4 ml-3"
                                                                                     style="border: 1px solid rgba(0,0,0,.09);border-radius: 13px;font-size: 95%;"
                                                                                     onclick="getComment(this, ${feedback.getOrderDetails().getOrderDetailsId()})"
                                                                                     name="rating2">Slow delivery time.
                                                                                </div>
                                                                                <div class="btn btn-light px-4 ml-3"
                                                                                     style="border: 1px solid rgba(0,0,0,.09);border-radius: 13px;font-size: 95%;"
                                                                                     onclick="getComment(this, ${feedback.getOrderDetails().getOrderDetailsId()})"
                                                                                     name="rating2">Poor service shop.
                                                                                </div>
                                                                            </div>
                                                                            <div class="w-100 d-flex justify-content-center">
                                                                                <div class="mt-4" style="width: 100%;">
                                                                                    <textarea class="form-control"
                                                                                              id="comment_${feedback.getOrderDetails().getOrderDetailsId()}_rating2"
                                                                                              rows="4"
                                                                                              style="border: 1px solid rgba(0,0,0,.14);"
                                                                                              placeholder="Share what you like about this product"></textarea>
                                                                                    <div class="d-flex justify-content-between py-2">
                                                                                        <a class="btn btn-danger border px-4 text-white"
                                                                                           onclick="cancelRating(${feedback.getFeedbackId()}, '2', ${feedback.getRating()}, ${feedback.getOrderDetails().getOrderDetailsId()}, '${feedback.getComment()}')">Cancel</a>
                                                                                        <a class="btn btn-success border px-4 text-white"
                                                                                           onclick="edit(${feedback.getOrderDetails().getOrderDetailsId()}, '2',${feedback.getRating()},${feedback.getFeedbackId()})">Edit</a>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div id="rating_3_${feedback.getOrderDetails().getOrderDetailsId()}"
                                                                             class="w-100" style="display: none;">
                                                                            <div>
                                                                                <div class="btn btn-light "
                                                                                     style="border: 1px solid rgba(0,0,0,.09);border-radius:13px;font-size: 95%;margin-left: 50px;"
                                                                                     onclick="getComment(this, ${feedback.getOrderDetails().getOrderDetailsId()})"
                                                                                     name="rating3">Product quality is
                                                                                    temporary.
                                                                                </div>
                                                                                <div class="btn btn-light px-4 ml-3"
                                                                                     style="border: 1px solid rgba(0,0,0,.09);border-radius: 13px;font-size: 95%;"
                                                                                     onclick="getComment(this, ${feedback.getOrderDetails().getOrderDetailsId()})"
                                                                                     name="rating3">Normal delivery time.
                                                                                </div>
                                                                                <div class="btn btn-light px-4 ml-3"
                                                                                     style="border: 1px solid rgba(0,0,0,.09);border-radius: 13px;font-size: 95%;"
                                                                                     onclick="getComment(this, ${feedback.getOrderDetails().getOrderDetailsId()})"
                                                                                     name="rating3">Shop serves temporarily.
                                                                                </div>
                                                                            </div>
                                                                            <div class="w-100 d-flex justify-content-center">
                                                                                <div class="mt-4" style="width: 100%;">
                                                                                    <textarea class="form-control"
                                                                                              id="comment_${feedback.getOrderDetails().getOrderDetailsId()}_rating3"
                                                                                              rows="4"
                                                                                              style="border: 1px solid rgba(0,0,0,.14);"
                                                                                              placeholder="Share what you like about this product"></textarea>

                                                                                    <div class="d-flex justify-content-between py-2">
                                                                                        <a class="btn btn-danger border px-4 text-white"
                                                                                           onclick="cancelRating(${feedback.getFeedbackId()},
                                                                                                           '3',${feedback.getRating()}, ${feedback.getOrderDetails().getOrderDetailsId()},
                                                                                                           '${feedback.getComment()} ')">Cancel</a>
                                                                                        <a class="btn btn-success border px-4 text-white"
                                                                                           onclick="edit(${feedback.getOrderDetails().getOrderDetailsId()}, '3',${feedback.getRating()}
                                                                                                   , ${feedback.getFeedbackId()})">Edit</a>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div id="rating_4_${feedback.getOrderDetails().getOrderDetailsId()}"
                                                                             class="w-100" style="display: none;">
                                                                            <div>
                                                                                <div class="btn btn-light px-4"
                                                                                     style="border: 1px solid rgba(0,0,0,.09);border-radius:13px;font-size: 95%;margin-left: 75px;"
                                                                                     onclick="getComment(this, ${feedback.getOrderDetails().getOrderDetailsId()})"
                                                                                     name="rating4">Good product quality.
                                                                                </div>
                                                                                <div class="btn btn-light px-4 ml-3"
                                                                                     style="border: 1px solid rgba(0,0,0,.09);border-radius: 13px;font-size: 95%;"
                                                                                     onclick="getComment(this, ${feedback.getOrderDetails().getOrderDetailsId()})"
                                                                                     name="rating4">Fast delivery.
                                                                                </div>
                                                                                <div class="btn btn-light px-4 ml-3"
                                                                                     style="border: 1px solid rgba(0,0,0,.09);border-radius: 13px;font-size: 95%;"
                                                                                     onclick="getComment(this, ${feedback.getOrderDetails().getOrderDetailsId()})"
                                                                                     name="rating4">Good service shop.
                                                                                </div>
                                                                            </div>
                                                                            <div class="w-100 d-flex justify-content-center">
                                                                                <div class="mt-4" style="width: 100%;">
                                                                                    <textarea class="form-control"
                                                                                              id="comment_${feedback.getOrderDetails().getOrderDetailsId()}_rating4"
                                                                                              rows="4"
                                                                                              style="border: 1px solid rgba(0,0,0,.14);"
                                                                                              placeholder="Share what you like about this product"></textarea>

                                                                                    <div class="d-flex justify-content-between py-2">
                                                                                        <a class="btn btn-danger border px-4 text-white"
                                                                                           onclick="cancelRating(${feedback.getFeedbackId()},
                                                                                                           '4',${feedback.getRating()}, ${feedback.getOrderDetails().getOrderDetailsId()},
                                                                                                           '${feedback.getComment()} ')">Cancel</a>
                                                                                        <a class="btn btn-success border px-4 text-white"
                                                                                           onclick="edit(${feedback.getOrderDetails().getOrderDetailsId()}, '4',${feedback.getRating()}
                                                                                                   , ${feedback.getFeedbackId()})">Edit</a>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div id="rating_5_${feedback.getOrderDetails().getOrderDetailsId()}"
                                                                             class="w-100" style="display: none;">
                                                                            <div>
                                                                                <div class="btn btn-light px-4"
                                                                                     style="border: 1px solid rgba(0,0,0,.09);border-radius:13px;font-size: 95%;margin-left: 75px;"
                                                                                     onclick="getComment(this, ${feedback.getOrderDetails().getOrderDetailsId()})"
                                                                                     name="rating5">Good product quality.
                                                                                </div>
                                                                                <div class="btn btn-light px-4 ml-3"
                                                                                     style="border: 1px solid rgba(0,0,0,.09);border-radius: 13px;font-size: 95%;"
                                                                                     onclick="getComment(this, ${feedback.getOrderDetails().getOrderDetailsId()})"
                                                                                     name="rating5">Fast delivery.
                                                                                </div>
                                                                                <div class="btn btn-light px-4 ml-3"
                                                                                     style="border: 1px solid rgba(0,0,0,.09);border-radius: 13px;font-size: 95%;"
                                                                                     onclick="getComment(this, ${feedback.getOrderDetails().getOrderDetailsId()})"
                                                                                     name="rating5">Good service shop.
                                                                                </div>
                                                                            </div>
                                                                            <div class="w-100 d-flex justify-content-center">
                                                                                <div class="mt-4" style="width: 100%;">
                                                                                    <textarea class="form-control"
                                                                                              id="comment_${feedback.getOrderDetails().getOrderDetailsId()}_rating5"
                                                                                              rows="4"
                                                                                              style="border: 1px solid rgba(0,0,0,.14);"
                                                                                              placeholder="Share what you like about this product"></textarea>

                                                                                    <div class="d-flex justify-content-between py-2">
                                                                                        <a class="btn btn-danger border px-4 text-white"
                                                                                           onclick="cancelRating(${feedback.getFeedbackId()},
                                                                                                           '5',${feedback.getRating()}, ${feedback.getOrderDetails().getOrderDetailsId()},
                                                                                                           '${feedback.getComment()} ')">Cancel</a>
                                                                                        <a class="btn btn-success border px-4 text-white"
                                                                                           onclick="edit(${feedback.getOrderDetails().getOrderDetailsId()}, '5',${feedback.getRating()}
                                                                                                   , ${feedback.getFeedbackId()})">Edit</a>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                        <c:if test="${feedback.getFeedbackId() ==0}">
                                            <span class="text-danger font-weight-bold text-center">No feedback on the product</span>
                                            <div class="w-100">
                                                <div class="pt-2" style="margin-left: 400px;">
                                                    <div class="star-wrapper">
                                                        <a class="fas fa-star s1 ${feedback.getOrderDetails().getOrderDetailsId()}"
                                                           value="1"
                                                           onclick="getRating('1', ${feedback.getOrderDetails().getOrderDetailsId()})"></a>
                                                        <a class="fas fa-star s2 ${feedback.getOrderDetails().getOrderDetailsId()}"
                                                           value="2"
                                                           onclick="getRating('2', ${feedback.getOrderDetails().getOrderDetailsId()})"></a>
                                                        <a class="fas fa-star s3 ${feedback.getOrderDetails().getOrderDetailsId()}"
                                                           value="3"
                                                           onclick="getRating('3', ${feedback.getOrderDetails().getOrderDetailsId()})"></a>
                                                        <a class="fas fa-star s4 ${feedback.getOrderDetails().getOrderDetailsId()}"
                                                           value="4"
                                                           onclick="getRating('4', ${feedback.getOrderDetails().getOrderDetailsId()})"></a>
                                                        <a class="fas fa-star s5 ${feedback.getOrderDetails().getOrderDetailsId()}"
                                                           value="5"
                                                           onclick="getRating('5', ${feedback.getOrderDetails().getOrderDetailsId()})"></a>
                                                    </div>
                                                    <script src="https://kit.fontawesome.com/5ea815c1d0.js"></script>
                                                </div>
                                                <div class=" mt-4 w-100">
                                                    <div id="rating_1_${feedback.getOrderDetails().getOrderDetailsId()}"
                                                         class="w-100" style="display: none;">
                                                        <div class="d-flex justify-content-center w-100">
                                                            <div class="btn btn-light"
                                                                 style="border: 1px solid rgba(0,0,0,.09);border-radius:13px;font-size: 95%;"
                                                                 onclick="getComment(this, ${feedback.getOrderDetails().getOrderDetailsId()})"
                                                                 name="rating1">Poor product quality.
                                                            </div>
                                                            <div class="btn btn-light px-4 ml-3"
                                                                 style="border: 1px solid rgba(0,0,0,.09);border-radius: 13px;font-size: 95%;"
                                                                 onclick="getComment(this, ${feedback.getOrderDetails().getOrderDetailsId()})"
                                                                 name="rating1">Slow delivery time.
                                                            </div>
                                                            <div class="btn btn-light px-4 ml-3"
                                                                 style="border: 1px solid rgba(0,0,0,.09);border-radius: 13px;font-size: 95%;"
                                                                 onclick="getComment(this, ${feedback.getOrderDetails().getOrderDetailsId()})"
                                                                 name="rating1">Poor service shop.
                                                            </div>
                                                        </div>
                                                        <div class="w-100 d-flex justify-content-center">
                                                            <div class="mt-4" style="width: 85%;">
                                                                <textarea class="form-control"
                                                                          onchange="showMessage(this)"
                                                                          id="comment_${feedback.getOrderDetails().getOrderDetailsId()}_rating1"
                                                                          rows="4"
                                                                          style="border: 1px solid rgba(0,0,0,.14);"
                                                                          placeholder="Share what you like about this product"></textarea>
                                                                <div class="d-flex justify-content-end">
                                                                    <p class="mt-2" id="message1">The limit is 100
                                                                        characters</p>
                                                                </div>
                                                                <div class="d-flex justify-content-between py-2">
                                                                    <a class="btn btn-danger border px-4 text-white"
                                                                       onclick="cancel(${feedback.getOrderDetails().getOrderDetailsId()}, '1')">Cancel</a>
                                                                    <a class="btn btn-success border px-4 text-white"
                                                                       onclick="complete(${feedback.getOrderDetails().getOrderDetailsId()}, '1')">Complete</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div id="rating_2_${feedback.getOrderDetails().getOrderDetailsId()}"
                                                         class="w-100" style="display: none;">
                                                        <div class="d-flex justify-content-center w-100">
                                                            <div class="btn btn-light "
                                                                 style="border: 1px solid rgba(0,0,0,.09);border-radius:13px;font-size: 95%;"
                                                                 onclick="getComment(this, ${feedback.getOrderDetails().getOrderDetailsId()})"
                                                                 name="rating2">Poor product quality.
                                                            </div>
                                                            <div class="btn btn-light px-4 ml-3"
                                                                 style="border: 1px solid rgba(0,0,0,.09);border-radius: 13px;font-size: 95%;"
                                                                 onclick="getComment(this, ${feedback.getOrderDetails().getOrderDetailsId()})"
                                                                 name="rating2">Slow delivery time.
                                                            </div>
                                                            <div class="btn btn-light px-4 ml-3"
                                                                 style="border: 1px solid rgba(0,0,0,.09);border-radius: 13px;font-size: 95%;"
                                                                 onclick="getComment(this, ${feedback.getOrderDetails().getOrderDetailsId()})"
                                                                 name="rating2">Poor service shop.
                                                            </div>
                                                        </div>
                                                        <div class="w-100 d-flex justify-content-center">
                                                            <div class="mt-4" style="width: 85%;">
                                                                <textarea class="form-control"
                                                                          id="comment_${feedback.getOrderDetails().getOrderDetailsId()}_rating2"
                                                                          rows="4"
                                                                          style="border: 1px solid rgba(0,0,0,.14);"
                                                                          placeholder="Share what you like about this product"></textarea>

                                                                <div class="d-flex justify-content-between py-2">
                                                                    <a class="btn btn-danger border px-4 text-white"
                                                                       onclick="cancel(${feedback.getOrderDetails().getOrderDetailsId()}, '2')">Cancel</a>
                                                                    <a class="btn btn-success border px-4 text-white"
                                                                       onclick="complete(${feedback.getOrderDetails().getOrderDetailsId()}, '2')">Complete</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div id="rating_3_${feedback.getOrderDetails().getOrderDetailsId()}"
                                                         class="w-100" style="display: none;">
                                                        <div class="d-flex justify-content-center w-100">
                                                            <div class="btn btn-light "
                                                                 style="border: 1px solid rgba(0,0,0,.09);border-radius:13px;font-size: 95%;"
                                                                 onclick="getComment(this, ${feedback.getOrderDetails().getOrderDetailsId()})"
                                                                 name="rating3">Product quality is
                                                                temporary.
                                                            </div>
                                                            <div class="btn btn-light px-4 ml-3"
                                                                 style="border: 1px solid rgba(0,0,0,.09);border-radius: 13px;font-size: 95%;"
                                                                 onclick="getComment(this, ${feedback.getOrderDetails().getOrderDetailsId()})"
                                                                 name="rating3">Normal delivery time.
                                                            </div>
                                                            <div class="btn btn-light px-4 ml-3"
                                                                 style="border: 1px solid rgba(0,0,0,.09);border-radius: 13px;font-size: 95%;"
                                                                 onclick="getComment(this, ${feedback.getOrderDetails().getOrderDetailsId()})"
                                                                 name="rating3">Shop serves
                                                                temporarily.
                                                            </div>
                                                        </div>
                                                        <div class="w-100 d-flex justify-content-center">
                                                            <div class="mt-4" style="width: 85%;">
                                                                <textarea class="form-control"
                                                                          id="comment_${feedback.getOrderDetails().getOrderDetailsId()}_rating3"
                                                                          rows="4"
                                                                          style="border: 1px solid rgba(0,0,0,.14);"
                                                                          placeholder="Share what you like about this product"></textarea>

                                                                <div class="d-flex justify-content-between py-2">
                                                                    <a class="btn btn-danger border px-5 text-white"
                                                                       onclick="cancel(${feedback.getOrderDetails().getOrderDetailsId()}, '3')">Cancel</a>
                                                                    <a class="btn btn-success border px-5 text-white"
                                                                       onclick="complete(${feedback.getOrderDetails().getOrderDetailsId()}, '3')">Complete</a>
                                                                </div>


                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div id="rating_4_${feedback.getOrderDetails().getOrderDetailsId()}"
                                                         class="w-100" style="display: none;">
                                                        <div class="d-flex justify-content-center w-100">
                                                            <div class="btn btn-light "
                                                                 style="border: 1px solid rgba(0,0,0,.09);border-radius:13px;font-size: 95%;"
                                                                 onclick="getComment(this, ${feedback.getOrderDetails().getOrderDetailsId()})"
                                                                 name="rating4">Good product quality.
                                                            </div>
                                                            <div class="btn btn-light px-4 ml-3"
                                                                 style="border: 1px solid rgba(0,0,0,.09);border-radius: 13px;font-size: 95%;"
                                                                 onclick="getComment(this, ${feedback.getOrderDetails().getOrderDetailsId()})"
                                                                 name="rating4">Fast delivery.
                                                            </div>
                                                            <div class="btn btn-light px-4 ml-3"
                                                                 style="border: 1px solid rgba(0,0,0,.09);border-radius: 13px;font-size: 95%;"
                                                                 onclick="getComment(this, ${feedback.getOrderDetails().getOrderDetailsId()})"
                                                                 name="rating4">Good service shop.
                                                            </div>
                                                        </div>
                                                        <div class="w-100 d-flex justify-content-center">
                                                            <div class="mt-4" style="width: 85%;">
                                                                <textarea class="form-control"
                                                                          id="comment_${feedback.getOrderDetails().getOrderDetailsId()}_rating4"
                                                                          rows="4"
                                                                          style="border: 1px solid rgba(0,0,0,.14);"
                                                                          placeholder="Share what you like about this product"></textarea>

                                                                <div class="d-flex justify-content-between py-2">
                                                                    <a class="btn btn-danger border px-5 text-white"
                                                                       onclick="cancel(${feedback.getOrderDetails().getOrderDetailsId()}, '4')">Cancel</a>
                                                                    <a class="btn btn-success border px-5 text-white"
                                                                       onclick="complete(${feedback.getOrderDetails().getOrderDetailsId()}, '4')">Complete</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div id="rating_5_${feedback.getOrderDetails().getOrderDetailsId()}"
                                                         class="w-100" style="display: none;">
                                                        <div class="d-flex justify-content-center w-100">
                                                            <div class="btn btn-light "
                                                                 style="border: 1px solid rgba(0,0,0,.09);border-radius:13px;font-size: 95%;"
                                                                 onclick="getComment(this, ${feedback.getOrderDetails().getOrderDetailsId()})"
                                                                 name="rating5">Good product quality.
                                                            </div>
                                                            <div class="btn btn-light px-4 ml-3"
                                                                 style="border: 1px solid rgba(0,0,0,.09);border-radius: 13px;font-size: 95%;"
                                                                 onclick="getComment(this, ${feedback.getOrderDetails().getOrderDetailsId()})"
                                                                 name="rating5">Fast delivery.
                                                            </div>
                                                            <div class="btn btn-light px-4 ml-3"
                                                                 style="border: 1px solid rgba(0,0,0,.09);border-radius: 13px;font-size: 95%;"
                                                                 onclick="getComment(this, ${feedback.getOrderDetails().getOrderDetailsId()})"
                                                                 name="rating5">Good service shop.
                                                            </div>
                                                        </div>
                                                        <div class="w-100 d-flex justify-content-center">
                                                            <div class="mt-4" style="width: 85%;">
                                                                <textarea class="form-control"
                                                                          id="comment_${feedback.getOrderDetails().getOrderDetailsId()}_rating5"
                                                                          rows="4"
                                                                          style="border: 1px solid rgba(0,0,0,.14);"
                                                                          placeholder="Share what you like about this product"></textarea>

                                                                <div class="d-flex justify-content-between py-2">
                                                                    <a class="btn btn-danger border px-5 text-white"
                                                                       onclick="cancel(${feedback.getOrderDetails().getOrderDetailsId()}, '5')">Cancel</a>
                                                                    <a class="btn btn-success border px-5 text-white"
                                                                       onclick="complete(${feedback.getOrderDetails().getOrderDetailsId()}, '5')">Complete</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </div>
                                </c:forEach>
                                <div class="d-flex justify-content-end mt-3">
                                    <!--<a class="btn btn-light border text-dark px-4 mt-3" href="Shop">Back to shop</a>-->
                                    <a href="Shop" class="genric-btn light border text-warning " style="font-size: 14px;">Back to shop<span class="lnr lnr-arrow-left mx-2 font-weight-bold"></span></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </section>
        <!-- End Banner Area -->
        <%@include file="../include/Footer.jsp" %>

        <script>
            function getRating(a, orderDetailsId) {

                // get element has class name is orderDetailsId
                const element = document.getElementsByClassName(orderDetailsId);
                // for
                for (let i = 0; i < element.length; i++) {
                    // if i <= a change color gold
                    if (i < a) {
                        element[i].style.color = "gold";
                    } else {
                        element[i].style.color = "rgb(0 0 0 / 10%)";
                    }
                }
                // for loop from 1 to 5
                for (let b = 1; b <= 5; b++) {
                    let id = 'rating_' + b + '_' + orderDetailsId;
                    if (a == b) {
                        $('#' + id).css('display', 'block');
                    } else {
                        $('#' + id).css('display', 'none');
                    }
                }

            }

            function getComment(value, orderDetailsId) {
                // get attribute name
                const name = value.getAttribute("name");
                // change background color of this
                if (value.style.backgroundColor === "gold") {
                    value.style.backgroundColor = "rgb(0 0 0 / 10%)";
                    document.getElementById('comment_' + orderDetailsId + '_' + name).value = document.getElementById('comment_' + orderDetailsId + '_' + name).value.replace(value.innerHTML.trim(), "");
                } else {
                    value.style.backgroundColor = "gold";
                    document.getElementById('comment_' + orderDetailsId + '_' + name).value = document.getElementById('comment_' + orderDetailsId + '_' + name).value.trim() + "" + value.innerHTML.trim();
                    //                    console.log(document.getElementById('comment_' + orderDetailsId + '_' + name).value);

                }

            }

            function cancel(orderDetailsId, rating) {
                // reload all value of rating
                var d = document.getElementById('rating_' + rating + '_' + orderDetailsId);
                d.style.display = "none";
                document.getElementById('comment_' + orderDetailsId + '_rating' + rating).value = "";
                // get element by class name orderDetailsId
                var element = document.getElementsByClassName(orderDetailsId);
                // for
                for (var i = 0; i < element.length; i++) {
                    // if i <= a change color gold
                    element[i].style.color = "rgb(0 0 0 / 10%)";
                }
                // get element by name rating and set value = 0
                var element = document.getElementsByName('rating' + rating);
                for (var i = 0; i < element.length; i++) {
                    element[i].style.backgroundColor = "rgb(0 0 0 / 10%)";
                }
            }

            function complete(orderDetailsId, rating) {
                var comment = document.getElementById('comment_' + orderDetailsId + '_rating' + rating).value;
                $.ajax({
                    url: "feedback_controller",
                    method: "POST",
                    data: {
                        action: "complete",
                        orderDetailsId: orderDetailsId,
                        rating: rating,
                        comment: comment.trim(),
                        orderId: ${orderId},
                        customerId: ${customer}
                    },
                    success: function () {
                        swal({
                            title: "Success",
                            text: "Thank you for your feedback",
                            icon: "success",
                            button: "OK",
                        }).then(function () {
                            location.reload();
                        });
                    },
                    error: function () {
                        swal({
                            title: "Error",
                            text: "Something went wrong",
                            icon: "error",
                            button: "OK",
                        });
                    }
                });
            }

            function editFeeback(feedbackId, rating, orderDetailsId, comment) {
                document.getElementById('viewFeedback_' + feedbackId).style.display = "none";
                document.getElementById('ratingForm_' + feedbackId).style.display = "block";
                document.getElementById('rating_' + rating + '_' + orderDetailsId).style.display = "block";
                document.getElementById('comment_' + orderDetailsId + '_rating' + rating).value = comment;
            }

            function cancelRating(feedbackId, rating1, rating2, orderDetailsId, comment) {
                document.getElementById('viewFeedback_' + feedbackId).style.display = "block";
                document.getElementById('ratingForm_' + feedbackId).style.display = "none";
                document.getElementById('comment_' + orderDetailsId + '_rating' + rating1).value = "";
                document.getElementById('comment_' + orderDetailsId + '_rating' + rating2).value = comment;
                document.getElementById('rating_' + rating1 + '_' + orderDetailsId).style.display = "none";
                document.getElementById('rating_' + rating2 + '_' + orderDetailsId).style.display = "block";
                console.log(rating1);
                console.log(rating2);
                var element = document.getElementsByClassName(orderDetailsId);
                for (var i = 0; i < element.length; i++) {
                    if (i < rating2) {
                        element[i].style.color = "gold";
                    } else {
                        element[i].style.color = "rgb(0 0 0 / 10%)";
                    }
                }
            }

            function edit(orderDetailsId, newRating, oldRating, feedbackId) {
                var newComment = document.getElementById('comment_' + orderDetailsId + '_rating' + newRating).value;
                $.ajax({
                    url: "feedback_controller",
                    method: "POST",
                    data: {
                        action: "edit",
                        rating: newRating,
                        comment: newComment,
                        feedbackId: feedbackId
                    },
                    success: function () {
                        swal({
                            title: "Success",
                            text: "Edit feedback successfully !",
                            icon: "success",
                            button: "OK",
                        }).then(function () {
                            location.reload();
                        });
                    },
                    error: function () {
                        swal({
                            title: "Error",
                            text: "Something went wrong",
                            icon: "error",
                            button: "OK",
                        });
                    }
                });
            }
        </script>
    </body>
</html>
