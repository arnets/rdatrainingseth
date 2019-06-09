<?php
	require 'ConnectionHandler.php';
	class ActivitiesHandler extends ConnectionHandler
	{
		private $statement;
		public function insert_Activity($code,$name,$description)
		{
			$sql = "CALL insert_activity('$code','$name','$description')";
			$this->statement = $this->connection->prepare($sql);
			if ($this->statement->execute()) {
				header("Location: ../pages/activity_upload.php");
			}
		}
		public function get_Activity()
		{
			$sql = "CALL get_all_activities()";
			$this->statement = $this->connection->prepare($sql);
			$this->statement->execute();
			return $this->statement->fetchall(PDO::FETCH_ASSOC);
		}
		public function insert_interest($name,$act_code,$descrip){
			$sql = "CALL insert_activity_interests('$name','$act_code','$descrip')";
			$this->statement = $this->connection->prepare($sql);
			if ($this->statement->execute()) {
				header("Location: ../pages/interest_upload.php");
			}
		}
		public function get_interest(){
			$sql = "CALL get_all_interests()";
			$this->statement = $this->connection->prepare($sql);
			$this->statement->execute();
			return $this->statement->fetchall(PDO::FETCH_ASSOC);
		}
		public function page_data($code){
			$sql = "CALL get_pages_data('$code')";
			$this->statement = $this->connection->prepare($sql);
			$this->statement->execute();
			return $this->statement->fetchall(PDO::FETCH_ASSOC);
		}
		public function get_users(){
            $sql = "CALL get_tact_users()";
            $this->statement = $this->connection->prepare($sql);
            $this->statement->execute();
            return $this->statement->fetchall(PDO::FETCH_ASSOC);
        }
        public function insert_update($userid,$activity,$city,$latitude,$longitude,$interest,$target_path){
            $sql = "CALL insert_activity_location('$userid','$activity','$longitude','$latitude','$city','$interest')";
            $this->statement = $this->connection->prepare($sql);
            $this->statement->execute();
            $sql1 = "CALL update_user_interest('$userid','$target_path','$interest')";
            $this->statement = $this->connection->prepare($sql1);
            if ($this->statement->execute()) {
            	header("Location: ../pages/add_interest_image.php");
            }

        }
        public function get_search_details($id,$interest,$pass){
        	$sql = "CALL get_more_details('$id','$interest','$pass')";
        	$this->statement = $this->connection->prepare($sql);
        	$this->statement->execute();
        	return $this->statement->fetch(PDO::FETCH_ASSOC) ;
        }
        public function get_About(){
        	$sql = "CALL get_about_us()";
        	$this->statement = $this->connection->prepare($sql);
        	$this->statement->execute();
        	return $this->statement->fetchall(PDO::FETCH_ASSOC) ;
        }
        public function get_home_page(){
        	$sql = "CALL get_home_page_data()";
        	$this->statement = $this->connection->prepare($sql);
        	$this->statement->execute();
        	return $this->statement->fetchall(PDO::FETCH_ASSOC) ;
        }
	}
?>