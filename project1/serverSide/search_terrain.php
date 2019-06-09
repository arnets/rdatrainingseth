<?php
session_start();
$interest = "terrain_domain";
$userid = $_SESSION['userid'];
require '../common/classes/ActivitiesHandler.php';
if(isset($_POST['name'])){
    $pass = $_POST['name'];
	$data = new ActivitiesHandler();
	$row = $data->get_search_details($userid,$interest,$pass);
	echo json_encode($row);
}
