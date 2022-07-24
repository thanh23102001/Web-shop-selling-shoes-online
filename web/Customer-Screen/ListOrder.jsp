<%-- 
    Document   : Profile
    Created on : Jun 8, 2022, 12:35:43 AM
    Author     : vietd
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>JSP Page</title>
        <%@include file="../include/Head.jsp" %>
        <!--        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
                <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <!--<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>-->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <!--<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>-->
        <style>
            body {
                color: #566787;
                /*background: #f5f5f5;*/
                font-family: 'Varela Round', sans-serif;
                font-size: 13px;
                /*margin-top: 200px;*/
            }
            .table-responsive {
                margin: 30px 0;
            }
            .table-wrapper {
                min-width: 1200px;
                background: #fff;
                padding: 20px 25px;
                border-radius: 3px;
                box-shadow: 0 1px 1px rgba(0,0,0,.05);
            }
            .table-wrapper .btn {
                float: right;
                color: #333;
                background-color: #fff;
                border-radius: 3px;
                border: none;
                outline: none !important;
                margin-left: 10px;
            }
            .table-wrapper .btn:hover {
                color: #333;
                background: #f2f2f2;
            }
            .table-wrapper .btn.btn-primary {
                color: #fff;
                background: #03A9F4;
            }
            .table-wrapper .btn.btn-primary:hover {
                background: #03a3e7;
            }
            .table-title .btn {		
                font-size: 13px;
                border: none;
            }
            .table-title .btn i {
                float: left;
                font-size: 21px;
                margin-right: 5px;
            }
            .table-title .btn span {
                float: left;
                margin-top: 2px;
            }
            .table-title {
                color: #fff;
                background: #4b5366;		
                padding: 16px 25px;
                margin: -20px -25px 10px;
                border-radius: 3px 3px 0 0;
            }
            .table-title h2 {
                margin: 5px 0 0;
                font-size: 24px;
            }
            .show-entries select.form-control {        
                width: 60px;
                margin: 0 5px;
            }
            .table-filter .filter-group {
                float: right;
                margin-left: 15px;
            }
            .table-filter input, .table-filter select {
                height: 34px;
                border-radius: 3px;
                border-color: #ddd;
                box-shadow: none;
            }
            .table-filter {
                padding: 5px 0 15px;
                /*border-bottom: 1px solid #e9e9e9;*/
                margin-bottom: 5px;
            }
            .table-filter .btn {
                height: 34px;
            }
            .table-filter label {
                font-weight: normal;
                margin-left: 10px;
            }
            .table-filter select, .table-filter input {
                display: inline-block;
                margin-left: 5px;
            }
            .table-filter input {
                width: 200px;
                display: inline-block;
            }
            .filter-group select.form-control {
                width: 110px;
            }
            .filter-icon {
                float: right;
                margin-top: 7px;
            }
            .filter-icon i {
                font-size: 18px;
                opacity: 0.7;
            }	
            table.table tr th, table.table tr td {
                border-color: #e9e9e9;
                padding: 12px 15px;
                vertical-align: middle;
            }
            table.table tr th:first-child {
                width: 60px;
            }
            table.table tr th:last-child {
                width: 80px;
            }
            table.table-striped tbody tr:nth-of-type(odd) {
                background-color: #fcfcfc;        
            }
            table.table-striped.table-hover tbody tr:hover {
                background: #f5f5f5;
            }
            table.table th i {
                font-size: 13px;
                margin: 0 5px;
                cursor: pointer;
            }	
            table.table td a {
                font-weight: bold;
                color: #566787;
                display: inline-block;
                text-decoration: none;
            }
            table.table td a:hover {
                color: #2196F3;
            }
            table.table td a.view {        
                width: 30px;
                height: 30px;
                color: #2196F3;
                border: 2px solid;
                border-radius: 30px;
                text-align: center;
            }
            table.table td a.view i {
                font-size: 22px;
                margin: 2px 0 0 1px;
            }   
            table.table .avatar {
                border-radius: 50%;
                vertical-align: middle;
                margin-right: 10px;
            }
            .status {
                font-size: 30px;
                margin: 2px 2px 0 0;
                display: inline-block;
                vertical-align: middle;
                line-height: 10px;
            }
            .text-success {
                color: #10c469;
            }
            .text-info {
                color: #62c9e8;
            }
            .text-warning {
                color: #FFC107;
            }
            .text-danger {
                color: #ff5b5b;
            }
            .pagination {
                float: right;
                margin: 0 0 5px;
            }
            .pagination li a {
                border: none;
                font-size: 13px;
                min-width: 30px;
                min-height: 30px;
                color: #999;
                margin: 0 2px;
                line-height: 30px;
                border-radius: 2px !important;
                text-align: center;
                padding: 0 6px;
            }
            .pagination li a:hover {
                color: #666;
            }	
            .pagination li.active a {
                background: #03A9F4;
            }
            .pagination li.active a:hover {        
                background: #0397d6;
            }
            .pagination li.disabled i {
                color: #ccc;
            }
            .pagination li i {
                font-size: 16px;
                padding-top: 6px
            }
            .hint-text {
                float: left;
                margin-top: 10px;
                font-size: 13px;
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
                        <h1>List Orders</h1>
                        <nav class="d-flex align-items-center">
                            <a href="HomePage">Home<span class="lnr lnr-arrow-right"></span></a>
                            <a href="ListOrder??cusid=${userLogin.getAccountId()}">List Orders</a>
                        </nav>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Banner Area -->
        <div class="container-xl p-5">
            <c:if test="${ListOrder.size() == 0}">
                <h3 class="font-weight-bold text-center my-3">VIEW ORDERS</h3>
                <div class="d-flex justify-content-center">
                    <h6>Sorry, you don't have any orders yet!</h6>
                </div>
                <div class="d-flex justify-content-center">
                    <p>Please come back to the store to continue shopping with us!</p>
                </div>
                <div class="d-flex justify-content-center">
                    <img src="../img/">
                </div>
            </c:if>
            <c:if test="${ListOrder.size() > 0}">
                <form action="ListOrder?cusid=${custid}" method="post">
                    <div class="table-wrapper">
                        <div class="table-filter mb-3" style="background-color: whitesmoke;">
                            <div class="row px-2 py-1">
                                <input hidden="" value="${custid}" name="custid" class="form-control">   
                                <div class="col-md-8 mt-2">
                                    <input type="search" class="light-table-filter" data-table="table table-striped table-hover" placeholder="Filtrer" />
                                </div>
                            </div>
                        </div>
                    </div>
                </form>  

                <table id="content" class="table table-striped table-hover" style="width: 100%;" >
                    <thead>
                        <tr>
                            <th colspan="2">#</th>
                            <th>Customer Name</th>
                            <!--<th>Address</th>-->
                            <!--<th>Phone Number</th>-->
                            <th>Order Date</th>
                            <th>Total Price</th>
                            <th>Status</th>						
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>                    
                        <c:forEach items="${ListOrder}" var="l">                              
                            <tr>
                                <td colspan="2">${l.getOrderID()}</td>
                                <td>${l.getCustomerName()}</td>
                                <!--<td>${l.getAddress()}</td>-->
                                <!--<td>${l.getPhoneNumber()}</td>-->
                                <td>${l.getOrderDate()}</td>
                                <td>${l.getTotal()}</td>
                                <c:set var = "st1" value="3"/>
                                <c:if test= "${l.getStatus().getStatusId()  eq st1}">
                                    <td><span class="status text-success">&bull;</span> Completed</td> 
                                </c:if>
                                <c:set var = "st2" value="1"/>
                                <c:if test= "${l.getStatus().getStatusId()  eq st2}">
                                    <td><span class="status text-warning">&bull;</span>Pending</td>
                                </c:if>
                                <c:set var = "st3" value="2"/>
                                <c:if test= "${l.getStatus().getStatusId()  eq st3}">
                                    <td><span class="status text-info">&bull;</span> Confirm</td>
                                </c:if>
                                <c:set var = "st4" value="4"/>
                                <c:if test= "${l.getStatus().getStatusId() eq st4}">
                                    <td><span class="status text-danger">&bull;</span>Canceled</td>
                                </c:if>
                                <td style="display: flex">
                                    <a style="padding-right: 20px; color: blue" class="pt-1" href="./OrderDetails?oid=${l.getOrderID()}&stt=${l.getStatus().getStatusId()}" title="View Details" data-toggle="tooltip"><svg class="mb-1 svg-inline--fa fa-eye fa-w-18 fa-fw select-all" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="eye" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M572.52 241.4C518.29 135.59 410.93 64 288 64S57.68 135.64 3.48 241.41a32.35 32.35 0 0 0 0 29.19C57.71 376.41 165.07 448 288 448s230.32-71.64 284.52-177.41a32.35 32.35 0 0 0 0-29.19zM288 400a144 144 0 1 1 144-144 143.93 143.93 0 0 1-144 144zm0-240a95.31 95.31 0 0 0-25.31 3.79 47.85 47.85 0 0 1-66.9 66.9A95.78 95.78 0 1 0 288 160z"></path></svg></a>
                                    <div class="modal fade" id="modalLoginForm${l.getOrderID()}" tabindex="-1"
                                         role="dialog" aria-labelledby="myModalLabel"
                                         aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header text-center" >
                                                    <h4 class="modal-title w-100 font-weight-bold">
                                                        Edit Information</h4>
                                                    <button type="button" class="close"
                                                            data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <form action="order_controller?action=edit" method="post" >
                                                    <input hidden="" type="tel" id="defaultForm-email"
                                                           class="form-control validate"
                                                           name="orderID"
                                                           value="${l.getOrderID()}">
                                                    <input hidden="" type="tel" id="defaultForm-email"
                                                           class="form-control validate"
                                                           name="cusid"
                                                           value="${l.getCustomer().getCustomerId()}">
                                                    <div class="modal-body mx-3">
                                                        <div class="md-form mb-4">
                                                            <label  data-error="wrong"
                                                                    data-success="right"
                                                                    for="defaultForm-email">Name</label>
                                                            <input type="tel" id="defaultForm-email"
                                                                   class="form-control validate"
                                                                   name="name"
                                                                   value="${l.getCustomerName()}">
                                                        </div>
                                                        <div class="md-form mb-4">
                                                            <label data-error="wrong"
                                                                   data-success="right"
                                                                   for="defaultForm-email">Address
                                                            </label>
                                                            <input type="text"
                                                                   id="defaultForm-email"
                                                                   class="form-control validate"
                                                                   name="address"
                                                                   value="${l.getAddress()}">
                                                        </div>
                                                        <div class="md-form mb-4">
                                                            <label data-error="wrong"
                                                                   data-success="right"
                                                                   for="defaultForm-pass">Phone
                                                                Number</label>
                                                            <input type="text" id="defaultForm-pass"
                                                                   class="form-control validate"
                                                                   name="phone"
                                                                   value="${l.getPhoneNumber()}">
                                                        </div>
                                                    </div>
                                                    <div
                                                        class="modal-footer d-flex justify-content-end">
                                                        <button type="submit"
                                                                class="btn btn-warning">Edit</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <c:if test= "${l.getStatus().getStatusId()  eq st2}">
                                        <a style="padding-right: 20px; color: #10c469" class="pt-1 ml-1" href=""  data-toggle="modal"
                                           data-target="#modalLoginForm${l.getOrderID()}" title="Edit address" aria-expanded="false"><svg class="mb-1 svg-inline--fa fa-edit fa-w-18 fa-fw select-all" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="edit" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M402.6 83.2l90.2 90.2c3.8 3.8 3.8 10 0 13.8L274.4 405.6l-92.8 10.3c-12.4 1.4-22.9-9.1-21.5-21.5l10.3-92.8L388.8 83.2c3.8-3.8 10-3.8 13.8 0zm162-22.9l-48.8-48.8c-15.2-15.2-39.9-15.2-55.2 0l-35.4 35.4c-3.8 3.8-3.8 10 0 13.8l90.2 90.2c3.8 3.8 10 3.8 13.8 0l35.4-35.4c15.2-15.3 15.2-40 0-55.2zM384 346.2V448H64V128h229.8c3.2 0 6.2-1.3 8.5-3.5l40-40c7.6-7.6 2.2-20.5-8.5-20.5H48C21.5 64 0 85.5 0 112v352c0 26.5 21.5 48 48 48h352c26.5 0 48-21.5 48-48V306.2c0-10.7-12.9-16-20.5-8.5l-40 40c-2.2 2.3-3.5 5.3-3.5 8.5z"></path></svg></a>
                                        </c:if>
                                        <c:if test= "${l.getStatus().getStatusId()  eq st2}">
                                        <a style="color: red" class="pt-1 ml-1" href="order_controller?action=delete&oid=${l.getOrderID()}&cid=${l.getCustomer().getCustomerId()}" title="Cancel order" data-toggle="tooltip" ><svg class="mb-1 svg-inline--fa fa-trash-alt fa-w-14 fa-fw select-all" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="trash-alt" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" data-fa-i2svg=""><path fill="currentColor" d="M32 464a48 48 0 0 0 48 48h288a48 48 0 0 0 48-48V128H32zm272-256a16 16 0 0 1 32 0v224a16 16 0 0 1-32 0zm-96 0a16 16 0 0 1 32 0v224a16 16 0 0 1-32 0zm-96 0a16 16 0 0 1 32 0v224a16 16 0 0 1-32 0zM432 32H312l-9.4-18.7A24 24 0 0 0 281.1 0H166.8a23.72 23.72 0 0 0-21.4 13.3L136 32H16A16 16 0 0 0 0 48v32a16 16 0 0 0 16 16h416a16 16 0 0 0 16-16V48a16 16 0 0 0-16-16z"></path></svg></a>
                                        </c:if>
                                        <c:if test= "${l.getStatus().getStatusId()  eq st3}">
                                        <a style="color: #10c469" class="pt-1 ml-1" href="order_controller?action=changestatus&oid=${l.getOrderID()}&cid=${l.getCustomer().getCustomerId()}&stt=${l.getStatus().getStatusId()}" title="Order complete" data-toggle="tooltip" ><svg class="mb-1 svg-inline--fa fa-check fa-w-16 fa-fw select-all" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="check" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M173.898 439.404l-166.4-166.4c-9.997-9.997-9.997-26.206 0-36.204l36.203-36.204c9.997-9.998 26.207-9.998 36.204 0L192 312.69 432.095 72.596c9.997-9.997 26.207-9.997 36.204 0l36.203 36.204c9.997 9.997 9.997 26.206 0 36.204l-294.4 294.401c-9.998 9.997-26.207 9.997-36.204-.001z"></path></svg></a>
                                        </c:if>
                                        <c:if test= "${l.getStatus().getStatusId()  eq st1}">
                                        <a class="ml-0 pl-0" style="color: #10c469; " href="feedback?orderId=${l.getOrderID()}&customerId=${l.getCustomer().getCustomerId()}" title="Feedback" data-toggle="tooltip" >
                                            <img
                                                src="https://img.icons8.com/nolan/64/star.png"
                                                height="25px" width="25px" />
                                        </a>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody> 
                </table>
            </c:if>
            <div class="d-flex justify-content-end mt-2">
                <!--<a class="btn btn-light border text-dark px-4 mt-3" href="Shop">Back to shop</a>-->
                <a href="Shop" class="genric-btn primary " style="font-size: 14px;">Back to shop<span class="lnr lnr-arrow-left mx-2 font-weight-bold"></span></a>
            </div>
        </div>   
        <%@include file="../include/Footer.jsp" %>
        <script>
            (function (document) {
                'use strict';

                var LightTableFilter = (function (Arr) {

                    var _input;

                    function _onInputEvent(e) {
                        _input = e.target;
                        var tables = document.getElementsByClassName(_input.getAttribute('data-table'));
                        Arr.forEach.call(tables, function (table) {
                            Arr.forEach.call(table.tBodies, function (tbody) {
                                Arr.forEach.call(tbody.rows, _filter);
                            });
                        });
                    }

                    function _filter(row) {
                        var text = row.textContent.toLowerCase(), val = _input.value.toLowerCase();
                        row.style.display = text.indexOf(val) === -1 ? 'none' : 'table-row';
                    }

                    return {
                        init: function () {
                            var inputs = document.getElementsByClassName('light-table-filter');
                            Arr.forEach.call(inputs, function (input) {
                                input.oninput = _onInputEvent;
                            });
                        }
                    };
                })(Array.prototype);

                document.addEventListener('readystatechange', function () {
                    if (document.readyState === 'complete') {
                        LightTableFilter.init();
                    }
                });

            })(document);
        </script>
    </body>
</html>