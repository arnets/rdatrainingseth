<?php
	require '../Database_Handler/ActivitiesHandler.php';
	$interest = new ActivitiesHandler();
	if (isset($_POST["update"])) {
		$activity= $_POST["activity_code"];
		$name = $_POST["name"];
		$descri = $_POST["description"];
		$interest->update_interest($name,$activity,$descri);
	}
?>