<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title> Shop</title>
   

        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/main-color.css">
                <link rel="stylesheet" href="assets/css/font-awesome.min.css">

        
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

    </head>

    <body class="biolife-body">

        <jsp:include page="header.jsp"/>


        <div class="page-contain shopping-cart">

            <!-- Main content -->
            <div id="main-content" class="main-content">
                <div class="container">

                    <!--Top banner-->

                    <!--Cart Table-->
                    <div class="shopping-cart-container" style="margin-bottom: 60px;">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <h1 class="box-title">View ordered </h1>
                                <table class="shop_table cart-form">
                                    <thead>
                                        <tr>
                                            <th >Product Name</th>
                                            <th class="product-name">Product Img</th>
                                            <th class="product-price">Price</th>
                                            <th class="product-quantity">Quantity</th>
                                            <th class="product-subtotal">Total</th>
                                            <th class="product-subtotal">Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="cart" items="${listOrdered}">
                                            
                                            <tr class="cart_item">
                                                <td >
                                                    <a href="#">${cart.getProduct_name()}</a>
                                                </td>
                                                <td class="product-thumbnail" data-title="Product Name">
                                                    <a class="prd-thumb" href="#">
                                                        <figure><img width="113" height="113" src="${cart.getImg()}" alt="shipping cart"></figure>
                                                    </a>
                                                </td>
                                                
                                                <td class="product-price" data-title="Price">
                                                    <div class="price price-contain">
                                                        <ins><span class="price-amount"><span class="currencySymbol">$</span>${cart.getPrice()}</span></ins>
                                                    </div>
                                                </td>
                                                <td class="product-quantity" data-title="Quantity">
                                                    ${cart.getQuantity()}
                                                </td>
                                                
                                               
                                                <td class="product-subtotal" data-title="Total">
                                                    <div class="price price-contain">
                                                        <ins><span class="price-amount"><span class="currencySymbol">$</span>${cart.getPrice()*cart.getQuantity()}</span></ins>
                                                    </div>
                                                </td>
                                                <td class="product-quantity" data-title="Quantity">
                                                    ${cart.getStatus()}
                                                </td>
                                            </tr>
                                        </c:forEach>

                                        <tr class="cart_item wrap-buttons">
                                            <td class="wrap-btn-control" colspan="4">
                                                <a class="btn back-to-shop" href="./HomePage" style="background-color: #d53535">Back to Shop</a>
                                                <a class="btn back-to-shop" href="#" style="background-color: #d53535; left: ">Total: ${profit}</a>
                                                
                                            </td>
                                            
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- FOOTER -->
        <%--<jsp:include page="footer.jsp"/>--%>



        <!-- Scroll Top Button -->
        <a class="btn-scroll-top"><i class="biolife-icon icon-left-arrow"></i></a>

        <script src="assets/js/jquery-3.4.1.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.countdown.min.js"></script>
        <script src="assets/js/jquery.nice-select.min.js"></script>
        <script src="assets/js/jquery.nicescroll.min.js"></script>
        <script src="assets/js/slick.min.js"></script>
        <script src="assets/js/biolife.framework.js"></script>
        <script src="assets/js/functions.js"></script>
    </body>

</html>