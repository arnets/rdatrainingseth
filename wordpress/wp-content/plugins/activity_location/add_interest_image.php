<?php
	require '../wp-content/plugins/customized-plugins/Database_Handler/ActivitiesHandler.php';
	$details = new ActivitiesHandler();
	$data = $details->get_users();
	$activity = $details->get_interest();
?>
<!DOCTYPE html>
<html>
<head>
	<title>Update user interest</title>
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.3.1/dist/leaflet.css" />
	<script src="https://unpkg.com/leaflet@1.3.1/dist/leaflet.js"></script>
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
	<div class="container mt-5">
			<div class="row">
				<div class="col-sm-5" style="margin: auto;">
					<form  method="POST" action="../wp-content/plugins/customized-plugins/serverSide/insert_activity_location.php" class="form-horizontal" style="margin: auto;" enctype="multipart/form-data">
						<div class="form-group">
							<select name="user" class="form-control">
								<option disabled selected class="form-control">Select user first name</option>
								<?php
									
									foreach ($data as $key) {
										echo "<option value=".$key['user_id'].">";
										echo $key['first_name'];
										echo"</option>";
									}
								?>
							</select>
						</div>
						<div class="form-group">
		      				<select name="user" class="form-control">
								<option disabled selected class="form-control">Select user last name</option>
								<?php
									
									foreach ($data as $key) {
										echo "<option value=".$key['user_id'].">";
										echo $key['surname'];
										echo"</option>";
									}
								?>
							</select>
						</div>
						<div class="form-group">
		      				<select name="activity" class="form-control">
								<option disabled selected class="form-control">Select activity</option>
								<?php
									
									foreach ($activity as $key) {
										if ($key['activity_code'] == "immo") {
											echo "<option value=".$key['interest_name'].">";
												echo $key['interest_name'];
											echo"</option>";
										}
									}
								?>
							</select>
						</div>
						<div class="form-group">
		      				Change Your Profile Image: <input type="file" class="form-control" name="interest_image" onchange="displayImage.call(this)">
						</div>
						<div class="form-group">
		      				<input type="text" class="form-control" id="city" name="city" placeholder="Enter activity location">
						</div>
						<div class="form-group">
		      				Latitude: <input type="text" class="form-control" readonly id="latitude" name="latitude">
						</div>
						<div class="form-group">
		      				Longitude: <input type="text" class="form-control" readonly id="longitude" name="longitude">
						</div>
						<input type="button" name="Search" onclick="addr_search()" value="Get Coordinates" class="btn btn-primary">
						<br><br>
						<input type="submit" name="Update" value="Update" class="btn btn-success">
					</form>
				</div>
				<div class="col-sm-3">
						<img src="" id="user_image" width="100%" height="200" alt="Upload the image/picture for the activity...">
				</div>
			</div>		
	</div>
	<script type="text/javascript">

function chooseAddr(lat1, lng1)
{
 lat2 = lat1;
 lon2 = lng1;
 document.getElementById('latitude').value = lat2;
 document.getElementById('longitude').value = lon2;
}

function myFunction(arr)
{
 var out = "<br />";
 var i;

 if(arr.length > 0)
 {
  for(i = 0; i < arr.length; i++)
  {
   chooseAddr(arr[i].lat,arr[i].lon);
  }
  document.getElementById('results').innerHTML = out;
 }

}

function addr_search()
{
	var inp = document.getElementById("city");
 if (inp.value != "") {
	 var xmlhttp = new XMLHttpRequest();
	 var url = "https://nominatim.openstreetmap.org/search?format=json&limit=1&q=" + inp.value;
	 xmlhttp.onreadystatechange = function()
	 {
	   if (this.readyState == 4 && this.status == 200)
	   {
	    var myArr = JSON.parse(this.responseText);
	    myFunction(myArr);
	   }
	 };
	 xmlhttp.open("GET", url, true);
	 xmlhttp.send();
 }
 else{
 	alert("activity location is missing");
 }
}

</script>
</body>
</html>