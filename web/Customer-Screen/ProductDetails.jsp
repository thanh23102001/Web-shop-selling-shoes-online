<%@page import="Models.Product"%>
<%@page import="Dal.FeedbackDAO"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%
    Product p = (Product) request.getAttribute("product");
    float average = new FeedbackDAO().get_Average_Rating(p.getProductId());
    int countReview = new FeedbackDAO().countReview(0, false, p.getProductId());
    int countReviewRating5 = new FeedbackDAO().countReview(5, true, p.getProductId());
    int countReviewRating4 = new FeedbackDAO().countReview(4, true, p.getProductId());
    int countReviewRating3 = new FeedbackDAO().countReview(3, true, p.getProductId());
    int countReviewRating2 = new FeedbackDAO().countReview(2, true, p.getProductId());
    int countReviewRating1 = new FeedbackDAO().countReview(1, true, p.getProductId());

%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Details</title>
        <%@include file="../include/Head.jsp" %>
        <link href="//cdn.jsdelivr.net/npm/@sweetalert2/theme-dark@4/dark.css"
              rel="stylesheet">
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
    </head>

    <body>
        <%@include file="../include/Header.jsp" %>
        <!-- Start Banner Area -->
        <section class="banner-area organic-breadcrumb">
            <div class="container">
                <div
                    class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                    <div class="col-first">
                        <h1>Product Details Page</h1>
                        <nav class="d-flex align-items-center">
                            <a href="Homepage">Home<span
                                    class="lnr lnr-arrow-right"></span></a>
                            <a href="Shop">Shop<span class="lnr lnr-arrow-right"></span></a>
                            <a
                                href="product_details?productId=${product.getProductId()}">product-details</a>
                        </nav>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Banner Area -->
        <!--================Single Product Area =================-->
        <div class="product_image_area">
            <div class="container">
                <div class="row s_product_inner">
                    <div class="col-lg-5 py-0 my-0">
                        <div class="s_Product_carousel">
                            <c:forEach items="${product.getImages()}" var="image">
                                <div class="single-prd-item">
                                    <img class="img-fluid" src="img/shoes/${image.getUrl()}"
                                         alt="">
                                </div>
                            </c:forEach>

                        </div>
                    </div>
                    <div class="col-lg-6 offset-lg-1">

                        <div class="s_product_text">
                            <h1 class="mb-3">${product.getProductName()}</h1>
                            <div class="d-flex ">
                                <div class="d-flex pb-5">
                                    <div class="mr-2" style="height: 15px;">5.0</div>
                                    <div class="d-flex mt-1">
                                        <img src="img/star.png" height="15px" width="15px">
                                        <img src="img/star.png" height="15px" width="15px">
                                        <img src="img/star.png" height="15px" width="15px">
                                        <img src="img/star.png" height="15px" width="15px">
                                        <img src="img/star.png" height="15px" width="15px">
                                    </div>
                                </div>
                                <div class="ml-5"> 100 comments</div>
                                <div class="mx-5"> 100 sold</div>
                            </div>

                            <h3 class="d-flex pb-5">
                                <div class="mr-5"
                                     style="text-decoration-line:line-through;color: #929292; ">
                                    <fmt:formatNumber value="${product.getUnitPrice()}"
                                                      type="number"/>
                                    &dstrok;
                                </div>
                                <div class="mr-5">
                                    <fmt:formatNumber
                                        value="${product.getUnitPrice() - product.getUnitPrice()*(product.getDiscount()/100)}"
                                        type="number"/> &dstrok;
                                </div>
                                <div class="px-2 py-1"
                                     style="font-size: 60%;margin-top: 7px;background-color:  #d0011b; color: white;">
                                    ${product.getDiscount()} % off
                                </div>
                            </h3>
                            <div class="d-flex pb-3" name="btn-color">
                                <label style="margin-right: 77px;">
                                    <h4 class="mt-3" style="color:  #777777;">Color</h4>
                                </label>
                                <div>
                                    <c:forEach items="${product.getColors()}" var="color">
                                        <button
                                            class="mr-3 btn btn-outline-light py-3 px-4 text-dark mb-3"
                                            style="border: 1px solid gray;font-size: 80%;"
                                            name="color" value="${color}">${color}</button>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="d-flex pb-3">
                                <label style="margin-right: 90px;">
                                    <h4 class="mt-3" style="color:  #777777;">Size</h4>
                                </label>
                                <div>
                                    <c:forEach items="${product.getSizes()}" var="size">
                                        <button
                                            class="mr-3 btn btn-outline-light py-3 px-5 text-dark mb-3"
                                            style="border: 1px solid gray;font-size: 80%;"
                                            value="${size}" name="size">${size}</button>
                                    </c:forEach>
                                </div>
                            </div>
                            <div id="show-action" style='visibility: hidden;'>
                                <div class="product_count d-flex align-items-center">
                                    <h4 class="mt-3" style="color:  #777777; margin-right: 46px;">Quantity</h4>
                                    </label>
                                    <span>
                                        <div class="btn btn-light py-1" id="subtractQuantity">
                                            <i class="fa fa-minus"
                                               style="color:  #777777;"></i>
                                        </div>
                                        <input type="text" name="qty" id="quantity" maxlength="12"
                                               value="1" title="Quantity:"
                                               class="input-text qty text-center py-1" disabled="">
                                        <div class="btn btn-light py-1" id="addQuantity"><i
                                                class="fas fa-plus "
                                                style="color:  #777777;"></i></div>
                                    </span>
                                    <div class="ml-5" id="message" ></div>

                                </div>

                                <div class="card_area d-flex align-items-center">
                                    <a class="primary-btn py-2"
                                       style="padding: 0px 70px 0px 70px;margin-left: 125px;"
                                       id="addToCart">Add to
                                        Cart</a>
                                        <%-- <a class="primary-btn py-2 ml-5"
                                           style="padding: 0px 55px 0px 55px;"
                                           id="orderNow">Order
                                            now</a> --%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--================End Single Product Area =================-->

        <!--================Product Description Area =================-->
        <section class="product_description_area">
            <div class="container">
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active show" id="home-tab" data-toggle="tab" href="#home"
                           role="tab" aria-controls="home"
                           aria-selected="true">Description</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="profile-tab" data-toggle="tab"
                           href="#profile" role="tab" aria-controls="profile"
                           aria-selected="false">Specification</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="review-tab" data-toggle="tab" href="#review"
                           role="tab" aria-controls="review"
                           aria-selected="false">Reviews</a>
                    </li>
                </ul>
                <div class="tab-content " id="myTabContent">
                    <div class="tab-pane fade active show" id="home" role="tabpanel"
                         aria-labelledby="home-tab">
                        <p>${product.getDesscription()}
                        </p>
                    </div>
                    <div class="tab-pane fade" id="profile" role="tabpanel"
                         aria-labelledby="profile-tab">
                        <div class="table-responsive">
                            <table class="table">
                                <tbody>
                                    <tr>
                                        <td>
                                            <h5>Width</h5>
                                        </td>
                                        <td>
                                            <h5>128mm</h5>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <h5>Height</h5>
                                        </td>
                                        <td>
                                            <h5>508mm</h5>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <h5>Depth</h5>
                                        </td>
                                        <td>
                                            <h5>85mm</h5>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <h5>Weight</h5>
                                        </td>
                                        <td>
                                            <h5>52gm</h5>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <h5>Quality checking</h5>
                                        </td>
                                        <td>
                                            <h5>yes</h5>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <h5>Freshness Duration</h5>
                                        </td>
                                        <td>
                                            <h5>03days</h5>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <h5>When packeting</h5>
                                        </td>
                                        <td>
                                            <h5>Without touch of hand</h5>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <h5>Each Box contains</h5>
                                        </td>
                                        <td>
                                            <h5>60pcs</h5>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <c:if test="${ListOfFeedback.size() > 0 }">
                        <div class="tab-pane fade show " id="review" role="tabpanel"
                             aria-labelledby="review-tab">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="row total_rate">
                                        <div class="col-6">
                                            <div class="box_total">
                                                <h5>Overall</h5>
                                                <h4><%=average%></h4>
                                                <h6>(<%=countReview%> Reviews)</h6>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="rating_list">
                                                <h3>Based on 3 Reviews</h3>
                                                <ul class="list">
                                                    <li><a href="#">5 Star <i
                                                                class="fa fa-star"></i><i
                                                                class="fa fa-star"></i><i
                                                                class="fa fa-star"></i><i
                                                                class="fa fa-star"></i><i
                                                                class="fa fa-star"></i> (<%=countReviewRating5%> Reviews) </a>
                                                    </li>
                                                    <li><a href="#">4 Star <i
                                                                class="fa fa-star"></i><i
                                                                class="fa fa-star"></i><i
                                                                class="fa fa-star"></i><i
                                                                class="fa fa-star"></i><i
                                                                class="fa fa-star"></i> (<%=countReviewRating4%> Reviews)</a>
                                                    </li>
                                                    <li><a href="#">3 Star <i
                                                                class="fa fa-star"></i><i
                                                                class="fa fa-star"></i><i
                                                                class="fa fa-star"></i><i
                                                                class="fa fa-star"></i><i
                                                                class="fa fa-star"></i> (<%=countReviewRating3%> Reviews)</a>
                                                    </li>
                                                    <li><a href="#">2 Star <i
                                                                class="fa fa-star"></i><i
                                                                class="fa fa-star"></i><i
                                                                class="fa fa-star"></i><i
                                                                class="fa fa-star"></i><i
                                                                class="fa fa-star"></i> (<%=countReviewRating2%> Reviews)</a>
                                                    </li>
                                                    <li><a href="#">1 Star <i
                                                                class="fa fa-star"></i><i
                                                                class="fa fa-star"></i><i
                                                                class="fa fa-star"></i><i
                                                                class="fa fa-star"></i><i
                                                                class="fa fa-star"></i> (<%=countReviewRating1%> Reviews)</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="review_list">
                                        <c:forEach items="${ListOfFeedback}" var="feedback">
                                            <div class="review_item">
                                                <div class="media">
                                                    <div class="d-flex">
                                                        <img src="img/user (1).png" height="35px" width="35px">
                                                    </div>
                                                    <div class="media-body">
                                                        <h4>${feedback.getCustomer().getCustomerName()}</h4>
                                                        <c:forEach begin="1" end="${feedback.getRating()}">
                                                            <i class="fa fa-star"></i>
                                                        </c:forEach>
                                                        <p>${feedback.getCreatedAt()} | Color:${feedback.getColor()} , Size:${feedback.getSize()} </p>
                                                    </div>

                                                </div>
                                                <p class="ml-5">${feedback.getComment()}</p>
                                            </div>
                                        </c:forEach>

                                    </div>
                                </div>

                            </div>
                        </div>
                    </c:if>
  <c:if test="${ListOfFeedback.size() == 0 }">
                        <div class="tab-pane fade show " id="review" role="tabpanel"
                             aria-labelledby="review-tab">
                            <div class="row">
                                <div class="col-lg-12">
                                    <p>There are no reviews for this product</p>
                                </div>

                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
        </section>
        <!--================End Product Description Area =================-->

        <!-- Start related-product Area -->
        <section class="related-product-area section_gap_bottom">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-6 text-center">
                        <div class="section-title">
                            <h1>Deals of the Week</h1>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed
                                do
                                eiusmod
                                tempor incididunt ut labore et dolore
                                magna aliqua.</p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-9">
                        <div class="row">
                            <c:forEach items="${RelatedProducts}" var="d">
                                <div class="col-lg-4 col-md-4 col-sm-6 mb-20">
                                    <div class="single-related-product d-flex">
                                        <a href="#"><img src="img/shoes/${d.getImages().get(0).getUrl()}" alt="" height="100px" width="100px"></a>
                                        <div class="desc">
                                            <a href="#" class="title">${d.getProductName().substring(0,10)}...</a>
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
                                <img class="img-fluid d-block mx-auto"
                                     src="img/category/c5.jpg" alt="">
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End related-product Area -->
        <%@include file="../include/Footer.jsp" %>
        <script src="js/jquery.nice-select.min.js"></script>
        <script>
            $(document).ready(function () {
                var color = null;
                var size = null;
                const productId = ${product.getProductId()};
                $('button[name="color"]').click(function () {
                    color = $(this).val();
                    findAttribute(productId, color, size);
                });
                $('button[name="size"]').click(function () {
                    size = $(this).val();
                    findAttribute(productId, color, size);
                });

                let findAttribute = (pId, color, size) => {
                    if (color !== null && size !== null) {
                        $.ajax({
                            url: 'product_details',
                            type: 'POST',
                            data: {
                                'action': 'getQuantityOfAttribute',
                                'productId': pId,
                                'color': color,
                                'size': size,
                            },
                            success: function (data) {
                                console.log(data);
                                if (data[1] === 0) {
                                    swal({
                                        title: "Out of stock",
                                        text: "This product is out of stock",
                                        icon: "warning",
                                        button: "OK",
                                    });
                                    $('#show-action').attr('style', 'visibility: hidden');
                                } else {
                                    $('#message').html('This product is available!');
                                    $('#message').css('color', 'green');
                                    $('#show-action').attr('style', 'visibility: visible');
                                    $('#subtractQuantity').on('click', function () {
                                        let quantity = $('#quantity').val();
                                        if (quantity > 1) {
                                            $('#quantity').val(parseInt(quantity) - 1);
                                        } else {
                                            swal("Oops...", "You can't subtract quantity!", "error");
                                        }
                                    });
                                    $('#addQuantity').on('click', function () {
                                        let quantity = $('#quantity').val();
                                        if (quantity < data[1]) {
                                            $('#quantity').val(parseInt(quantity) + 1);
                                        } else {
                                            swal("Oops...", "You can't add more than " + data[1] + " quantity!", "error");
                                        }
                                    });
                                    $('#addToCart').on('click', function () {
                                        $.ajax({
                                            url: 'add_to_cart',
                                            type: 'POST',
                                            data: {
                                                'action': 'addToCart',
                                                'productId': productId,
                                                'ProductDetailId': data[0],
                                                'color': color,
                                                'size': size,
                                                'quantity': $('#quantity').val(),
                                            },
                                            success: function (data) {
                                                // if is success
                                                if (data === 'success') {
                                                    swal({
                                                        title: "Success",
                                                        text: "Product has been added to cart!",
                                                        icon: "success",
                                                        button: "OK",
                                                    });
                                                } else {
                                                    swal({
                                                        title: "Error",
                                                        text: "Please log in to add this product to shopping cart!",
                                                        icon: "error",
                                                        button: "OK",
                                                    });
                                                }
                                            }
                                        });
                                    });
                                }

                            }
                        });
                    }
                };
            });
        </script>

        <script>
            var color = document.getElementsByName('color');
            var size = document.getElementsByName('size');

            for (var i = 0; i < color.length; i++) {
                color[i].addEventListener('click', function () {
                    var color = document.getElementsByName('color');
                    for (var i = 0; i < color.length; i++) {
                        color[i].classList.remove('active');
                        //remove background color from all
                        color[i].style.backgroundColor = '#fff';
                    }
                    this.classList.add('active');
                    //change color active
                    var colorActive = document.getElementsByClassName('active');
                    for (var i = 0; i < colorActive.length; i++) {
                        colorActive[i].style.backgroundColor = '#ffc107';
                    }
                });
            }

            for (var i = 0; i < size.length; i++) {
                size[i].addEventListener('click', function () {
                    var size = document.getElementsByName('size');
                    for (var i = 0; i < size.length; i++) {
                        size[i].classList.remove('active');
                        //remove background color from all
                        size[i].style.backgroundColor = '#fff';
                    }
                    this.classList.add('active');
                    //change color active
                    var sizeActive = document.getElementsByClassName('active');
                    for (var i = 0; i < sizeActive.length; i++) {
                        sizeActive[i].style.backgroundColor = '#ffc107';
                    }
                });
            }


        </script>
    </body>
</html>