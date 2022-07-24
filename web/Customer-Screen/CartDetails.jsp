<%-- 
    Document   : CartDetails
    Created on : Jun 14, 2022, 6:00:12 PM
    Author     : vietd
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="../include/Head.jsp" %>
        <style>
            select {
                border: none;
            }
        </style>
    </head>
    <body>
        <%@include file="../include/Header.jsp" %>
        <!-- Start Banner Area -->
        <section class="banner-area organic-breadcrumb">
            <div class="container">
                <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                    <div class="col-first">
                        <h1>Shopping Cart</h1>
                        <nav class="d-flex align-items-center">
                            <a href="HomePage">Home<span class="lnr lnr-arrow-right"></span></a>
                            <a href="view_cart">Cart</a>
                        </nav>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Banner Area -->

        <!--================Cart Area =================-->
        <section class="cart_area">
            <div class="container">

                <c:if test="${cart.getCartItems().size() > 0}">
                    <div class="cart_inner">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col"><input type="checkbox" name="selectAll"> All
                                        </th>
                                        <th scope="col">Product</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">Amount</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${cart.getCartItems()}" var="item">
                                        <tr>
                                            <td>
                                                <input type="checkbox" name="cartDetailId" value="${item.getCartDetailId()}"
                                                       style="visibility: ${item.productDetail.quantityInStock >0 ? 'visible' : 'hidden'}">
                                            </td>
                                            <td>
                                                <div class="media">
                                                    <div class="d-flex">
                                                        <img src="img/shoes/${item.getProduct().getImages().get(0).getUrl()}"
                                                             class="book-img" height="150px" width="150px" alt="">
                                                    </div>
                                                    <div class="media-body">
                                                        <h3>${item.getProduct().getProductName()}</h3>
                                                        <div class="row">
                                                            <select class="col-md-4" name="color"
                                                                    onchange="findSize(this, ${item.getProduct().getProductId()})">
                                                                <c:forEach items="${item.getProduct().colors}" var="color">
                                                                    <option value="${color}" ${color eq item.getProductDetail().getColor() ? 'selected' : ''} >${color}</option>
                                                                </c:forEach>
                                                            </select>
                                                            <select class="col-md-3" name="size">
                                                                <option value="${item.getProductDetail().getSize()}">${item.getProductDetail().getSize()}</option>
                                                            </select>
                                                            <div class="col-md-5">
                                                                <p>Qty in stock:
                                                                    <span class="text-white badge ${item.productDetail.quantityInStock >0 ? 'bg-primary' :'bg-danger'}">${item.productDetail.quantityInStock}</span>
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <input name="productDetailId" type="hidden"
                                                               value="${item.getProductDetail().getProductDetailId()}">
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <h5>
                                                    <p class="mob-text  " style="text-decoration-line:line-through;color: #929292;">
                                                        <fmt:formatNumber value="${item.getProduct().getUnitPrice()}"
                                                                          type="number"/> &dstrok;
                                                        <input type="hidden"
                                                               value="${item.getProduct().getUnitPrice()}"
                                                               name="oldPrice">
                                                    </p>
                                                    <p class="mob-text text-dark"><fmt:formatNumber
                                                            value="${item.getProduct().getUnitPrice() - item.getProduct().getUnitPrice()*(item.getProduct().getDiscount()/100)}"
                                                            type="number"/>&dstrok;
                                                        <input type="hidden"
                                                               value="${item.getProduct().getUnitPrice() - item.getProduct().getUnitPrice()*(item.getProduct().getDiscount()/100)}"
                                                               name="unitPrice">
                                                    </p>
                                                </h5>
                                            </td>
                                            <td>
                                                <div class="product_count">
                                                    <input type="text" name="qty" id="quantity" value="${item.quantityInCart}"
                                                           title="Quantity:" disabled=""
                                                           class="input-text qty">
                                                    <button onclick="btnUpdateQuantity(this, 'add')"
                                                            class="increase items-count" type="button"><i
                                                            class="lnr lnr-chevron-up"></i></button>
                                                    <button class="reduced items-count" type="button"
                                                            onclick="btnUpdateQuantity(this, 'sub')"><i
                                                            class="lnr lnr-chevron-down"></i></button>
                                                </div>
                                            </td>
                                            <td>
                                                <h5><strong><fmt:formatNumber
                                                            value="${(item.getProduct().getUnitPrice() - item.getProduct().getUnitPrice()*(item.getProduct().getDiscount()/100))*item.quantityInCart}"
                                                            type="number"/>&dstrok;</strong></h5>
                                            </td>
                                            <td class="text-center">
                                                <div class="d-flex justify-content-between">
                                                    <button onclick="updateCart(this, ${item.getCartDetailId()})" name="update"
                                                            style="visibility: hidden;"
                                                            class="btn btn-sm btn-primary"
                                                            ><i class="fa fa-refresh"></i>
                                                    </button>
                                                    <button onclick="deleteCartItem(${item.getCartDetailId()})" name="delete"
                                                            class="btn btn-sm btn-danger">
                                                        <i class="fa fa-trash"></i>
                                                    </button>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td colspan="1">
                                            <h5>Subtotal</h5>
                                        </td>
                                        <td colspan="2">
                                            <h5><input name="oldSubtotal" disabled="" type="text"
                                                       style="border: none;  font-weight: bold;" value="0 VNĐ"
                                                       class="text-right"></h5>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td colspan="1">
                                            <h3>Total</h3>
                                        </td>
                                        <td colspan="2">
                                            <h5>
                                                <input name="subtotal" disabled="" type="text"
                                                       style="border: none;  font-weight: bold;" value="0 VNĐ" class="text-right">
                                            </h5>
                                        </td>
                                    </tr>


                                    <tr class="out_button_area">
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td colspan="2">

                                        </td>
                                        <td>
                                            <div class="checkout_btn_inner d-flex align-items-center">
                                                <a class="gray_btn" href="#">Continue Shopping</a>
                                                <a class="primary-btn" onclick="getItemCheckout()">Proceed to checkout</a>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </c:if>
                
            </div>
        </section>

        <!--================End Cart Area =================-->
        <%@include file="../include/Footer.jsp" %>
        <script>
            // if input[name=cartDetailId] is changed, update subtotal
            const calculateTotal = () => {
                // for each input[name=cartDetailId]
                let oldSubtotal = 0;
                let total = 0;
                $('input[name=cartDetailId]:checked').each(function () {
                    total += parseFloat(quantityOrder($(this)).val()) * parseFloat(unitPrice($(this)).val());
                    oldSubtotal += parseFloat(quantityOrder($(this)).val()) * parseFloat(oldPrice($(this)).val());
                });
                $('input[name=subtotal]').val(formatNumber(total) + ' VNĐ');
                $('input[name=oldSubtotal]').val(formatNumber(oldSubtotal) + ' VNĐ');
            }
            $('input[name=cartDetailId]').change(function () {
                calculateTotal();
            });


            const formatNumber = (value) => {
                return value.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
            };
            $('input[name="selectAll"]').on('change', function () {
                if ($(this).is(':checked')) {
                    $('input[name="cartDetailId"]').prop('checked', true);
                } else {
                    $('input[name="cartDetailId"]').prop('checked', false);
                }
                calculateTotal();
            });
            // color element
            const color = (element) => {
                return $(element).closest('tr').find('select[name="size"]');
            };
            // productDetailId element
            const productDetailId = (element) => {
                return $(element).closest('tr').find('input[name="productDetailId"]');
            };

            const quantityInStock = (element, quantity) => {
                const qtyInStock = $(element).closest('tr').find('p span');
                if (quantity > 0) {
                    qtyInStock.removeClass('bg-danger');
                    qtyInStock.addClass('bg-primary');
                } else {
                    qtyInStock.removeClass('bg-primary');
                    qtyInStock.addClass('bg-danger');
                }
                return qtyInStock;
            };
            const quantityOrder = (element) => {
                return $(element).closest('tr').find('input[name="qty"]');
            };
            const updateOn = (element, option) => {
                $(element).closest('tr').find('button[name="update"]').css('visibility', option ? 'visible' : 'hidden');
            }
            const updateCart = (element, cartDId) => {
                let qtyOrder = quantityOrder(element).val();
                let productDId = productDetailId(element).val();
                $.ajax({
                    url: 'cart',
                    type: 'POST',
                    data: {
                        action: 'updateCart',
                        cartDetailId: cartDId,
                        quantityOrder: qtyOrder,
                        productDetailId: productDId
                    },
                    success: function (data) {
                        swal({
                            title: "Success",
                            text: "Update cart success",
                            icon: "success",
                            button: "OK",
                            timer: 2000
                        }).then(function () {
                            location.reload();
                        });
                    },
                    error: function (data) {
                        showSwal('Error', 'Update cart failed', 'error');
                    }
                })
                        ;
            }
            const unitPrice = (element) => {
                return $(element).closest('tr').find('input[name="unitPrice"]');
            }
            const oldPrice = (element) => {
                return $(element).closest('tr').find('input[name="oldPrice"]');
            }
            const showSwal = (title, text, icon) => {
                swal({
                    title: title,
                    text: text,
                    icon: icon,
                    button: "OK",
                });
            }

            btnUpdateQuantity = (element, option) => {
                const quantity = quantityOrder(element);
                const qtyInStock = quantityInStock();
                const qtyInStockValue = $(element).closest('tr').find('p span');
                const unitPriceValue = unitPrice(element);
                const totalPrice = $(element).closest('tr').find('h5 strong');
                if (parseInt(qtyInStockValue.text()) > 0) {
                    if (option === 'add') {
                        if (parseInt(quantity.val()) < parseInt(qtyInStockValue.text())) {
                            quantity.val(parseInt(quantity.val()) + 1);
                            updateOn(element, true);
                            totalPrice.text(formatNumber(parseInt(quantity.val()) * parseInt(unitPriceValue.val()))).append('đ');
                        } else {
                            showSwal('Oops...', 'You cant add more than the quantity in stock!', 'error');
                        }
                    }
                    if (option === 'sub') {
                        if (parseInt(quantity.val()) > 1) {
                            quantity.val(parseInt(quantity.val()) - 1);
                            updateOn(element, true);
                            totalPrice.text(formatNumber(parseInt(quantity.val()) * parseInt(unitPriceValue.val()))).append('đ');
                        } else {
                            showSwal('Oops...', 'You cant reduce the quantity to less than 1!', 'error');
                        }
                    }
                } else {
                    showSwal('Oops...', 'Product is out of stock!', 'error');
                }
            }

            function findSize(element, productId) {
                color(element).html('');
                $.ajax({
                    url: 'cart',
                    type: 'POST',
                    data: {
                        color: element.value,
                        productId: productId,
                        action: 'getQuantity'
                    },
                    success: function (data) {
                        quantityOrder(element).val(1);
                        quantityInStock(element, data[0]['quantityInStock']).text(data[0]['quantityInStock']);
                        if (data[0]['quantityInStock'] > 0) {
                            updateOn(element, true);
                        } else {
                            updateOn(element, false);
                        }
                        productDetailId(element).val(data[0]['ProductDetailId']);
                        data.forEach(function (item) {
                            color(element).append('<option value="' + item.size + '">' + item.size + '</option>');
                        });
                        // when color size change, update quantity
                        color(element).on('change', function () {
                            // find nearest input quantity and update quantity
                            // find index of colored size
                            var index = $(color(element)).find('option:selected').index();
                            quantityInStock(element, data[index]['quantityInStock']).text(data[index]['quantityInStock']);
                            if (data[index]['quantityInStock'] > 0) {
                                updateOn(element, true);
                            } else {
                                updateOn(element, false);
                            }
                            productDetailId(element).val(data[index]['ProductDetailId']);
                        });
                    }
                });
            }

            function deleteCartItem(cartDetailId) {
                swal({
                    title: "Confirm delete?",
                    text: "You will not be able to recover this item!",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                }).then((willDelete) => {
                    if (willDelete) {
                        $.ajax({
                            url: 'cart',
                            type: 'POST',
                            data: {
                                action: 'deleteCartItem',
                                cartDetailId: cartDetailId
                            },
                            success: function () {
                                swal({
                                    title: "Deleted!",
                                    text: "Your item has been deleted.",
                                    icon: "success",
                                    button: "OK",
                                    timer: 2000
                                }).then(function () {
                                    location.reload();
                                });
                            },
                            error: function () {
                                swal("Error!", "Your item has not been deleted.", "error");
                            }
                        });
                    }
                });
            }

            function getItemCheckout(cartDetailId) {
                // array
                var itemCheckout = [];
                // get all cart detail id
                $('input[name="cartDetailId"]').each(function () {
                    // if checked
                    if ($(this).is(':checked')) {
                        // push to array
                        itemCheckout.push($(this).val());
                    }
                });
                var items = itemCheckout.join(',');
                if (itemCheckout.length > 0) {
                    $.ajax({
                        url: 'cart',
                        type: 'POST',
                        data: {
                            action: 'getItemCheckout',
                            listOrder: items
                        },
                        success: function (data) {
                            //return to checkout
                            window.location.href = 'checkout';
                        }
                    });
                } else {
                    showSwal('Oops...', 'You must select at least one item!', 'error');
                }

            }


        </script>

    </body>
</html>
