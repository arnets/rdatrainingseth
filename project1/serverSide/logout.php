<?php
    session_start();
    if(isset($_GET['signout'])){
        session_destroy();
        header("location: ../pages/Home.php");
    }
?>