<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html class="no-js" lang="en">
    <head>
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
        <link rel="stylesheet" href="assets/css/style.css">

  <!-- Main CSS File -->
  <link href="assets/css/main.css" rel="stylesheet">

    </head>
    <body class="biolife-body">

        <jsp:include page="header.jsp"/>


        <div class="page-contain checkout">

            <!-- Main content -->
            <div id="main-content" class="main-content">
                <div class="container sm-margin-top-37px">
                    <div class="row">

                        <h2 class="title" style="text-align: center">Checkout</h2>


                        <!--Order Summary-->
                        <div class=" col-md-12 sm-padding-top-48px sm-margin-bottom-0 xs-margin-bottom-15px">
                            <div class="order-summary sm-margin-bottom-80px">
                                
                                <div class="cart-list-box short-type">
                                    <ul class="cart-list">
                                        <c:forEach var="cart" items="${sessionScope['cart'].getItems()}">

                                            <li class="cart-elem">
                                                <div class="cart-item">
                                                    <div class="product-thumb">
                                                        <a class="prd-thumb" href="#">
                                                            <figure><img src="${cart.getProduct().getImg()}" width="113" height="113" alt="shop-cart" ></figure>
                                                        </a>
                                                    </div>
                                                    <div class="info">
                                                        <span class="txt-quantity">${cart.getQuantity()}X</span>
                                                        <a href="#" class="pr-name">${cart.getProduct().getProductName()}</a>
                                                    </div>
                                                    <div class="price price-contain">
                                                        <ins><span class="price-amount"><span class="currencySymbol">$</span>${cart.getProduct().getPrice()}</span></ins>

                                                    </div>
                                                </div>
                                            </li>
                                        </c:forEach>

                                    </ul>
                                    <ul class="subtotal">
                                        <li>
                                            <div class="subtotal-line">
                                                <b class="stt-name">Subtotal</b>
                                                <span class="stt-price">$${cart.getTotalMoney()}</span>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="subtotal-line">
                                                <b class="stt-name">Shipping</b>
                                                <span class="stt-price">$0.00</span>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="subtotal-line">
                                                <b class="stt-name">total:</b>
                                                <span class="stt-price">$${cart.getTotalMoney()}</span>
                                            </div>
                                        </li>
                                    </ul>
                                    <form action="Checkout" name="frm-login" method="post">
                                        <p class="form-row">
                                            <b>Shipping notes: </b> <input name="notes" type="text" style="width: 60%;" >
                                            <button style="float: right; background-color:#d53535;color: white; " type="submit" name="btn-sbmt" class="btn">Order</button>
                                        </p>
                                    </form>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
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