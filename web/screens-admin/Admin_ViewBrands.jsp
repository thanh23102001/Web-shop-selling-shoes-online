<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Dashboard - Brands</title>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/bootstrap.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!--<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>-->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <link rel="stylesheet" href="assets/css/app.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">
        <link rel="stylesheet" href="//cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">
        <link rel="shortcut icon" href="assets/images/favicon.svg" type="image/x-icon">
        <link rel="stylesheet" href="https://cdn.datatables.net/datetime/1.1.2/css/dataTables.dateTime.min.css">
        <style>
            .table .thead-dark th{
                color: white;
                background-color: #3a53aa;
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
                                    <li class="submenu-item ">
                                        <a href="AdminViewCategories">Categories</a>
                                    </li>
                                    <li class="submenu-item active">
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
                                <h3>Brands</h3>
                                <p class="text-subtitle text-muted">Brands list</p>
                            </div>
                            <div class="col-12 col-md-6 order-md-2 order-first">
                                <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="admindashboard.jsp">Dashboard</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Catalog - Brands</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>


                    <!-- Table head options start -->
                    <section class="section">
                        <div class="row mt-4" id="table-head" >
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-content">
                                        <!-- table head dark -->
                                        <div class="table-responsive">
                                            <table class="table mb-0 table-borderless mb-4 " id="example" style="background-color: white;" >
                                                <thead class="thead-dark"  >
                                                    <tr>
                                                        <th>#</th>
                                                        <th></th>
                                                        <th>Brand Name</th>
                                                        <th>Created Date</th>
                                                        <th>Status</th>
                                                        <th></th>
                                                    </tr>
                                                </thead>
                                                <tbody id="myTable">
                                                    <c:forEach items="${brands}" var="brand">
                                                        <tr>
                                                            <td>${brand.getBrandId()}</td>
                                                            <td class="d-flex justify-content-center">
                                                                <img src="img/brand/${brand.getBrandImage()}" height="150px" width="50%">
                                                            </td>
                                                            <td>
                                                                <p class="font-bold">${brand.getBrandName()}</p>
                                                            </td>
                                                            <td>${brand.getCreatedAt()}</td>
                                                            <td>
                                                                <c:if test="${brand.getStatus() == 'activate'}">
                                                                    <i class='far fa-eye' style='font-size:24px;color: #75af1c;' title="activate" data-toggle="tooltip"></i>
                                                                </c:if>
                                                                <c:if test="${brand.getStatus() == 'not activate'}">
                                                                    <i class='far fa-eye-slash' style='font-size:24px;color: #ca0606;' title="not activate" data-toggle="tooltip"></i>
                                                                </c:if>
                                                            </td>
                                                            <td>
                                                                <a style="padding-right: 15px;" class="pt-2 mt-2" 
                                                                   data-toggle="modal" data-target=".bd-example-modal-lg-${brand.getBrandId()}"
                                                                   title="View Details" data-toggle="tooltip">
                                                                    <img src="https://img.icons8.com/external-phatplus-lineal-color-phatplus/64/000000/external-details-virus-transmission-phatplus-lineal-color-phatplus.png" height="30px" width="30px" />
                                                                </a>

                                                                <div class="modal fade bd-example-modal-lg-${brand.getBrandId()}" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                                                                    <div class="modal-dialog modal-lg">
                                                                        <div class="modal-content" style="background-color: aliceblue;">
                                                                            <div class="modal-header h5 font-bold" style="background-color: #3a53aa;color: white;">Brand Details</div>
                                                                            <div class="modal-body row" >
                                                                                <div class="col-md-5">
                                                                                    <img src="img/brand/${brand.getBrandImage()}" width="300px" height="300px">
                                                                                </div>
                                                                                <div class="col-md-7">
                                                                                    <div class="d-flex">
                                                                                        <p class="mr-2">Brand Name:</p> 
                                                                                        <p class="font-bold" style="font-style: italic;">${brand.getBrandName()}</p>
                                                                                    </div>
                                                                                    <div class="d-flex">
                                                                                        <p class="mr-2">Created Date:</p> 
                                                                                        <p class="font-bold" style="font-style: italic;">${brand.getCreatedAt()}</p>
                                                                                    </div>
                                                                                    <div class="d-flex">
                                                                                        <p class="mr-2">Modified Date (most recent): </p> 
                                                                                        <p class="font-bold" style="font-style: italic;">${brand.getModifiedAt()}</p>
                                                                                    </div>
                                                                                    <div class="d-flex">
                                                                                        <p class="mr-2">Description:</p> 
                                                                                        <p class="font-bold" style="font-style: italic;">${brand.getDescription()}</p>
                                                                                    </div>
                                                                                    <div class="d-flex pb-0 mb-0">
                                                                                        <p class="mr-2">Status:</p> 
                                                                                        <c:if test="${brand.getStatus() == 'activate'}">
                                                                                            <p  style="font-style: italic;color: #3ae53a;">${brand.getStatus()} 
                                                                                            </c:if>
                                                                                            <c:if test="${brand.getStatus() == 'not activate'}">
                                                                                            <p  style="font-style: italic;color: #df3131;">${brand.getStatus()} 
                                                                                            </c:if>
                                                                                        </p>
                                                                                    </div>
                                                                                    <div class="d-flex">
                                                                                        <p class="mr-2">Total Products:</p> 
                                                                                        <p  style="font-style: italic;">${brand.getTotalProduct()}</p>
                                                                                    </div>

                                                                                </div>
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <button type="button" style="background-color: #3a53aa;" class="btn btn-light px-4 text-white border" data-dismiss="modal">Close</button>
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
                            </div>
                        </div>
                    </section>
                    <!-- Table head options end -->
                </div>
            </div>
            <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
            <script src="assets/js/bootstrap.bundle.min.js"></script>

            <script src="assets/js/main.js"></script>
            <script src="./assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
            <script src="./assets/js/bootstrap.bundle.min.js"></script>
            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
            <script src="./assets/js/main.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
            <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
            <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
            <script>
                $(document).ready(function () {
                    $('#example').DataTable({
                        pagingType: 'full_numbers',
                    });
                });
            </script>
    </body>

</html>