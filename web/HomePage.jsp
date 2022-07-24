<%-- 
    Document   : HomePage
    Created on : May 24, 2022, 9:04:33 AM
    Author     : ADMIN
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<fmt:setLocale value="vi_VN" scope="session"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="include/Head.jsp" %>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body>
        <%@include file="include/Header.jsp" %>
        <section class="banner-area">
            <div class="container">
                <div class="row fullscreen align-items-center justify-content-start">
                    <div class="col-lg-12">
                        <div class="active-banner-slider owl-carousel">
                            <!-- single-slide -->
                            <div class="row single-slide align-items-center d-flex">
                                <div class="col-lg-5 col-md-6">
                                    <div class="banner-content">
                                        <h1>ALL DAY, <br> ALL NEW,<br> ALL YOU!</h1>
                                        <h3>The collection was made to move with you </h3>

                                    </div>
                                </div>
                                <div class="col-lg-7">
                                    <div class="banner-img">
                                        <img class="img-fluid" src="img/banner/banner-img.png" alt="">
                                    </div>
                                </div>
                            </div>
                            <!-- single-slide -->
                            <div class="row single-slide">
                                <div class="col-lg-5">
                                    <div class="banner-content">
                                        <h1>Nike New <br>Collection!</h1>
                                        <p>New products are updated continuously.</p>
                                        <div class="add-bag d-flex align-items-center">
                                            <a class="add-btn" href=""><span class="lnr lnr-cross"></span></a>
                                            <span class="add-text text-uppercase">Add to Bag</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-7">
                                    <div class="banner-img">
                                        <img class="img-fluid" src="img/banner/banner-img.png" alt="">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        <!-- start features Area -->
        <section class="features-area section_gap">
            <div class="container">
                <div class="row features-inner">
                    <!-- single features -->
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="single-features">
                            <div class="f-icon">
                                <img src="img/features/f-icon1.png" alt="">
                            </div>
                            <h6>Free Delivery</h6>
                            <p>Free Shipping on all order</p>
                        </div>
                    </div>
                    <!-- single features -->
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="single-features">
                            <div class="f-icon">
                                <img src="img/features/f-icon2.png" alt="">
                            </div>
                            <h6>Return Policy</h6>
                            <p>Free Shipping on all order</p>
                        </div>
                    </div>
                    <!-- single features -->
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="single-features">
                            <div class="f-icon">
                                <img src="img/features/f-icon3.png" alt="">
                            </div>
                            <h6>24/7 Support</h6>
                            <p>Free Shipping on all order</p>
                        </div>
                    </div>
                    <!-- single features -->
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="single-features">
                            <div class="f-icon">
                                <img src="img/features/f-icon4.png" alt="">
                            </div>
                            <h6>Secure Payment</h6>
                            <p>Free Shipping on all order</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- end features Area -->

        <!-- Start category Area -->
        <section class="category-area">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-8 col-md-12">
                        <div class="row">
                            <div class="col-lg-8 col-md-8">
                                <div class="single-deal">
                                    <div class="overlay"></div>
                                    <img class="img-fluid w-100" src="img/category/c1.jpg" alt="">
                                    <a href="img/category/c1.jpg" class="img-pop-up" target="_blank">
                                        <div class="deal-details">
                                            <h6 class="deal-title">Sneaker for Sports</h6>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                                <div class="single-deal">
                                    <div class="overlay"></div>
                                    <img class="img-fluid w-100" src="img/category/c2.jpg" alt="">
                                    <a href="img/category/c2.jpg" class="img-pop-up" target="_blank">
                                        <div class="deal-details">
                                            <h6 class="deal-title">Sneaker for Sports</h6>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                                <div class="single-deal">
                                    <div class="overlay"></div>
                                    <img class="img-fluid w-100" src="img/category/c3.jpg" alt="">
                                    <a href="img/category/c3.jpg" class="img-pop-up" target="_blank">
                                        <div class="deal-details">
                                            <h6 class="deal-title">Product for Couple</h6>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="col-lg-8 col-md-8">
                                <div class="single-deal">
                                    <div class="overlay"></div>
                                    <img class="img-fluid w-100" src="img/category/c4.jpg" alt="">
                                    <a href="img/category/c4.jpg" class="img-pop-up" target="_blank">
                                        <div class="deal-details">
                                            <h6 class="deal-title">Sneaker for Sports</h6>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="single-deal">
                            <div class="overlay"></div>
                            <img class="img-fluid w-100" src="img/category/c5.jpg" alt="">
                            <a href="img/category/c5.jpg" class="img-pop-up" target="_blank">
                                <div class="deal-details">
                                    <h6 class="deal-title">Sneaker for Sports</h6>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End category Area -->

        <!-- start product Area -->
        <section class="owl-carousel active-product-area section_gap">
            <!-- single product slide -->
            <div class="single-product-slider">
                <div class="container">
                    <div class="row justify-content-center mb-0 pb-0">
                        <div class="col-lg-6 text-center">
                            <div class="section-title">
                                <h1 style="color: #ff9900">Latest Products</h1>
                                <p style="color: #ff9900">New products are constantly being updated.</p>
                            </div>
                        </div>
                    </div>
                    <div class="row pt-0 mt-0">
                        <!-- single product -->
                        <c:forEach items="${LatestList}" var="l">
                            <div class="col-lg-3 col-md-6 " >
                                <div class="single-product ">
                                    <!--anh-->
                                    <img class="mx-auto d-block" src="img/shoes/${l.getImages().get(0).getUrl()}" alt=""  >
                                    <!--ten va gia-->
                                    <div class="product-details">
                                        <div>
                                            <h6>${l.getProductName()}</h6>
                                            <div class="price">
                                                <h6><fmt:formatNumber type="currency"  value="${l.getUnitPrice() - l.getUnitPrice()*(l.getDiscount()/100)}" />
                                                </h6>
                                                <h6 class="l-through" style="color: #666666"><fmt:formatNumber type="currency"  value="${l.getUnitPrice()}" /></h6>
                                            </div>
                                        </div>
                                        <div style="color: #008200"> ${l.getDiscount()} % off </div>
                                        <!--cac nut tai day-->
                                        <div class="prd-bottom">

                                            <a href="product_details?productId=${l.getProductId()}" class="social-info">
                                                <span class="ti-bag"></span>
                                                <p class="hover-text">Add to cart</p>
                                            </a>
                                            <a href="" class="social-info">
                                                <span class="lnr lnr-sync"></span>
                                                <p class="hover-text">reload</p>
                                            </a>
                                            <a href="product_details?productId=${l.getProductId()}" class="social-info">
                                                <span class="lnr lnr-move"></span>
                                                <p class="hover-text">view more</p>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <!-- single product slide -->
            <div class="single-product-slider">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-6 text-center">
                            <div class="section-title">
                                <h1 style="color: #ff9900" >Featured Products</h1>
                                <p style="color: #ff9900" >Our branded products.</p>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <c:forEach items="${FeaturedList}" var="f">
                            <!-- single product -->
                            <div class="col-lg-3 col-md-6">
                                <div class="single-product">
                                    <!--anh-->
                                    <img class="mx-auto d-block" src="img/shoes/${f.getImages().get(0).getUrl()}" alt="" height="250px">
                                    <!--ten va gia-->
                                    <div class="product-details">
                                        <div>
                                            <h6>${f.getProductName()}</h6>
                                            <div class="price">
                                                <h6><fmt:formatNumber type="currency"  value="${f.getUnitPrice() - f.getUnitPrice()*(f.getDiscount()/100)}" />
                                                </h6>
                                                <h6 class="l-through" style="color: #666666"><fmt:formatNumber type="currency" value="${f.getUnitPrice()}" /></h6>
                                            </div>
                                        </div>
                                        <div style="color: #008200"> ${f.getDiscount()} % off </div>
                                        <!--cac nut tai day-->
                                        <div class="prd-bottom">

                                            <a href="product_details?productId=${f.getProductId()}" class="social-info">
                                                <span class="ti-bag"></span>
                                                <p class="hover-text">Add to cart</p>
                                            </a>
                                            <a href="" class="social-info">
                                                <span class="lnr lnr-sync"></span>
                                                <p class="hover-text">compare</p>
                                            </a>
                                            <a href="product_details?productId=${f.getProductId()}" class="social-info">
                                                <span class="lnr lnr-move"></span>
                                                <p class="hover-text">view more</p>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </section>
        <!-- end product Area -->


        <!-- Start brand Area -->
        <section class="brand-area section_gap">
            <div class="container">
                <div class="row">
                    <c:forEach items="${BrandList}" var="b">
                        <a class="col single-img" href="#">
                            <img class="img-fluid d-block mx-auto"  src="img/brand/${b.getBrandImage()}" alt="">
                        </a>
                    </c:forEach>
                </div>
            </div>
        </section>
       


        <!-- End brand Area -->
        <!-- Start related-product Area -->
        <section class="related-product-area section_gap_bottom">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-6 text-center">
                        <div class="section-title">
                            <h1>Deals of the Week</h1>
                            <p>Super promotion items.</p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-9">
                        <div class="row">
                            <c:forEach items="${DiscountList}" var="d">
                                <div class="col-lg-4 col-md-4 col-sm-6 mb-20">
                                    <div class="single-related-product d-flex">
                                        <a href="product_details?productId=${d.getProductId()}"><img src="img/shoes/${d.getImages().get(0).getUrl()}" alt="" height="100px" width="100px"></a>
                                        <div class="desc">
                                            <a href="product_details?productId=${d.getProductId()}" class="title">${d.getProductName().substring(0,10)}...</a>
                                            <div class="price">

                                                <h6><fmt:formatNumber type="currency"  value="${d.getUnitPrice() - d.getUnitPrice()*(d.getDiscount()/100)}" />
                                                </h6>
                                                <h6 class="l-through" style="color: #666666"><fmt:formatNumber type="currency" value="${d.getUnitPrice()}" /></h6>
                                                <div style="color: #008200"> ${d.getDiscount()} % off </div>

                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
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

        <%@include file="include/Footer.jsp" %>
        <script src="js/jquery.nice-select.min.js"></script>
    </body>
</html>
