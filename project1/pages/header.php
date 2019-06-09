<?php
	require '../common/classes/ActivitiesHandler.php';
	$activities = new ActivitiesHandler();
	$datas = $activities->get_activity();
	$interest = $activities->get_interest();
?>
<!DOCTYPE html>
<html>
<head>
	<link rel="icon" type="images/jpeg" href="../images/pagesImages/icon.png">
	<link href="../css/bootstrap4.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="../css/style.css">
	<script src="../js/jquery.js"></script>
	<script src="../js/bootstrap.js"></script>
	<link rel="stylesheet" type="text/css" href="../css/bootstrap-formhelpers.css">
	<script>
		function getCountry(){
			var pay = document.getElementById('countries_states1');
			var displayCountry = pay.options[pay.selectedIndex].text;
			document.getElementById('country').value = displayCountry;
		}
		function getCity(){
			var ville = document.getElementById('cities');
			var displayCity = ville.options[ville.selectedIndex].text;
			document.getElementById('city').value = displayCity;
		}
		function showInterest(checked){
			if (checked == true) {
				$("#interestDiv").fadeIn();
			}
			else {
				$("#interestDiv").fadeOut();
			}
		}
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
	<div class="container-Fluid" id="bodyContent">
		<div class="header clearfix fixed-top">
			<div class="row sticky-top" id="menus">
				<div class="col-sm-2" id="project">
				<h3 class="text-muted text-center">Tact.com</h3>
				</div>
				<div class="col-sm-7 float-left" >
					<div class="container" id="menus">
						<nav class="navbar navbar-expand-md navbar-nav-light">
							<div class="container" id="dropdown">
								<ul class="navbar-nav">
									<li class="nav-item  text-center">
										<a href="Home.php" class="nav-link">Home</a>
									</li>
									<li class="nav-item dropdown">
										<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Activities</a>
										<div class="dropdown-menu">
											<?php
												foreach ($datas as $key) {
													echo "<a href=".$key['activity_name'].".php?act_code=".$key['activity_code'].""." class='dropdown-item'>".$key['activity_name']."</a>";
												}
											?>
										</div>
									</li>
									<li class="nav-item dropdown">
										<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Contact Us</a>
										<div class="dropdown-menu">
											<a href="#" class="dropdown-item">Address</a>
											<a href="#" class="dropdown-item" data-toggle="modal" data-target="#chatloginModal">Live Chat</a> 
										</div>
									</li>
									<li class="nav-item  text-center">
										<a href="about_us.php" class="nav-link">About Us</a>
									</li>
                                    <li class="nav-item dropdown">
                                        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Login</a>
                                        <div class="dropdown-menu" style="width:300px;">
                                            <form class="form" role="form" method="POST" action="../serverSide/login.php" accept-charset="UTF-8" id="login-nav">
                                                <div class="form-group">
                                                    <label class="sr-only" for="email">Email address</label>
                                                    <input type="email" class="form-control" name="email" placeholder="Email address" required>
                                                </div>
                                                <div class="form-group">
                                                    <label class="sr-only" for="password">Password</label>
                                                    <input type="password" class="form-control" name="password" placeholder="Password" required>
                                                    <div class="help-block text-right"><a href="">Forget the password ?</a></div>
                                                </div>
												<?php 
													if (@$_GET['invalid']==true) 
													{
												?>
													<div style="text-align: left; margin-bottom: 3px; margin-top: -5px; color: red;" ><?php echo $_GET['invalid']?></div>	
												<?php 
													}
												?>
                                                <div class="form-group">
                                                    <button type="submit" name="login" class="btn btn-primary btn-block">Sign in</button>
                                                </div>
                                            </form>
                                            <div class="bottom text-center">
                                            <button type="button" class="btn btn-primary btn-block" data-toggle="modal" data-target="#myModal" id="button">Register</button>
                                            </div>
                                        </div>
                                    </li>
								</ul>
							</div>
						</nav>
					</div>
				</div>
				<div class="col-sm-3" id="colum">
					<form class="form-inline my-3 my-sm-3 my-sm-3 bg">
						<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
						<button class="btn btn-outline-success my-2 my-sm-0" type="submit" id="search">Search</button>
					</form>			
				</div>
			</div>
		</div>
		<hr>

		<div class="modal fade" id="chatloginModal" role="dialog">
   			 <div class="modal-dialog">
      			<div class="modal-content">
        			<div class="modal-header">
         				<button type="button" class="close" data-dismiss="modal">&times;</button>
          				<h6 class="modal-title">Sign in Form</h6>
        			</div>
        			<div class="modal-body">
						<form role="form" method="POST" action="../serverSide/chat_login.php">
							 <div class="form-group">
                                 <label class="sr-only" for="email">Email address</label>
                                 <input type="email" class="form-control" name="email" placeholder="Email address" required>
                             </div>
                            <div class="form-group">
                                <label class="sr-only" for="password">Password</label>
                                <input type="password" class="form-control" name="password" placeholder="Password" required>
                            <div class="help-block text-right"><a href="">Forget the password ?</a></div>
                            </div>
							<?php 
								if (@$_GET['invalid']==true) 
									{
							?>
							<div style="text-align: left; margin-bottom: 3px; margin-top: -5px; color: red;" ><?php echo $_GET['invalid']?>
							</div>	
							<?php 
								}
							?>
                            <div class="form-group">
                                <button type="submit" name="login" class="btn btn-primary btn-block">Sign in</button>
                            </div>
						</form>
        			</div>
        			<div class="modal-footer">
         				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        			</div>
      			</div>
  			 </div>
 		 </div>

		<div class="modal fade" id="myModal" role="dialog">
   			 <div class="modal-dialog">
      			<div class="modal-content">
        			<div class="modal-header">
         				<button type="button" class="close" data-dismiss="modal">&times;</button>
          				<h6 class="modal-title">Registration Form</h6>
        			</div>
        			<div class="modal-body">
						<form role="form" method="POST" action="../serverSide/user_registration.php" enctype="multipart/form-data">
							<div class="form-group">
								<label for="firstname">First Name:</label>
								<input type="text" class="form-control" name="firstName" placeholder="Enter First Name" required>
							</div>
							<div class="form-group">
								<label for="lastname">Surname:</label>
								<input type="text" class="form-control" name="lastName" placeholder="Enter Last Name" required>
							</div>
							<div class="form-group">
								<label for="email">Email:</label>
								<input type="email" class="form-control" name="email" placeholder="Enter Email" required>
							</div>
							<div class="form-group">
								<label for="phone">Phone:</label>
								<input type="text" class="form-control" name="phone" placeholder="Enter Phone Number" required>
							</div>
							<div class="form-group">
								<label for="gender">Gender:</label>
								<select name="gender" class="form-control" required>
									<option>Select Gender</option>
									<option value="male">Male</option>
									<option value="female">Female</option>
								</select>
							</div>
							<div class="form-group">
								<label for="paasword">Password:</label>
								<input type="password" class="form-control" name="password" placeholder="Enter Password" required>
							</div>
							<div class="form-group">
								<label for="country">Country</label>
								<select id="countries_states1" data-name="country" class="form-control input-medium bfh-countries" onchange="getCountry();" style="color: teal" required></select>
								<input type="hidden" name="country" id="country">
								<label for="city">City:</label>
								<select id="cities" class=" form-control input-medium bfh-states" data-country="countries_states1" onchange="getCity();" style="color: teal" required></select>
								<input type="hidden" name="city" id="city">
							</div>
							<div class="form-group">
								<label for="profile_image">Upload Your Image</label>
								<img src="" class="form-control" style="display: none;height: 250px;" id="user_image">
								<input type="file" class="form-control" name="image_upload" onchange="displayImage.call(this)">
							</div>
							<div class="checkbox">
								<label for="activity"><u>Choose Your Favorite Activity</u></label><br>
								<?php
									foreach ($datas as $key) {
										echo"<input type='checkbox' onchange="."showInterest(this.checked)"." name=".$key['activity_name']." value=".$key['activity_code']." >"." ".$key['activity_name'];
										echo "<br>";
									}
								?>
							</div>
							<div class="checkbox" id="interestDiv" style="display: none;">
								<label for="interest"><u>Choose Your Favourite Interest</u></label><br></b>
								<?php
									foreach ($interest as $key ) {
										echo "<input type='checkbox' name=".$key['interest_name']." value=".$key['interest_name'].">"." ".$key['interest_name'];
										echo "<br>";
									}
								?>
							</div>
							<br>
							<button type="submit" name="submit" class="btn btn-default bg-success">Register</button>
						</form>
        			</div>
        			<div class="modal-footer">
         				<button type="button" class="btn btn-default bg-danger" data-dismiss="modal">Close</button>
        			</div>
      			</div>
  			 </div>
 		 </div>
 	</div>
 	<script type="text/javascript" src="../js/bootstrap-formhelpers.min.js"></script>
 	<script type="text/javascript" src="../js/bootstrap-formhelpers-countries.js"></script>
 	<script type="text/javascript" src="../js/bootstrap-formhelpers-states.js"></script>
 </body>
 </html>

		