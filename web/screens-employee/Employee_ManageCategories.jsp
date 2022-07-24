<!DOCTYPE html>
<html lang="en">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Employee Dashboard - Categories</title>

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
        
        <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/datetime/1.1.2/css/dataTables.dateTime.min.css">
        
        <script src="./assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
            <script src="./assets/js/bootstrap.bundle.min.js"></script>
            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
            <script src="./assets/js/main.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
                                                <thead class="thead-dark">
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Category Name</th>
                                                        <th>Units In Stock</th>
                                                        <!--<th>Description</th>-->
                                                        <th>Created At</th>
                                                        <th>Category Name</th>
                                                        <th></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${listCategory}" var="c">
                                                        <tr>
                                                            <td>${c.getCategoryId()}</td>
                                                            <td class="text-bold-500">${c.getCategoryName()}</td>
                                                            <td>${c.getTotalProduct()}</td>
                                                            <td>${c.getCreatedAt()}</td>
                                                            <td><a href="EmployeeManageSubcategory?cateId=${c.getCategoryId()}" class="btn btn-info">View</a></td>
                                                             <td>
                                                                    <a style="padding-right: 15px;" class="pt-2 mt-2" 
                                                                       data-toggle="modal" data-target=".bd-example-modal-lg-${c.getCategoryId()}"
                                                                       title="View Details" data-toggle="tooltip">
                                                                        <img src="https://img.icons8.com/external-phatplus-lineal-phatplus/64/000000/external-details-virus-transmission-phatplus-lineal-phatplus.png" height="30px" width="30px"/>
                                                                    </a>

                                                            <div class="modal fade bd-example-modal-lg-${c.getCategoryId()}" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                                                                        <div class="modal-dialog modal-lg modal-dialog-scrollable">
                                                                            <div class="modal-content" style="background-color: aliceblue;">
                                                                                <div class="modal-header h5 font-bold" style="background-color: #e89544;color: white;">Sub-Category Details</div>
                                                                                <div class="modal-body row" >
                                                                                    <div class="col-md-7">
                                                                                        <div class="d-flex">
                                                                                            <p class="mr-2">Category Name:</p> 
                                                                                            <p class="font-bold" style="font-style: italic;">${c.getCategoryName()}</p>
                                                                                        </div>
                                                                                        <div class="d-flex">
                                                                                            <p class="mr-2">Created Date:</p> 
                                                                                            <p class="font-bold" style="font-style: italic;">${c.getCreatedAt()}</p>
                                                                                        </div>
                                                                                        <div class="d-flex">
                                                                                            <p class="mr-2">Modified Date (most recent): </p> 
                                                                                            <p class="font-bold" style="font-style: italic;">${c.getModifiedAt()}</p>
                                                                                        </div>
                                                                                        <div class="d-flex">
                                                                                            <p class="mr-2">Description:</p> 
                                                                                            <p class="font-bold" style="font-style: italic;">${c.getCategoryDescription()}</p>
                                                                                        </div>
                                                                                        <div class="d-flex">
                                                                                            <p class="mr-2">Total products:</p> 
                                                                                            <p style="font-style: italic;">${c.getTotalProduct()} products
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
                                        </div>
                                        <a href="EmployeeAddCategories" class="btn btn-info">Add new</a>
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

            <script src="./assets/js/main.js"></script>
    </body>

</html>