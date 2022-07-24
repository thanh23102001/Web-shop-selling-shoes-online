<%@page import="Dal.BrandDAO"%>
<%@page import="Models.Brands"%>
<%@page import="Models.Brands"%>
<%@page import="Models.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dal.CategoryDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    CategoryDAO Cdao = new CategoryDAO();
    ArrayList<Category> categories = Cdao.getAllCategories();
    ArrayList<Brands> brands = new BrandDAO().getListBrands();
%>
<!-- Start Header Area -->
<header class="header_area sticky-header font-weight-bold">
    <div class="main_menu">
        <nav class="navbar navbar-expand-lg navbar-light main_box">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="col-md-2">
                    <img src="img/logo.png" alt="" >
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="col-md-7" id="navbarSupportedContent" style="margin-left: 80px;">
                    <ul class="nav navbar-nav menu_nav ml-auto " >
                        <li class="nav-item"><a class="nav-link" href="HomePage">Home</a></li>
                        <li class="nav-item "><a class="nav-link" href="Shop">Shopping</a></li>
                            <c:forEach items="<%=categories%>" var="c">
                            <li class="nav-item submenu dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                                   aria-expanded="false">${c.getCategoryName()}</a>
                                <ul class="dropdown-menu">
                                    <c:forEach items="${c.getSubcategories()}" var="sub">
                                        <li class="nav-item"><a class="nav-link" href="Shop?subCategory=${sub.getSubCategoryId()}">${sub.getSubCategoryName()}</a></li>
                                        </c:forEach>
                                </ul>
                            </li>
                        </c:forEach>
                        <li class="nav-item submenu dropdown">
                            <a href="" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                               aria-expanded="false">Brand</a>
                            <ul class="dropdown-menu">
                                <c:forEach items="<%=brands%>" var="b">
                                    <li class="nav-item"><a class="nav-link" href="Shop?brand=${b.getBrandId()}">${b.getBrandName()}</a></li>
                                    </c:forEach>
                            </ul>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="contact.html">Contact</a></li>
                    </ul>
                </div>
                <div class=" mt-3 col-md-3" id="navbarSupportedContent">
                    <ul class="nav navbar-nav menu_nav  ">
                        <li class="nav-item d-flex justify-content-between ">
                            <button class="cart" style="border: solid 1px white;background-color: white;"><span class="lnr lnr-magnifier " id="search"></span></button>
                            <button class="search" style="border: solid 1px white;background-color: white;"><a href="cart" class="cart text-dark "><span class="ti-bag"></span></a></button>

                        </li>
                        <li class="nav-item submenu dropdown px-0 mx-0 py-2">
                            <c:if test="${sessionScope.userLogin==null}">
                                <a href="Login" class="nav-link dropdown-toggle" >Login </a>        
                                <a href="Register" class="nav-link dropdown-toggle">/ Register </a>    
                            </c:if>
                            <c:if test="${sessionScope.userLogin!=null}">
                                <a href="#" class="nav-link dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true"
                                   aria-expanded="false"><img src="img/user (1).png" height="20px" width="20px" class="mr-3">${userLogin.getUsername()} </a>
                                <ul class="dropdown-menu">
                                    <li class="nav-item"><a class="nav-link" href="profile">Profile</a></li>
                                    <li class="nav-item"><a class="nav-link" href="ListOrder?cusid=${userLogin.getAccountId()}">Orders</a></li>
                                    <li class="nav-item"><a class="nav-link" href="Logout">Logout</a></li>
                                </ul>
                            </c:if>

                        </li>                   
                    </ul>
                </div>
            </div>
        </nav>
    </div>
    <!--    <div class="search_input" id="search_input_box">
            <div class="container">
                <form class="d-flex justify-content-between">
                    <input type="text" class="form-control" id="search_input" placeholder="Search Here">
                    <button type="submit" class="btn"></button>
                    <span class="lnr lnr-cross" id="close_search" title="Close Search"></span>
                </form>
            </div>
        </div>-->

</header>
<!-- End Header Area -->

