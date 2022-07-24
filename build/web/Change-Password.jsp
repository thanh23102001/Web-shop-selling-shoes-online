<%-- Document : change-password Created on : Jun 1, 2022, 7:59:29 AM Author : ADMIN --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="include/Head.jsp" %>
         <link href="//cdn.jsdelivr.net/npm/@sweetalert2/theme-dark@4/dark.css"
              rel="stylesheet">
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
    </head>

    <body>
        <c:if test="${actionFor == null}">
            <%@include file="include/Header.jsp" %>
        </c:if>
        <!-- Start Banner Area -->
        <section class="banner-area organic-breadcrumb">
            <div class="container">
                <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                    <div class="col-first">
                        <h1>Change Password</h1>
                        <nav class="d-flex align-items-center">
                            <a>User profile<span class="lnr lnr-arrow-right"></span></a>
                            <a>Home</a>
                        </nav>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Banner Area -->
        <section class="login_box_area section_gap mt-0">
            <div class="container">
                    <div class="row d-flex justify-content-center">
                        <div class="col-lg-4">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="mt-2 mx-2  ">
                                            <h6 class="mb-3 text-center"
                                                style="font-size: 160%;margin-right: 10px;">CHANGE PASSWORD</h6>
                                        </div>
                                        <div class="mb-5 ml-3">
                                            <p style="text-align-last: center;color: rgb(174, 167, 167);">For account security, please do not
                                                share your password with
                                                others</p>
                                        </div>
                                        <div class="mb-4 mt-4 ">
                                            <div class="">
                                                <h6 class="mb-0  mt-2">Current Password</h6>
                                            </div>
                                            <div class="input-group mb-3 mt-3">
                                                <input type="password" class="form-control" id="current_password"
                                                       name="old_password" value="${oldPass}" required="true"/>
                                                <div class="input-group-append">
                                                    <button class="btn btn-outline-secondary" type="button"
                                                            id="btn_current_password">
                                                        <span class="fas fa-eye"></span>
                                                    </button>
                                                </div>
                                            </div>
                                            <p id="message_current_password"></p>
                                        </div>
                                        <div class=" mb-4 mt-2">
                                            <div class="">
                                                <h6 class="mb-0  mt-2">New Password</h6>
                                            </div>
                                            <div class="input-group mb-3 mt-3">
                                                <input type="password" name="new_password" class="form-control"
                                                       value="${newPass}" required id="new_password" />
                                                <div class="input-group-append ">
                                                    <button class="btn btn-outline-secondary" type="button"
                                                            id="btn_new_password">
                                                        <span class="fas fa-eye"></span>
                                                    </button>
                                                </div>
                                            </div>
                                            <p id="message_new_password"></p>

                                        </div>
                                        <div class=" mb-3 mt-2">
                                            <div class="">
                                                <h6 class="mb-0 mt-2">Confirm Password</h6>
                                            </div>
                                            <div class="input-group mb-3 mt-3">
                                                <input type="password" name="confirm_password" class="form-control"
                                                       value="${cfPass}" required id="confirm_password">
                                                <div class="input-group-append ">
                                                    <button class="btn btn-outline-secondary" type="button"
                                                            id="btn_confirm_password">
                                                        <span class="fas fa-eye"></span>
                                                    </button>
                                                </div>
                                            </div>
                                            <p id="message_confirm_password"></p>
                                        </div>
                                        <p style="color: red;text-align-last: center;" id="message"></p>
                                        <div class=" form-group mt-3">
                                            <!-- Button trigger modal -->
                                            <button onclick="changePassword()" class="btn btn-warning py-2 "
                                                    style="width: 100%;">
                                                Complete
                                            </button>
                                        </div>
                                        <c:if test="${actionFor == null}">
                                            <a href="Forgot_password" style="margin-left: 100px;"
                                               class="text-warning">Forgot Password ?</a>
                                        </c:if>
                                        <c:if test="${actionFor != null}">
                                            <a href="Forgot_password?actionFor=${actionFor}" style="margin-left: 100px;"
                                               class="text-warning">Forgot Password ?</a>
                                        </c:if>


                                    </div>
                                </div>
                            <%-- </form> --%>
                        </div>
                    </div>
            </div>
        </section>
        <script>
            document.getElementById('btn_current_password').addEventListener('click', function () {
                const inputElement = document.getElementById('current_password');
                const currentType = inputElement.getAttribute('type');
                inputElement.setAttribute(
                        'type', currentType == 'password' ? 'text' : 'password'
                        )
            })

            document.getElementById('btn_new_password').addEventListener('click', function () {
                const inputElement = document.getElementById('new_password');
                const currentType = inputElement.getAttribute('type');
                inputElement.setAttribute(
                        'type', currentType == 'password' ? 'text' : 'password'
                        )
            })

            document.getElementById('btn_confirm_password').addEventListener('click', function () {
                const inputElement = document.getElementById('confirm_password');
                const currentType = inputElement.getAttribute('type');
                inputElement.setAttribute(
                        'type', currentType == 'password' ? 'text' : 'password'
                        )
            })

            // required = "required"
            var current_password = document.getElementById('current_password');
            var new_password = document.getElementById('new_password');
            var confirm_password = document.getElementById('confirm_password');
            // if current password is empty show message
            current_password.onblur = function () {
                if (current_password.value == "") {
                    current_password.style.border = "1px solid red";
                    document.getElementById('message_current_password').innerHTML = "Current Password is required";
                    // message color
                    document.getElementById('message_current_password').style.color = "red";
                } else {
                    current_password.removeAttribute("required");
                    current_password.style.border = "1px solid green";
                    document.getElementById('message_current_password').innerHTML = "";
                }
            }

            // if new password is empty show message
            new_password.onblur = function () {
                if (new_password.value == "") {
                    new_password.style.border = "1px solid red";
                    document.getElementById('message_new_password').innerHTML = "New Password is required";
                    // message color
                    document.getElementById('message_new_password').style.color = "red";
                } else {
                    new_password.removeAttribute("required");
                    new_password.style.border = "1px solid green";
                    document.getElementById('message_new_password').innerHTML = "";
                }
            }

            // if confirm password is empty show message
            confirm_password.onblur = function () {
                if (confirm_password.value == "" ) {
                    confirm_password.style.border = "1px solid red";
                    document.getElementById('message_confirm_password').innerHTML = "Confirm Password is required";
                    // message color
                    document.getElementById('message_confirm_password').style.color = "red";
                } 
                else {
                    confirm_password.removeAttribute("required");
                    confirm_password.style.border = "1px solid green";
                    document.getElementById('message_confirm_password').innerHTML = "";
                }
            }

            function changePassword(){
                // if one of 3 fields is empty show message
                if(current_password.value == "" || new_password.value == "" || confirm_password.value == ""){
                    document.getElementById('message').innerHTML = "Please fill all fields";
                    // message color
                    document.getElementById('message').style.color = "red";
                }else{
                    // if new password is not equal to confirm password show message
                    if(new_password.value != confirm_password.value){
                        document.getElementById('message').innerHTML = "New Password and Confirm Password are not equal";
                        // message color
                        document.getElementById('message').style.color = "red";
                    }else{
                        // if all fields are filled show message
                        document.getElementById('message').innerHTML = "Please wait...";
                        // message color
                        document.getElementById('message').style.color = "green";
                        // console log value of all fields
                        console.log(document.getElementById('current_password').value);
                        console.log(document.getElementById('new_password').value);
                        console.log(document.getElementById('confirm_password').value);
                        $.ajax({
                            url: "password_controller",
                            type: "POST",
                            data: {
                                current_password: document.getElementById('current_password').value,
                                new_password: document.getElementById('new_password').value,
                                confirm_password: document.getElementById('confirm_password').value
                            },
                            success: function () {
                                document.getElementById('message').innerHTML = "Password changed successfully";
                                // message color
                                document.getElementById('message').style.color = "green";
                                swal({
                                    title: "Password changed successfully",
                                    text: "Please login with new password",
                                    icon: "success",
                                    button: "OK"
                                });
                            },
                            error: function () {
                                document.getElementById('message').innerHTML = "Password not changed";
                                // message color
                                document.getElementById('message').style.color = "red";
                                swal({
                                    title: "Password not changed",
                                    text: "Please try again",
                                    icon: "error",
                                    button: "OK"
                                });
                            }
                        });
                    }
                }
            }


        </script>
        <%@include file="include/Footer.jsp" %>
                <script src="js/jquery.nice-select.min.js"></script>


    </body>

</html>
