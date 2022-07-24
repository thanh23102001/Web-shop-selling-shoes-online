<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Employee Dashboard - Products</title>

        <link rel="stylesheet" href="css/nice-select.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/bootstrap.css">

        <link rel="stylesheet" href="assets/vendors/iconly/bold.css">

        <link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
        <link rel="stylesheet" href="assets/css/app.css">
        <link rel="stylesheet" href="css/nice-select.css">
        <link rel="stylesheet" href="assets/vendors/simple-datatables/style.css">
        <link rel="shortcut icon" href="assets/images/favicon.svg" type="image/x-icon">

        <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/datetime/1.1.2/css/dataTables.dateTime.min.css">
        
        <style>
            *{
                list-style: none;
                -webkit-box-sizing: border-box;
                box-sizing: border-box;

            }

            thead > tr {
                background-color: #343a40;
                color: white;
            }

            .section{
                font-size: 13px;
                height: 100%;
                background: #fff;
                margin: 15px auto 0;
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
                width: 60%;
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
                min-width: 40%;
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
    </head>

    <body>
        <div id="app">
            <div id="sidebar" class="active">
                <div class="sidebar-wrapper active">
                    <div class="sidebar-header">
                        <div class="d-flex justify-content-between">
                            <div class="logo">
                                <a href="index.html"><img src="assets/images/logo/logo.png" alt="Logo" style="height: 150px"></a>
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

                            <li class="sidebar-item  has-sub active">
                                <a href="#" class='sidebar-link'>
                                    <i class="bi bi-stack"></i>
                                    <span>Catalog</span>
                                </a>
                                <ul class="submenu active">
                                    <li class="submenu-item active">
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

                            <li class="sidebar-item has-sub">
                                <a href="#" class='sidebar-link'>
                                    <i class="bi bi-file-earmark-spreadsheet-fill"></i>
                                    <span>Orders</span>
                                </a>
                                <ul class="submenu ">
                                    <li class="submenu-item ">
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
                                <h3>Products</h3>
                                <p class="text-subtitle text-muted">Product management - Employee</p>
                            </div>
                            <div class="col-12 col-md-6 order-md-2 order-first">
                                <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="Employee">Dashboard</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Catalog - Products</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <div class="ml-2" style="font-size: 14px; margin-left: 4px">
                        <table border="0" cellspacing="5" cellpadding="5">
                            <tbody class="row"><tr>
                                    <td>From:</td>
                                    <td><input type="text" id="min" name="min"></td>
                                </tr>
                                <tr>
                                    <td>To:</td>
                                    <td><input type="text" id="max" name="max"></td>
                                </tr>
                            </tbody></table>

                    </div>



                    <!-- Table head options start -->
                    <section class="section">
                        <div class="row" id="table-head">
                            <div class="col-12">
                                <div class="card">
                                    <form action="EmployeeDeleteProduct" method="post" class="card-content">

                                        <!-- table head dark -->
                                        <div class="table-responsive">

                                            <table id="products" class="display table table-striped" style="width:100%">
                                                <thead class="thead-dark">
                                                    <tr>
                                                        <th><input onClick="toggle(this)" id="allCheck" type="checkbox" class="form-check-secondary" name="">
                                                        </th>
                                                        <th>#</th>
                                                        <th>Product Name </th>
                                                        <th>Category</th>
                                                        <th>Brand</th>
                                                        <th>Import Price</th>
                                                        <th>Price</th>
                                                        <th>Created At </th>
                                                        <th>Modified At</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${pList}" var="p">
                                                        <tr>
                                                            <td>
                                                                <input type="checkbox" class="form-check-secondary" name="${p.productId}">
                                                            </td>
                                                            <td>${p.productId}</td>
                                                            <td>${p.productName}</td>
                                                            <td>${scDao.getSubCategoriesBySubCateId(p.subCategoryId).getSubCategoryName()}</td>
                                                            <td>${bDao.getBrandById(p.brandId).getBrandName()}</td>
                                                            <td>${p.getImportPriceVN()}</td>
                                                            <td>${p.getUnitPriceVN()}</td>
                                                            <td>${p.getCreatedAtDate()}</td>
                                                            <td>${p.getModifiedAtDate()}</td>
                                                            <td >
                                                                <div class="modal-info me-1 mb-1 d-inline-block">
                                                                    <!-- Button trigger for info theme modal -->
                                                                    <a href="#" class="btn btn-info"
                                                                       data-bs-toggle="modal" data-bs-target="#pod${p.productId}">
                                                                        <svg class="mb-1 svg-inline--fa fa-eye fa-w-18 fa-fw select-all" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="eye" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M572.52 241.4C518.29 135.59 410.93 64 288 64S57.68 135.64 3.48 241.41a32.35 32.35 0 0 0 0 29.19C57.71 376.41 165.07 448 288 448s230.32-71.64 284.52-177.41a32.35 32.35 0 0 0 0-29.19zM288 400a144 144 0 1 1 144-144 143.93 143.93 0 0 1-144 144zm0-240a95.31 95.31 0 0 0-25.31 3.79 47.85 47.85 0 0 1-66.9 66.9A95.78 95.78 0 1 0 288 160z"></path></svg>
                                                                    </a>

                                                                    <!--info theme Modal -->
                                                                    <div class="modal fade text-left" id="pod${p.productId}" tabindex="-1" aria-labelledby="myModalLabel130" style="display: none;" aria-hidden="true">
                                                                        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document" style="min-width: 60%;">
                                                                            <div class="modal-content">
                                                                                <div class="modal-header bg-info">
                                                                                    <h5 class="modal-title white" id="myModalLabel130">
                                                                                        Product Detail
                                                                                    </h5>
                                                                                    <h5 class="modal-title white" id="myModalLabel130">
                                                                                        ID: ${p.productId}
                                                                                    </h5>

                                                                                </div>
                                                                                <div class="modal-body bg-light-info">
                                                                                    <div class="d-flex">
                                                                                        <div style="flex: 38">
                                                                                            <p>Name: <span style="font-weight: 500">${p.productName}</span> </p>
                                                                                            <p>Sub-Category: <span style="font-weight: 500">${scDao.getSubCategoriesBySubCateId(p.subCategoryId).getSubCategoryName()}</span> </p>
                                                                                            <p>Brand: <span style="font-weight: 500">${bDao.getBrandById(p.brandId).getBrandName()}</span> </p>
                                                                                            <p>Import price: <span style="font-weight: 500">${p.getImportPriceVN()}</span> </p>
                                                                                            <p>Price: <span style="font-weight: 500">${p.getUnitPriceVN()}</span> </p>
                                                                                            <p>Created At: <span style="font-weight: 500">${p.getCreatedAtDate()}</span> </p>
                                                                                            <p>Modified At: <span style="font-weight: 500">${p.getModifiedAtDate()}</span> </p>
                                                                                            <p style="text-align: justify">Description: <span style="font-weight: 400; font-style: italic;">${p.desscription}</span> </p>
                                                                                        </div>
                                                                                        <div style="flex: 2"></div>
                                                                                        <div style="flex: 60;" class="row">
                                                                                            <c:forEach items="${p.getImages()}" var="pi">
                                                                                                <img class="img-fluid col-4 mb-2" style="height: fit-content" src="img/shoes/${pi.getUrl()}" alt="Product images: ${p.productId}">
                                                                                            </c:forEach>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="d-flex bg-light-info justify-content-center pt-3">
                                                                                        <table class="styled-table" id="tablePD">
                                                                                            <thead>
                                                                                                <tr>
                                                                                                    <th>Size</th>
                                                                                                    <th>Color</th>
                                                                                                    <th>Quantity</th>
                                                                                                </tr>
                                                                                            </thead>
                                                                                            <tbody>
                                                                                                <c:forEach items="${pdDao.getProductDetails(p.productId)}" var="pd">
                                                                                                    <tr>
                                                                                                        <td>${pd.size}</td>
                                                                                                        <td>${pd.color}</td>
                                                                                                        <td>${pd.quantityInStock}</td>
                                                                                                    </tr>
                                                                                                </c:forEach>
                                                                                                <!-- and so on... -->
                                                                                            </tbody>
                                                                                        </table>

                                                                                    </div>
                                                                                </div>  
                                                                                <div class="modal-footer bg-light-info">
                                                                                    <a href="#" type="button" data-bs-toggle="modal" data-bs-backdrop="true"
                                                                                       class="btn btn-success ml-1" data-bs-target="#rup${p.productId}">
                                                                                        <i class="bx bx-check d-block d-sm-none"></i>
                                                                                        <span class="d-none d-sm-block">Update</span>
                                                                                    </a>
                                                                                    <a href="#" type="button" class="btn btn-danger"
                                                                                       data-bs-toggle="modal" data-bs-backdrop="true" data-bs-target="#dlp${p.productId}">
                                                                                        <span class="d-none d-sm-block">Delete</span>
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
                                                                    <a href="#" type="button" class="btn btn-success"
                                                                       data-bs-toggle="modal" data-bs-target="#rup${p.productId}">
                                                                        <svg class="mb-1 svg-inline--fa fa-edit fa-w-18 fa-fw select-all" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="edit" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M402.6 83.2l90.2 90.2c3.8 3.8 3.8 10 0 13.8L274.4 405.6l-92.8 10.3c-12.4 1.4-22.9-9.1-21.5-21.5l10.3-92.8L388.8 83.2c3.8-3.8 10-3.8 13.8 0zm162-22.9l-48.8-48.8c-15.2-15.2-39.9-15.2-55.2 0l-35.4 35.4c-3.8 3.8-3.8 10 0 13.8l90.2 90.2c3.8 3.8 10 3.8 13.8 0l35.4-35.4c15.2-15.3 15.2-40 0-55.2zM384 346.2V448H64V128h229.8c3.2 0 6.2-1.3 8.5-3.5l40-40c7.6-7.6 2.2-20.5-8.5-20.5H48C21.5 64 0 85.5 0 112v352c0 26.5 21.5 48 48 48h352c26.5 0 48-21.5 48-48V306.2c0-10.7-12.9-16-20.5-8.5l-40 40c-2.2 2.3-3.5 5.3-3.5 8.5z"></path></svg>
                                                                    </a>
                                                                    <!--modal-->
                                                                    <div class="modal fade text-left" id="rup${p.productId}" tabindex="-1"
                                                                         role="dialog" aria-labelledby="myModalLabel160"
                                                                         aria-hidden="true">
                                                                        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
                                                                             role="document">
                                                                            <div class="modal-content">
                                                                                <div class="modal-header bg-success" style="display: flex; justify-content: space-between">
                                                                                    <h5 class="modal-title white" id="myModalLabel160">
                                                                                        Update
                                                                                    </h5>
                                                                                    <h5 class="modal-title white">ID: ${p.productId} </h5>
                                                                                </div>
                                                                                <div class="modal-body" >
                                                                                    Do you want to update this product?
                                                                                </div>
                                                                                <div class="modal-footer">
                                                                                    <a href="EmployeeUpdateProduct?pid=${p.productId}" class="btn btn-success ml-1"
                                                                                       >
                                                                                        <i class="bx bx-check d-block d-sm-none"></i>
                                                                                        <span class="d-none d-sm-block">Yes</span>
                                                                                    </a>
                                                                                    <button type="button"
                                                                                            class="btn btn-light-secondary"
                                                                                            data-bs-dismiss="modal">
                                                                                        <i class="bx bx-x d-block d-sm-none"></i>
                                                                                        <span class="d-none d-sm-block">Close</span>
                                                                                    </button>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="modal-danger me-1 mb-1 d-inline-block">
                                                                    <!-- Button trigger for danger theme modal -->
                                                                    <a href="#" type="button" class="btn btn-danger"
                                                                       data-bs-toggle="modal" data-bs-target="#dlp${p.productId}">
                                                                        <svg class="mb-1 svg-inline--fa fa-trash-alt fa-w-14 fa-fw select-all" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="trash-alt" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" data-fa-i2svg=""><path fill="currentColor" d="M32 464a48 48 0 0 0 48 48h288a48 48 0 0 0 48-48V128H32zm272-256a16 16 0 0 1 32 0v224a16 16 0 0 1-32 0zm-96 0a16 16 0 0 1 32 0v224a16 16 0 0 1-32 0zm-96 0a16 16 0 0 1 32 0v224a16 16 0 0 1-32 0zM432 32H312l-9.4-18.7A24 24 0 0 0 281.1 0H166.8a23.72 23.72 0 0 0-21.4 13.3L136 32H16A16 16 0 0 0 0 48v32a16 16 0 0 0 16 16h416a16 16 0 0 0 16-16V48a16 16 0 0 0-16-16z"></path></svg>
                                                                    </a>
                                                                    <!--Danger theme Modal -->
                                                                    <div class="modal fade text-left" id="dlp${p.productId}" tabindex="-1" aria-labelledby="myModalLabel120" aria-hidden="true" style="display: none;">
                                                                        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
                                                                            <div class="modal-content">
                                                                                <div class="modal-header bg-danger" style="display: flex; justify-content: space-between">
                                                                                    <h5 class="modal-title white" id="myModalLabel120">
                                                                                        Delete
                                                                                    </h5>
                                                                                    <h5 class="modal-title white">ID: ${p.productId} </h5>
                                                                                </div>
                                                                                <div class="modal-body">
                                                                                    Do you want to delete this product?
                                                                                </div>
                                                                                <div class="modal-footer">
                                                                                    <a onclick="deleteRow(${p.productId})" class="btn btn-danger ml-1"
                                                                                       >
                                                                                        <span class="d-none d-sm-block"  style="color: white">Yes</span>
                                                                                    </a>
                                                                                    <button type="button" class="btn btn-light-secondary" data-bs-dismiss="modal">
                                                                                        <i class="bx bx-x d-block d-sm-none"></i>
                                                                                        <span class="d-none d-sm-block">No</span>
                                                                                    </button>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                        <tfoot>
                                                    <tr>
                                                        <th></th>
                                                        <th></th>
                                                        <th>Select: </th>
                                                        <th>Category</th>
                                                        <th>Brand</th>
                                                        <th></th>
                                                        <th></th>
                                                        <th></th>
                                                        <th></th>
                                                        <th></th>
                                                    </tr>
                                                </tfoot>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div style="display: flex; justify-content: space-between" class="mt-3">
                                            <a name="action" href="#" type="button" data-bs-toggle="modal" data-bs-target="#delselected"
                                               class="btn btn-outline-danger ">Delete selected products</a>
                                            <!--modal-->
                                            <div class="modal fade text-left" id="delselected" tabindex="-1" aria-labelledby="myModalLabel120" aria-hidden="true" style="display: none;">
                                                <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header bg-danger">
                                                            <h5 class="modal-title white" id="myModalLabel120">
                                                                Delete
                                                            </h5>
                                                        </div>
                                                        <div class="modal-body">
                                                            Do you want to delete selected product?
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="submit" class="btn btn-danger ml-1"
                                                                    >
                                                                <span class="d-none d-sm-block"  style="color: white">Yes</span>
                                                            </button>
                                                            <button type="button" class="btn btn-light-secondary" data-bs-dismiss="modal">
                                                                <i class="bx bx-x d-block d-sm-none"></i>
                                                                <span class="d-none d-sm-block">No</span>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <a href="EmployeeViewProductsTrash" class="btn btn-outline-dark" style="margin-right: 40px">
                                                🗑 Bin</a>
                                            <a href="EmployeeAddProduct" class="btn btn-outline-primary" style="margin-right: 40px">+ Add product</a>
                                        </div>
                                        
                                    </form>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- Table head options end -->


                </div>
            </div>
            <script src="./assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
            <script src="./assets/js/bootstrap.bundle.min.js"></script>

            <script src="./assets/vendors/apexcharts/apexcharts.js"></script>
            <script src="./assets/js/pages/dashboard.js"></script>

            <script src="assets/vendors/simple-datatables/simple-datatables.js"></script>
            <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
            
            <script src="js/jquery.nice-select.min.js"></script>


            
            <script>
                // Simple Datatable
                let table1 = document.querySelector('#table1');
                let dataTable1 = new simpleDatatables.DataTable(table1);
                let table2 = document.querySelector('#table2');
                let dataTable2 = new simpleDatatables.DataTable(table2);

                // check all inpunt
                function toggle(source) {
                    checkboxes = document.getElementsByTagName('input');
                    for (var i = 0, n = checkboxes.length; i < n; i++) {
                        checkboxes[i].checked = source.checked;
                    }
                }

                // nice - select
//                $(document).ready(function () {
//                    $('nice-select').niceSelect();
//                });

                // ajax delete
                function deleteRow(r) {
                    // console.log(table.rows[i].cells[0].innerHTML);
                    $.ajax({
                        url: "EmployeeDeleteProduct?pid=" + r,
                        type: "GET",
                        success: function (data) {
                            location.reload();
                        },
                        error: function (data) {
                            alert("Cannot delete!")
                            location.reload();
                        }
                    });
                }
                ;


            </script>

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
                            var date = new Date(data[7]);

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
                    var table = $('#products').DataTable({
                        initComplete: function () {
                            this.api()
                                    .columns([3, 4])
                                    .every(function () {
                                        var column = this;
                                        var select = $('<select><option value=""></option></select>')
                                                .appendTo($(column.footer()).empty())
                                                .on('change', function () {
                                                    var val = $.fn.dataTable.util.escapeRegex($(this).val());

                                                    column.search(val ? '^' + val + '$' : '', true, false).draw();
                                                });

                                        column
                                                .data()
                                                .unique()
                                                .sort()
                                                .each(function (d, j) {
                                                    select.append('<option value="' + d + '">' + d + '</option>');
                                                });
                                    });
                        }
                    });

                    // Refilter the table
                    $('#min, #max').on('change', function () {
                        table.draw();
                    });
                });




            </script>
            <script src="./assets/js/main.js"></script>
            <script src="js/jquery.nice-select.min.js"></script>
    </body>

</html> 