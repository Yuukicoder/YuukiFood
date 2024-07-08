<%-- 
    Document   : home.jsp
    Created on : Jun 27, 2024, 10:18:19 PM
    Author     : Admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>Index - Yummy Bootstrap Template</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
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

  <!-- Main CSS File -->
  <link href="assets/css/main.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Yummy
  * Template URL: https://bootstrapmade.com/yummy-bootstrap-restaurant-website-template/
  * Updated: Jun 14 2024 with Bootstrap v5.3.3
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>
    <body class="index-page">

          <jsp:include page="header.jsp"/>


  <main class="main">

   <c:if test="${sessionScope['account']!=null}">
                    <h1 style="text-align: center;">Welcome    ${sessionScope['account'].getUserName()}</h1>
                </c:if>
    <!-- Hero Section -->


    <!-- About Section -->
 

    <!-- Why Us Section -->
  

    <!-- Stats Section -->
   

    <!-- Menu Section -->
    <section id="menu" class="menu section">

      <!-- Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>Our Menu</h2>
        <p><span>Check Our</span> <span class="description-title">Yummy Menu</span></p>
      </div><!-- End Section Title -->

    <div class="container">
                <div class="row">


                    <!-- Main content -->
                    <div id="main-content" class="main-content col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <form action="ViewMenu"  method="get">
                            <div class="row">
                                <div class="col-md-2">


                                </div>
                                <div class="col-md-4">
                                    <select name="categoryId" class="form-select" onchange="this.form.submit()" >
                                        <option value="">All Category</option>
                                        
                                        <c:forEach var="c"   items="${clist}">
                                            <option value="${c.getCategoryId()}" ${param['categoryId']==c.getCategoryId()?"selected":""}>${c.getCategoryName()}</option>
                                            
                                        </c:forEach>
                                            <h1>${clist}</h1>
                                    </select>
                                </div>
                               
                                <div class="col-md-3">
                                    <select name="sort" class="form-select"  onchange="this.form.submit()">
                                        <option value="0" ${param['sort']==0?"selected":""}>Sort Default</option>
                                        <option value="1" ${param['sort']==1?"selected":""}>Newest</option>
                                        <option value="2" ${param['sort']==2?"selected":""}>Price ascending</option>
                                        <option value="3" ${param['sort']==3?"selected":""}>Price descending</option>
                                    </select>
                                </div>
                            </div>
                        </form>
                    </div>

                    <div class="row" style="margin-bottom: 10px;">


                        <ul class="products-list row"  >
                            <c:forEach var="p" items="${plist}">

                                <li class="product-item col-lg-4 col-xs-6 " style=" list-style: none;flex-direction: column">
                                    <div class="contain-product layout-default ">
                                        <div class="product-thumb">
                                            <a href="./ProductDetails?pid=${p.getProductId()}" class="link-to-product" style="display: block; width: 300px; height: 300px; padding: auto;">
                                                <img src="${p.getImg()}" alt="img" width="300" height="300" style="margin-left: 8%;">
                                            </a>
                                        </div>
                                        <div class="info">
                                            <h4 class="product-title" style="margin-top: 45px;"><a href="./ProductDetails?pid=${p.getProductId()}" class="pr-name"  style="color: black;">Name: ${p.getProductName()}</a></h4>
                                            <div class="price">
                                                <ins ><span class="price-amount"  style="color: black;">Price: <span class="currencySymbol">$</span >${p.getPrice()}</span></ins>
                                                <div class="buttons">
                                                    <a href="./AddToCart?pid=${p.getProductId()}&quantity=1"  class="btn btn-primary"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>add to cart</a>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>

                    </div>
                    <div style="display: flex; justify-content: center;">
                        <ul class="pagination" >
                            <li  class="page-item next"><a href="ProductList?index=1&categoryId=${param['categoryId']}"><i class="fa fa-angle-left" class="page-link" aria-hidden="true"></i></a></li>
                                    <c:forEach var = "i" begin = "1" end = "${numberPage}">
                                <li class="${param['index']==i?'page-item active':'page-item'}"><a href="ProductList?index=${i}&categoryId=${param['categoryId']}"   class="page-link">${i}</a></li>
                                </c:forEach>
                            <li  class="page-item next"><a href="ProductList?index=${numberPage}&categoryId=${param['categoryId']}"><i class="fa fa-angle-right" class="page-link" aria-hidden="true"></i></a></li>
                        </ul>
                    </div>

                </div>

            </div>

    </section><!-- /Menu Section -->

    <!-- Testimonials Section -->


    <!-- Events Section -->


    <!-- Chefs Section -->


    <!-- Book A Table Section -->


    <!-- Gallery Section -->


    <!-- Contact Section -->


  </main>

  <footer id="footer" class="footer">

    <div class="container">
      <div class="row gy-3">
        <div class="col-lg-3 col-md-6 d-flex">
          <i class="bi bi-geo-alt icon"></i>
          <div class="address">
            <h4>Address</h4>
            <p>A108 Adam Street</p>
            <p>New York, NY 535022</p>
            <p></p>
          </div>

        </div>

        <div class="col-lg-3 col-md-6 d-flex">
          <i class="bi bi-telephone icon"></i>
          <div>
            <h4>Contact</h4>
            <p>
              <strong>Phone:</strong> <span>+1 5589 55488 55</span><br>
              <strong>Email:</strong> <span>info@example.com</span><br>
            </p>
          </div>
        </div>

        <div class="col-lg-3 col-md-6 d-flex">
          <i class="bi bi-clock icon"></i>
          <div>
            <h4>Opening Hours</h4>
            <p>
              <strong>Mon-Sat:</strong> <span>11AM - 23PM</span><br>
              <strong>Sunday</strong>: <span>Closed</span>
            </p>
          </div>
        </div>

        <div class="col-lg-3 col-md-6">
          <h4>Follow Us</h4>
          <div class="social-links d-flex">
            <a href="#" class="twitter"><i class="bi bi-twitter-x"></i></a>
            <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
            <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
            <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
          </div>
        </div>

      </div>
    </div>

    <div class="container copyright text-center mt-4">
      <p>© <span>Copyright</span> <strong class="px-1 sitename">Yummy</strong> <span>All Rights Reserved</span></p>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you've purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: [buy-url] -->
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
      </div>
    </div>

  </footer>

  <!-- Scroll Top -->
  <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Preloader -->
  <div id="preloader"></div>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>

  <!-- Main JS File -->
  <script src="assets/js/main.js"></script>
<script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
<df-messenger
  intent="WELCOME"
  chat-title="YuukiFood_chat"
  agent-id="038a5277-6067-4e77-ad66-8868973dceea"
  language-code="en"
></df-messenger>
</body>
</html>
