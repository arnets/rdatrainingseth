<?php
    session_start();
    require"../common/classes/ProfileHandler.php";
    $login = new ProfileHandler();
    if(isset($_POST['login'])){
        $email = $_POST['email'];
        $password = md5($_POST['password']);
        $details = $login->user_login($email,$password);
        if($details['email'] == $email AND $details['pass_word']==$password){
            $_SESSION['userid'] = $details['user_id'];
            $_SESSION['username'] = $details['surname'];
            // $login->updateUserOnline($record['userID'], 1);
            header("location: ../site_chats/index.php");
        }
        else{
            header("location: ../pages/Home.php? invalid= Incorrect User Or Password");
        }
    }
?>