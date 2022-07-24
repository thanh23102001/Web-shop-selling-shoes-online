<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Dashboard - Categories</title>
        <!--<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">-->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/bootstrap.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!--<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>-->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
        <link rel="stylesheet" href="assets/css/app.css">
        <link rel="stylesheet" href="//cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">
        <link rel="shortcut icon" href="assets/images/favicon.svg" type="image/x-icon">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/datetime/1.1.2/css/dataTables.dateTime.min.css">
        <style>
            .table .thead-dark th{
                color: white;
                background-color: #e89544;
                padding-top: 15px;
                padding-bottom: 15px;
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
                                <a href="index.html"><img src="assets/images/logo/logo.png" alt="Logo" srcset="" style="height: 150px"></a>
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
                                <a href="Admin" class='sidebar-link'>
                                    <i class="bi bi-grid-fill"></i>
                                    <span>Dashboard</span>
                                </a>
                            </li>

                            <li class="sidebar-item  has-sub ">
                                <a href="#" class='sidebar-link'>
                                    <i class="bi bi-person-badge-fill"></i>
                                    <span>Accounts</span>
                                </a>
                                <ul class="submenu ">
                                    <li class="submenu-item ">
                                        <a href="AdminManageEmployees">Employees</a>
                                    </li>
                                    <li class="submenu-item ">
                                        <a href="AdminManageCustomers">Customers</a>
                                    </li>
                                </ul>
                            </li>

                            <li class="sidebar-item  has-sub active">
                                <a href="#" class='sidebar-link'>
                                    <i class="bi bi-stack"></i>
                                    <span>Catalog</span>
                                </a>
                                <ul class="submenu active">
                                    <li class="submenu-item ">
                                        <a href="AdminViewProducts">Products</a>
                                    </li>
                                    <li class="submenu-item active">
                                        <a href="AdminViewCategories">Categories</a>
                                    </li>
                                    <li class="submenu-item ">
                                        <a href="AdminViewBrands">Brands</a>
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
                                        <a href="AdminViewOrders">Orders list</a>
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
                                        <li class="breadcrumb-item"><a href="admindashboard.jsp">Dashboard</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Catalog - Categories</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>


                    <!-- Table head options start -->
                    <section class="section">
                        <!--                        <div class="row py-3 mt-5 d-flex justify-content-between" style="background-color: white;margin-left: 1px; margin-right: 1px;">
                                                    <div class="d-flex">
                                                        <label class="mt-2 mr-2">From</label>
                                                        <input type="text" name="min" id="min" class="form-control" >
                                                        <label class="mt-2 mx-2">to</label>
                                                        <input type="text" name="max" id="max" class="form-control">
                                                    </div>
                                                </div>-->
                        <div class="row mt-4" id="table-head" >
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-content">
                                        <!-- table head dark -->
                                        <div class="table-responsive">
                                            <c:if test="${action == 'view_subcategories'}">
                                                <table class="table mb-0 table-borderless mb-4 " id="example" style="background-color: white;" >
                                                    <thead class="thead-dark"  >
                                                        <tr>
                                                            <th>#</th>
                                                            <th></th>
                                                            <th>Sub-Category Name</th>
                                                            <th>Created Date</th>
                                                            <th>Status</th>
                                                            <th></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="myTable">
                                                        <c:forEach items="${SubCategories}" var="sub">
                                                            <tr>
                                                                <td>${sub.getSubCategoryId()}</td>
                                                                <td >
                                                                    <img src="img/category/${sub.getImage()}" height="120px" width="130px">
                                                                </td>
                                                                <td class="font-bold">${sub.getSubCategoryName()}</td>
                                                                <td>${sub.getCreatedAt()}</td>
                                                                <td>
                                                                    <c:if test="${sub.getStatus() == 'activate'}">
                                                                        <i class='far fa-eye' style='font-size:24px;color: #black;' title="activate" data-toggle="tooltip"></i>
                                                                    </c:if>
                                                                    <c:if test="${sub.getStatus() == 'not activate'}">
                                                                        <i class='far fa-eye-slash' style='font-size:24px;color: #ca0606;' title="not activate" data-toggle="tooltip"></i>
                                                                    </c:if>
                                                                </td>
                                                                <td>
                                                                    <a style="padding-right: 15px;" class="pt-2 mt-2" 
                                                                       data-toggle="modal" data-target=".bd-example-modal-lg-${sub.getSubCategoryId()}"
                                                                       title="View Details" data-toggle="tooltip">
                                                                        <img src="https://img.icons8.com/external-phatplus-lineal-phatplus/64/000000/external-details-virus-transmission-phatplus-lineal-phatplus.png" height="30px" width="30px"/>
                                                                    </a>

                                                                    <div class="modal fade bd-example-modal-lg-${sub.getSubCategoryId()}" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                                                                        <div class="modal-dialog modal-lg">
                                                                            <div class="modal-content" style="background-color: aliceblue;">
                                                                                <div class="modal-header h5 font-bold" style="background-color: #e89544;color: white;">Sub-Category Details</div>
                                                                                <div class="modal-body row" >
                                                                                    <div class="col-md-5">
                                                                                        <img src="img/category/${sub.getImage()}" width="300px" height="300px">
                                                                                    </div>
                                                                                    <div class="col-md-7">
                                                                                        <div class="d-flex">
                                                                                            <p class="mr-2">Category:</p> 
                                                                                            <p class="font-bold" style="font-style: italic;">${sub.getCategory().getCategoryName()}</p>
                                                                                        </div>
                                                                                        <div class="d-flex">
                                                                                            <p class="mr-2">Sub-Category Name:</p> 
                                                                                            <p class="font-bold" style="font-style: italic;">${sub.getSubCategoryName()}</p>
                                                                                        </div>
                                                                                        <div class="d-flex">
                                                                                            <p class="mr-2">Created Date:</p> 
                                                                                            <p class="font-bold" style="font-style: italic;">${sub.getCreatedAt()}</p>
                                                                                        </div>
                                                                                        <div class="d-flex">
                                                                                            <p class="mr-2">Modified Date (most recent): </p> 
                                                                                            <p class="font-bold" style="font-style: italic;">${sub.getModifiedAt()}</p>
                                                                                        </div>
                                                                                        <div class="d-flex">
                                                                                            <p class="mr-2">Description:</p> 
                                                                                            <p class="font-bold" style="font-style: italic;">${sub.getDescription()}</p>
                                                                                        </div>
                                                                                        <div class="d-flex pb-0 mb-0">
                                                                                            <p class="mr-2">Status:</p> 
                                                                                            <c:if test="${sub.getStatus() == 'activate'}">
                                                                                                <p  style="font-style: italic;color: #3ae53a;">${sub.getStatus()} 
                                                                                                </c:if>
                                                                                                <c:if test="${sub.getStatus() == 'not activate'}">
                                                                                                <p  style="font-style: italic;color: #df3131;">${sub.getStatus()} 
                                                                                                </c:if>
                                                                                            </p>
                                                                                        </div>
                                                                                        <div class="d-flex">
                                                                                            <p class="mr-2">Total products:</p> 
                                                                                            <p style="font-style: italic;">${sub.getTotalProduct()} products
                                                                                            </p>

                                                                                        </div>

                                                                                    </div>
                                                                                </div>
                                                                                <div class="modal-footer">
                                                                                    <button type="button" style="background-color: #e89544;" class="btn btn-light px-4 text-white border" data-dismiss="modal">Close</button>
                                                                                </div>

                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </c:if>
                                            <c:if test="${action == 'view_categories'}">
                                                <table class="table table-borderless" id="example">
                                                    <thead class="thead-dark">
                                                        <tr>
                                                            <th>#</th>
                                                            <th>Category Name</th>
                                                            <th>Units In Stock</th>
                                                            <th>Created Date</th>
                                                            <th>Modified Date</th>
                                                            <th></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="myTable">
                                                        <c:forEach items="${Categories}" var="category">
                                                            <tr >
                                                                <td>${category.getCategoryId()}</td>
                                                                <td >${category.getCategoryName()}'s shoes</td>
                                                                <td >${category.getTotalProduct()}</td>
                                                                <td>${category.getCreatedAt()}</td>
                                                                <td>${category.getModifiedAt()}</td>
                                                                <td>
                                                                    <a style="padding-right: 20px; color: black" class="pt-1" 
                                                                       data-toggle="modal" data-target=".bd-example-modal-lg${category.getCategoryId()}"
                                                                       title="View Details" data-toggle="tooltip">
                                                                        <svg class="mb-1 svg-inline--fa fa-eye fa-w-18 fa-fw select-all" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="eye" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M572.52 241.4C518.29 135.59 410.93 64 288 64S57.68 135.64 3.48 241.41a32.35 32.35 0 0 0 0 29.19C57.71 376.41 165.07 448 288 448s230.32-71.64 284.52-177.41a32.35 32.35 0 0 0 0-29.19zM288 400a144 144 0 1 1 144-144 143.93 143.93 0 0 1-144 144zm0-240a95.31 95.31 0 0 0-25.31 3.79 47.85 47.85 0 0 1-66.9 66.9A95.78 95.78 0 1 0 288 160z"></path></svg>                                                                    </a>

                                                                    <div class="modal fade bd-example-modal-lg${category.getCategoryId()}" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                                                                        <div class="modal-dialog modal-lg">
                                                                            <div class="modal-content" style="background-color: aliceblue;">
                                                                                <div class="modal-header h5 font-bold" style="background-color: #e89544;color: white;">Category Information</div>
                                                                                <div class="modal-body row">
                                                                                    <div class="col-md-12">
                                                                                        <div class="d-flex">
                                                                                            <p class="mr-2">Category name:</p> 
                                                                                            <p class="font-bold" style="font-style: italic;">${category.getCategoryName()}'s shoes</p>
                                                                                        </div>
                                                                                        <div class="d-flex">
                                                                                            <p class="mr-2">Created Date:</p> 
                                                                                            <p class="font-bold" style="font-style: italic;">${category.getCreatedAt()}</p>
                                                                                        </div>
                                                                                        <div class="d-flex">
                                                                                            <p class="mr-2">Modified Date (most recent): </p> 
                                                                                            <p class="font-bold" style="font-style: italic;">${category.getModifiedAt()}</p>
                                                                                        </div>
                                                                                        <div class="d-flex">
                                                                                            <p class="mr-2">Description:</p> 
                                                                                            <p class="font-bold" style="font-style: italic;">${category.getCategoryDescription()}</p>
                                                                                        </div>
                                                                                        <div class="d-flex">
                                                                                            <p class="mr-2">Total products:</p> 
                                                                                            <p class="font-bold" style="font-style: italic;">${category.getTotalProduct()} products
                                                                                            </p>
                                                                                            <a style="text-decoration: underline;font-style: italic;color: #b3ca92;margin-left: 8px;">click here to view products</a>
                                                                                        </div>
                                                                                        <div class="d-flex pb-0 mb-0">
                                                                                            <p class="mr-2">Total sub-categories:</p> 
                                                                                            <p class="font-bold" style="font-style: italic;">${category.getSubcategories().size()} sub-categories
                                                                                            </p>
                                                                                            <a style="text-decoration: underline;font-style: italic;color: #b3ca92;margin-left: 8px;" href="AdminViewSubCategories?categoryId=${category.getCategoryId()}">click here to view sub-categories of this category</a>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="modal-footer">
                                                                                    <button type="button" class="btn btn-light px-4 text-white border" style="background-color: #e89544;" data-dismiss="modal">Close</button>
                                                                                </div>

                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- Table head options end -->
                </div>
            </div>
            <script src="./assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
            <script src="./assets/js/bootstrap.bundle.min.js"></script>
            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
            <script src="./assets/js/main.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
            <script>
                $(document).ready(function () {
                    $("#myInput").on("keyup", function () {
                        var value = $(this).val().toLowerCase();
                        $("#myTable tr").filter(function () {
                            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                        });
                    });
                });
            </script>
            <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
            <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.2/moment.min.js"></script>
            <script src="https://cdn.datatables.net/datetime/1.1.2/js/dataTables.dateTime.min.js"></script>


            <script>
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
                        format: 'DD/MMM/YYYY',
                    });
                    maxDate = new DateTime($('#max'), {
                        format: 'DD/MMM/YYYY',
                    });

                    // DataTables initialisation
                    var table = $('#example').DataTable();

                    // Refilter the table
                    $('#min, #max').on('change', function () {
                        table.draw();
                    });
                });
            </script>
    </body>

</html>