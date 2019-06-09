<?php
	require 'ConnectionHandler.php';
	class ProfileHandler extends ConnectionHandler{
	       private $statement;
               public function register($firstname,$lastname,$email,$phone,$gender,$password,$country,$city,$image,$interest){
                        $sql = "CALL register_user('$firstname','$lastname','$email','$phone','$gender','$password','$country','$city','$image','$interest')";
                        $this->statement = $this->connection->prepare($sql);
                        if ($this->statement->execute()) {
                                header("Location: ../pages/profile.php");
                        }
                }
                public function user_login($user_email,$user_password){
                    $sql = "SELECT * FROM tb_tact_users WHERE email = :gmai AND pass_word = :pwd";
                    $this->statement = $this->connection->prepare($sql);
                    $this->statement->bindParam(':gmai',$user_email);
                    $this->statement->bindParam(':pwd',$user_password);
                    if ($this->statement->execute()){
                       return $this->statement->fetch(PDO::FETCH_ASSOC);
                    }
                    
                }
                public function get_user_pfrofiles($user_id){
                        $sql = "CALL get_user_details('$user_id')";
                        $this->statement = $this->connection->prepare($sql);
                        if ($this->statement->execute()) {
                                return $this->statement->fetchall(PDO::FETCH_ASSOC);
                        }
                }
                public function update_user_profile($id,$fname,$lname,$gmail,$phone){
                        $sql = "CALL update_user_profile('$id','$fname','$lname','$gmail','$phone')";
                        $this->statement = $this->connection->prepare($sql);
                        if ($this->statement->execute()) {
                                header("Location: ../pages/profile.php");
                        }
                }
                public function get_user_activities($id){
                    $sql = "CALL get_user_activities('$id')";
                    $this->statement = $this->connection->prepare($sql);
                    if ($this->statement->execute()) {
                         return $this->statement->fetchall(PDO::FETCH_ASSOC);
                    }
                }
                public function get_distinct_user_activities($id){
                    $sql = "CALL get_user_distinct_activity('$id')";
                    $this->statement = $this->connection->prepare($sql);
                    if ($this->statement->execute()) {
                         return $this->statement->fetchall(PDO::FETCH_ASSOC);
                    }
                }
                

	       }
?>
