<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html class="no-js" lang="en">
  <head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>Index - Yummy Bootstrap Template</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Fonts -->
  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Inter:wght@100;200;300;400;500;600;700;800;900&family=Amatic+SC:wght@400;700&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Main CSS File -->
  <link href="assets/css/main.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Yummy
  * Template URL: https://bootstrapmade.com/yummy-bootstrap-restaurant-website-template/
  * Updated: Jun 14 2024 with Bootstrap v5.3.3
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

    <body class="biolife-body">

        <jsp:include page="header.jsp"/>


        <div class="page-contain login-page">

            <!-- Main content -->
            <div id="main-content" class="main-content">
                <div class="container">

                    <div class="row">

                        <div class="col-12">
                            <h3 class="box-title" style="display: inline;">Your Account Profile</h3><br>
                         
                            <form method="post" action="Profile">
                                <div  class="col-md-6">
                                    <label class="" >Name</label><input class="form-control" type="text" value="${sessionScope['account'].getName()}" name="name">
                                </div>
                                <div  class="col-md-6">
                                    <label class="" >Phone</label><input class="form-control" type="text" value="${sessionScope['account'].getPhone()}" name="phone">
                                </div>
                                <div  class="col-md-6">
                                    <label class="" >Email</label><input class="form-control" type="text" value="${sessionScope['account'].getEmail()}" name="email">
                                </div>
                                <div  class="col-md-6">
                                    <label class="" >Password</label><input class="form-control" type="password" value="${sessionScope['account'].getPassword()}" name="pass">
                                </div>
                                <div  class="col-md-6">
                                    <label class="" >Gender</label><br>
                                    <input type="radio" name="gender" value="1"  ${sessionScope['account'].getGender()?"Checked":""}> Male  
                                    <input type="radio" name="gender" value="0"  ${!sessionScope['account'].getGender()?"Checked":""}> Female
                                </div>
                                <div  class="col-md-12">
                                    <label class="" >Address</label><input class="form-control" type="text" value="${sessionScope['account'].getAddress()}" name="address">
                                </div>
                                <div  class="col-md-12" style="padding: 2px;">           
                                    <input value="${sessionScope['account'].getId()}" name="id" type="hidden">
                                </div>
                                <div  class="col-md-12" style="padding: 2px;">           
                                    <p style="color: green;">${mess}</p>
                                </div>
                                <div  class="col-md-12">
                                    <input class="btn btn-primary" type="submit" value="Edit" >
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
    </body>

</html>