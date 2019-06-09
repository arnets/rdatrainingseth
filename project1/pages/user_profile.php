<?php
	session_start();
	$id = $_SESSION['userid'];
	require '../common/classes/ProfileHandler.php';
	$details = new ProfileHandler();
	$data = $details->get_user_pfrofiles($id);
	foreach ($data as $key) {
		
	}
?>
<!DOCTYPE html>
<html>
<head>
	<title>User_Profile</title>
	<link rel="stylesheet" type="text/css" href="../css/bootstrap4.css">
    <script type="text/javascript" src="../js/jquery.js"></script>
    <script type="text/javascript" src="../js/bootstrap.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap-formhelpers.css">
    <script type="text/javascript">
	function displayImage(){
		if (this.files && this.files[0]) {
			var image_to_upload = new FileReader();
			image_to_upload.onload = function(data){
				var profile_image = document.getElementById('user_image');
				profile_image.src = data.target.result;
				profile_image.style.display = "block";
			}
			image_to_upload.readAsDataURL(this.files[0]);
		}
	}
</script>
</head>
<body>
	<div class="container">
			<div class="row">
				<div class="col-sm-5">
					<form  method="POST" action="../serverSide/update_profile.php" class="form-horizontal" style="margin: auto;" enctype="multipart/form-data">
						<div class="form-group">
							FirstName: <input type="text" class="form-control" name="fname" value="<?php echo $key['first_name'] ?>">
						</div>
						<div class="form-group">
							LastName: <input type="text" name="lname" class="form-control" value="<?php echo $key['surname'] ?>">
						</div>

						<div class="form-group">
		      				Email: <input type="email" class="form-control" name="email" value="<?php echo $key['email'] ?>">
						</div>

						<div class="form-group">
		      				Phone Number: <input type="text" class="form-control" name="phone" value="<?php echo $key['phone_number'] ?>">
						</div>

						<div class="form-group">
		      				Country: <input type="text" class="form-control" name="country" readonly value="<?php echo $key['country_of_origin'] ?>">
						</div>

						<div class="form-group">
		      				City: <input type="text" class="form-control" name="city" readonly value="<?php echo $key['city_of_origin'] ?>">
						</div>
						<div class="form-group">
		      				Change Your Profile Image: <input type="file" class="form-control" name="image_update" onchange="displayImage.call(this)">
						</div>
						<input type="submit" name="Update" value="Update" class="btn btn-success">
					</form>
				</div>
				<div class="col-sm-3">
						<img src="<?php echo $key['profile_image'] ?>" id="user_image" width="100%" height="200" alt="You don't have any picture!! Upload one...">
				</div>
			</div>		
	</div>
</body>
</html>