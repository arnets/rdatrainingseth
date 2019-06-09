<?php
  session_start();
  if (!isset($_SESSION['username']) or !isset($_SESSION['userid']) or !isset($_SESSION['image'])) {
    header("location: Home.php");
  }
  require '../common/classes/ProfileHandler.php';
  $user_activities = new ProfileHandler();
  $activities = $user_activities->get_distinct_user_activities($_SESSION['userid']);
  $interests = $user_activities->get_user_activities($_SESSION['userid']);
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Profile Dashboard</title>
  <link rel="icon" type="images/jpeg" href="../images/pagesImages/icon.png">
  <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="../css/admin.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="../css/bootstrap4.css">
  <script src="../js/jquery.js"></script>
</head>
<body id="page-top">
  <nav class="navbar navbar-expand bg-dark navbar-dark fixed-top">
    <a class="navbar-brand mr-1" href="about_us.php">tact.com</a>
    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
      <i class="fas fa-bars"></i>
    </button>
    <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-5 my-2 my-md-0">
      <div class="input-group">
        <input type="text" class="form-control" placeholder="Search" aria-label="Search" aria-describedby="basic-addon2">
        <div class="input-group-append">
          <button class="btn btn-primary" type="button">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </div>
    </form>
    <ul class="navbar-nav ml-auto ml-md-0">
      <li class="nav-item dropdown no-arrow">
        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <img src="<?php echo $_SESSION['image'] ?>" class="float-right rounded-circle" style="width: 50px;height: 50px;">
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
          <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">Logout </a>
          <a href="#" class="dropdown-item" id="profile">View Profile</a>
        </div>
      </li>
    </ul>
  </nav>
  <br>
  <div id="wrapper" class="mt-5">
    <ul class="sidebar navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="#" id="dashboard">
          <i class="fas fa-fw fa-tachometer-alt"></i>Dashboard
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#" id="chat">
          <i class="fas fa-envelope"></i>
          <span>Boite de reception</span>
        </a>
      </li>
      <?php
        foreach ($activities as $key) {
          echo "<li data-toggle='collapse' data-target='#products' class='nav-item dropdown'>";
            echo "<a class='nav-link dropdown-toggle' href='#' id='immobilier'> <i class='fas fa-igloo'></i>"." ".$key['activity_name']."</a>";
          echo "</li>";
        }
      ?>
      <?php 
        foreach ($interests as $key) {
          if ($key['activity_name'] == "immobilier") {
            echo "<ul class='sub-menu collapse' id='products' style='height: 0px;'>";
              echo "<li><a class='nav-link' style='color: white;' href='#' id=".$key['interest_name'].">".$key['interest_name']."</a></li>";
            echo "</ul>";
          }
        }
      ?>
      <li class="nav-item">
        <a class="nav-link" href="profile.php">
          <i class="fas fa-arrow-left"></i>
          <span>Back</span></a>
      </li>
    </ul>

    <div id="content-wrapper">
      <div class="container-fluid" id="contents">

      </div>
      <footer class="sticky-footer">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span><a href="http://localhost/WorkWeb/project1/pages/Home.php" target="_blank">Home</a></span> | <span>Copyright © tact.com Webmaster 2019</span>
          </div>
        </div>
      </footer>

    </div>

  </div>
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-danger" href="../serverSide/logout.php?signout">Logout</a>
        </div>
      </div>
    </div>
  </div>

  <script >
    $('#dashboard').on('click',function(){
      $('#contents').load("http://localhost/WorkWeb/project1/pages/chart.php");
     });
  </script>
  <script >
    $('#batiment').on('click',function(){
      $('#contents').load("http://localhost/WorkWeb/project1/pages/batiments.php");
     });
  </script>
  <script >
    $('#infrastructure').on('click',function(){
      $('#contents').load("http://localhost/WorkWeb/project1/pages/infrastructure.php");
     });
  </script>
  <script >
    $('#terrains').on('click',function(){
      $('#contents').load("http://localhost/WorkWeb/project1/pages/terrain.php");
     });
  </script>
  <script >
    $('#profile').on('click',function(){
      $('#contents').load("http://localhost/WorkWeb/project1/pages/user_profile.php");
     });
  </script>
  
  <script src="../js/jquery.js"></script>
  <script src="../js/bootstrap.js"></script>

  <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

  <script src="../vendor/chart.js/Chart.min.js"></script>
  <script src="../vendor/datatables/jquery.dataTables.js"></script>
  <script src="../vendor/datatables/dataTables.bootstrap4.js"></script>

  <script src="../js/sb-admin.min.js"></script>

  <script src="../js/demo/datatables-demo.js"></script>
  <script src="../js/demo/chart-area-demo.js"></script>

</body>
</html>