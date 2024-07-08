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
    <%@include file="CheckAdminRole.jsp" %>

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
                        <li >
                            <a style="text-decoration: none;" href="ManagerUser"> Manage User</a>
                        </li>
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
                            <a style="text-decoration: none;" href="AdminHomePage">Back</a>
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
                        <h1 style="text-align: center;">Manager User</h1>

                        <table class="table" style="margin-top: 20px; margin-bottom: 20px;">
                            <thead >
                                <tr style="font-size: 20px;">
                                    <th scope="col">ID</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Address</th>
                                    <th scope="col">gender</th>
                                    <th scope="col">Phone</th>
                                    <th scope="col">Role</th>
                                    <th scope="col" style="text-align: center;" >Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="p" items="${pl}">
                                    <tr>
                                        <th scope="row">${p.getUserId()}</th>
                                        <td>${p.getUserName()}</td>
                                        <td>${p.getEmail()}</td>
                                        <td>${p.getAddress()}</td>
                                        <td>${p.getGender()?"Male":"Female"}</td>
                                        <td>${p.getPhone()}</td>
                                        <td>
                                            <c:if test="${p.getRoles().getRoleId() == 1}">
                                                user    
                                            </c:if>
                                            <c:if test="${p.getRoles().getRoleId() == 2}">
                                                admin
                                            </c:if>
                                            <c:if test="${p.getRoles().getRoleId() == 3}">
                                                staff
                                            </c:if>
                                        </td>
                                        <td ><a href="DeleteUser?id=${p.getUserId()}" class="btn- btn-danger  btn-lg" style="display: block; display: inline; position: absolute" > Delete</a>
                                        <a href="UpdateUser?user_id=${p.getUserId()}" class="btn- btn-danger  btn-lg" style="display: block; display: inline; position: absolute; margin-left: 90px;" > Update</a></td>
                                       
                                    </tr>
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