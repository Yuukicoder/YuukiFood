<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manager User</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">

    <style>
        body {
            background-color: #f4f6f9;
        }
        .page-title {
            margin: 30px 0;
            font-weight: bold;
        }
        .card-box {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }
        .table thead {
            background-color: #343a40;
            color: white;
        }
        .btn-action {
            margin-right: 5px;
        }
        .search-box {
            margin-bottom: 15px;
        }
    </style>
</head>

<%@include file="CheckAdminRole.jsp" %>

<body>

<!-- NAVBAR -->
<nav class="navbar navbar-default"> <div class="container"> <!-- BRAND --> <div class="navbar-header"> <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#alignment-example" aria-expanded="false"> <span class="sr-only">Toggle navigation</span> </button> <a class="navbar-brand" href="AdminHomePage">Yummy</a> </div> <!-- COLLAPSIBLE NAVBAR --> <div class="collapse navbar-collapse" id="alignment-example"> <!-- Links --> <ul class="nav navbar-nav"> <li > <a href="Dashboard" class="nav-link" style="font-size: 20px;">Dashboard</a> </li> <li > <a style="text-decoration: none;" href="ManagerUser"> Manage User</a> </li> <li > <a style="text-decoration: none;" href="ManagerProduct"> Manage Product</a> </li> <li > <a style="text-decoration: none;" href="ManagerOrder"> Manage Order</a> </li> <li > <a style="text-decoration: none;" href="Statistics"> Statistic</a> </li> <li > <a style="text-decoration: none;" href="CategoryManager"> Manage Category</a> </li> <li > <a style="text-decoration: none;" href="AdminHomePage">Back</a> </li> </ul> </div> </div> </nav>

<div class="container">

    <h2 class="text-center page-title">
        <i class="fa fa-users"></i> User Management
    </h2>

    <div class="card-box">

        <!-- SEARCH BOX -->
        <div class="row search-box">
            <div class="col-md-4">
                <input type="text" class="form-control" placeholder="Search user...">
            </div>
        </div>

        <!-- TABLE -->
        <div class="table-responsive">
            <table class="table table-bordered table-hover table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Address</th>
                        <th>Gender</th>
                        <th>Phone</th>
                        <th>Role</th>
                        <th class="text-center">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="p" items="${pl}">
                        <tr>
                            <td>${p.getUserId()}</td>
                            <td>${p.getUserName()}</td>
                            <td>${p.getEmail()}</td>
                            <td>${p.getAddress()}</td>
                            <td>
                                ${p.getGender() ? "Male" : "Female"}
                            </td>
                            <td>${p.getPhone()}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${p.getRoles().getRoleId() == 1}">
                                        <span class="label label-primary">User</span>
                                    </c:when>
                                    <c:when test="${p.getRoles().getRoleId() == 2}">
                                        <span class="label label-danger">Admin</span>
                                    </c:when>
                                    <c:when test="${p.getRoles().getRoleId() == 3}">
                                        <span class="label label-success">Staff</span>
                                    </c:when>
                                </c:choose>
                            </td>

                            <td class="text-center">
                                <a href="UpdateUser?user_id=${p.getUserId()}" 
                                   class="btn btn-warning btn-sm btn-action">
                                    <i class="fa fa-edit"></i> Update
                                </a>

                                <a href="DeleteUser?id=${p.getUserId()}" 
                                   class="btn btn-danger btn-sm"
                                   onclick="return confirm('Are you sure to delete this user?');">
                                    <i class="fa fa-trash"></i> Delete
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

    </div>
</div>

<!-- JS -->
<script src="assets/js/jquery-3.4.1.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>

</body>
</html>