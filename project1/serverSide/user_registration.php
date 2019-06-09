<?php
    require"../common/classes/ProfileHandler.php";
    $InsertUser = new ProfileHandler();
    if(isset($_POST['submit'])){
    	$target_path = "../images/userImages/";
    	$extens = pathinfo($_FILES['image_upload']['name'],PATHINFO_EXTENSION);
    	$new_name = rand().".".$extens;
    	$target_path = $target_path . $new_name;
    	if (move_uploaded_file($_FILES['image_upload']['tmp_name'], $target_path)) {
    		$InsertUser->register($_POST['firstName'],$_POST['lastName'],$_POST['email'],$_POST['phone'],$_POST['gender'],md5($_POST['password']),$_POST['country'],$_POST['city'],$target_path,$_POST['batiment']);	
    	}
      }
?>
