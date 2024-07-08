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
        <style>
            table, th, td {
                border: 1px solid black;
                border-collapse: collapse;
                padding: 5px;
                text-align: center;
            }
            td {
                padding-left: 10px;
            }
            #image-user-bill img{
                width: 90%;
                height: 120px;
            }
            form#f {
                display: flex;
                flex-direction: column;
                align-items: center; /* Center the form elements horizontally */
            }

            form#f div {
                margin-bottom: 10px;
            }

        </style>
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
                        <h1 style="text-align: center;">Manager Order</h1>

                        <form method="get" action="ManagerOrder" style="width: 100%; padding: 15px; display: flex; justify-content: space-between">
                            <div>
                                <label >User list:</label>
                                <div>
                                    <select name="uid" class="form-control">
                                        <option value="">Select a user</option>
                                        <c:forEach var="u" items="${pl}">
                                            <option value="${u.userId}" ${param.uid == u.userId ? "selected" : ""} >${u.userName}
                                            </option>
                                        </c:forEach>

                                    </select>
                                </div>
                            </div>
                            <div>
                                <label >  From date:</label> <input type="date" name="fdate" value="${param["fdate"]}" class="form-control">
                            </div>
                            <div >  
                                <label >    To date: </label><input type="date" name="tdate"  value="${param["tdate"]}" class="form-control">
                            </div>
                            <input class="btn btn-primary" type="submit" value="Find" style="margin-top: 10px; ">
                        </form>
                    </div>
                    <table class="table" style="margin-top: 20px; margin-bottom: 20px;">
                        <thead>
                            <tr>
                                <th class="product-name">User name</th>
                                <th class="product-price">Product name</th>
                                <th class="product-quantity">Price</th>
                                <th class="product-subtotal">Quantity</th>
                                <th class="product-subtotal">Image</th>
                                <th class="product-subtotal">Order date</th>
                                <th class="product-subtotal">Status</th>
                                <th class="product-subtotal">Total</th>

                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="o" items="${ol}">

                                <tr class="cart_item">
                                    <td style="vertical-align: middle" class="product-thumbnail" >
                                        ${o.getUser_name()}
                                    </td>
                                    <td style="vertical-align: middle" class="product-price" >
                                        ${o.getProduct_name()}
                                    </td>
                                    <td style="vertical-align: middle" class="product-quantity" >
                                        ${o.getPrice()}

                                    </td>
                                    <td style="vertical-align: middle" class="product-subtotal" >
                                        ${o.getQuantity()}
                                    </td>
                                    <td style="vertical-align: middle" class="product-subtotal" id="image-user-bill" >
                                        <img src="${o.getImg()}" alt="${o.getUser_name()}"/>
                                    </td>
                                    <td style="vertical-align: middle" class="product-subtotal" >
                                        ${o.getOrder_date()}
                                    </td>
                                    <td style="vertical-align: middle">
                                        <form id="f" action="EditStatus" method="POST">
                                            <input type="hidden" name="editStatusOrderId" value="${o.getDetail_id()}">
                                            <input type="hidden" name="editStatusUserId" value="${param.uid}">
                                            <%-- Khi change lựa chọn của thẻ select sẽ tự submit--%>
                                            <c:choose>
                                                <c:when test="${param.newStatus != null && param.editStatusOrderId == o.getDetail_id()}">
                                                    <c:set var="currentStatus" value="${param.newStatus}" />
                                                </c:when>
                                                <c:otherwise>
                                                    <c:set var="currentStatus" value="${o.status}" />
                                                </c:otherwise>
                                            </c:choose>
                                            <select name="newStatus" <%--onchange="document.getElementById('f').submit()" --%>>
                                                <option value="Preparing" ${currentStatus.equals("Preparing") ? "selected" : ""}>Preparing</option>
                                                <option value="Done" ${currentStatus.equals("Done") ? "selected" : ""}>Done</option>
                                                <option value="Cancelled" ${currentStatus.equals("Cancelled") ? "selected" : ""}>Cooking</option>
                                            </select>
                                            <button type="submit" name="Save changes status">Save changes status</button>
                                        </form>
                                    </td>
                                    <td style="vertical-align: middle" class="product-subtotal" >
                                        ${o.getPrice()}
                                    </td>
                                    <c:set var="total" value="${total + o.getPrice()}" />
                                </tr>
                            </c:forEach>
                            <tr>
                                <td colspan="7" style="font-weight: bold; font-size: 25px">Total price:</td>
                                <td style="vertical-align: middle">${total_bill}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
<td class="wrap-btn-control" colspan="2">
    <c:if test="${userIdOrder != 0}">
        <a class="btn back-to-shop" href="./Pay?pid=${userIdOrder}" style="background-color:#d53535">Pay</a>
    </c:if>
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