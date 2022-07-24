<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Employee Dashboard - Order Statistics</title>

        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/bootstrap.css">

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
                                <h3>User Profile</h3>
                                <p class="text-subtitle text-muted">View Profile</p>
                            </div>
                            <div class="col-12 col-md-6 order-md-2 order-first">
                                <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Profile</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>

                    <section class="section">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4>View Profile</h4>
                                        <p>Manage profile information for account security</p>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <table class="table w-75 ml-3">
                                <tbody>
                                    <tr >
                                        <th scope="row">UserName</th>
                                        <td>
                                            <input type="text" name="username" id="username" value="${account.getUsername()}" disabled class="p-1 w-50">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Email</th>
                                        <td>
                                            <input type="text" name="email" id="email" value="${account.getEmail()}" disabled class="p-1 w-50">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Password</th>
                                        <td class="d-flex">
                                            <input id="password" type="password" value="${account.getPassword()}" disabled class="w-50">
                                            <i class="bi bi-eye ml-2" style="font-size: 20px;margin-top: 3px;" id="eye_icon"></i>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Date created</th>
                                        <td>
                                            ${account.getCreatedAt()}
                                        </td>
                                    </tr>
                                    <tr >
                                        <th scope="row"></th>
                                        <td class="d-flex justify-content-end">
                                            <button class="btn btn-light text-dark border" id="button_edit">Edit profile</button
                                            ></td>
                                    </tr>
                                </tbody>

                            </table>
                        </div>

                    </section>
                </div>


            </div>
            <script>
                document.getElementById('button_edit').addEventListener('click', function () {
                    const password = document.getElementById('password');
                    const username = document.getElementById('username');
                    const email = document.getElementById('email');
                    // clear disable on password and username
                    password.disabled = false;
                    username.disabled = false;
                    document.getElementById('button_edit').innerHTML = 'Save';
                    // if button edit has html is save click
                    if (document.getElementById('button_edit').innerHTML === 'Save') {
                        document.getElementById('button_edit').addEventListener('click', function () {
                            const password = document.getElementById('password').value;
                            const username = document.getElementById('username').value;
                            const email = document.getElementById('email').value;
                          
                            // call ajax
                            $.ajax({
                                url: "EmployeeUpdateProfile",
                                method: "POST",
                                data: {
                                    password: password,
                                    username: username,
                                    email: email
                                },
                                success: function (data) {
                                    document.getElementById('button_edit').innerHTML = 'Edit profile';
                                    swal({
                                        title: "Success",
                                        text: "Update profile success",
                                        icon: "success",
                                        button: "OK",
                                    }).then(function () {
                                        location.reload();
                                    });
                                    
                                },
                                error: function (data) {
                                    swal({
                                        title: "Error",
                                        text: "Update profile failed",
                                        icon: "error",
                                        button: "OK",
                                    });
                                }
                            });
                        });
                    } 
                    
                })

                // click on button edit input not disable
                document.getElementById('eye_icon').addEventListener('click', function () {
                    const inputElement = document.getElementById('password');
                    const currentType = inputElement.getAttribute('type');
                    inputElement.setAttribute(
                            'type', currentType == 'password' ? 'text' : 'password'
                            )
                })
            </script>
            <script src="./assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
            <script src="./assets/js/bootstrap.bundle.min.js"></script>

            <script src="./assets/vendors/dayjs/dayjs.min.js"></script>
            <script src="./assets/vendors/apexcharts/apexcharts.js"></script>
            <script src="./assets/js/pages/ui-apexchart.js"></script>

            <script src="./assets/js/main.js"></script>
            <script src="js/vendor/jquery-2.2.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
        integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
        crossorigin="anonymous"></script>
<script src="js/vendor/bootstrap.min.js"></script>
<script src="js/jquery.ajaxchimp.min.js"></script>
<script src="js/jquery.sticky.js"></script>
<script src="js/nouislider.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!--gmaps Js-->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
<script src="js/gmaps.min.js"></script>
<script src="js/main.js"></script>
    </body>
</html>