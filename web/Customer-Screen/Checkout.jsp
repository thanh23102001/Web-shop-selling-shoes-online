<%-- 
    Document   : Checkout
    Created on : May 24, 2022, 9:36:46 AM
    Author     : ADMIN
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                    <div class="col-first">
                        <h1>Checkout</h1>
                        <nav class="d-flex align-items-center">
                            <a href="HomePage">Home<span class="lnr lnr-arrow-right"></span></a>
                            <a href="checkout">Checkout</a>
                        </nav>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Banner Area -->

        <!--================Checkout Area =================-->
        <section class="checkout_area section_gap">
            <div class="container">
                <form  class="form-style-9">
                    <div class="billing_details">
                        <div class="row">
                            <div class="col-lg-7">
                                <h3>Billing Details</h3>
                                <style type="text/css">
                                    .nice-select{
                                        line-height: 24px;
                                    }
                                    .form-style-9{
                                        background: #FAFAFA;
                                        padding: 30px;
                                        margin: 50px auto;
                                        box-shadow: 1px 1px 25px rgba(0, 0, 0, 0.35);
                                        border-radius: 10px;
                                    }
                                    .form-style-9 ul{
                                        padding:0;
                                        margin:0;
                                        list-style:none;
                                    }
                                    .form-style-9 ul li{
                                        display: block;
                                        margin-bottom: 20px;
                                        min-height: 35px;
                                    }
                                    .form-style-9 ul li  .field-style{
                                        box-sizing: border-box; 
                                        -webkit-box-sizing: border-box;
                                        -moz-box-sizing: border-box; 
                                        padding: 8px;
                                        outline: none;
                                        border: 1px solid #B0CFE0;
                                        -webkit-transition: all 0.30s ease-in-out;
                                        -moz-transition: all 0.30s ease-in-out;
                                        -ms-transition: all 0.30s ease-in-out;
                                        -o-transition: all 0.30s ease-in-out;

                                    }.form-style-9 ul li  .field-style:focus{
                                        box-shadow: 0 0 5px #ff9933;
                                        border:1px solid #ff9933;
                                    }
                                    .form-style-9 ul li .field-split{
                                        width: 49%;
                                    }
                                    .form-style-9 ul li .field-full{
                                        width: 100%;
                                    }
                                    .form-style-9 ul li input.align-left{
                                        float:left;
                                    }
                                    .form-style-9 ul li input.align-right{
                                        float:right;
                                    }
                                    .form-style-9 ul li textarea{
                                        width: 100%;
                                        height: 100px;
                                    }
                                    .form-style-9 ul li input[type="button"], 
                                    .form-style-9 ul li input[type="submit"] {
                                        -moz-box-shadow: inset 0px 1px 0px 0px #ff9933;
                                        -webkit-box-shadow: inset 0px 1px 0px 0px #ff9933;
                                        box-shadow: inset 0px 1px 0px 0px #ff9933;
                                        background-color: #ff9933;
                                        border: 1px solid #ff9933;
                                        display: inline-block;
                                        cursor: pointer;
                                        color: #FFFFFF;
                                        padding: 8px 18px;
                                        text-decoration: none;
                                        font: 12px Arial, Helvetica, sans-serif;
                                    }
                                    .form-style-9 ul li input[type="button"]:hover, 
                                    .form-style-9 ul li input[type="submit"]:hover {
                                        background: linear-gradient(to bottom, #ffcc66 5%, #ffcc66 100%);
                                        background-color: #ffcc66;
                                    }
                                </style>

                                <div>   
                                    <form>
                                        <div>
                                            <select id="addressChoosen" class="form-select" style="color:gray;" onchange="findAddress()">
                                                <option value="">Open to select your address</option>
                                                <c:forEach items="${addresses}" var="a">
                                                    <option class="p-2 " value="${a.getCustomerAddressId()}"> ${a.getCustomerName()} - ${a.getPhoneNumber()} - ${a.getAddress()}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <p class="py-3">or add a new address by filling in the information below</p>
                                        <div class="form-group">
                                            <label for="name">Your Name<span class="ml-2" style="color:orange;">*</span></label>
                                            <input type="text" class="form-control mt-1" id="name" aria-describedby="emailHelp" placeholder="Enter your name" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="phone">Phone Number<span class="ml-2" style="color:orange;">*</span></label>
                                            <input type="tel" class="form-control mt-1" id="phone" placeholder="Phonenumber" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="address">Address<span class="ml-2" style="color:orange;">*</span></label>
                                            <input type="text" class="form-control mt-1" id="address" placeholder="Address" required>
                                        </div>
                                        <div>
                                            <p><span class="mx-2" style="color:orange;">**</span>choose your desired shipping company so that we can deliver your order to you as soon as possible</p>
                                            <select id="ship" class="form-control" style="color:gray;" onchange="findShipCompany()">
                                                <option value="">Open to select shipping company</option>
                                                <c:forEach items="${shipping}" var="s">
                                                    <option value="${s.getId()}">${s.getCompanyName()}</option>
                                                </c:forEach>
                                            </select>
                                        </div>

                                    </form>

                                </div>

                            </div>
                            <div class="col-lg-5">
                                <div class="order_box">
                                    <h2>Your Order</h2>
                                    <ul class="list">
                                        <li><a href="#">Product <span>Total</span></a></li>
                                            <c:forEach items="${orderList}" var="item">
                                            <li><a href="#">${item.getProduct().getProductName().substring(0,15)}... 
                                            <span class="middle">x ${item.quantityInCart}</span> 
                                            <span class="last" name="total"><fmt:formatNumber
                                        value="${(item.getProduct().getUnitPrice() - item.getProduct().getUnitPrice()*(item.getProduct().getDiscount()/100))}"
                                        type="number"/>&dstrok;</span></a></li>
                                            </c:forEach>
                                    </ul>
                                    <ul class="list list_2">
                                        <li><a>Total <span id="totalOrder"><fmt:formatNumber
                                        value="${totalPrice}"
                                        type="number"/>&dstrok;</span></a></li>
                                    </ul>
                                    <a class="btn primary-btn" style="font-size: 16px" onclick="checkout()">Proceed to Checkout</a>
                                </div>

                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </section>
        <!--================End Checkout Area =================-->

        <%@include file="../include/Footer.jsp" %>
                <%-- <script src="js/jquery.nice-select.min.js"></script> --%>

        
<script>
var addressId = "";
var shipCompanyId = "";
function findAddress() {
    addressId = document.getElementById("addressChoosen");
    // find option is selected
    var selectedAddress = addressId.options[addressId.selectedIndex];
    
    if(selectedAddress.value != ""){
        addressId = selectedAddress.value;
        var address = selectedAddress.text;
        var name = address.split("-")[0];
        var phone = address.split("-")[1];
        var address = address.split("-")[2];
        document.getElementById("name").value = name;
        document.getElementById("name").disabled = true;
        document.getElementById("phone").value = phone;
        document.getElementById("phone").disabled = true;
        document.getElementById("address").value = address;
        // disalble
        document.getElementById("address").disabled = true;
    }else{
        // set the name
        document.getElementById("name").value = "";
        // set the phone number
        document.getElementById("phone").value = "";
        // set the address
        document.getElementById("address").value = "";
        // enable
        document.getElementById("name").disabled = false;
        // enable
        document.getElementById("phone").disabled = false;
        // enable
        document.getElementById("address").disabled = false;
    }
}
function findShipCompany() {
           // get value select name is address
              var ship = document.getElementById("ship");
                // find option is selected
                var selectedShip = ship.options[ship.selectedIndex];
                // get the address id
                if(selectedShip.value != ""){
                    shipCompanyId = selectedShip.value;
                }
}

function checkout() {
    if(addressId == ""){
        // get all element in form
        var name = document.getElementById("name").value;
        var phone = document.getElementById("phone").value;
        var address = document.getElementById("address").value;
        if(shipCompanyId == ""){
            swal({
                title: "Please select a shipping company",
                text: "",
                icon: "warning",
                button: "OK",
            });
        }else{
            // send to server
            $.ajax({
                url: "checkout",
                type: "POST",
                data: {
                    name: name,
                    phone: phone,
                    address: address,
                    shipCompanyId: shipCompanyId,
                    action: "checkout_addAddress"
                },
                success: function(data) {
                    window.location.href= "OrderConfirmation?oid="+data;
                }
            });
        }
        }else{
        $.ajax({
            url: "checkout",
            type: "POST",
            data: {
                action: "checkout_order",
                addressId: addressId,
                shipCompanyId: shipCompanyId
            },
            success: function(data) {
                window.location.href= "OrderConfirmation?oid="+data;

            }
        });
    }
    
}






                
               
                
                



</script>

    </body>
</html>
