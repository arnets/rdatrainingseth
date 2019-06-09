<?php
	require '../Database_Handler/ActivitiesHandler.php';
	$activity = new ActivitiesHandler();
	if (isset($_POST["submit"])) {
		$first = $_POST["left_column"];
		$second = $_POST["rigth_column"];
		$activity->insert_home_page($first,$second);
	}
?>