<%-- 
    Document   : Shop
    Created on : May 24, 2022, 9:20:36 AM
    Author     : ADMIN
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="../include/Head.jsp" %>
    </head>
    <body>
        <%@include file="../include/Header.jsp" %>
        <!-- Start Banner Area -->
        <section class="banner-area organic-breadcrumb">
            <div class="container">
                <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                    <div class="col-first">
                        <h1>Shop Category page</h1>
                        <nav class="d-flex align-items-center">
                            <a href="index.html">Home<span class="lnr lnr-arrow-right"></span></a>
                            <a href="#">Shop<span class="lnr lnr-arrow-right"></span></a>
                            <a href="category.html">Fashion </a>
                        </nav>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Banner Area -->

        <div class="container">
            <div class="row pt-5">
                <div class="col-xl-3 col-lg-4 col-md-5">
                    <div class="sidebar-categories">
                        <div class="head">Browse Categories</div>
                        <ul class="main-categories">
                            <c:forEach items="${categories}" var="c">
                                <li class="main-nav-list">
                                    <c:forEach items="${c.getSubcategories()}" var="sub">
                                        <c:if test="${sub.getTotalProduct() > 0}">
                                        <li class="filter-list mt-4"><input <c:forEach items="${productFilter.getSubcategoryId()}" var="subcategoryId">
                                                    ${subcategoryId == sub.getSubCategoryId() ? 'checked' : '' }
                                                </c:forEach> class="pixel-checkbox mr-2" type="checkbox" id="${sub.getSubCategoryId()}"  name="subcategoryId" value="${sub.getSubCategoryId()}"><label for="${sub.getSubCategoryId()}">${sub.getSubCategoryName()}'s ${c.getCategoryName()} - (${sub.getTotalProduct()})</label></li>
                                        </c:if>
                                    </c:forEach>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="sidebar-filter mt-50">
                        <div class="top-filter-head">Product Filters</div>
                        <div class="common-filter">
                            <div class="head">Brands</div>
                            <ul>
                                <c:forEach items="${brands}" var="b">
                                    <c:if test="${b.getTotalProduct() > 0}">
                                        <li class="filter-list"><input <c:forEach items="${productFilter.getBrandId()}" var="brandId">
                                                    ${brandId == b.getBrandId() ? 'checked' : '' } </c:forEach>
                                                class="pixel-checkbox mr-2" type="checkbox" id="${b.getBrandName()}" name="brandId" value="${b.getBrandId()}"><label for="${b.getBrandName()}">${b.getBrandName()}</label></li>
                                        </c:if>
                                    </c:forEach>
                            </ul>
                        </div>
                        <div class="common-filter">
                            <div class="head">Color</div>
                            <ul>
                                <li class="filter-list"><input class="pixel-radio mr-2" type="radio" id="all" name="color" ${productFilter.getColor() eq '' ? 'checked' : ''} value=""><label for="all">All</label></li>
                                <li class="filter-list"><input class="pixel-radio mr-2" type="radio" id="black" name="color" ${productFilter.getColor() eq 'black' ? 'checked' : ''} value="black"><label for="black">Black</label></li>
                                <li class="filter-list"><input class="pixel-radio mr-2" type="radio" id="white" name="color" ${productFilter.getColor() eq 'white' ? 'checked' : ''} value="white"><label for="white">White</label></li>
                                <li class="filter-list"><input class="pixel-radio mr-2" type="radio" id="gray" name="color"  ${productFilter.getColor() eq 'gray' ? 'checked' : ''} value="gray"><label for="gray">Gray</label></li>
                                <li class="filter-list"><input class="pixel-radio mr-2" type="radio" id="orange" name="color" ${productFilter.getColor() eq 'orange' ? 'checked' : ''} value="orange"><label for="orange">Orange</label></li>
                                <li class="filter-list"><input class="pixel-radio mr-2" type="radio" id="silver" name="color" ${productFilter.getColor() eq 'silver' ? 'checked' : ''} value="silver"><label for="silver">Silver</label></li>
                                <li class="filter-list"><input class="pixel-radio mr-2" type="radio" id="golden" name="color" ${productFilter.getColor() eq 'golden' ? 'checked' : ''} value="golden"><label for="golden">Golden</label></li>
                                <li class="filter-list"><input class="pixel-radio mr-2" type="radio" id="red" name="color" ${productFilter.getColor() eq 'red' ? 'checked' : ''} value="red"><label for="red">Red</label></li>
                                <li class="filter-list"><input class="pixel-radio mr-2" type="radio" id="pink" name="color" ${productFilter.getColor() eq 'pink' ? 'checked' : ''} value="pink"><label for="pink">Pink</label></li>
                                <li class="filter-list"><input class="pixel-radio mr-2" type="radio" id="green" name="color" ${productFilter.getColor() eq 'green' ? 'checked' : ''} value="green"><label for="green">Green</label></li>
                                <li class="filter-list"><input class="pixel-radio mr-2" type="radio" id="walnut" name="color" ${productFilter.getColor() eq 'walnut' ? 'checked' : ''} value="walnut"><label for="walnut">Walnut</label></li>
                            </ul>
                        </div>
                        <div class="common-filter">
                            <div class="head">Size</div>
                            <ul>
                                <li class="filter-list">
                                    <input class="pixel-radio mr-2" type="radio" id="all" ${productFilter.getSize() eq '' ? 'checked' : ''} name="size" value="">
                                    <label for="all">All
                                    </label>
                                </li>
                                <c:forEach items="${sizes}" var="size">
                                    <li class="filter-list">
                                        <input class="pixel-radio mr-2" type="radio" id="${size}" ${productFilter.getSize() == size ? 'checked' : ''} name="size" value="${size}">
                                        <label for="${size}">${size}
                                        </label>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-xl-9 col-lg-8 col-md-7" >
                    <c:if test="${productList.getProducts().size() == 0}">
                         <div class="filter-bar d-flex justify-content-end" style="background-color: whitesmoke;display: none;">
                            <label for="sortBy" class="mt-3" style="font-size: 120%;">Sort By </label>
                            <div class="sorting ml-3">
                                <select name="sortBy" id="sortBy">
                                    <!--<option value="" disabled="" selected="">Sort by</option>-->
                                    <option value="latest" ${(productFilter.getSortBy() eq "date" && !productFilter.isIsAsc()) ? "selected"
                                                             : "" }> Lastest
                                    </option>
                                    <option value="oldest" ${(productFilter.getSortBy() eq "date" && productFilter.isIsAsc()) ? "selected"
                                                             : "" }> Oldest
                                    </option>
                                    <option value="priceAsc" ${(productFilter.getSortBy() eq "price" && productFilter.isIsAsc()) ? "selected" : ""
                                            }> Price: low to high
                                    </option>
                                    <option value="priceDesc" ${(productFilter.getSortBy() eq "price" && !productFilter.isIsAsc()) ? "selected"
                                                                : "" }> Price: high to low
                                    </option>
                                </select>
                            </div>
                            <label for="view" class="mt-3 ml-5" style="font-size: 120%;">View </label>
                            <div class="sorting mr-5 px-4">
                                <select name="view" id="view">
                                    <option value="12" ${(productFilter.getRecordPerPage() == 12 ?'selected' : '')}>12</option>
                                    <option value="24" ${(productFilter.getRecordPerPage() == 24 ?'selected' : '')}>24</option>
                                    <option value="36" ${(productFilter.getRecordPerPage() == 36 ?'selected' : '')}>36</option>
                                </select>
                            </div>
                        </div>
                        <h6 class="text-center mt-5">Sorry , the store has no products that match your wishes !</h6>
                    </c:if>
                    <c:if test="${productList.getProducts().size() > 0}">
                        <!-- Start Filter Bar -->
                        <div class="filter-bar d-flex justify-content-end" style="background-color: whitesmoke;">
                            <label for="sortBy" class="mt-3" style="font-size: 120%;">Sort By </label>
                            <div class="sorting ml-3">
                                <select name="sortBy" id="sortBy">
                                    <!--<option value="" disabled="" selected="">Sort by</option>-->
                                    <option value="latest" ${(productFilter.getSortBy() eq "date" && !productFilter.isIsAsc()) ? "selected"
                                                             : "" }> Lastest
                                    </option>
                                    <option value="oldest" ${(productFilter.getSortBy() eq "date" && productFilter.isIsAsc()) ? "selected"
                                                             : "" }> Oldest
                                    </option>
                                    <option value="priceAsc" ${(productFilter.getSortBy() eq "price" && productFilter.isIsAsc()) ? "selected" : ""
                                            }> Price: low to high
                                    </option>
                                    <option value="priceDesc" ${(productFilter.getSortBy() eq "price" && !productFilter.isIsAsc()) ? "selected"
                                                                : "" }> Price: high to low
                                    </option>
                                </select>
                            </div>
                            <label for="view" class="mt-3 ml-5" style="font-size: 120%;">View </label>
                            <div class="sorting mr-5 px-4">
                                <select name="view" id="view">
                                    <option value="12" ${(productFilter.getRecordPerPage() == 12 ?'selected' : '')}>12</option>
                                    <option value="24" ${(productFilter.getRecordPerPage() == 24 ?'selected' : '')}>24</option>
                                    <option value="36" ${(productFilter.getRecordPerPage() == 36 ?'selected' : '')}>36</option>
                                </select>
                            </div>
                        </div>
                        <!-- End Filter Bar -->
                        <!-- Start Best Seller -->
                        <section class="lattest-product-area pb-40 category-list">
                            <div class="row">
                                <!-- single product -->
                                <c:forEach items="${productList.getProducts()}" var="product">
                                    <div class="col-lg-4 col-md-6">
                                        <div class="single-product">
                                            <img class="img-fluid" src="img/shoes/${product.getImages().get(0).getUrl()}" alt="" style="width: 180px;height:180px">
                                            <div class="product-details">
                                                <h6>${product.getProductName()}</h6>
                                                <div class="price">
                                                    <h6> <fmt:formatNumber
                                                            value="${product.getUnitPrice()}"
                                                            type="number"/> &dstrok;
                                                    </h6>
                                                    <h6 class="l-through">$210.00</h6>
                                                </div>
                                                <div class="prd-bottom">

                                                    <a href="product_details?productId=${product.getProductId()}" class="social-info">
                                                        <span class="ti-bag"></span>
                                                        <p class="hover-text">add to bag</p>
                                                    </a>
                                                    <a href="" class="social-info">
                                                        <span class="lnr lnr-sync"></span>
                                                        <p class="hover-text">compare</p>
                                                    </a>
                                                    <a href="product_details?productId=${product.getProductId()}" class="social-info">
                                                        <span class="lnr lnr-move"></span>
                                                        <p class="hover-text">view more</p>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </section>
                        <!-- End Best Seller -->
                        <!-- Start Filter Bar -->
                        <div class="filter-bar" style="background:none">
                            <div id="pagination" class="text-center">

                            </div>
                        </div>
                        <!-- End Filter Bar -->
                    </c:if>

                </div>
            </div>
        </div>
        <!-- Start related-product Area -->
        <section class="related-product-area section_gap">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-6 text-center">
                        <div class="section-title">
                            <h1>Deals of the Week</h1>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore
                                magna aliqua.</p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-9">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-6 mb-20">
                                <div class="single-related-product d-flex">
                                    <a href="#"><img src="img/r1.jpg" alt=""></a>
                                    <div class="desc">
                                        <a href="#" class="title">Black lace Heels</a>
                                        <div class="price">
                                            <h6>$189.00</h6>
                                            <h6 class="l-through">$210.00</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 mb-20">
                                <div class="single-related-product d-flex">
                                    <a href="#"><img src="img/r2.jpg" alt=""></a>
                                    <div class="desc">
                                        <a href="#" class="title">Black lace Heels</a>
                                        <div class="price">
                                            <h6>$189.00</h6>
                                            <h6 class="l-through">$210.00</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 mb-20">
                                <div class="single-related-product d-flex">
                                    <a href="#"><img src="img/r3.jpg" alt=""></a>
                                    <div class="desc">
                                        <a href="#" class="title">Black lace Heels</a>
                                        <div class="price">
                                            <h6>$189.00</h6>
                                            <h6 class="l-through">$210.00</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 mb-20">
                                <div class="single-related-product d-flex">
                                    <a href="#"><img src="img/r5.jpg" alt=""></a>
                                    <div class="desc">
                                        <a href="#" class="title">Black lace Heels</a>
                                        <div class="price">
                                            <h6>$189.00</h6>
                                            <h6 class="l-through">$210.00</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 mb-20">
                                <div class="single-related-product d-flex">
                                    <a href="#"><img src="img/r6.jpg" alt=""></a>
                                    <div class="desc">
                                        <a href="#" class="title">Black lace Heels</a>
                                        <div class="price">
                                            <h6>$189.00</h6>
                                            <h6 class="l-through">$210.00</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 mb-20">
                                <div class="single-related-product d-flex">
                                    <a href="#"><img src="img/r7.jpg" alt=""></a>
                                    <div class="desc">
                                        <a href="#" class="title">Black lace Heels</a>
                                        <div class="price">
                                            <h6>$189.00</h6>
                                            <h6 class="l-through">$210.00</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6">
                                <div class="single-related-product d-flex">
                                    <a href="#"><img src="img/r9.jpg" alt=""></a>
                                    <div class="desc">
                                        <a href="#" class="title">Black lace Heels</a>
                                        <div class="price">
                                            <h6>$189.00</h6>
                                            <h6 class="l-through">$210.00</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6">
                                <div class="single-related-product d-flex">
                                    <a href="#"><img src="img/r10.jpg" alt=""></a>
                                    <div class="desc">
                                        <a href="#" class="title">Black lace Heels</a>
                                        <div class="price">
                                            <h6>$189.00</h6>
                                            <h6 class="l-through">$210.00</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6">
                                <div class="single-related-product d-flex">
                                    <a href="#"><img src="img/r11.jpg" alt=""></a>
                                    <div class="desc">
                                        <a href="#" class="title">Black lace Heels</a>
                                        <div class="price">
                                            <h6>$189.00</h6>
                                            <h6 class="l-through">$210.00</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="ctg-right">
                            <a href="#" target="_blank">
                                <img class="img-fluid d-block mx-auto" src="img/category/c5.jpg" alt="">
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End related-product Area -->
        <%@include file="../include/Footer.jsp" %>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/pagination.min.js"></script>

        <script>
            $(document).ready(function () {
                let currentPage =${productFilter.getCurrentPage()};
                let totalPage = ${productFilter.getTotalPage()};
                const values = {};
                const loadPage = () => {
                    // if search is not empty then add it to values
                    // map all the checkboxes
                    const checkboxes = $("input:checkbox");
                    // loop over each checkbox
                    checkboxes.each(function () {
                        // if the checkbox is checked
                        if ($(this).is(":checked")) {
                            // get name of the checkbox
                            const name = $(this).attr("name");
                            // get value of the checkbox
                            const value = $(this).val();
                            // check if name is already in values object and add it if it isn't
                            if (name in values) {
                                values[name].push(value);
                            } else {
                                values[name] = [value];
                            }
                        }
                    });
                    const radio = $("input:radio");
                    radio.each(function () {
                        // if the checkbox is checked
                        if ($(this).is(":checked")) {
                            // get name of the checkbox
                            const name = $(this).attr("name");
                            // get value of the checkbox
                            const value = $(this).val();
                            // check if name is already in values object and add it if it isn't
                            if (value !== "") {
                                if (name in values) {
                                    values[name].push(value);
                                } else {
                                    values[name] = [value];
                                }
                            }
                        }
                    });
                    values["sortBy"] = $("#sortBy option:selected").val();
                    values["view"] = $("#view option:selected").val();
                    let url = window.location.pathname + "?";
                    for (const key in values) {
                        url += key + "=" + values[key] + "&";
                    }
                    // // remove the last ampersand
                    url = url.slice(0, -1);
                    // redirect to the new url
                    window.location.href = url;

                };
                // if sortBy is changed then load the page with the new sortBy
                $('select').change(function () {
                    loadPage(values);
                });
                $("input:checkbox").click(function (e) {
                    loadPage(values);
                });
                $("input:radio").click(function (e) {
                    loadPage(values);
                });
                const paginationFooter = $('#pagination');
                paginationFooter.pagination({
                    dataSource: (done) => {
                        var dataPaging = [];
                        for (let i = 0; i < totalPage; i++) {
                            dataPaging.push(i + 1);
                        }
                        done(dataPaging);
                    },
                    pageSize: 1,
                    pageRange: 1,
                });
                paginationFooter.addHook('afterPreviousOnClick', function () {
                    currentPage = currentPage > 1 ? currentPage - 1 : 1;
                    values["page"] = currentPage;
                    loadPage(values);
                });

                paginationFooter.addHook('afterPageOnClick', function (e) {
                    currentPage = e.target.innerText;
                    values["page"] = currentPage;
                    loadPage(values);
                });
                paginationFooter.addHook('afterNextOnClick', function () {
                    currentPage = currentPage < totalPage ? currentPage + 1 : totalPage;
                    values["page"] = currentPage;
                    loadPage(values);
                });
                paginationFooter.pagination(currentPage);
            });

        </script>
    </body>
</html>
