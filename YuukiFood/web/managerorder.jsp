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
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    </head>

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
                        <h1 style="text-align: center;">Manager Order</h1>

                        <form method="get" action="ManagerOrder" style="width: 70%; padding: 15px; display: flex; justify-content: space-between">
                            <div>
                                <label >User list:</label>
                                <div>
                                    <select name="uid" class="form-control">
                                        <c:forEach var="u" items="${pl}">
                                            <option value="${u.userId}">${u.userName}</option>
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
                                <th class="product-name">Order Id </th>
                                <th class="product-price">Order Date</th>
                                <th class="product-quantity">Total Bill</th>
                                <th class="product-subtotal">Address</th>
                                <th class="product-subtotal">Note</th>
                                <th class="product-subtotal">Details</th>
                                <th class="product-subtotal">Action</th>

                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="o" items="${ol}">
                                <tr class="cart_item">
                                    <td class="product-thumbnail" >
                                        ${o.getOrderId()}
                                    </td>
                                    <td class="product-price" >
                                        ${o.getOrderDate()}
                                    </td>
                                    <td class="product-quantity" >
                                        ${o.getTotal()}

                                    </td>
                                     <td class="product-quantity" >
                                        ${o.getUser().getAddress()}

                                    </td>
                                    <td class="product-subtotal" >
                                        ${o.getNotes()}
                                    </td>

                                    <td class="product-subtotal" >
                                        <a href="./OrderDetails?oid=${o.getOrderId()}">Details</a>
                                    </td>
                                    <td class="product-subtotal" >
                                        <%--<c:if test="${o.getStatusName()=='Wait'||o.getStatusName()=='Done'}">--%>
                                            <a href="./CancelOrder?oid=${o.getOrderId()}" class="btn btn-danger">Cancel order</a>
                                        <%--</c:if>--%>
                                    </td>
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