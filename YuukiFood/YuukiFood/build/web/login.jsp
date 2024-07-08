<%-- 
    Document   : login
    Created on : Jun 26, 2024, 11:46:36 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
        <style>

            .inline{
                display:inline-block;
            }
        </style>
    </head>
    <body class="biolife-body" onload="generate()">

        <jsp:include page="headerNotLogin.jsp"/>
        <%
    if (session.getAttribute("account") != null) {
        %>
        <c:choose>
            <c:when test="${sessionScope.account.roles.roleId == 1}">
                <%request.getRequestDispatcher("userHomePage.jsp").forward(request, response);%>
            </c:when>
            <c:when test="${sessionScope.account.roles.roleId == 2}">
                <%request.getRequestDispatcher("adminHome.jsp").forward(request, response);%>
            </c:when>
            <c:when test="${sessionScope.account.roles.roleId == 3}">
                <%request.getRequestDispatcher("staffHome.jsp").forward(request, response);%>
            </c:when>
        </c:choose>
        <% }
        %>


        <div class="page-contain login-page">

            <!-- Main content -->
            <div id="main-content" class="main-content">
                <div class="container">

                    <div class="row">

                        <!--Form Sign In-->
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <div class="signin-container">
                                <h1>Login</h1>
                                <form action="./login" name="frm-login" method="post">
                                    <p class="form-row">
                                        <label for="fid-name">Email<span class="requite">*</span></label>
                                        <input type="email" id="fid-name" name="email" value="" class="txt-input">
                                    </p>
                                    <p class="form-row">
                                        <label for="fid-pass">Password:<span class="requite">*</span></label>
                                        <input type="password" id="fid-pass" minlength="6" name="pass" value="" class="txt-input">
                                    </p>
                                    <p style="color: red;">${mess}</p>
                                    <p class="form-row wrap-btn">
                                        <button style="cursor: pointer; color:white; background-color: red; width: 48px; text-align: center; font-size: 17px" class="btn btn-submit "  id="btnLogin" type="submit">Login</button>
                                    </p>
                                </form>
                            </div>
                        </div>

                        <!--Form Sign In-->
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <div class="signin-container">
                                <h1>Register</h1>

                                <form action="register" name="frm-login" method="post">
                                    <p class="form-row">
                                        <label for="fid-name">Username<span class="requite">*</span></label>
                                        <input type="text" id="fid-name" name="name" value="" class="txt-input">
                                    </p>
                                    <p class="form-row">
                                        <label for="fid-name">Email<span class="requite">*</span></label>
                                        <input type="email" id="fid-name" name="email" value="" class="txt-input">
                                    </p>
                                    <p class="form-row">
                                        <label for="fid-name">Phone<span class="requite">*</span></label>
                                        <input type="text" id="fid-name" name="phone" value="" class="txt-input">
                                    </p>
                                    <p class="form-row">
                                        <label for="fid-name">Address<span class="requite">*</span></label>
                                        <input type="text" id="fid-name" name="address" value="" class="txt-input">
                                    </p>
                                    <p class="form-row">
                                        <label for="fid-name">Gender<span class="requite">*</span></label>
                                    <div>
                                        <input type="radio" name="gender" value="1" > Male  
                                        <input type="radio" name="gender" value="0" > Female
                                    </div>
                                    </p>
                                    <p class="form-row">
                                        <label for="fid-pass">Password:<span class="requite">*</span></label>
                                        <input type="password" id="fid-pass"  minlength="6"  name="pass" value="" class="txt-input">
                                    </p>
                                    <div id="user-input"style="display: inline;cursor: pointer" class="inline">
                                        <input type="text" id="submitLogin"
                                               placeholder="Captcha code" >
                                    </div>

                                    <div style="cursor: pointer; color:white; background-color: red; width: 48px" class="btn btn-default" onclick="generate()">
                                        Change
                                    </div>

                                    <div style=" box-shadow: 5px 5px 5px 5px gray; font-weight: 400;user-select: none;margin: 15px; padding: 5px;text-decoration:line-through;" id="image" class="inline" selectable="False">
                                    </div>
                                    <div style="color:white; background-color: red" id="btn" onclick="printmsg()"  class="btn btn-default">Check</div>

                                    <p id="key" style="color: red" ></p>
                                    <p class="form-row" style="color: red">
                                        ${messregis}
                                    </p>
                                    <p class="form-row wrap-btn">
                                        <button style="color:white; background-color: red; width: 48px" class="btn btn-submit " disabled="" id="btnRegister" type="submit">Register</button>
                                    </p>
                                </form>
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
        <script>
                                        var captcha;
                                        function generate() {

                                            // Clear old input
                                            document.getElementById("submitLogin").value = "";

                                            // Access the element to store
                                            // the generated captcha
                                            captcha = document.getElementById("image");
                                            var uniquechar = "";

                                            const randomchar =
                                                    "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

                                            // Generate captcha for length of
                                            // 5 with random character
                                            for (let i = 1; i < 6; i++) {
                                                uniquechar += randomchar.charAt(
                                                        Math.random() * randomchar.length)
                                            }

                                            // Store generated input
                                            captcha.innerHTML = uniquechar;
                                        }

                                        function printmsg() {
                                            const usr_input = document
                                                    .getElementById("submitLogin").value;

                                            // Check whether the input is equal
                                            // to generated captcha or not
                                            if (usr_input == captcha.innerHTML) {
                                                document.getElementById("btnRegister")
                                                        .disabled = false;
                                                var s = document.getElementById("key")
                                                        .innerHTML = "Capcha Matched";
                                                generate();
                                            } else {
                                                var s = document.getElementById("key")
                                                        .innerHTML = "Capcha Not Matched";
                                                generate();
                                            }
                                        }
        </script>
    </body>
</html>
