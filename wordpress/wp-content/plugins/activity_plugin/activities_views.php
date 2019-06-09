<?php
	require '../wp-content/plugins/customized-plugins/Database_Handler/ActivitiesHandler.php';
	$activities = new ActivitiesHandler();
	$all_activities = $activities->get_Activity();
?>
<!DOCTYPE html>
<html>
<head>
	<title>Available Activities</title>
</head>
<body>
	<div class="container p-5">
		<table border="1" style="border-collapse: collapse;" class="border border-info table table-hover">
			<tr >
				<td colspan="4" class="align-middle">
					<form class="form-inline" method="GET" action="studentForm.php">
						<input class="form-control" type="text" name="qrStr" placeholder="Search name" required />
						<input class="form-control" type="submit" name="search" value="Search" class="bg-success">
					</form>
				</td>
			</tr>
			<tr class="bg-info">
				<th>Activity Code</th>
				<th>Activity Name</th>
				<th>Activity Description</th>
				<th>Actions</th>
			</tr>
			<?php
				foreach ($all_activities as $key) {
					echo '
					<tr>
						<td>' . $key["activity_code"] . '</td>
						<td>' . $key["activity_name"] . '</td>
						<td>' . $key["activity_description"] . '</td>
						<td>
							<a href="../wp-content/plugins/activity_plugin/activity_update.php?activity=' . $key["activity_code"] . '" >
								<button class="bg-success">Edit</button>
							</a>
							<a onclick="return redirect()" href="http://localhost/wordpress/wp-admin/?activity=' . $key["activity_code"] . '">
								<button class="bg-danger">Delete</button>
							</a>
						</td>
					</tr>

					';
				}
			?>
		</table>
	</div>
	<script type="text/javascript">
		function redirect() {
			var a = confirm("Do you want to delete this activity?");
			if (a == true) {
				return true;
			}
			else{
				return false;
			}
		}
	</script>
</body>
</html>