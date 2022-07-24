<%-- 
    Document   : Profile
    Created on : Jun 8, 2022, 12:35:43 AM
    Author     : vietd
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="../include/Head.jsp" %>
    </head>

    <body>
        <%@include file="../include/Header.jsp" %>
        <!-- Start Banner Area -->
        <section class="banner-area organic-breadcrumb">
            <div class="container">
                <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                    <div class="col-first">
                        <h1>Contact Us</h1>
                        <nav class="d-flex align-items-center">
                            <a href="index.html">Home<span class="lnr lnr-arrow-right"></span></a>
                            <a href="category.html">Profile</a>
                        </nav>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Banner Area -->

        <!--================Contact Area =================-->
        <div class="container">
            <div class="main-body">
                <!-- Breadcrumb -->
                <nav aria-label="breadcrumb" class="main-breadcrumb" style="background-color: white;">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="HomePage.jsp" class="text-dark">Home</a></li>
                        <li class="breadcrumb-item"><a href="" class="text-dark">User</a></li>
                        <li class="breadcrumb-item active " style="color: #ffb901;" aria-current="">User
                            Profile</li>
                    </ol>
                </nav>
                <!-- /Breadcrumb -->

                <div class="row gutters-sm">
                    <div class="col-md-4 mb-3">
                        <div class="card pb-3">
                            <div class="card-body">
                                <div class="d-flex flex-column align-items-center text-center">
                                    <img src="https://bootdey.com/img/Content/avatar/avatar7.png"
                                         alt="Admin" class="rounded-circle" width="150">
                                    <div class="mt-3">
                                        <h4>${account.getUsername()}</h4>
                                        <h4 class="mt-3">${profile.getCustomerName()}</h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card mt-3 pb-3">
                            <ul class="list-group list-group-flush">
                                <li data-toggle="collapse" data-target="#demo"
                                    class="list-group-item d-flex justify-content-between align-items-center flex-wrap mt-4">
                                    <h6 class="mb-0"><img alt="" src="img/resume.png" height="24px"
                                                          width="24px" class="mr-3">
                                        My Account</h6>

                                </li>
                                <div id="demo" class="collapse">
                                    <p class="title my-0"><img alt="" src="img/user.png"><a href="./profile"
                                                                                            class="text-dark">Profile</a>
                                    </p>
<!--                                    <p class="title my-0"><img alt="" src="img/map.png"><a
                                            href="./profile?action=show_address"
                                            class="text-dark">Addresses</a>
                                    </p>-->
                                    <p class="title my-0"><img alt="" src="img/reset-password.png"><a
                                            href="./Change_password" class="text-dark">Change
                                            Password</a>
                                    </p>
                                </div>
                                <li
                                    class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                    <h6 class="mb-0"><img alt="" src="img/order.png" height="24px"
                                                          width="24px" class="mr-3"><a href="./ListOrder?cusid=${cid}"
                                                          class="text-dark">My Orders</a></h6>
                                </li>
                                <li
                                    class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                    <h6 class="mb-0"><img alt="" src="img/notification.png" height="24px"
                                                          width="24px" class="mr-3"><a href="./list_orders"
                                                          class="text-dark">Notification</a></h6>
                                </li>
                            </ul>


                        </div>
                    </div>
                    <div class="col-lg-8">
                        <c:if test="${action == null}">
                            <form method="post">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="row mt-2 mx-2  ">
                                            <h6 class="mb-3" style="font-size: 160%;">MY PROFILE</h6>
                                        </div>
                                        <div class="row mb-4  mx-2 border-bottom ">
                                            <p>Manage profile information for account security</p>
                                        </div>
                                        <div class="row mb-4 ">
                                            <div class="col-sm-3">
                                                <h6 class="mb-0 ml-4 mt-2">User Name</h6>
                                            </div>
                                            <div class="col-sm-9 text-secondary">
                                                <input type="text" class="form-control"
                                                       value="${account.getUsername().trim()}" disabled>
                                            </div>
                                        </div>
                                        <div class="row mb-4 ">
                                            <div class="col-sm-3">
                                                <h6 class="mb-0 ml-4 mt-2">Full Name</h6>
                                            </div>
                                            <div class="col-sm-9 text-secondary">
                                                <input type="text" class="form-control"
                                                       value="${profile.getCustomerName().trim()}" disabled>
                                            </div>
                                        </div>
                                        <div class="row mb-4">
                                            <div class="col-sm-3">
                                                <h6 class="mb-0 ml-4 mt-2">Email</h6>
                                            </div>
                                            <div class="col-sm-9 text-secondary">
                                                <input type="email" class="form-control"
                                                       value="${account.getEmail().trim()}" disabled>
                                            </div>
                                        </div>
                                        <div class="row mb-4">
                                            <div class="col-sm-3">
                                                <h6 class="mb-0 ml-4 mt-2">Phone</h6>
                                            </div>
                                            <div class="col-sm-9 text-secondary">
                                                <input type="tel" class="form-control"
                                                       value="${profile.getPhoneNumber().trim()}" disabled>
                                            </div>
                                        </div>
                                        <div class="row d-flex justify-content-between mt-2">
                                            <c:if test="${result == 'success'}">
                                                <div class="mt-3 text-success "
                                                     style="font-size: 120%;margin-left: 35px;">${message}</div>
                                            </c:if>
                                            <c:if test="${result != 'success'}">
                                                <div class="mt-3 text-danger "
                                                     style="font-size: 120%;margin-left: 35px;">${message}</div>
                                            </c:if>
                                            <!-- Trigger the modal with a button -->
                                            <div class="modal fade" id="modalLoginForm" tabindex="-1"
                                                 role="dialog" aria-labelledby="myModalLabel"
                                                 aria-hidden="true">
                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header text-center" >
                                                            <h4 class="modal-title w-100 font-weight-bold">
                                                                Edit Profile</h4>
                                                            <button type="button" class="close"
                                                                    data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <form method="post">
                                                            <div class="modal-body mx-3">
                                                                <div class="md-form mb-4">
                                                                    <label data-error="wrong"
                                                                           data-success="right"
                                                                           for="defaultForm-email">Full
                                                                        Name</label>
                                                                    <input type="text"
                                                                           id="defaultForm-email"
                                                                           class="form-control validate"
                                                                           name="name"
                                                                           value="${profile.getCustomerName().trim()}" required="">
                                                                </div>
                                                                <div class="md-form mb-4">
                                                                    <label data-error="wrong"
                                                                           data-success="right"
                                                                           for="defaultForm-email">Email</label>
                                                                    <input type="tel" id="defaultForm-email"
                                                                           class="form-control validate"
                                                                           value="${account.getEmail().trim()}" disabled>
                                                                </div>
                                                                <div class="md-form mb-4">
                                                                    <label data-error="wrong"
                                                                           data-success="right"
                                                                           for="defaultForm-pass">Phone
                                                                        Number</label>
                                                                    <input type="text" 
                                                                           class="form-control validate"
                                                                           name="phone"
                                                                           value="${profile.getPhoneNumber().trim()}" id="defaultForm-pass">
                                                                    <br>
                                                                </div>

                                                            </div>
                                                            <div
                                                                class="modal-footer d-flex justify-content-end">
                                                                <button
                                                                    class="btn btn-warning">Edit</button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                            <div>
                                                <a href="" class="btn btn-warning mb-5"
                                                   style="margin-right: 30px;" data-toggle="modal"
                                                   data-target="#modalLoginForm">Edit profile</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </c:if>
                        <c:if test="${action == 'show_address'}">
                            <div class="card">
                                <div class="row mt-4 mx-2 ml-4 ">
                                    <h6 class="mb-3" style="font-size: 160%;">MY ADDRESSES</h6>
                                </div>
                                <div class="row mb-1 mx-2 border-bottom ml-4">
                                    <p>You can edit the address information to make the delivery faster</p>
                                </div>
                                <div class="mb-2">
                                    <c:if test="${result == 'success'}">
                                        <div class="mt-3 text-success "
                                             style="font-size: 120%;margin-left: 35px;">${message}</div>
                                    </c:if>
                                    <c:if test="${result != 'success'}">
                                        <div class="mt-3 text-danger "
                                             style="font-size: 120%;margin-left: 35px;">${message}</div>
                                    </c:if>
                                </div>

                                <c:if test="${profile.getAddresses().size() == 0}">
                                    <div class="d-flex justify-content-center">
                                        <h6>Sorry, you don't have an address yet!</h6>
                                    </div>
                                    <div class="d-flex justify-content-center">
                                        <p>Please add a new address so that we can deliver to you as soon as possible.</p>
                                    </div>
                                </c:if>
                                <c:if test="${profile.getAddresses().size() > 0}">
                                    <c:forEach items="${profile.getAddresses()}" var="i">
                                        <div class="container padding-bottom-3x mb-2">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="padding-top-2x mt-2 hidden-lg-up"></div>
                                                    <!-- Messages-->
                                                    <div class="comment border p-3 mb-3 border-radius-10">
                                                        <div class="comment-body">
                                                            <div class="row ">
                                                                <div class="col md-3" style="font-size: 110%;">
                                                                    Full Name</div>
                                                                <div class="col-md-9" style="font-size: 110%;">
                                                                    ${i.getCustomerName()}</div>
                                                            </div>
                                                            <div class="row mt-3">
                                                                <div class="col md-3" style="font-size: 110%;">
                                                                    Phone Number</div>
                                                                <div class="col-md-9" style="font-size: 110%;">
                                                                    ${i.getPhoneNumber()}</div>
                                                            </div>
                                                            <div class="row mt-3">
                                                                <div class="col md-3" style="font-size: 110%;">
                                                                    Address</div>
                                                                <div class="col-md-9" style="font-size: 110%;">
                                                                    ${i.getAddress()}</div>
                                                            </div>
                                                            <div class="row mt-0 d-flex justify-content-end">
                                                                <div>
                                                                    <div class="modal fade" id="modalEditForm${i.getCustomerAddressId()}" tabindex="-1" role="dialog"
                                                                         aria-labelledby="myModalLabel" aria-hidden="true">
                                                                        <div class="modal-dialog" role="document">
                                                                            <div class="modal-content">
                                                                                <div class="modal-header text-center">
                                                                                    <h4 class="modal-title w-100 font-weight-bold">Edit Address</h4>
                                                                                    <button type="button" class="close" data-dismiss="modal"
                                                                                            aria-label="Close">
                                                                                        <span aria-hidden="true">&times;</span>
                                                                                    </button>
                                                                                </div>
                                                                                <form method="post" action="address_process?keyword=edit&id=${i.getCustomerAddressId()}">
                                                                                    <div class="modal-body mx-3">
                                                                                        <div class="md-form mb-5">
                                                                                            <label data-error="wrong" data-success="right" for="defaultForm-email">Full Name</label>
                                                                                            <input placeholder="FullName" type="text"
                                                                                                   id="defaultForm-email"
                                                                                                   class="form-control validate" name="fullname" value="${i.getCustomerName()}">
                                                                                        </div>
                                                                                        <div class="md-form mb-5">
                                                                                            <label data-error="wrong" data-success="right" for="defaultForm-email">Phone Number</label>
                                                                                            <input type="tel" id="defaultForm-email"
                                                                                                   class="form-control validate" name="phonenumber"
                                                                                                   placeholder="Phone Number" value=" ${i.getPhoneNumber()}">
                                                                                        </div>
                                                                                        <div class="md-form mb-4">
                                                                                            <label data-error="wrong" data-success="right" for="defaultForm-email">Address</label>
                                                                                            <input type="text" id="defaultForm-pass"
                                                                                                   class="form-control validate" name="address"
                                                                                                   placeholder="Province/City , County/District, Ward/Commune" value=" ${i.getAddress()}">
                                                                                        </div>

                                                                                    </div>
                                                                                    <div class="modal-footer d-flex justify-content-end">
                                                                                        <button class="btn btn-warning">Edit</button>
                                                                                    </div>
                                                                                </form>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="text-center">
                                                                        <a href="" class="btn btn-default " 
                                                                           data-toggle="modal" data-target="#modalEditForm${i.getCustomerAddressId()}"><button class="btn btn-link text-dark px-3 ">Edit</button></a>
                                                                    </div>
                                                                </div>

                                                                <div>
                                                                    <!-- Button trigger modal -->
                                                                    <button type="button" class="btn btn-link text-dark mt-2 mx-3 px-2" data-toggle="modal" data-target="#modalDeleteAddress${i.getCustomerAddressId()}">
                                                                        Delete
                                                                    </button>

                                                                    <!-- Modal -->
                                                                    <div class="modal fade" id="modalDeleteAddress${i.getCustomerAddressId()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                                        <div class="modal-dialog" role="document">
                                                                            <div class="modal-content">
                                                                                <div class="modal-header">
                                                                                    <h5 class="modal-title" id="exampleModalLabel">Delete Address</h5>
                                                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                                        <span aria-hidden="true">&times;</span>
                                                                                    </button>
                                                                                </div>
                                                                                <div class="modal-body">
                                                                                    Do you want to delete this address?
                                                                                </div>
                                                                                <div class="modal-footer">
                                                                                    <button type="button" class="btn btn-default text-dark" data-dismiss="modal">Cancel</button>
                                                                                    <button type="button" class="btn btn-default text-dark"><a class="text-dark" href="address_process?keyword=delete&id=${i.getCustomerAddressId()}">Delete</a></button>
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
                                    </c:forEach>
                                </c:if>

                                <div class="row d-flex justify-content-end mt-2">
                                    <!-- Trigger the modal with a button -->
                                    <div class="modal fade" id="modalLoginForm" tabindex="-1" role="dialog"
                                         aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header text-center">
                                                    <h4 class="modal-title w-100 font-weight-bold">New
                                                        Address</h4>
                                                    <button type="button" class="close" data-dismiss="modal"
                                                            aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <form action="address_process?keyword=add" method="post">
                                                    <div class="modal-body mx-3">
                                                        <div class="md-form mb-5">
                                                            <!--<label data-error="wrong" data-success="right" for="defaultForm-email">Full Name</label>-->
                                                            <input placeholder="FullName" type="text"
                                                                   id="defaultForm-email"
                                                                   class="form-control validate" name="fullname" required="">
                                                        </div>
                                                        <div class="md-form mb-5">
                                                            <input type="tel" id="defaultForm-email"
                                                                   class="form-control validate" name="phonenumber"
                                                                   placeholder="Phone Number" required="">
                                                        </div>
                                                        <div class="md-form mb-4">
                                                            <input type="text" id="defaultForm-pass"
                                                                   class="form-control validate" name="address"
                                                                   placeholder="Province/City , County/District, Ward/Commune" required="">
                                                        </div>

                                                    </div>
                                                    <div class="modal-footer d-flex justify-content-end">
                                                        <button class="btn btn-warning">Submit</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="d-flex justify-content-end">
                                        <a href="" class="btn btn-warning mb-5 py-2" style="margin-right: 30px;"
                                           data-toggle="modal" data-target="#modalLoginForm">Add new address</a>
                                    </div>
                                </div>

                            </div>

                        </c:if>

                    </div>


                </div>
            </div>

        </div>
        <!--================Contact Area =================-->

        <style type="text/css">
            body {
                margin-top: 20px;
                color: #1a202c;
                text-align: left;
                background-color: #e2e8f0;
            }

            .main-body {
                padding: 15px;
            }

            .card {
                box-shadow: 0 1px 3px 0 rgba(0, 0, 0, .1), 0 1px 2px 0 rgba(0, 0, 0, .06);
            }

            .card {
                position: relative;
                display: flex;
                flex-direction: column;
                min-width: 0;
                word-wrap: break-word;
                background-color: #fff;
                background-clip: border-box;
                border: 0 solid rgba(0, 0, 0, .125);
                border-radius: .25rem;
            }

            .card-body {
                flex: 1 1 auto;
                min-height: 1px;
                padding: 1rem;
            }

            .gutters-sm {
                margin-right: -8px;
                margin-left: -8px;
            }

            .gutters-sm>.col,
            .gutters-sm>[class*=col-] {
                padding-right: 8px;
                padding-left: 8px;
            }

            .mb-3,
            .my-3 {
                margin-bottom: 1rem !important;
            }

            .bg-gray-300 {
                background-color: #e2e8f0;
            }

            .h-100 {
                height: 100% !important;
            }

            .shadow-none {
                box-shadow: none !important;
            }

            .title:hover {
                padding-left: 10px;
                background-color: #eceef3;
            }

            .title>a {
                font-size: 17px;
            }

            .title {
                padding-top: 10px;
                padding-bottom: 10px;

            }


            .title>img {
                height: 24px;
                width: 24px;
                margin-left: 80px;
                margin-right: 20px;
                ;
            }
        </style>

        <%@include file="../include/Footer.jsp" %>

    </body>

</html>

