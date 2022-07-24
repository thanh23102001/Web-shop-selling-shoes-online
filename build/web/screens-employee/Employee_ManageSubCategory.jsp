<!DOCTYPE html>
<html lang="en">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Employee Dashboard - SubCategory</title>

        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/bootstrap.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
        <link rel="stylesheet" href="assets/css/app.css">
        <link rel="shortcut icon" href="assets/images/favicon.svg" type="image/x-icon">
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        
        <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/datetime/1.1.2/css/dataTables.dateTime.min.css">
    </head>
    <style>
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
    </style>
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
                                    <li class="submenu-item ">
                                        <a href="EmployeeManageProducts">Products</a>
                                    </li>
                                    <li class="submenu-item active">
                                        <a href="EmployeeManageCategories">Categories</a>
                                    </li>
                                    <li class="submenu-item ">
                                        <a href="EmployeeManageBrands">Brands</a>
                                    </li>
                                </ul>
                            </li>

                            <li class="sidebar-item  has-sub">
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
                                <h3>Categories</h3>
                                <p class="text-subtitle text-muted">Catogries list</p>
                            </div>
                            <div class="col-12 col-md-6 order-md-2 order-first">
                                <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="Employee">Dashboard</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Catalog - Categories</li>
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
                                    <div class="card-content">

                                        <!-- table head dark -->
                                        <div class="table-responsive">
                                            <table border="0" cellspacing="5" cellpadding="5">
                                            <tbody><tr>
                                                    <td>Minimum date:</td>
                                                    <td><input type="text" id="min" name="min"></td>
                                                </tr>
                                                <tr>
                                                    <td>Maximum date:</td>
                                                    <td><input type="text" id="max" name="max"></td>
                                                </tr>
                                            </tbody></table>
                                        <table id="brands" class="display nowrap" style="width:100%">
                                                <thead class="thead-dark">
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Sub-Category Name</th>
                                                        <th>Units In Stock</th>
                                                        <th>Description</th>
                                                        <th>Created At</th>
                                                        <th>Status</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${listSubCate}" var="s">
                                                        <tr>
                                                            <td>${s.getSubCategoryId()}</td>
                                                            <td class="text-bold-500">${s.getSubCategoryName()}</td>
                                                            <td>${s.getTotalProduct()}</td>
                                                            <td> <img class="img-fluid" src="img/category/${s.getImage()}" alt="" style="width: 100px;height:100px"></td>
                                                            <td>${s.getCreatedAt()}</td>
                                                            <td>${s.getStatus()}</td>
                                                            <td>
                                                                <c:if test="${s.getStatus() == 'activate'}">
                                                                <div class="modal fade" id="modalLoginForm${s.getSubCategoryId()}" tabindex="-1"
                                                                     role="dialog" aria-labelledby="myModalLabel"
                                                                     aria-hidden="true">
                                                                    <div class="modal-dialog" role="document">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header text-center" >
                                                                                <button type="button" class="close"
                                                                                        data-dismiss="modal" aria-label="Close">
                                                                                    <span aria-hidden="true">&times;</span>
                                                                                </button>
                                                                            </div>
                                                                            <div class="modal-body mx-3">
                                                                                <div class="md-form mb-4">
                                                                                    <label>The number of products for this brand is: <label style="color: red;font: bold">${s.getTotalProduct()}</label> </label>
                                                                                    <label>Are you sure you want to delete ?</label>
                                                                                </div>
                                                                            </div>
                                                                            <div
                                                                                class="modal-footer d-flex justify-content-end">
                                                                                <a href="EmployeeDeleteSubCategory?subId=${s.getSubCategoryId()}&cateId=${cateId}"
                                                                                   class="btn btn-danger">Ok</a> 
                                                                            </div>
                                                                        </div>
                                                                    </div> 
                                                                </div>   
                                                                </c:if>
                                                                
                                                                 <c:if test="${s.getStatus() != 'activate'}">
                                                                <div class="modal fade" id="modalLoginForm${s.getSubCategoryId()}" tabindex="-1"
                                                                     role="dialog" aria-labelledby="myModalLabel"
                                                                     aria-hidden="true">
                                                                    <div class="modal-dialog" role="document">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header text-center" >
                                                                                <button type="button" class="close"
                                                                                        data-dismiss="modal" aria-label="Close">
                                                                                    <span aria-hidden="true">&times;</span>
                                                                                </button>
                                                                            </div>
                                                                            <div class="modal-body mx-3">
                                                                                <div class="md-form mb-4">
                                                                           
                                                                                    <label>Are you sure you want to restore ?</label>
                                                                                </div>
                                                                            </div>
                                                                            <div
                                                                                class="modal-footer d-flex justify-content-end">
                                                                                <a href="EmployeeRestoreSubCategory?subId=${s.getSubCategoryId()}&cateId=${cateId}"
                                                                                   class="btn btn-danger">Ok</a> 
                                                                            </div>
                                                                        </div>
                                                                    </div> 
                                                                </div>   
                                                                </c:if>
                                                                
                                                                <c:if test="${s.getStatus() == 'activate'}">
                                                                    <a href=""  data-toggle="modal"
                                                                       data-target="#modalLoginForm${s.getSubCategoryId()}" title="Edit address" aria-expanded="false" class="btn btn-danger">Delete</a>
                                                                </c:if>

                                                                <c:if test="${s.getStatus() != 'activate'}">
                                                                    <a href=""  data-toggle="modal"
                                                                       data-target="#modalLoginForm${s.getSubCategoryId()}" title="Edit address" aria-expanded="false" class="btn btn-success">Restore</a>
                                                                </c:if>

                                                                <a href="EmployeeUpdateCategory?subid=${s.getSubCategoryId()}&subname=${s.getSubCategoryName()}&description=${s.getDescription()}&status=${s.getStatus()}&cateId=${cateId}&logo=${s.getImage()}" class="btn btn-success">Edit</a></td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                        <a href="EmployeeAddCategory?cateId=${cateId}" class="btn btn-info">Add new</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- Table head options end -->

                </div>
            </div>
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
                        var date = new Date(data[4]);
                        
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
            <script src="./assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
            <script src="./assets/js/bootstrap.bundle.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
            <script src="./assets/js/main.js"></script>
    </body>

</html>