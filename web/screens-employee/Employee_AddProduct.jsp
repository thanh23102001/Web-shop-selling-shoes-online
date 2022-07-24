<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Employee Dashboard - Add product</title>

        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/bootstrap.css">

        <link rel="stylesheet" href="assets/vendors/iconly/bold.css">

        <link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
        <link rel="stylesheet" href="assets/css/app.css">
        <link rel="stylesheet" href="css/nice-select.css">
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
                                <h3>Add product</h3>
                                <p class="text-subtitle text-muted">For add new product - Employee</p>
                            </div>
                            <div class="col-12 col-md-6 order-md-2 order-first">
                                <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Catalog - Product - Add product</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>


                    <!-- Table head options start -->
                    <section id="multiple-column-form">
                        <div class="row match-height">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">New product:</h4>
                                    </div>
                                    <div class="card-content">
                                        <div class="card-body">
                                            <form class="form" method="post" action="EmployeeAddProduct" enctype="multipart/form-data">
                                                <div class="row">
                                                    <div class="col-md-6 col-12">
                                                        <div class="form-group">
                                                            <label for="product-name">Product Name</label>
                                                            <input type="text" id="first-name-column" class="form-control"
                                                                   placeholder="Product name" name="pname" required="">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-2 col-4">
                                                        <div class="form-group">
                                                            <label for="cate">Category</label>
                                                            <br>
                                                            <div class="btn-group mb-1">
                                                                <select name="cate" id="select-category" onchange="selectCate()">
                                                                    <c:forEach var="c" items="${categories}">
                                                                        <option value="${c.categoryId}">${c.categoryName}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-2 col-4">
                                                        <div class="form-group">
                                                            <label for="subcate">Sub-Category</label>
                                                            <br>
                                                            <div id="subcate1" class="btn-group mb-1">
                                                                <select id="select1" name="subcate">
                                                                    <c:forEach var="sc" items="${scDao.getSubCategoriesById(1)}">
                                                                        <option value="${sc.subCategoryId}">${sc.subCategoryName}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                            <div id="subcate2" class="btn-group mb-1" style="display: none;">
                                                                <select id="select2" name="">
                                                                    <c:forEach var="sc" items="${scDao.getSubCategoriesById(2)}">
                                                                        <option value="${sc.subCategoryId}">${sc.subCategoryName}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <script>
                                                        function selectCate() {
                                                            var x = document.getElementById("select-category").value;
                                                            if (x === "2") {
                                                                document.getElementById("subcate1").style.display = "none";
                                                                document.getElementById("subcate2").style.display = "block";
                                                                document.getElementById("select1").name = "";
                                                                document.getElementById("select2").name = "subcate";
                                                            } else {
                                                                document.getElementById("subcate2").style.display = "none";
                                                                document.getElementById("subcate1").style.display = "block";
                                                                document.getElementById("select2").name = "";
                                                                document.getElementById("select1").name = "subcate";
                                                            }
                                                        }
                                                    </script>
                                                    <style>
                                                        .upload-images-label {
                                                            margin: 0;
                                                        }
                                                        .upload__box {
                                                            text-align: center;
                                                            padding: 20px;
                                                        }
                                                        .box-upload{
                                                            background-color: #fff;
                                                            background-clip: padding-box;
                                                            border: 1px solid #ced4da;
                                                            border-radius: 0.25rem;
                                                            transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
                                                        }
                                                        .upload__inputfile {
                                                            width: 0.1px;
                                                            height: 0.1px;
                                                            opacity: 0;
                                                            overflow: hidden;
                                                            position: absolute;
                                                            z-index: -1;
                                                        }
                                                        .upload__btn {
                                                            display: inline-block;
                                                            font-weight: 600;
                                                            color: #4045ba;
                                                            text-align: center;
                                                            min-width: 116px;
                                                            padding: 5px;
                                                            transition: all 0.3s ease;
                                                            cursor: pointer;
                                                            border: 2px solid;
                                                            background-color: #fff;
                                                            border-color: #4045ba;
                                                            border-radius: 10px;
                                                            line-height: 26px;
                                                            font-size: 14px;
                                                        }
                                                        .upload__btn:hover {
                                                            background-color: #4045ba;
                                                            color: #fff;
                                                            transition: all 0.3s ease;
                                                        }
                                                        .upload__btn-box {
                                                            margin-bottom: 10px;
                                                        }
                                                        .upload__img-wrap {
                                                            display: flex;
                                                            flex-wrap: wrap;
                                                            margin: 0 -10px;
                                                        }
                                                        .upload__img-box {
                                                            width: 50%;
                                                            padding: 0 10px;
                                                            margin-bottom: 12px;
                                                        }
                                                        .upload__img-close {
                                                            width: 24px;
                                                            height: 24px;
                                                            border-radius: 50%;
                                                            background-color: rgba(0, 0, 0, 0.5);
                                                            position: absolute;
                                                            top: 10px;
                                                            right: 10px;
                                                            text-align: center;
                                                            line-height: 24px;
                                                            z-index: 1;
                                                            cursor: pointer;
                                                        }
                                                        .upload__img-close:after {
                                                            font-family: "Font Awesome 5 Free";
                                                            content: "\2716";
                                                            font-size: 18px;
                                                            color: white;
                                                        }
                                                        .img-bg {
                                                            background-repeat: no-repeat;
                                                            background-position: center;
                                                            background-size: cover;
                                                            position: relative;
                                                            padding-bottom: 100%;
                                                        }
                                                    </style>
                                                    <div class="col-md-2 col-4">
                                                        <div class="form-group">
                                                            <label for="brand">Brand</label>
                                                            <br>
                                                            <div class="btn-group mb-1">
                                                                <select name="brand">
                                                                    <c:forEach var="b" items="${brands}">
                                                                        <option value="${b.brandId}">${b.brandName}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-6 col-12">
                                                        <div class="form-group">
                                                            <label for="description">Description</label>
                                                            <textarea id="description" class="form-control" 
                                                                      placeholder="Product description" name="description"></textarea>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3 col-6">
                                                        <div class="form-group">
                                                            <label for="first-name-column">Import price</label>
                                                            <input type="number" id="first-name-column" class="form-control" required=""
                                                                   placeholder="Import price" name="iprice">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3 col-6">
                                                        <div class="form-group">
                                                            <label for="first-name-column">Price</label>
                                                            <input type="number" id="first-name-column" class="form-control" required=""
                                                                   placeholder="Price" name="uprice">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 col-12">
                                                        <div class="form-group">
                                                            <label for="image">Images</label>
                                                            <div class="box-upload">
                                                                <div class="upload__box">
                                                                    <div class="upload__btn-box">
                                                                        <label class="upload__btn">
                                                                            <p class="upload-images-label">Upload images</p>
                                                                            <input type="file" name="images" accept="image/*" multiple="" data-max_length="20" class="upload__inputfile">
                                                                        </label>
                                                                    </div>
                                                                    <div class="upload__img-wrap"></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-6 col-12" style="display: none">
                                                        <div class="form-group">
                                                            <label for="image">Product details</label>
                                                            <br>
                                                            <div class="d-flex justify-content-center">
                                                                <style>
                                                                    /*Table css*/
                                                                    .styled-table {
                                                                        border-collapse: collapse;
                                                                        margin: 0;
                                                                        min-width: 50%;
                                                                        font-size: 0.9em;
                                                                        font-family: sans-serif;
                                                                        box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
                                                                        margin-bottom: 20px;
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
                                                                <table class="styled-table" id="tablePD">
                                                                    <thead>
                                                                        <tr>
                                                                            <th>Size</th>
                                                                            <th>Color</th>
                                                                            <th>Quantity</th>
                                                                            <th></th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody id="myTable">
                                                                        
                                                                        <tr style="padding: 0px;">
                                                                        </tr>
                                                                        <!-- and so on... -->
                                                                    </tbody>

                                                                    <style>
                                                                        #data {
                                                                            margin-bottom: 10px;
                                                                        }
                                                                        #size, #color {
                                                                            padding: 5px;
                                                                            width: 80px;
                                                                            border-radius: 2px;
                                                                        }
                                                                        #quantity {
                                                                            padding: 5px;
                                                                            width: 100px;
                                                                            border-radius: 2px;
                                                                        }
                                                                    </style>
                                                                </table>
                                                            </div>
                                                            <div class="d-flex justify-content-center">
                                                                <table class="styled-table">
                                                                    <tbody id="data">
                                                                        <tr>
                                                                            <td><input type="text" id="size" placeholder="Size"></td>
                                                                            <td><input type="color" id="color" placeholder="Color"></td>
                                                                            <td><input type="number" min="0" id="quantity" placeholder="Quantity"></td>
                                                                            <td><button type="button" id="addPD" style="font-size: large">+</button></td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-12 d-flex justify-content-between">
                                                        <button type="reset"
                                                                class="btn btn-light-secondary me-1 mb-1">Reset</button>
                                                        <div>  
                                                            <div class="modal-primary me-1 mb-1 d-inline-block">
                                                                <!-- Button trigger for primary themes modal -->
                                                                <a href="#" type="button" class="btn btn-success"
                                                                   data-bs-toggle="modal" data-bs-target="#udp${pid}">
                                                                    <span>Submit</span>
                                                                </a>

                                                                <!--primary theme Modal -->
                                                                <div class="modal fade text-left" id="udp${pid}" tabindex="-1"
                                                                     role="dialog" aria-labelledby="myModalLabel160"
                                                                     aria-hidden="true">
                                                                    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
                                                                         role="document">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header bg-success" style="display: flex; justify-content: space-between">
                                                                                <h5 class="modal-title white" id="myModalLabel160">
                                                                                    Submit
                                                                                </h5>
                                                                                <h5 class="modal-title white">ID: ${p.productId} </h5>
                                                                            </div>
                                                                            <div class="modal-body" >
                                                                                Do you want to submit?
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <button id="confirm" type="submit" class="btn btn-success ml-1"
                                                                                        >
                                                                                    <i class="bx bx-check d-block d-sm-none"></i>
                                                                                    <span class="d-none d-sm-block">Yes</span>
                                                                                </button>
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
                                                            <!--back-->
                                                            <div class="modal-primary me-1 mb-1 d-inline-block">
                                                                <!-- Button trigger for primary themes modal -->
                                                                <a href="#" type="button" class="btn btn-light-secondary"
                                                                   data-bs-toggle="modal" data-bs-target="#bp${p.productId}">
                                                                    <span>Back</span>
                                                                </a>

                                                                <!--primary theme Modal -->
                                                                <div class="modal fade text-left" id="bp${p.productId}" tabindex="-1"
                                                                     role="dialog" aria-labelledby="myModalLabel160"
                                                                     aria-hidden="true">
                                                                    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
                                                                         role="document">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header bg-info" style="display: flex; justify-content: space-between">
                                                                                <h5 class="modal-title white" id="myModalLabel160">
                                                                                    Back
                                                                                </h5>
                                                                                <h5 class="modal-title white">ID: ${p.productId} </h5>
                                                                            </div>
                                                                            <div class="modal-body" >
                                                                                Do you want to back to products management?
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <a href="EmployeeManageProducts" id="confirm" class="btn btn-info ml-1"
                                                                                   >
                                                                                    <i class="bx bx-check d-block d-sm-none"></i>
                                                                                    <span class="d-none d-sm-block">Yes</span>
                                                                                </a>
                                                                                <button type="button"
                                                                                        class="btn btn-light-secondary"
                                                                                        data-bs-dismiss="modal">
                                                                                    <i class="bx bx-x d-block d-sm-none"></i>
                                                                                    <span class="d-none d-sm-block">No</span>
                                                                                </button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
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
            <script src="assets/js/main.js"></script>
            <script src="assets/js/bootstrap.bundle.min.js"></script>
            <script src="js/vendor/jquery-2.2.4.min.js"></script>
            <script src="js/jquery.nice-select.min.js"></script>


            <script>
                                                                                    $(document).ready(function () {
                                                                                        $('select').niceSelect();
                                                                                    });

                                                                                    //Image upload preview
                                                                                    jQuery(document).ready(function () {
                                                                                        ImgUpload();
                                                                                    });

                                                                                    function ImgUpload() {
                                                            var imgWrap = "";
                                                            var imgArray = [];

                                                            $('.upload__inputfile').each(function () {
                                                                $(this).on('change', function (e) {
                                                                    imgWrap = $(this).closest('.upload__box').find('.upload__img-wrap');
                                                                    var maxLength = $(this).attr('data-max_length');
                                                                    
                                                                    
                                                                    var files = e.target.files;
                                                                    var filesArr = Array.prototype.slice.call(files);
                                                                    var iterator = 0;
                                                                    filesArr.forEach(function (f, index) {

                                                                        if (!f.type.match('image.*')) {
                                                                            alert("Please choose images!")
                                                                            return;
                                                                        }
                                                                        
                                                                        if (f.size > 2097152) {
                                                                            alert("Please choose images that smaller than 2MB!")
                                                                            return;
                                                                        }
                                                                       
                                                                        if (imgArray.length > maxLength) {
                                                                            alert("Can not push more image!");
                                                                            return false;
                                                                        } else {
                                                                            
                                                                            var len = 0;
                                                                            for (var i = 0; i < imgArray.length; i++) {
                                                                                if (imgArray[i] !== undefined) {
                                                                                    len++;
                                                                                }
                                                                            }
                                                                            if (len > maxLength) {
                                                                                return false;
                                                                            } else {
                                                                                imgArray.push(f);

                                                                                var reader = new FileReader();
                                                                                reader.onload = function (e) {
                                                                                    var html = "<div class='upload__img-box'><div style='background-image: url(" + e.target.result + ")' data-number='" + $(".upload__img-close").length + "' data-file='" + f.name + "' class='img-bg'><div class='upload__img-close'></div></div></div>";
                                                                                    imgWrap.append(html);
                                                                                    iterator++;
                                                                                }
                                                                                reader.readAsDataURL(f);
                                                                            }
                                                                        }
                                                                    });
                                                                });
                                                            });

                                                            $('body').on('click', ".upload__img-close", function (e) {
                                                                var file = $(this).parent().data("file");
                                                                for (var i = 0; i < imgArray.length; i++) {
                                                                    if (imgArray[i].name === file) {
                                                                        imgArray.splice(i, 1);
                                                                        break;
                                                                    }
                                                                }
                                                                $(this).parent().parent().remove();
                                                            });
                                                        }
            </script>
            <script>
                const arr = ${pdsJ};
                buildTable(arr);



                                                        function buildTable(data) {
                                                            var table = document.getElementById('myTable');

                                                            for (var i = 0; i < data.length; i++) {
                                                                var row = `<tr>
                                                        <td>` + data[i].ProductDetailId + `</td>
                                                        <td>` + data[i].size + `</td>
                                                        <td>` + data[i].color + `</td>
                                                        <td>` + data[i].quantityInStock + `</td>
                                                        <td><a class="btn btn-outline-warning" onclick="deleteRow(this)">
                                                                                        <svg class="mb-1 svg-inline--fa fa-trash-alt fa-w-14 fa-fw select-all" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="trash-alt" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" data-fa-i2svg=""><path fill="currentColor" d="M32 464a48 48 0 0 0 48 48h288a48 48 0 0 0 48-48V128H32zm272-256a16 16 0 0 1 32 0v224a16 16 0 0 1-32 0zm-96 0a16 16 0 0 1 32 0v224a16 16 0 0 1-32 0zm-96 0a16 16 0 0 1 32 0v224a16 16 0 0 1-32 0zM432 32H312l-9.4-18.7A24 24 0 0 0 281.1 0H166.8a23.72 23.72 0 0 0-21.4 13.3L136 32H16A16 16 0 0 0 0 48v32a16 16 0 0 0 16 16h416a16 16 0 0 0 16-16V48a16 16 0 0 0-16-16z"></path></svg>
                                                                                       </a></td>
                                          </tr>`;
                                                                table.innerHTML += row;
                                                            }
                                                        }
                                                        
                var table = document.getElementById('tablePD');
                var btnAdd = document.getElementById('addPD');
                var btnDel = document.getElementById('deleteRowPD');
                btnAdd.addEventListener('click', () => {
                    var sizeInput = document.querySelector('#size');
                    var colorInput = document.querySelector('#color');
                    var quantityInput = document.querySelector('#quantity');

//                    var row = table.insertRow();
//                    if (sizeInput.value !== "" && colorInput.value !== "" && quantityInput.value !== "") {
//                        var cell1 = row.insertCell(0);
//                        var cell2 = row.insertCell(1);
//                        var cell3 = row.insertCell(2);
//                        var cell4 = row.insertCell(3);
//
//                        cell1.innerHTML = sizeInput.value;
//                        cell2.innerHTML = ntc.name(colorInput.value)[3];
//                        cell3.innerHTML = quantityInput.value;
//                        cell4.innerHTML = `<a class="btn btn-outline-warning" onclick="deleteRow(this)">
//                    <svg class="mb-1 svg-inline--fa fa-trash-alt fa-w-14 fa-fw select-all" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="trash-alt" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" data-fa-i2svg=""><path fill="currentColor" d="M32 464a48 48 0 0 0 48 48h288a48 48 0 0 0 48-48V128H32zm272-256a16 16 0 0 1 32 0v224a16 16 0 0 1-32 0zm-96 0a16 16 0 0 1 32 0v224a16 16 0 0 1-32 0zm-96 0a16 16 0 0 1 32 0v224a16 16 0 0 1-32 0zM432 32H312l-9.4-18.7A24 24 0 0 0 281.1 0H166.8a23.72 23.72 0 0 0-21.4 13.3L136 32H16A16 16 0 0 0 0 48v32a16 16 0 0 0 16 16h416a16 16 0 0 0 16-16V48a16 16 0 0 0-16-16z"></path></svg>
//                    </a>
//                    }
                    $.ajax({
                        url: "EmployeeAddProductDetail?pid=" +${pid},
                        type: "POST",
                        data: {
                            size: sizeInput.value,
                            color: ntc.name(colorInput.value)[3],
                            quantity: quantityInput.value
                        },
                        success: function () {
                            location.reload();
                        }

                    });
                });
                function deleteRow(r) {
                    var i = r.parentNode.parentNode.rowIndex;
                    $.ajax({
                        url: "EmployeeDeleteProductDetail?pdi=" + table.rows[i].cells[0].innerHTML,
                        type: "POST",
                        success: function (data) {
                            location.reload();
                        }

                    });
                }
            </script>

            <script src="http://www.color-blindness.com/color-name-hue-tool/js/ntc.js"></script>
            <script src="assets/vendors/ckeditor/ckeditor.js"></script>

            <script>
                ClassicEditor
                        .create(document.querySelector('#editor'))
                        .catch(error => {
                            console.error(error);
                        });
            </script>

    </body>

</html>