<!DOCTYPE html>
<html>
<head>
	<h3><title>Home</title></h3>
	<link rel="icon" type="images/jpeg" href="../images/pagesImages/icon.png">
	<link rel="stylesheet" type="text/css" href="../css/style.css">
	<link rel="stylesheet" type="text/css" href="../css/gfonts.css">
	<link href="../css/bootstrap4.css" rel="stylesheet">
	<script src="../js/jquery.js"></script>
	<script src="../js/bootstrap.js"></script>
</head>
		<?php
			require"header.php";
			$datas = $activities->get_home_page();
			foreach ($datas as $key) {}
		?>
		<div class="container-fluid" id="content">
			<div class="row" id="rows">
				<div class="col-lg-12">
					<div class="" style="height: 400px">
						<img src="../images/pagesImages/img1.jpg" style="width: 100%;height: 100%">
					</div>
				</div>
				
			</div>
			
			<div class="row mt-5" id="rows">
				<div class="col-lg-5">
					<div class="pageContent">
						<p><?php echo $key['first_column']; ?></p>
					</div>
				</div>
				<div class="col-lg-2">
				</div>
				<div class="col-lg-5">
					<div class="pageContent">
						<p><?php echo $key['second_column']; ?></p>
					</div>
				</div>
			</div>
		</div>
<?php
	require"footer.php";
?>