<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Employee Dashboard - Products</title>

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


                    <!-- Table head options start -->
                    <section class="section">
                        <div class="row" id="table-head">
                            <div class="col-12">
                                <div class="card">
                                    <form action="" class="card-content">
                                        <div style="display: none; color: #848181;padding: 5px 0 5px 0; justify-content: space-between; font-family: -apple-system,BlinkMacSystemFont,sans-serif; color: #666666">
                                            <div>
                                                <select>
                                                    <c:forEach items="${categories}" var="c">
                                                        <option value="${c.categoryId}">${c.categoryName}</option>
                                                    </c:forEach>
                                                </select>
                                                <select>
                                                    <option>${subcateSelector}</option>
                                                    <c:forEach items="${subcategories}" var="sc">
                                                        <option value="${sc.subCategoryId}">${sc.subCategoryName}</option>
                                                    </c:forEach>
                                                </select>
                                                <select>
                                                    <c:forEach items="${brands}" var="b">
                                                        <option value="${b.brandId}">${b.brandName}</option>
                                                    </c:forEach>
                                                </select>

                                            </div>
                                            <div>
                                                <label for="dateFrom">Created from</label> <input name="dateFrom" type="date">
                                                <label for="dateFrom">to</label> <input name="dateFrom" type="date">
                                            </div>
                                        </div>
                                        <!-- table head dark -->
                                        <div class="table-responsive">
                                            <table class="table table-striped" id="table1">
                                                <thead>
                                                    <tr>
                                                        <th><input onClick="toggle(this)" id="allCheck" type="checkbox" class="form-check-secondary" name="">
                                                        </th>
                                                        <th>#</th>
                                                        <th>Product Name </th>
                                                        <th>Category</th>
                                                        <th>Brand</th>
                                                        <th>Import Price</th>
                                                        <th>Unit Price</th>
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
                                                                <div class="modal-primary me-1 mb-1 d-inline-block">
                                                                    <!-- Button trigger for danger theme modal -->
                                                                    <a href="#" type="button" class="btn btn-primary"
                                                                       data-bs-toggle="modal" data-bs-target="#dlp${p.productId}">
                                                                        ↻</a>
                                                                    <!--Danger theme Modal -->
                                                                    <div class="modal fade text-left" id="dlp${p.productId}" tabindex="-1" aria-labelledby="myModalLabel120" aria-hidden="true" style="display: none;">
                                                                        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
                                                                            <div class="modal-content">
                                                                                <div class="modal-header bg-primary" style="display: flex; justify-content: space-between">
                                                                                    <h5 class="modal-title white" id="myModalLabel120">
                                                                                        Restore
                                                                                    </h5>
                                                                                    <h5 class="modal-title white">ID: ${p.productId} </h5>
                                                                                </div>
                                                                                <div class="modal-body">
                                                                                    Do you want to restore this product?
                                                                                </div>
                                                                                <div class="modal-footer">
                                                                                    <a href="EmployeeRestoreProducts?pid=${p.productId}" type="button" class="btn btn-primary ml-1"
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
                                                </tbody>
                                            </table>
                                        </div>
                                        <div style="display: flex; justify-content: space-between">
                                            <input type="submit" name="action" class="btn btn-outline-primary " value="Restore selected products">
                                            <a href="EmployeeManageProducts" class="btn btn-outline-light" style="margin-right: 40px">Back to Products Management</a>
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
                
            </script>
            
            <script src="./assets/js/main.js"></script>
            <script src="js/vendor/jquery-2.2.4.min.js"></script>
            <script src="js/jquery.nice-select.min.js"></script>
    </body>

</html> 