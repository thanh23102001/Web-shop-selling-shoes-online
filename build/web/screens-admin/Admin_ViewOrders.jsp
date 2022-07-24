<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Dashboard - Orders</title>

        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/bootstrap.css">
        
        <link rel="stylesheet" href="assets/vendors/simple-datatables/style.css">

        <link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
        <link rel="stylesheet" href="assets/css/app.css">
        <link rel="shortcut icon" href="assets/images/favicon.svg" type="image/x-icon">
        <script src="https://cdn.jsdelivr.net/npm/moment@2.24.0/moment.min.js"></script>    
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

                            <li class="sidebar-item  has-sub ">
                                <a href="#" class='sidebar-link'>
                                    <i class="bi bi-stack"></i>
                                    <span>Catalog</span>
                                </a>
                                <ul class="submenu ">
                                    <li class="submenu-item ">
                                        <a href="AdminViewProducts">Products</a>
                                    </li>
                                    <li class="submenu-item ">
                                        <a href="AdminViewCategories">Categories</a>
                                    </li>
                                    <li class="submenu-item ">
                                        <a href="AdminViewBrands">Brands</a>
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
                                <h3>Orders</h3>
                                <p class="text-subtitle text-muted">Orders list</p>
                            </div>
                            <div class="col-12 col-md-6 order-md-2 order-first">
                                <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Orders - Orders List</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>

                    <section class="section">
                        <div class="card">
                            <div class="card-body">
                                <table class="table table-striped" id="table1">
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

                    </section>

                </div>

            </div>
            <script src="assets/vendors/simple-datatables/simple-datatables.js"></script>
            <script>
                // Simple Datatable
                let table1 = document.querySelector('#table1');
                let dataTable1 = new simpleDatatables.DataTable(table1);
            </script>
            <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
            <script src="assets/js/bootstrap.bundle.min.js"></script>

            <script src="assets/js/main.js"></script>
    </body>

</html>