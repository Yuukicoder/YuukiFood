<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">

    <style>
        body {
            background-color: #f4f6f9;
        }
        .card-box {
            padding: 20px;
            border-radius: 10px;
            color: white;
            margin-bottom: 20px;
        }
        .card-box h3 {
            margin: 0;
            font-size: 28px;
        }
        .card-box p {
            margin: 0;
            font-size: 16px;
        }
        .bg-blue { background: #4e73df; }
        .bg-green { background: #1cc88a; }
        .bg-orange { background: #f6c23e; }
        .bg-red { background: #e74a3b; }
        .chart-container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            margin-top: 20px;
        }
    </style>
</head>

<body>

<nav class="navbar navbar-default">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="AdminHomePage">Yummy Admin</a>
        </div>
        <ul class="nav navbar-nav">
            <li><a href="Dashboard">Dashboard</a></li>
            <li><a href="ManagerUser">Manage User</a></li>
            <li><a href="ManagerProduct">Manage Product</a></li>
            <li><a href="ManagerOrder">Manage Order</a></li>
            <li><a href="Statistics">Statistic</a></li>
            <li><a href="CategoryManager">Manage Category</a></li>
        </ul>
    </div>
</nav>

<div class="container">

    <h2>📊 Admin Dashboard</h2>
    <hr>

    <!-- STATISTIC CARDS -->
    <div class="row">

        <div class="col-md-3">
            <div class="card-box bg-blue text-center">
                <i class="fa fa-cube fa-2x"></i>
                <h3>${nump}</h3>
                <p>Total Products</p>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card-box bg-green text-center">
                <i class="fa fa-shopping-cart fa-2x"></i>
                <h3>${numo}</h3>
                <p>Total Orders</p>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card-box bg-orange text-center">
                <i class="fa fa-users fa-2x"></i>
                <h3>${numu}</h3>
                <p>Total Customers</p>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card-box bg-red text-center">
                <i class="fa fa-dollar fa-2x"></i>
                <h3>${profit} $</h3>
                <p>Total Profit</p>
            </div>
        </div>

    </div>

    <!-- BAR CHART -->
    <div class="chart-container">
        <h4>System Overview (Bar Chart)</h4>
        <canvas id="barChart"></canvas>
    </div>

    <!-- PIE CHART -->
    <div class="chart-container">
        <h4>System Overview (Pie Chart)</h4>
        <canvas id="pieChart"></canvas>
    </div>

</div>

<!-- JS -->
<script src="assets/js/jquery-3.4.1.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>

<!-- Chart.js CDN -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
    const labels = ['Products', 'Orders', 'Customers', 'Profit'];

    const dataValues = [
        ${nump},
        ${numo},
        ${numu},
        ${profit}
    ];

    // BAR CHART
    new Chart(document.getElementById('barChart'), {
        type: 'bar',
        data: {
            labels: labels,
            datasets: [{
                label: 'Statistics',
                data: dataValues,
                backgroundColor: [
                    '#4e73df',
                    '#1cc88a',
                    '#f6c23e',
                    '#e74a3b'
                ]
            }]
        },
        options: {
            responsive: true,
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });

    // PIE CHART
    new Chart(document.getElementById('pieChart'), {
        type: 'pie',
        data: {
            labels: labels,
            datasets: [{
                data: dataValues,
                backgroundColor: [
                    '#4e73df',
                    '#1cc88a',
                    '#f6c23e',
                    '#e74a3b'
                ]
            }]
        }
    });
</script>

</body>
</html>