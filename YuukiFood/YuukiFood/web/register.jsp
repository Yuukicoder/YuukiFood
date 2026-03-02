<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">

    <style>
        body{
            background: linear-gradient(135deg,#43cea2,#185a9d);
            height:100vh;
            display:flex;
            align-items:center;
            justify-content:center;
        }
        .register-card{
            width:500px;
            background:white;
            padding:30px;
            border-radius:15px;
            box-shadow:0 10px 25px rgba(0,0,0,0.2);
        }
        .btn-register{
            background:#28a745;
            color:white;
            width:100%;
        }
        #image{
            text-decoration: line-through;
            font-weight:bold;
            letter-spacing:3px;
            font-size:18px;
            padding:5px;
            background:#f2f2f2;
            margin-top:10px;
            display:inline-block;
        }
    </style>
</head>

<body onload="generate()">

<div class="register-card">
    <h3 class="text-center"><i class="fa fa-user-plus"></i> Register</h3>
    <hr>

    <form action="register" method="post">

        <div class="form-group">
            <label>Username</label>
            <input type="text" name="name" class="form-control" required>
        </div>

        <div class="form-group">
            <label>Email</label>
            <input type="email" name="email" class="form-control" required>
        </div>

        <div class="form-group">
            <label>Phone</label>
            <input type="text" name="phone" class="form-control" required>
        </div>

        <div class="form-group">
            <label>Address</label>
            <input type="text" name="address" class="form-control" required>
        </div>

        <div class="form-group">
            <label>Gender</label><br>
            <label class="radio-inline">
                <input type="radio" name="gender" value="1" required> Male
            </label>
            <label class="radio-inline">
                <input type="radio" name="gender" value="0"> Female
            </label>
        </div>

        <div class="form-group">
            <label>Password</label>
            <input type="password" name="pass" minlength="6" class="form-control" required>
        </div>

        <!-- CAPTCHA -->
        <div class="form-group">
            <label>Captcha</label>
            <input type="text" id="submitLogin" class="form-control" placeholder="Enter captcha">
            <div id="image"></div>
            <button type="button" onclick="generate()" class="btn btn-default btn-sm">Change</button>
            <button type="button" onclick="checkCaptcha()" class="btn btn-info btn-sm">Check</button>
            <p id="key" style="color:red;"></p>
        </div>

        <p style="color:red;">${messregis}</p>

        <button type="submit" id="btnRegister" class="btn btn-register" >Register</button>

        <div class="text-center" style="margin-top:15px;">
            Already have account? 
            <a href="login.jsp">Login here</a>
        </div>

    </form>
</div>

<script>
    var captcha;

    function generate(){
        document.getElementById("submitLogin").value="";
        captcha=document.getElementById("image");
        var chars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        var code="";
        for(let i=0;i<5;i++){
            code+=chars.charAt(Math.floor(Math.random()*chars.length));
        }
        captcha.innerHTML=code;
    }

    function checkCaptcha(){
        var input=document.getElementById("submitLogin").value;
        if(input===captcha.innerHTML){
            document.getElementById("btnRegister").disabled=false;
            document.getElementById("key").innerHTML="Captcha Matched";
        }else{
            document.getElementById("key").innerHTML="Captcha Not Matched";
            generate();
        }
    }
</script>

<script src="assets/js/jquery-3.4.1.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
</body>
</html>