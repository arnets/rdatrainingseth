<?php
	require '../Database_Handler/ActivitiesHandler.php';
	$activity = new ActivitiesHandler();
	if (isset($_POST["submit"])) {
		$code = $_POST["code"];
		$name = $_POST["name"];
		$descri = $_POST["description"];
		$activity->insert_Activity($code,$name,$descri);
	}
?>