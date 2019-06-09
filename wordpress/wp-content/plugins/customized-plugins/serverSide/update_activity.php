<?php
	require '../Database_Handler/ActivitiesHandler.php';
	$activity = new ActivitiesHandler();
	if (isset($_POST["update"])) {
		$code = $_POST["code"];
		$name = $_POST["name"];
		$descri = $_POST["description"];
		$activity->update_activtity($code,$name,$descri);
	}
?>