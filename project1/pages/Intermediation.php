<!DOCTYPE html>
<html>
<head>
	<h3><title>Ingenieurie | Informatique</title></h3>
	<link rel="icon" type="images/jpeg" href="../images/pagesImages/icon.png">
	<link rel="stylesheet" type="text/css" href="../css/style.css">
	<link rel="stylesheet" type="text/css" href="../css/gfonts.css">
	<link href="../css/bootstrap4.css" rel="stylesheet">
	<script src="../js/jquery.js"></script>
	<script src="../js/bootstrap.js"></script>
	<script type="text/javascript">
		function shows(e) {
			e = e || window.event;
			e = e.target || e.srcElement;
				$("#"+e.id+"yu").fadeIn();
		}
	</script>
</head>
		<?php
			require"header.php";
			$activities = new ActivitiesHandler();
			$datas = $activities->page_data($_GET['act_code']);
			foreach ($datas as $key) {
		
			}
		?>
		<div class="container-fluid" id="content">
			<div class="row" id="rows">
				<div class="col-lg-12">
					<div class="" style="height: 400px">
						<img src="../images/pagesImages/img6.jpg" style="width: 100%;height: 100%">
					</div>
				</div>
				
			</div>
			
			<div class="row" id="rows">
				<div class="col-sm-5">
					<div class="pageContent mt-4">
						<div class=" container ml-0">
							<h5 class="d-inline p-2 text-black"><u>Activity: <?php echo $key['activity_name']; ?></u></h5>
						</div>
						<div class="container ml-2 mt-4">
							<p class="d-inline p-2 bg-primary text-white"><u>Description:</u></p> <?php echo $key['activity_description']; ?>
						</div>
						<div class="container ml-2 mt-4">
							<p class="p-2  text-cyan"><u>Activities Interest:</u></p>
							<?php
								foreach ($datas as $key) {
									echo "<a href='#' id=".$key['interest_name']." onclick='shows.call(this.id)' class='m-2 text-dark btn '>".$key['interest_name']."</a>";
									echo "<br>";
								}
							?>
						</div>
					</div>
				</div>
				<div class="col-sm-2">
					
				</div>
				<div class="col-sm-5 fix-right">
					<div class="pageContent">
							<?php
								foreach ($datas as $key) {
									echo "<div id=".$key['interest_name']."yu"." style='display:none'  class='container ml-0 mt-5'>";
										echo "<h5 class='btn d-inline p-2 text-black'><u>Interest:". $key['interest_name']."</u></h5>";
										echo "<br>";	
										echo "<div class='container ml-2 mt-4'>";
											echo "<p class='d-inline p-2 bg-primary text-white'><u>Description: </u></p>".$key['interest_description'];
										echo "</div>";		
									echo "</div>";
								}
							?>
					</div>
				</div>
			</div>
		</div>
		<hr>
<?php
	require"footer.php";
?>