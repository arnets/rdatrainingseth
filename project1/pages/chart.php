<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>tact.com chart</title>
  <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="../vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
  <link href="../css/admin.css" rel="stylesheet">
  <script src="../js/jquery.js"></script>
</head>
<body id="page-top">
  <div id="wrapper">
    <div id="content-wrapper">
      <div class="container-fluid">
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
          </li>
          <li class="breadcrumb-item active">Charts</li>
        </ol>
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-chart-area"></i>
            Area Chart
          </div>
          <div class="card-body">
            <canvas id="myAreaChart" width="100%" height="35"></canvas>
          </div>
        </div>
        <div class="row">
            <div class="col-lg-8">
              <div class="card mb-3">
                <div class="card-header">
                  <i class="fas fa-chart-bar"></i>
                  Bar Chart </div>
                <div class="card-body">
                  <canvas id="myBarChart" width="100%" height="50"></canvas>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="card mb-3">
                <div class="card-header">
                  <i class="fas fa-chart-pie"></i>
                  Pie Chart
                </div>
                <div class="card-body">
                  <canvas id="myPieChart" width="100%" height="100"></canvas>
                </div>
              </div>
            </div>
        </div>
      </div>
      <footer class="sticky-footer">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright © tact.com 2019</span>
          </div>
        </div>
      </footer>
    </div>
  </div>
    <script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="../vendor/chart.js/Chart.min.js"></script>
    <script src="../js/sb-admin.min.js"></script>
    <script src="../js/demo/chart-area-demo.js"></script>
    <script src="../js/demo/chart-bar-demo.js"></script>
    <script src="../js/demo/chart-pie-demo.js"></script>

  </body>

</html>
