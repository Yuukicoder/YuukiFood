<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Staff Dashboard</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">

    <style>
        body {
            background-color: #f4f6f9;
        }
        .navbar {
            border-radius: 0;
        }
        .dashboard-title {
            margin: 30px 0;
            font-weight: bold;
        }
        .card-box {
            padding: 25px;
            border-radius: 8px;
            color: white;
            margin-bottom: 20px;
        }
        .card-box h2 {
            font-weight: bold;
            margin-top: 10px;
        }
        .bg-blue { background-color: #007bff; }
        .bg-green { background-color: #28a745; }
        .bg-orange { background-color: #fd7e14; }
        .bg-red { background-color: #dc3545; }
    </style>
</head>

<%@include file="CheckStaffRole.jsp" %>

<body>

    <!-- NAVBAR -->
<nav class="navbar navbar-default">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="AdminHomePage">Yummy Admin</a>
        </div>
        <ul class="nav navbar-nav">
   

            <li><a href="ManagerProduct">Manage Product</a></li>
            <li><a href="ManagerOrder">Manage Order</a></li>

            <li><a href="CategoryManager">Manage Category</a></li>
        </ul>
    </div>
</nav>

    <!-- MAIN CONTENT -->
    <div class="container">
        <h2 class="dashboard-title">Dashboard Overview</h2>

        <div class="row">

            <!-- PRODUCTS -->
            <div class="col-md-3">
                <div class="card-box bg-blue text-center">
                    <h4>Total Products</h4>
                    <h2>${nump}</h2>
                </div>
            </div>

            <!-- ORDERS -->
            <div class="col-md-3">
                <div class="card-box bg-green text-center">
                    <h4>Total Orders</h4>
                    <h2>${numo}</h2>
                </div>
            </div>

            <!-- CUSTOMERS -->
            <div class="col-md-3">
                <div class="card-box bg-orange text-center">
                    <h4>Total Customers</h4>
                    <h2>${numu}</h2>
                </div>
            </div>

            <!-- PROFIT -->
            <div class="col-md-3">
                <div class="card-box bg-red text-center">
                    <h4>Total Profit</h4>
                    <h2>${profit} $</h2>
                </div>
            </div>

        </div>
    </div>

    <!-- JS -->
    <script src="assets/js/jquery-3.4.1.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>

</body>
</html>