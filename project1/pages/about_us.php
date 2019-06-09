<!DOCTYPE html>
<html>
<head>
	<title>About Us</title>
	<link rel="icon" type="image/png" href="../images/pagesImages/icon.png">
	<link href="../css/bootstrap4.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="../css/style.css">
	<script src="../js/jquery.js"></script>
	<script src="../js/bootstrap.js"></script>
	<link rel="stylesheet" type="text/css" href="../css/bootstrap-formhelpers.css">
</head>
<body>
	<?php 
		require 'header.php'; 
		$datas = $activities->get_About();
		foreach ($datas as $key) {
		
		}
	?>

	<div class="container mt-5 mb-2">
		<div class="col-sm-5" style="margin: auto;">
			<img src="../images/pagesImages/about.png" style="width: 100%" >
		</div>
		<div class="card">
			<div class="card-body">
				<h4 class="h4"><center>-Our Mission-</center></h4>
				<p><center><?php echo $key['mission']; ?></center></p>
				<h4 class="h4"><center>-About tact-</center></h4>
				<p><?php echo $key['details']; ?></p>
			</div>
		</div>
	</div>
	<?php require 'footer.php'; ?>
</body>
</html>