<?php
	require '../Database_Handler/ActivitiesHandler.php';
	$activities = new ActivitiesHandler();
	if (isset($_POST["Update"])) {
		$userid = $_POST["user"];
		$activity = "immo";
		$city = $_POST["city"];
		$latitude = $_POST["latitude"];
		$longitude = $_POST["longitude"];
		$interest = $_POST["activity"];
		if ($interest =="batiment") {
			$target_move_path = "E:/xampp/htdocs/WorkWeb/project1/images/batiments/";
			$target_upload_path = "../images/batiments/";
		}
		elseif ($interest =="infrastructure") {
			$target_move_path = "E:/xampp/htdocs/WorkWeb/project1/images/infrastructure/";
			$target_upload_path = "../images/infrastructure/";
		}
		elseif ($interest =="terrain_domain") {
			$target_move_path = "E:/xampp/htdocs/WorkWeb/project1/images/terrain_domain/";
			$target_upload_path = "../images/terrain_domain/";
		}
		$extens = pathinfo($_FILES['interest_image']['name'],PATHINFO_EXTENSION);
		$new_name = rand().".".$extens;
    	$target_move_path = $target_move_path . $new_name;
    	$target_upload_path = $target_upload_path. $new_name;
    	if (move_uploaded_file($_FILES['interest_image']['tmp_name'], $target_move_path)) {
    		
    		$activities->insert_update($userid,$activity,$city,$latitude,$longitude,$interest,$target_upload_path);	
    	}
	}
?>