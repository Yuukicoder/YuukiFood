<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Biolife - Organic Food</title>
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

    <body class="biolife-body" onload="generate()">

        <jsp:include page="header.jsp"/>


        <div class="page-contain login-page">

            <!-- Main content -->
            <div id="main-content" class="main-content">
                <div class="container">

                    <div class="row">

                        <div class="col-12">
                            <h3 class="box-title" style="display: inline;">Change password</h3><br>

                            <form method="post" action="Changepassword">
                                <div  class="col-md-12">
                                    <label class="" >Old Password:</label><input class="form-control" type="password"name="oldpass">
                                </div>
                                <div  class="col-md-12">
                                    <label class="" >New Password::</label><input class="form-control" type="password"  name="newpass">
                                </div>
                                <div  class="col-md-12">
                                    <label class="" >Re-newPass:</label><input class="form-control" type="password"  name="renewpass">
                                </div>
                                <div  class="col-md-12" style="padding: 2px;">           
                                    <p style="color: red;">${mess}</p>
                                </div>
                                <div  class="col-md-4">

                                    <div id="user-input"style="display: inline;cursor: pointer" class="inline">
                                        <input type="text" id="submitLogin"
                                               placeholder="Captcha code" >
                                    </div>

                                    <div style="display: inline;cursor: pointer; "  onclick="generate()">
                                        Change
                                    </div>

                                    <div style=" box-shadow: 5px 5px 5px 5px gray; font-weight: 400;user-select: none;margin-top: 10px; margin-bottom: 20px; padding: 5px;text-decoration:line-through; width: 150px;" id="image" class="inline" selectable="False">
                                    </div>
                                    <div id="btn" onclick="printmsg()" style="display: inline;" class="btn btn-default">Check</div>

                                    <p id="key" style="color: black" ></p>
                                </div>

                                <div  class="col-md-12">
                                    <input class="btn btn-primary" disabled="" type="submit" id="btnRegister" value="Edit" >
                                </div>
                            </form>
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
                                                        .innerHTML = "CapCha Matched";
                                                generate();
                                            } else {
                                                var s = document.getElementById("key")
                                                        .innerHTML = "CapCha Not Matched";
                                                generate();
                                            }
                                        }
        </script>
    </body>

</html>