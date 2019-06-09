<?php
	require '../Database_Handler/ActivitiesHandler.php';
	$interest = new ActivitiesHandler();
	if (isset($_POST["submit"])) {
		$code = $_POST["activity_code"];
		$name = $_POST["name"];
		$descri = $_POST["description"];
		$interest->insert_interest($name,$code,$descri);
	}
?>