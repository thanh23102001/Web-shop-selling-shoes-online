
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Employee Dashboard - Orders</title>

        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/bootstrap.css">

        <link rel="stylesheet" href="assets/vendors/simple-datatables/style.css">
        
        <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/datetime/1.1.2/css/dataTables.dateTime.min.css">

        <link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
        <link rel="stylesheet" href="assets/css/app.css">
        <link rel="shortcut icon" href="assets/images/favicon.svg" type="image/x-icon">
        
    </head>

    <body>
        <div id="app">
            <div id="sidebar" class="active">
                <div class="sidebar-wrapper active">
                    <div class="sidebar-header">
                        <div class="d-flex justify-content-between">
                            <div class="logo">
                                <a href="Employee"><img src="assets/images/logo/logo.png" alt="Logo" style="height: 150px"></a>
                            </div>
                            <div class="toggler">
                                <a href="#" class="sidebar-hide d-xl-none d-block"><i class="bi bi-x bi-middle"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="sidebar-menu">
                        <ul class="menu">
                            <li class="sidebar-title">Menu</li>

                            <li class="sidebar-item ">
                                <a href="Employee" class='sidebar-link'>
                                    <i class="bi bi-grid-fill"></i>
                                    <span>Dashboard</span>
                                </a>
                            </li>

                            <li class="sidebar-item  has-sub ">
                                <a href="#" class='sidebar-link'>
                                    <i class="bi bi-stack"></i>
                                    <span>Catalog</span>
                                </a>
                                <ul class="submenu ">
                                    <li class="submenu-item ">
                                        <a href="EmployeeManageProducts">Products</a>
                                    </li>
                                    <li class="submenu-item ">
                                        <a href="EmployeeManageCategories">Categories</a>
                                    </li>
                                    <li class="submenu-item ">
                                        <a href="EmployeeManageBrands">Brands</a>
                                    </li>
                                </ul>
                            </li>

                            <li class="sidebar-item  has-sub active">
                                <a href="#" class='sidebar-link'>
                                    <i class="bi bi-file-earmark-spreadsheet-fill"></i>
                                    <span>Orders</span>
                                </a>
                                <ul class="submenu active">
                                    <li class="submenu-item active">
                                        <a href="EmployeeViewOrders">Orders list</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
                </div>
            </div>
            <div id="main">
                <header class="mb-3">
                    <a href="#" class="burger-btn d-block d-xl-none">
                        <i class="bi bi-justify fs-3"></i>
                    </a>
                </header>

                <div class="page-heading">
                    <div class="page-title">
                        <div class="row">
                            <div class="col-12 col-md-6 order-md-1 order-last">
                                <h3>Orders</h3>
                                <p class="text-subtitle text-muted">Orders list</p>
                            </div>
                            <div class="col-12 col-md-6 order-md-2 order-first">
                                <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Catalog - Products</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>

                    <section class="section">
                        <style>
                            @import url('https://fonts.googleapis.com/css?family=Montserrat:400,600,700&display=swap');

                            *{
                                list-style: none;
                                -webkit-box-sizing: border-box;
                                box-sizing: border-box;
                            }

                            .wrapper{
                                font-size: 13px;
                                height: 100%;
                                background: #fff;
                                margin: 15px auto 0;
                            }

                            .wrapper .title{
                                padding: 30px 20px;
                                text-align: center;
                                font-size: 24px;
                                font-weight: 700;
                                border-bottom: 1px solid #ebedec;
                            }

                            .wrapper .tabs_wrap{
                                padding: 5px;
                                border-bottom: 1px solid #ebedec;
                            }

                            .wrapper .tabs_wrap ul{
                                display: -webkit-box;
                                display: -ms-flexbox;
                                display: flex;
                                -webkit-box-pack: center;
                                -ms-flex-pack: center;
                                justify-content: center;
                            }

                            .wrapper .tabs_wrap ul li{
                                width: 150px;
                                text-align: center;
                                background: #6c757d;
                                border-right: 1px solid #c1c4c9;
                                padding: 13px 15px;
                                cursor: pointer;
                                -webkit-transition: all 0.2s ease;
                                -o-transition: all 0.2s ease;
                                transition: all 0.2s ease;
                            }

                            .wrapper .tabs_wrap ul li:first-child{
                                border-top-left-radius: 25px;
                                border-bottom-left-radius: 25px;
                            }

                            .wrapper .tabs_wrap ul li:last-child{
                                border-right: 0px;
                                border-top-right-radius: 25px;
                                border-bottom-right-radius: 25px;
                            }

                            .head-all {
                                color: #ffffff;
                            }

                            .head-pending {
                                color: #ffffcc;
                            }

                            .head-confirmed {
                                color: #ccffff;
                            }

                            .head-completed {
                                color: #ccffcc;
                            }

                            .head-canceled {
                                color: #ffcccc;
                            }

                            .wrapper .tabs_wrap ul li:hover,
                            .wrapper .tabs_wrap ul li.active{
                                background: #f0f0f0;
                                color: #6c757d;
                            }

                            .wrapper .container .item_wrap{
                                /*padding: 10px 20px;*/
                                border-bottom: 1px solid #ebedec;
                                cursor: pointer;
                            }

                            .wrapper .container .item{
                                position: relative;
                                display: -webkit-box;
                                display: -ms-flexbox;
                                display: flex;
                                -webkit-box-align: center;
                                -ms-flex-align: center;
                                align-items: center;
                                -webkit-box-pack: justify;
                                -ms-flex-pack: justify;
                                justify-content: space-between;
                            }

                            .item_wrap .item .item_left{
                                display: -webkit-box;
                                display: -ms-flexbox;
                                display: flex;
                                -webkit-box-align: center;
                                -ms-flex-align: center;
                                align-items: center;
                            }

                            .item_wrap .item_left img{
                                width: 70px;
                                height: 70px;
                                display: block;
                            }

                            .item_wrap .item_left .data{
                                /*margin-left: 20px;*/
                            }

                            .item_wrap .item_left .data .name{
                                font-weight: 600;
                            }

                            .item_wrap .item_left .data .distance{
                                color: #7f8b9b;
                                font-size: 14px;
                                margin-top: 3px;
                            }

                            .item_wrap .item_right .status{
                                position: relative;
                                color: #77818d;
                            }

                            .item_wrap .item_right .status:before{
                                content: "";
                                position: absolute;
                                top: 5px;
                                left: -12px;
                                width: 8px;
                                height: 8px;
                                border-radius: 50%;
                                background: #b3bbc8;
                            }

                            .item_wrap.offline .item_right .status{
                                color: #b3bbc8; 
                            }

                            .item_wrap.online .item_right .status:before{
                                background: #7fc469;
                            }
                            
                            /*Table css*/
                            .styled-table {
                                border-collapse: collapse;
                                margin: 0;

                                font-size: 0.9em;
                                font-family: sans-serif;
                                box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
                            }

                            .styled-table thead{
                                background-color: #ff9900;
                                color: #ffffff;
                                text-align: left;
                            }

                            .styled-table th,
                            .styled-table td {
                                padding: 12px 15px;
                            }


                            .styled-table tbody tr:nth-of-type(even) {
                                background-color: #f3f3f3;
                            }
                        </style>
                        <div class="wrapper">
                            <div class="tabs_wrap">
                                <ul id="statusList">
                                    <li data-tabs="allstatuses" class="head-all"><svg class="bi svg-inline--fa fa-align-justify fa-w-14 fa-fw select-all" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="align-justify" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" data-fa-i2svg=""><path fill="currentColor" d="M432 416H16a16 16 0 0 0-16 16v32a16 16 0 0 0 16 16h416a16 16 0 0 0 16-16v-32a16 16 0 0 0-16-16zm0-128H16a16 16 0 0 0-16 16v32a16 16 0 0 0 16 16h416a16 16 0 0 0 16-16v-32a16 16 0 0 0-16-16zm0-128H16a16 16 0 0 0-16 16v32a16 16 0 0 0 16 16h416a16 16 0 0 0 16-16v-32a16 16 0 0 0-16-16zm0-128H16A16 16 0 0 0 0 48v32a16 16 0 0 0 16 16h416a16 16 0 0 0 16-16V48a16 16 0 0 0-16-16z"></path></svg>
                                        &nbsp; &nbsp;<span>All</span> </li>
                                    <li data-tabs="pending" class="head-pending active"><svg class="bi svg-inline--fa fa-clock fa-w-16 fa-fw select-all" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="clock" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M256,8C119,8,8,119,8,256S119,504,256,504,504,393,504,256,393,8,256,8Zm92.49,313h0l-20,25a16,16,0,0,1-22.49,2.5h0l-67-49.72a40,40,0,0,1-15-31.23V112a16,16,0,0,1,16-16h32a16,16,0,0,1,16,16V256l58,42.5A16,16,0,0,1,348.49,321Z"></path></svg><!-- <span class="fa-fw select-all fas"></span> Font Awesome fontawesome.com -->
                                        &nbsp; &nbsp;<span>Pending</span> </li>
                                    <li data-tabs="confirmed" class="head-confirmed"><svg class="bi svg-inline--fa fa-clipboard-check fa-w-12 fa-fw select-all" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="clipboard-check" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512" data-fa-i2svg=""><path fill="currentColor" d="M336 64h-80c0-35.3-28.7-64-64-64s-64 28.7-64 64H48C21.5 64 0 85.5 0 112v352c0 26.5 21.5 48 48 48h288c26.5 0 48-21.5 48-48V112c0-26.5-21.5-48-48-48zM192 40c13.3 0 24 10.7 24 24s-10.7 24-24 24-24-10.7-24-24 10.7-24 24-24zm121.2 231.8l-143 141.8c-4.7 4.7-12.3 4.6-17-.1l-82.6-83.3c-4.7-4.7-4.6-12.3.1-17L99.1 285c4.7-4.7 12.3-4.6 17 .1l46 46.4 106-105.2c4.7-4.7 12.3-4.6 17 .1l28.2 28.4c4.7 4.8 4.6 12.3-.1 17z"></path></svg>
                                        &nbsp; &nbsp;<span>Confirmed</span></li>
                                    <li data-tabs="completed" class="head-completed"><svg class="bi svg-inline--fa fa-check fa-w-16 fa-fw select-all" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="check" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M173.898 439.404l-166.4-166.4c-9.997-9.997-9.997-26.206 0-36.204l36.203-36.204c9.997-9.998 26.207-9.998 36.204 0L192 312.69 432.095 72.596c9.997-9.997 26.207-9.997 36.204 0l36.203 36.204c9.997 9.997 9.997 26.206 0 36.204l-294.4 294.401c-9.998 9.997-26.207 9.997-36.204-.001z"></path></svg>
                                        &nbsp; &nbsp;<span>Completed</span></li>
                                    <li data-tabs="canceled" class="head-canceled"><svg class="bi svg-inline--fa fa-times fa-w-11 fa-fw select-all" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="times" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 352 512" data-fa-i2svg=""><path fill="currentColor" d="M242.72 256l100.07-100.07c12.28-12.28 12.28-32.19 0-44.48l-22.24-22.24c-12.28-12.28-32.19-12.28-44.48 0L176 189.28 75.93 89.21c-12.28-12.28-32.19-12.28-44.48 0L9.21 111.45c-12.28 12.28-12.28 32.19 0 44.48L109.28 256 9.21 356.07c-12.28 12.28-12.28 32.19 0 44.48l22.24 22.24c12.28 12.28 32.2 12.28 44.48 0L176 322.72l100.07 100.07c12.28 12.28 32.2 12.28 44.48 0l22.24-22.24c12.28-12.28 12.28-32.19 0-44.48L242.72 256z"></path></svg>
                                        &nbsp; &nbsp;<span>Canceled</span></li>
                                </ul>
                            </div>
                            <div class="container">
                                <ul id="statusContainer" style="padding-left: 0">
                                    <li class="item_wrap allstatuses online" style="display: none">
                                        <div class="item">
                                            <div class="card" style="width: 100%;">

                                                <div class="card-body" style="padding: 5px">

                                                    <table class="ml-2" border="0" cellspacing="5" cellpadding="5">
                                            <tbody class="row"><tr>
                                                    <td>From:</td>
                                                    <td><input type="text" id="min" name="min"></td>
                                                </tr>
                                                <tr>
                                                    <td>To:</td>
                                                    <td><input type="text" id="max" name="max"></td>
                                                </tr>
                                            </tbody></table>
                                        <table id="brands" class="display nowrap" style="width:100%">
                                                        <thead>
                                                            <tr>
                                                                <th>#</th>
                                                                <th>Customer </th>
                                                                <th>Shipping Company</th>
                                                                <th>Order Date</th>
                                                                <th>Ship Address</th>
                                                                <th>Phone</th>
                                                                <th>Total </th>
                                                                <th>Status</th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach items="${AllOrders}" var="ao">
                                                                <tr>
                                                                    <td>${ao.getOrderID()}</td>
                                                                    <td>${ao.getCustomerName()}</td>
                                                                    <td>${ao.getShippingCompany().getCompanyName()}</td>
                                                                    <td>${ao.getOrderDate()}</td>
                                                                    <td>${ao.getAddress()}</td>
                                                                    <td>${ao.getPhoneNumber()}</td>
                                                                    <td>${ao.getTotal()}</td>
                                                                    <td>
                                                                        <c:if test="${ao.getStatus().getStatusId() == 1}">
                                                                            <span class="badge bg-light-warning">${ao.getStatus().getStatusName()}</span>
                                                                        </c:if>
                                                                        <c:if test="${ao.getStatus().getStatusId() == 2}">
                                                                            <span class="badge bg-light-primary">${ao.getStatus().getStatusName()}</span>
                                                                        </c:if>
                                                                        <c:if test="${ao.getStatus().getStatusId() == 3}">
                                                                            <span class="badge bg-light-success">${ao.getStatus().getStatusName()}</span>
                                                                        </c:if>
                                                                        <c:if test="${ao.getStatus().getStatusId() == 4}">
                                                                            <span class="badge bg-light-danger">${ao.getStatus().getStatusName()}</span>
                                                                        </c:if>
                                                                    </td>
                                                                    <td>
                                                                        <div class="modal-info me-1 mb-1 d-inline-block">
                                                                            <!-- Button trigger for info theme modal -->
                                                                            <a href="#" class="btn btn-info"
                                                                               data-bs-toggle="modal" data-bs-target="#aod${ao.getOrderID()}">
                                                                                <svg class="mb-1 svg-inline--fa fa-eye fa-w-18 fa-fw select-all" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="eye" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M572.52 241.4C518.29 135.59 410.93 64 288 64S57.68 135.64 3.48 241.41a32.35 32.35 0 0 0 0 29.19C57.71 376.41 165.07 448 288 448s230.32-71.64 284.52-177.41a32.35 32.35 0 0 0 0-29.19zM288 400a144 144 0 1 1 144-144 143.93 143.93 0 0 1-144 144zm0-240a95.31 95.31 0 0 0-25.31 3.79 47.85 47.85 0 0 1-66.9 66.9A95.78 95.78 0 1 0 288 160z"></path></svg>
                                                                            </a>

                                                                            <!--info theme Modal -->
                                                                            <div class="modal fade text-left" id="aod${ao.getOrderID()}" tabindex="-1" aria-labelledby="myModalLabel130" style="display: none;" aria-hidden="true">
                                                                                <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document" style="min-width: 60%">
                                                                                    <div class="modal-content">
                                                                                        <div class="modal-header bg-info">
                                                                                            <h5 class="modal-title white" id="myModalLabel130">
                                                                                                Order Details
                                                                                            </h5>
                                                                                            <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                                                                                <i data-feather="x"></i>
                                                                                            </button>
                                                                                        </div>
                                                                                        <div class="modal-body" style="display: flex; justify-content: center"><table class="styled-table">
                                                                                                <thead>
                                                                                                    <tr>
                                                                                                        <th>Product Name</th>
                                                                                                        <th>Size</th>
                                                                                                        <th>Color</th>
                                                                                                        <th>Price</th>
                                                                                                        <th>Quantity</th>
                                                                                                    </tr>
                                                                                                </thead>
                                                                                                <tbody>
                                                                                                    <c:forEach items="${odDao.getOrderDetails(ao.getOrderID())}" var="od">
                                                                                                        <tr>
                                                                                                            <td>${od.getProductDetail().getProduct().productName}</td>
                                                                                                            <td>${od.getProductDetail().getSize()}</td>
                                                                                                            <td>${od.getProductDetail().getColor()}</td>
                                                                                                            <td>${od.getPrice()}</td>
                                                                                                            <td>${od.getQuantity()}</td>
                                                                                                        </tr>
                                                                                                    </c:forEach>
                                                                                                    <!-- and so on... -->
                                                                                                </tbody>
                                                                                            </table>
                                                                                        </div>
                                                                                        <div class="modal-footer">
                                                                                            <c:if test="${ao.getStatus().getStatusId() == 1}">
                                                                                                <a href="EmployeeConfirmOrders?id=${ao.getOrderID()}&status=2" type="button" class="btn btn-primary ml-1" data-bs-dismiss="modal">
                                                                                                    <i class="bx bx-check d-block d-sm-none"></i>
                                                                                                    <span class="d-none d-sm-block">Confirm</span>
                                                                                                </a>
                                                                                                <a href="EmployeeConfirmOrders?id=${ao.getOrderID()}&status=4" type="button" class="btn btn-danger ml-1" data-bs-dismiss="modal">
                                                                                                    <i class="bx bx-check d-block d-sm-none"></i>
                                                                                                    <span class="d-none d-sm-block">Cancel</span>
                                                                                                </a>
                                                                                            </c:if>
                                                                                            <button type="button" class="btn btn-light-secondary" data-bs-dismiss="modal">
                                                                                                <i class="bx bx-x d-block d-sm-none"></i>
                                                                                                <span class="d-none d-sm-block">Close</span>
                                                                                            </button>

                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </td>

                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="item_wrap pending online">
                                        <div class="item">
                                            <div class="card" style="width: 100%;">

                                                <div class="card-body" style="padding: 5px">
                                                    <form action="EmployeeConfirmOrders" method="post">
                                                        <table class="table table-striped" id="table2">
                                                            <thead>
                                                                <tr>
                                                                    <th><input onClick="toggle(this)" id="allCheck" type="checkbox" class="form-check-secondary" name="">
                                                                    </th>
                                                                    <th>#</th>
                                                                    <th>Customer </th>
                                                                    <th>Shipping Company</th>
                                                                    <th>Order Date</th>
                                                                    <th>Ship Address</th>
                                                                    <th>Phone</th>
                                                                    <th>Total </th>
                                                                    <th></th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:forEach items="${PendingOrders}" var="ao">
                                                                    <tr>
                                                                        <td>
                                                                            <input type="checkbox" class="form-check-secondary" name="${ao.getOrderID()}">
                                                                        </td>
                                                                        <td>${ao.getOrderID()}</td>
                                                                        <td>${ao.getCustomerName()}</td>
                                                                        <td>${ao.getShippingCompany().getCompanyName()}</td>
                                                                        <td>${ao.getOrderDate()}</td>
                                                                        <td>${ao.getAddress()}</td>
                                                                        <td>${ao.getPhoneNumber()}</td>
                                                                        <td>${ao.getTotal()}</td>
                                                                        <td>
                                                                            <div class="modal-info me-1 mb-1 d-inline-block">
                                                                                <!-- Button trigger for info theme modal -->
                                                                                <a href="#" class="btn btn-info"
                                                                                   data-bs-toggle="modal" data-bs-target="#pod${ao.getOrderID()}">
                                                                                    <svg class="mb-1 svg-inline--fa fa-eye fa-w-18 fa-fw select-all" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="eye" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M572.52 241.4C518.29 135.59 410.93 64 288 64S57.68 135.64 3.48 241.41a32.35 32.35 0 0 0 0 29.19C57.71 376.41 165.07 448 288 448s230.32-71.64 284.52-177.41a32.35 32.35 0 0 0 0-29.19zM288 400a144 144 0 1 1 144-144 143.93 143.93 0 0 1-144 144zm0-240a95.31 95.31 0 0 0-25.31 3.79 47.85 47.85 0 0 1-66.9 66.9A95.78 95.78 0 1 0 288 160z"></path></svg>
                                                                                </a>

                                                                                <!--info theme Modal -->
                                                                                <div class="modal fade text-left" id="pod${ao.getOrderID()}" tabindex="-1" aria-labelledby="myModalLabel130" style="display: none;" aria-hidden="true">
                                                                                    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
                                                                                        <div class="modal-content">
                                                                                            <div class="modal-header bg-info">
                                                                                                <h5 class="modal-title white" id="myModalLabel130">
                                                                                                    Order Details
                                                                                                </h5>
                                                                                                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                                                                                    <i data-feather="x"></i>
                                                                                                </button>
                                                                                            </div>
                                                                                            <div class="modal-body" style="display: flex; justify-content: center">


                                                                                                <table class="styled-table">
                                                                                                    <thead>
                                                                                                        <tr>
                                                                                                            <th>Product Name</th>
                                                                                                            <th>Size</th>
                                                                                                            <th>Color</th>
                                                                                                            <th>Price</th>
                                                                                                            <th>Quantity</th>
                                                                                                        </tr>
                                                                                                    </thead>
                                                                                                    <tbody>
                                                                                                        <c:forEach items="${odDao.getOrderDetails(ao.getOrderID())}" var="od">
                                                                                                            <tr>
                                                                                                            <td>${od.getProductDetail().getProduct().productName}</td>
                                                                                                            <td>${od.getProductDetail().getSize()}</td>
                                                                                                            <td>${od.getProductDetail().getColor()}</td>
                                                                                                            <td>${od.getPrice()}</td>
                                                                                                            <td>${od.getQuantity()}</td>
                                                                                                        </tr>
                                                                                                        </c:forEach>
                                                                                                        <!-- and so on... -->
                                                                                                    </tbody>
                                                                                                </table>
                                                                                            </div>
                                                                                            <div class="modal-footer">
                                                                                                <a href="EmployeeConfirmOrders?id=${ao.getOrderID()}&status=2" type="button" class="btn btn-primary ml-1" data-bs-dismiss="#pcfod${ao.getOrderID()}">
                                                                                                    <i class="bx bx-check d-block d-sm-none"></i>
                                                                                                    <span class="d-none d-sm-block">Confirm</span>
                                                                                                </a>
                                                                                                <a href="EmployeeConfirmOrders?id=${ao.getOrderID()}&status=4" type="button" class="btn btn-danger ml-1" data-bs-target="pccod${ao.getOrderID()}">
                                                                                                    <i class="bx bx-check d-block d-sm-none"></i>
                                                                                                    <span class="d-none d-sm-block">Cancel</span>
                                                                                                </a>
                                                                                                <button type="button" class="btn btn-light-secondary" data-bs-dismiss="modal">
                                                                                                    <i class="bx bx-x d-block d-sm-none"></i>
                                                                                                    <span class="d-none d-sm-block">Close</span>
                                                                                                </button>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                            <div class="modal-primary me-1 mb-1 d-inline-block">
                                                                                <!-- Button trigger for primary themes modal -->
                                                                                <a href="#" type="button" class="btn btn-primary"
                                                                                   data-bs-toggle="modal" data-bs-target="#pcfod${ao.getOrderID()}">
                                                                                    <svg class="mb-1 svg-inline--fa fa-check fa-w-16 fa-fw select-all" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="check" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M173.898 439.404l-166.4-166.4c-9.997-9.997-9.997-26.206 0-36.204l36.203-36.204c9.997-9.998 26.207-9.998 36.204 0L192 312.69 432.095 72.596c9.997-9.997 26.207-9.997 36.204 0l36.203 36.204c9.997 9.997 9.997 26.206 0 36.204l-294.4 294.401c-9.998 9.997-26.207 9.997-36.204-.001z"></path></svg>
                                                                                </a>

                                                                                <!--primary theme Modal -->
                                                                                <div class="modal fade text-left" id="pcfod${ao.getOrderID()}" tabindex="-1"
                                                                                     role="dialog" aria-labelledby="myModalLabel160"
                                                                                     aria-hidden="true">
                                                                                    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
                                                                                         role="document">
                                                                                        <div class="modal-content">
                                                                                            <div class="modal-header bg-primary">
                                                                                                <h5 class="modal-title white" id="myModalLabel160">
                                                                                                    Confirm
                                                                                                </h5>
                                                                                                <button type="button" class="close"
                                                                                                        data-bs-dismiss="modal" aria-label="Close">
                                                                                                    <i data-feather="x"></i>
                                                                                                </button>
                                                                                            </div>
                                                                                            <div class="modal-body">
                                                                                                Do you want to confirm this order?
                                                                                            </div>
                                                                                            <div class="modal-footer">
                                                                                                <button type="button"
                                                                                                        class="btn btn-light-secondary"
                                                                                                        data-bs-dismiss="modal">
                                                                                                    <i class="bx bx-x d-block d-sm-none"></i>
                                                                                                    <span class="d-none d-sm-block">Close</span>
                                                                                                </button>
                                                                                                <a id="confirm" href="EmployeeConfirmOrders?id=${ao.getOrderID()}&status=2" type="button" class="btn btn-primary ml-1"
                                                                                                   >
                                                                                                    <i class="bx bx-check d-block d-sm-none"></i>
                                                                                                    <span class="d-none d-sm-block">Accept</span>
                                                                                                </a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                            <div class="modal-danger me-1 mb-1 d-inline-block">
                                                                                <!-- Button trigger for danger theme modal -->
                                                                                <a href="#" type="button" class="btn btn-danger"
                                                                                   data-bs-toggle="modal" data-bs-target="#pccod${ao.getOrderID()}">
                                                                                    <svg class="mb-1 svg-inline--fa fa-times fa-w-11 fa-fw select-all" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="times" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 352 512" data-fa-i2svg=""><path fill="currentColor" d="M242.72 256l100.07-100.07c12.28-12.28 12.28-32.19 0-44.48l-22.24-22.24c-12.28-12.28-32.19-12.28-44.48 0L176 189.28 75.93 89.21c-12.28-12.28-32.19-12.28-44.48 0L9.21 111.45c-12.28 12.28-12.28 32.19 0 44.48L109.28 256 9.21 356.07c-12.28 12.28-12.28 32.19 0 44.48l22.24 22.24c12.28 12.28 32.2 12.28 44.48 0L176 322.72l100.07 100.07c12.28 12.28 32.2 12.28 44.48 0l22.24-22.24c12.28-12.28 12.28-32.19 0-44.48L242.72 256z"></path></svg>
                                                                                </a>
                                                                                <!--Danger theme Modal -->
                                                                                <div class="modal fade text-left" id="pccod${ao.getOrderID()}" tabindex="-1" aria-labelledby="myModalLabel120" aria-hidden="true" style="display: none;">
                                                                                    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
                                                                                        <div class="modal-content">
                                                                                            <div class="modal-header bg-danger">
                                                                                                <h5 class="modal-title white" id="myModalLabel120">
                                                                                                    Cancel
                                                                                                </h5>
                                                                                                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                                                                                    <i data-feather="x"></i>
                                                                                                </button>
                                                                                            </div>
                                                                                            <div class="modal-body">
                                                                                                Do you want to cancel this order?
                                                                                            </div>
                                                                                            <div class="modal-footer">
                                                                                                <button type="button" class="btn btn-light-secondary" data-bs-dismiss="modal">
                                                                                                    <i class="bx bx-x d-block d-sm-none"></i>
                                                                                                    <span class="d-none d-sm-block">Close</span>
                                                                                                </button>
                                                                                                <a href="EmployeeConfirmOrders?id=${ao.getOrderID()}&status=4" type="button" class="btn btn-danger ml-1" 
                                                                                                   >
                                                                                                    <i class="bx bx-check d-block d-sm-none"></i>
                                                                                                    <span class="d-none d-sm-block">Accept</span>
                                                                                                </a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                        </td>

                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>
                                                        </table>

                                                        <div style="float: left">
                                                            <input type="submit" name="action" class="btn btn-outline-primary" style="margin-right: 4px" value="Confirm">
                                                            <input type="submit" name="action" class="btn btn-outline-danger" value="Cancel">
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="item_wrap confirmed online" style="display: none">
                                        <div class="item">
                                            <div class="card" style="width: 100%;">

                                                <div class="card-body" style="padding: 5px">

                                                    <table class="table table-striped" id="table3">
                                                        <thead>
                                                            <tr>
                                                                <th>#</th>
                                                                <th>Customer </th>
                                                                <th>Shipping Company</th>
                                                                <th>Order Date</th>
                                                                <th>Ship Address</th>
                                                                <th>Phone</th>
                                                                <th>Total </th>
                                                                <th></th>

                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach items="${ConfirmedOrders}" var="ao">
                                                                <tr>
                                                                    <td>${ao.getOrderID()}</td>
                                                                    <td>${ao.getCustomerName()}</td>
                                                                    <td>${ao.getShippingCompany().getCompanyName()}</td>
                                                                    <td>${ao.getOrderDate()}</td>
                                                                    <td>${ao.getAddress()}</td>
                                                                    <td>${ao.getPhoneNumber()}</td>
                                                                    <td>${ao.getTotal()}</td>
                                                                    <td>
                                                                        <div class="modal-info me-1 mb-1 d-inline-block">
                                                                            <!-- Button trigger for info theme modal -->
                                                                            <a href="#" class="btn btn-info"
                                                                               data-bs-toggle="modal" data-bs-target="#cfod${ao.getOrderID()}">
                                                                                <svg class="mb-1 svg-inline--fa fa-eye fa-w-18 fa-fw select-all" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="eye" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M572.52 241.4C518.29 135.59 410.93 64 288 64S57.68 135.64 3.48 241.41a32.35 32.35 0 0 0 0 29.19C57.71 376.41 165.07 448 288 448s230.32-71.64 284.52-177.41a32.35 32.35 0 0 0 0-29.19zM288 400a144 144 0 1 1 144-144 143.93 143.93 0 0 1-144 144zm0-240a95.31 95.31 0 0 0-25.31 3.79 47.85 47.85 0 0 1-66.9 66.9A95.78 95.78 0 1 0 288 160z"></path></svg>
                                                                            </a>

                                                                            <!--info theme Modal -->
                                                                            <div class="modal fade text-left" id="cfod${ao.getOrderID()}" tabindex="-1" aria-labelledby="myModalLabel130" style="display: none;" aria-hidden="true">
                                                                                <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
                                                                                    <div class="modal-content">
                                                                                        <div class="modal-header bg-info">
                                                                                            <h5 class="modal-title white" id="myModalLabel130">
                                                                                                Order Details
                                                                                            </h5>
                                                                                            <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                                                                                <i data-feather="x"></i>
                                                                                            </button>
                                                                                        </div>
                                                                                        <div class="modal-body" style="display: flex; justify-content: center">
                                                                                            <table class="styled-table">
                                                                                                <thead>
                                                                                                    <tr>
                                                                                                        <th>Product Name</th>
                                                                                                        <th>Size</th>
                                                                                                        <th>Color</th>
                                                                                                        <th>Price</th>
                                                                                                        <th>Quantity</th>
                                                                                                    </tr>
                                                                                                </thead>
                                                                                                <tbody>
                                                                                                    <c:forEach items="${odDao.getOrderDetails(ao.getOrderID())}" var="od">
                                                                                                        <tr>
                                                                                                            <td>${od.getProductDetail().getProduct().productName}</td>
                                                                                                            <td>${od.getProductDetail().getSize()}</td>
                                                                                                            <td>${od.getProductDetail().getColor()}</td>
                                                                                                            <td>${od.getPrice()}</td>
                                                                                                            <td>${od.getQuantity()}</td>
                                                                                                        </tr>
                                                                                                    </c:forEach>
                                                                                                    <!-- and so on... -->
                                                                                                </tbody>
                                                                                            </table>
                                                                                        </div>
                                                                                        <div class="modal-footer">
                                                                                            <button type="button" class="btn btn-light-secondary" data-bs-dismiss="modal">
                                                                                                <i class="bx bx-x d-block d-sm-none"></i>
                                                                                                <span class="d-none d-sm-block">Close</span>
                                                                                            </button>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="item_wrap completed offline" style="display: none">
                                        <div class="item">
                                            <div class="card" style="width: 100%;">

                                                <div class="card-body" style="padding: 5px">

                                                    <table class="table table-striped" id="table4">
                                                        <thead>
                                                            <tr>
                                                                <th>#</th>
                                                                <th>Customer </th>
                                                                <th>Shipping Company</th>
                                                                <th>Order Date</th>
                                                                <th>Ship Address</th>
                                                                <th>Phone</th>
                                                                <th>Total </th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach items="${CompletedOrders}" var="ao">
                                                                <tr>
                                                                    <td>${ao.getOrderID()}</td>
                                                                    <td>${ao.getCustomerName()}</td>
                                                                    <td>${ao.getShippingCompany().getCompanyName()}</td>
                                                                    <td>${ao.getOrderDate()}</td>
                                                                    <td>${ao.getAddress()}</td>
                                                                    <td>${ao.getPhoneNumber()}</td>
                                                                    <td>${ao.getTotal()}</td>
                                                                    <td>
                                                                        <div class="modal-info me-1 mb-1 d-inline-block">
                                                                            <!-- Button trigger for info theme modal -->
                                                                            <a href="#" class="btn btn-info"
                                                                               data-bs-toggle="modal" data-bs-target="#cpod${ao.getOrderID()}">
                                                                                <svg class="mb-1 svg-inline--fa fa-eye fa-w-18 fa-fw select-all" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="eye" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M572.52 241.4C518.29 135.59 410.93 64 288 64S57.68 135.64 3.48 241.41a32.35 32.35 0 0 0 0 29.19C57.71 376.41 165.07 448 288 448s230.32-71.64 284.52-177.41a32.35 32.35 0 0 0 0-29.19zM288 400a144 144 0 1 1 144-144 143.93 143.93 0 0 1-144 144zm0-240a95.31 95.31 0 0 0-25.31 3.79 47.85 47.85 0 0 1-66.9 66.9A95.78 95.78 0 1 0 288 160z"></path></svg>
                                                                            </a>

                                                                            <!--info theme Modal -->
                                                                            <div class="modal fade text-left" id="cpod${ao.getOrderID()}" tabindex="-1" aria-labelledby="myModalLabel130" style="display: none;" aria-hidden="true">
                                                                                <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
                                                                                    <div class="modal-content">
                                                                                        <div class="modal-header bg-info">
                                                                                            <h5 class="modal-title white" id="myModalLabel130">
                                                                                                Order Details
                                                                                            </h5>
                                                                                            <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                                                                                <i data-feather="x"></i>
                                                                                            </button>
                                                                                        </div>
                                                                                        <div class="modal-body" style="display: flex; justify-content: center">


                                                                                            <table class="styled-table">
                                                                                                <thead>
                                                                                                    <tr>
                                                                                                        <th>Product Name</th>
                                                                                                        <th>Size</th>
                                                                                                        <th>Color</th>
                                                                                                        <th>Price</th>
                                                                                                        <th>Quantity</th>
                                                                                                    </tr>
                                                                                                </thead>
                                                                                                <tbody>
                                                                                                    <c:forEach items="${odDao.getOrderDetails(ao.getOrderID())}" var="od">
                                                                                                        <tr>
                                                                                                            <td>${od.getProductDetail().getProduct().productName}</td>
                                                                                                            <td>${od.getProductDetail().getSize()}</td>
                                                                                                            <td>${od.getProductDetail().getColor()}</td>
                                                                                                            <td>${od.getPrice()}</td>
                                                                                                            <td>${od.getQuantity()}</td>
                                                                                                        </tr>
                                                                                                    </c:forEach>
                                                                                                    <!-- and so on... -->
                                                                                                </tbody>
                                                                                            </table>
                                                                                        </div>
                                                                                        <div class="modal-footer">
                                                                                            <button type="button" class="btn btn-light-secondary" data-bs-dismiss="modal">
                                                                                                <i class="bx bx-x d-block d-sm-none"></i>
                                                                                                <span class="d-none d-sm-block">Close</span>
                                                                                            </button>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="item_wrap canceled offline" style="display: none">
                                        <div class="item">
                                            <div class="card" style="width: 100%;">

                                                <div class="card-body" style="padding: 5px">

                                                    <table class="table table-striped" id="table5">
                                                        <thead>
                                                            <tr>
                                                                <th>#</th>
                                                                <th>Customer </th>
                                                                <th>Shipping Company</th>
                                                                <th>Order Date</th>
                                                                <th>Ship Address</th>
                                                                <th>Phone</th>
                                                                <th>Total </th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach items="${CanceledOrders}" var="ao">
                                                                <tr>
                                                                    <td>${ao.getOrderID()}</td>
                                                                    <td>${ao.getCustomerName()}</td>
                                                                    <td>${ao.getShippingCompany().getCompanyName()}</td>
                                                                    <td>${ao.getOrderDate()}</td>
                                                                    <td>${ao.getAddress()}</td>
                                                                    <td>${ao.getPhoneNumber()}</td>
                                                                    <td>${ao.getTotal()}</td>
                                                                    <td>
                                                                        <div class="modal-info me-1 mb-1 d-inline-block">
                                                                            <!-- Button trigger for info theme modal -->
                                                                            <a href="#" class="btn btn-info"
                                                                               data-bs-toggle="modal" data-bs-target="#ccod${ao.getOrderID()}">
                                                                                <svg class="mb-1 svg-inline--fa fa-eye fa-w-18 fa-fw select-all" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="eye" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M572.52 241.4C518.29 135.59 410.93 64 288 64S57.68 135.64 3.48 241.41a32.35 32.35 0 0 0 0 29.19C57.71 376.41 165.07 448 288 448s230.32-71.64 284.52-177.41a32.35 32.35 0 0 0 0-29.19zM288 400a144 144 0 1 1 144-144 143.93 143.93 0 0 1-144 144zm0-240a95.31 95.31 0 0 0-25.31 3.79 47.85 47.85 0 0 1-66.9 66.9A95.78 95.78 0 1 0 288 160z"></path></svg>
                                                                            </a>

                                                                            <!--info theme Modal -->
                                                                            <div class="modal fade text-left" id="ccod${ao.getOrderID()}" tabindex="-1" aria-labelledby="myModalLabel130" style="display: none;" aria-hidden="true">
                                                                                <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
                                                                                    <div class="modal-content">
                                                                                        <div class="modal-header bg-info">
                                                                                            <h5 class="modal-title white" id="myModalLabel130">
                                                                                                Order Details
                                                                                            </h5>
                                                                                            <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                                                                                <i data-feather="x"></i>
                                                                                            </button>
                                                                                        </div>
                                                                                        <div class="modal-body" style="display: flex; justify-content: center">
                                                                                            <table class="styled-table">
                                                                                                <thead>
                                                                                                    <tr>
                                                                                                        <th>Product Name</th>
                                                                                                        <th>Size</th>
                                                                                                        <th>Color</th>
                                                                                                        <th>Price</th>
                                                                                                        <th>Quantity</th>
                                                                                                    </tr>
                                                                                                </thead>
                                                                                                <tbody>
                                                                                                    <c:forEach items="${odDao.getOrderDetails(ao.getOrderID())}" var="od">
                                                                                                        <tr>
                                                                                                            <td>${od.getProductDetail().getProduct().productName}</td>
                                                                                                            <td>${od.getProductDetail().getSize()}</td>
                                                                                                            <td>${od.getProductDetail().getColor()}</td>
                                                                                                            <td>${od.getPrice()}</td>
                                                                                                            <td>${od.getQuantity()}</td>
                                                                                                        </tr>
                                                                                                    </c:forEach>
                                                                                                    <!-- and so on... -->
                                                                                                </tbody>
                                                                                            </table>
                                                                                        </div>
                                                                                        <div class="modal-footer">
                                                                                            <button type="button" class="btn btn-light-secondary" data-bs-dismiss="modal">
                                                                                                <i class="bx bx-x d-block d-sm-none"></i>
                                                                                                <span class="d-none d-sm-block">Close</span>
                                                                                            </button>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>

                    </section>
                </div>
            </div>
            <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
            <script src="assets/js/bootstrap.bundle.min.js"></script>
            <script>
                                                                        function toggle(source) {
                                                                            checkboxes = document.getElementsByTagName('input');
                                                                            for (var i = 0, n = checkboxes.length; i < n; i++) {
                                                                                checkboxes[i].checked = source.checked;
                                                                            }
                                                                        }
            </script>

            <script src="assets/vendors/simple-datatables/simple-datatables.js"></script>
            <script>

                                                                        // Simple Datatable
                                                                        let table2 = document.querySelector('#table2');
                                                                        let dataTable2 = new simpleDatatables.DataTable(table2);

                                                                        // Simple Datatable
                                                                        let table3 = document.querySelector('#table3');
                                                                        let dataTable3 = new simpleDatatables.DataTable(table3);

                                                                        // Simple Datatable
                                                                        let table4 = document.querySelector('#table4');
                                                                        let dataTable4 = new simpleDatatables.DataTable(table4);

                                                                        // Simple Datatable
                                                                        let table5 = document.querySelector('#table5');
                                                                        let dataTable5 = new simpleDatatables.DataTable(table5);
            </script>
            <script src="assets/js/main.js"></script>
            <script>
                                                                        var tabs = document.querySelectorAll(".tabs_wrap ul li");
                                                                        var allstatuses = document.querySelectorAll(".allstatuses");
                                                                        var pending = document.querySelectorAll(".pending");
                                                                        var confirmed = document.querySelectorAll(".confirmed");
                                                                        var completed = document.querySelectorAll(".completed");
                                                                        var canceled = document.querySelectorAll(".canceled");
                                                                        var all = document.querySelectorAll(".item_wrap");

                                                                        tabs.forEach((tab) => {
                                                                            tab.addEventListener("click", () => {
                                                                                tabs.forEach((tab) => {
                                                                                    tab.classList.remove("active");
                                                                                })
                                                                                tab.classList.add("active");
                                                                                var tabval = tab.getAttribute("data-tabs");

                                                                                all.forEach((item) => {
                                                                                    item.style.display = "none";
                                                                                })

                                                                                if (tabval == "allstatuses") {
                                                                                    allstatuses.forEach((allstatuses) => {
                                                                                        allstatuses.style.display = "block";
                                                                                    })
                                                                                } else if (tabval == "pending") {
                                                                                    pending.forEach((pending) => {
                                                                                        pending.style.display = "block";
                                                                                    })
                                                                                } else if (tabval == "confirmed") {
                                                                                    confirmed.forEach((confirmed) => {
                                                                                        confirmed.style.display = "block";
                                                                                    })
                                                                                } else if (tabval == "completed") {
                                                                                    completed.forEach((completed) => {
                                                                                        completed.style.display = "block";
                                                                                    })
                                                                                } else {
                                                                                    canceled.forEach((canceled) => {
                                                                                        canceled.style.display = "block";
                                                                                    })
                                                                                }

                                                                            })
                                                                        })


            </script>
            <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.2/moment.min.js"></script>
        <script src="https://cdn.datatables.net/datetime/1.1.2/js/dataTables.dateTime.min.js"></script>
        <script>
            // Simple Datatable
//            let brands = document.querySelector('#brands');
//            let dataBrands = new simpleDatatables.DataTable(brands);
            var minDate, maxDate;

// Custom filtering function which will search data in column four between two values
            $.fn.dataTable.ext.search.push(
                    function (settings, data, dataIndex) {
                        var min = minDate.val();
                        var max = maxDate.val();
                        var date = new Date(data[3]);
                        
                        if (
                                (min === null && max === null) ||
                                (min === null && date <= max) ||
                                (min <= date && max === null) ||
                                (min <= date && date <= max)
                                ) {
                            return true;
                        }
                        return false;
                    }
            );

            $(document).ready(function () {
                // Create date inputs
                minDate = new DateTime($('#min'), {
                    format: 'MMMM Do YYYY'
                });
                maxDate = new DateTime($('#max'), {
                    format: 'MMMM Do YYYY'
                });

                // DataTables initialisation
                var table = $('#brands').DataTable();

                // Refilter the table
                $('#min, #max').on('change', function () {
                    table.draw();
                });
            });
        </script>

    </body>

</html>