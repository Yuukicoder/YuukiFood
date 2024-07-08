<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Flower Shop</title>

        <link href="https://fonts.googleapis.com/css?family=Cairo:400,600,700&amp;display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Poppins:600&amp;display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400i,700i" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Ubuntu&amp;display=swap" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/animate.min.css">
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/nice-select.css">
        <link rel="stylesheet" href="assets/css/slick.min.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/main-color.css">
    </head>

    <body class="biolife-body">

        <jsp:include page="header.jsp"/>



        <div class="page-contain single-product">
            <div class="container">

                <!-- Main content -->
                <div id="main-content" class="main-content">
                    <h1 style="text-align: center;"> Product details </h1>
                    <!-- summary info -->
                    <div style="display: flex; justify-content: space-around">
                        <div class="media" style="width: 40%">
                            <img src="${p.getImg()}" alt="" width="300" height="300">
                        </div>
                        <div class="product-attribute" style="width: 50%">
                            <h2 class="title">Product Name: ${p.getProductName()}</h2>
                            <div class="rating">
                            </div>
                            <span class="sku"><p style="font-size: 20px;line-height: 20px">
                                <p  style="font-size: 20px;">     <b >Category:</b> ${p.getCategory().getCategoryName()} </p> 

                                 <p style="font-size: 20px;">    <b>In Stock:</b> ${p.getStock()}</p> 
                                </p>
                            </span>
                            <div class="price">
                                <ins><span class="price-amount">Price:<span class="currencySymbol">$</span>${p.getPrice()}</span></ins>
                            </div>
                            <form action="./AddToCart" method="post">
                                <div class="quantity-box">
                                    <span class="title">Quantity: <input type="hidden" value="${p.getProductId()}" name="pid">
                                    </span>
                                    <input type="number" class="form-control" style="width: 90px;margin: 10px 0px;" name="quantity" value="1" max="${p.getStock()}" min="1" data-step="1">
                                </div>
                                <div class="buttons" >
                                    <button type="submit" class="btn add-to-cart-btn" style="background-color: #00ffff; padding: 7px; font-size: 15px;">
                                        add to cart
                                    </button>
                                </div>
                            </form>

                        </div>

                    </div>
                                <div style="width: 80%;margin: auto;">
                        <h2 style="text-align: center;">Product information</h2>
                        <p style="font-size: 16px;"> ${p.getDescription()}</p>
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