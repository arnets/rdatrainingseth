<?php
	require '../Database_Handler/ActivitiesHandler.php';
	$activity = new ActivitiesHandler();
	if (isset($_POST["submit"])) {
		$mission = $_POST["mission"];
		$information = $_POST["information"];
		$activity->insert_about($mission,$information);
	}
?>