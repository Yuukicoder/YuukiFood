<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title> Shop</title>

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



        <div class="page-contain login-page">

            <!-- Main content -->
            <div id="main-content" class="main-content">
                <div class="container">

                    <div class="row">

                        <div class="col-12">
                            <h3 class="box-title"  style="text-align: center">Your Order List</h3>
                            <form method="get" action="MyOrder" style="width: 40%; padding: 15px; display: flex; justify-content: space-between">
                                <div>
                                    From date: <input type="date" name="fdate" value="${param["fdate"]}" class="form-control">
                                </div>
                                <div >  
                                    To date: <input type="date" name="tdate"  value="${param["tdate"]}" class="form-control">
                                </div>
                                <input class="btn btn-primary" type="submit" value="Find" style="margin-top: 10px; ">
                            </form>
                            <table class="table table-hover table-striped" style="font-size: 20px;">
                                <thead>
                                    <tr>
                                        <th class="product-name">Order Id </th>
                                        <th class="product-price">Order Date</th>
                                        <th class="product-quantity">Total Bill</th>
                                        <th class="product-subtotal">Address</th>
                                        <th class="product-subtotal">Status</th>
                                        <th class="product-subtotal">Details</th>
                                        <th class="product-subtotal">Action</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="o" items="${ol}">
                                        <tr class="cart_item">
                                            <td class="product-thumbnail" >
                                                ${o.getId()}
                                            </td>
                                            <td class="product-price" >
                                                ${o.getOrderDate()}
                                            </td>
                                            <td class="product-quantity" >
                                                ${o.getTotal()}

                                            </td>
                                            <td class="product-subtotal" >
                                                ${o.getNotes()}
                                            </td>
                                            <td class="product-subtotal" >
                                                ${o.getStatusName()}
                                            </td>
                                            <td class="product-subtotal" >
                                                <a href="./OrderDetails?oid=${o.getId()}">Details</a>
                                            </td>
                                            <td class="product-subtotal" >
                                                <c:if test="${o.getStatusName()=='Wait'||o.getStatusName()=='Done'}">
                                                    <a href="./CancelOrder?oid=${o.getId()}" class="btn btn-danger">Cancel order</a>
                                                </c:if>

                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
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