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
        <!--<link rel="stylesheet" href="assets/css/style.css">-->
        <link rel="stylesheet" href="assets/css/main-color.css">

    </head>
    <%@include file="CheckAdminOrStaffRole.jsp" %>
    <body class="biolife-body">

        <nav class="navbar navbar-default">
            <div class="container">

                <!-- BRAND -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#alignment-example" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                    </button>
                    <a class="navbar-brand" href="AdminHomePage">Yummy</a>
                </div>
                <!-- COLLAPSIBLE NAVBAR -->
                <div class="collapse navbar-collapse" id="alignment-example">

                    <!-- Links -->
                    <ul class="nav navbar-nav">
                        <li >
                            <a href="Dashboard" class="nav-link" style="font-size: 20px;">Dashboard</a>
                        </li>
                        <c:if test="${sessionScope.account.roles.roleId == 2}">
                            <li >
                                <a style="text-decoration: none;" href="ManagerUser"> Manage User</a>
                            </li>
                        </c:if>
                        <li >
                            <a style="text-decoration: none;" href="ManagerProduct"> Manage Product</a>
                        </li>
                        <li >
                            <a style="text-decoration: none;" href="ManagerOrder"> Manage Order</a>
                        </li>
                        <li >
                            <a style="text-decoration: none;" href="Statistics"> Statistic</a>
                        </li>
                        <li >
                            <a style="text-decoration: none;" href="CategoryManager"> Manage Category</a>
                        </li>
                        <li >
                            <a style="text-decoration: none;" href="HomePage">Back</a>
                        </li>

                    </ul>
                </div>

            </div>
        </nav>
        <!-- Main content -->
        <div id="main-content" class="main-content">
            <div class="container-fluid">

                <div class="row" >

                    <div class="col-md-12">
                        <h1 style="text-align: center;">Statistic</h1>
                        <!-- Modal -->


                        <table class="table" style="margin-top: 20px; margin-bottom: 20px;">
                            <thead >
                                <tr style="font-size: 20px;">
                                    <th scope="col">Product ID</th>
                                    <th scope="col">Product Name</th>
                                    <th scope="col">Img</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Sold</th>
                                    <th scope="col">Stock</th>
                                    <th scope="col">Profit</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="p" items="${pl}">
                                    <tr>
                                        <th scope="row">${p.getProduct_id()}</th>
                                        <td>${p.getProduct_name()}</td>
                                        <td><img style="width:150px;height:150px;"src="${p.getImg()}"></td>

                                        <td>${p.getPrice()}</td>
                                        <td>${p.getQuantity()}</td>
                                        <td>${p.getStock()}</td>
                                        <td>${p.getPrice() * p.getQuantity()}</td>

                                    </tr>
                                    <!-- Modal -->
                                
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

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