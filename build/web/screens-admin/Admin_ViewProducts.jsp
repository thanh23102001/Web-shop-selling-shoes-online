<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Dashboard - Products</title>

        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/bootstrap.css">

        <link rel="stylesheet" href="assets/vendors/iconly/bold.css">

        <link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
        <link rel="stylesheet" href="assets/css/app.css">
        <link rel="shortcut icon" href="assets/images/favicon.svg" type="image/x-icon">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/datetime/1.1.2/css/dataTables.dateTime.min.css">
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
                                    <li class="submenu-item active">
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
                                <h3>Products</h3>
                                <p class="text-subtitle text-muted"></p>
                            </div>
                            <div class="col-12 col-md-6 order-md-2 order-first">
                                <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="admindashboard.jsp">Dashboard</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Catalog - Products</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>

                    <form id="form" action="AdminViewProducts" method="post">
                        <input type="text" hidden name="page" id="pageNo"/>
                        <div class="row mb-3" >
                            <div class="col-3">
                                Sub-Category: <select id="cateSelect" name="cate" value="${scate}">
                                    <option value="" >-All-</option>
                                    <c:forEach items="${categories}" var="c">
                                        <option value="${c.getId()}">${c.getName()}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-3" style="padding-left: 10%">
                                Brand: <select id="brandSelect" name="brand" value="${sbrand}">
                                    <option value="">-All-</option>
                                    <c:forEach items="${brands}" var="b">
                                        <option value="${b.getId()}">${b.getName()}</option>
                                    </c:forEach>
                                </select>

                            </div>
                            <div style="padding-left: 38%"><button class="btn btn-primary" type="submit">Search</button></div>
                        </div>
                    </form>
                    <!--                    <div class="row mb-3">
                                            <nav aria-label="...">
                                                <ul class="pagination">


            </ul>
        </nav>
    </div>-->
                    <!--                    Table head options start -->
                    <section class="section ">
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
                                            <table id="products" class="table table-striped" style="width:100%">
                                                <thead class="thead-dark">
                                                    <tr>
                                                        <th>Index</th>
                                                        <th>Product Name </th>
                                                        <th>Category</th>
                                                        <th>Brand</th>
                                                        <th>Import Price</th>
                                                        <th>Unit Price</th>
                                                        <th>Created At </th>
                                                        <th></th>
                                                        <th>View more</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${ls}" var="p">
                                                        <tr>
                                                            <td>${p.getProductId()}</td>
                                                            <td>${p.getProductName()}</td>
                                                            <td>${p.getSubCateName()}</td>
                                                            <td>${p.getBrand()}</td>
                                                            <td>${p.getImportPrice()}</td>
                                                            <td>${p.getUnitPrice()}</td>
                                                            <td>${p.getCreatedAtDate()}</td>
                                                            <td>${p.getModifiedAtDate()}</td>
                                                            <td>
                                                                <a href="#" class="btn btn-info"
                                                                   data-bs-toggle="modal" data-bs-target="#pod${p.productId}">
                                                                    <svg class="mb-1 svg-inline--fa fa-eye fa-w-18 fa-fw select-all" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="eye" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M572.52 241.4C518.29 135.59 410.93 64 288 64S57.68 135.64 3.48 241.41a32.35 32.35 0 0 0 0 29.19C57.71 376.41 165.07 448 288 448s230.32-71.64 284.52-177.41a32.35 32.35 0 0 0 0-29.19zM288 400a144 144 0 1 1 144-144 143.93 143.93 0 0 1-144 144zm0-240a95.31 95.31 0 0 0-25.31 3.79 47.85 47.85 0 0 1-66.9 66.9A95.78 95.78 0 1 0 288 160z"></path></svg>
                                                                </a>
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
                                                                                    
                                                                                    <button type="button" class="btn btn-light-secondary" data-bs-dismiss="modal">
                                                                                        <i class="bx bx-x d-block d-sm-none"></i>
                                                                                        <span class="d-none d-sm-block">Close</span>
                                                                                    </button>
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
                                                                                                    var date = new Date(data[6]);

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
                                                                                            var table = $('#products').DataTable();

                                                                                            // Refilter the table
                                                                                            $('#min, #max').on('change', function () {
                                                                                                table.draw();
                                                                                            });
                                                                                        });
            </script>
            <script src="./assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
            <script src="./assets/js/bootstrap.bundle.min.js"></script>

            <script src="./assets/vendors/apexcharts/apexcharts.js"></script>
            <script src="./assets/js/pages/dashboard.js"></script>

            <script src="./assets/js/main.js"></script>
    </body>

</html>