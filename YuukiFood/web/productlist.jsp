<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <%--<jsp:include page="header.jsp"/>--%>


        <div class="page-contain category-page no-sidebar">
            <div class="container">
                <div class="row">


                    <!-- Main content -->
                    <div id="main-content" class="main-content col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <form action="ProductList"  method="get">
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


                        <ul class="products-list">
                            <c:forEach var="p" items="${plist}">

                                <li class="product-item col-lg-4 col-xs-6" style=" list-style: none;">
                                    <div class="contain-product layout-default">
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