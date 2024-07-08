<%-- 
    Document   : headerNotLogin
    Created on : Jul 1, 2024, 3:36:12 PM
    Author     : Admin
--%>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Fonts -->
<link href="https://fonts.googleapis.com" rel="preconnect">
<link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Inter:wght@100;200;300;400;500;600;700;800;900&family=Amatic+SC:wght@400;700&display=swap" rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="assets/vendor/aos/aos.css" rel="stylesheet">
<link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
<link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- Main CSS File -->
<link href="assets/css/main.css" rel="stylesheet">
<!-- HEADER -->
<header id="header" class="header d-flex align-items-center sticky-top">
    <div class="container position-relative d-flex align-items-center justify-content-between">


        <a href="HomePage" class="logo d-flex align-items-center me-auto me-xl-0">
            <!-- Uncomment the line below if you also wish to use an image logo -->
            <!-- <img src="assets/img/logo.png" alt=""> -->
            <a href="home.jsp"><h1 class="sitename">Yummy<span style="color: red">.</span></h1><a/>
        </a>

        <nav id="navmenu" class="navmenu">
            <ul>
                <li><a href="home.jsp" >Home</a></li>
                <li><a href="ViewAbout">About</a></li>
                <li><a href="ViewMenu" >Menu</a></li>
                <li><a href="ViewEvents">Events</a></li>
                <li><a href="ViewChefs">Chefs</a></li>
                <li><a href="ViewGallery">Gallery</a></li>

                <li><a href="ViewContact">Contact</a></li>
                <li >
                    <a href="ViewCart" class="link-to">
                        Cart 
                        <c:if test="${sessionScope['cart']==null}">
                            (0)
                        </c:if>
                        <c:if test="${sessionScope['cart']!=null}">
                            (${sessionScope['cart'].getItems().size()})
                        </c:if>
                    </a>
                </li>

                <form action="ProductList?index=1" class="navbar-form nav navbar-nav" name="desktop-seacrh" method="get">
                    <input type="text" name="search"  class="input-text" value="" placeholder="Search here...">
                    <button type="submit" class="btn-submit"><i class="biolife-icon icon-search"></i></button>
                </form>



            </ul>
            <i class="mobile-nav-toggle d-xl-none bi bi-list" ></i>

        </nav>

        <a class="btn-getstarted" href="login">Log in</a>
        <c:if test="${sessionScope['account']!=null}">
            <li style="list-style-type: none;" ><a href="Logout" style="color: black;" class="login-link" ><i class="fa fa-sign-out" style="font-size: 18px; margin-left: 10px;" aria-hidden="true"> </i> </a></li>
            </c:if>
    </div>
</header>
