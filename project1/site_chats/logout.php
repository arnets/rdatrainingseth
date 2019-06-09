<?php
session_start();
require '../common/classes/DatabaseHandler.php';
$chat = new Operations();
$chat->updateUserOnline($_SESSION['userid'], 0);
$_SESSION['username'] = "";
$_SESSION['userid']  = "";
$_SESSION['login_details_id']= "";
header("Location:../pages/Home.php");
?>






