<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">

    <style>
        body{
            background: linear-gradient(135deg,#667eea,#764ba2);
            height:100vh;
            display:flex;
            align-items:center;
            justify-content:center;
        }
        .login-card{
            width:400px;
            background:white;
            padding:30px;
            border-radius:15px;
            box-shadow:0 10px 25px rgba(0,0,0,0.2);
        }
        .btn-login{
            background:#667eea;
            color:white;
            width:100%;
        }
    </style>
</head>

<body>

<div class="login-card">
    <h3 class="text-center"><i class="fa fa-user-circle"></i> Login</h3>
    <hr>

    <form action="login" method="post">
        <div class="form-group">
            <label>Email</label>
            <input type="email" name="email" class="form-control" required>
        </div>

        <div class="form-group">
            <label>Password</label>
            <input type="password" name="pass" minlength="6" class="form-control" required>
        </div>

        <p style="color:red;">${mess}</p>

        <button type="submit" class="btn btn-login">Login</button>

        <div class="text-center" style="margin-top:15px;">
            Don't have account? 
            <a href="register.jsp">Register here</a>
        </div>
    </form>
</div>

<script src="assets/js/jquery-3.4.1.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
</body>
</html>