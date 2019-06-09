<?php
	require '../wp-content/plugins/customized-plugins/Database_Handler/ActivitiesHandler.php';
	$interests = new ActivitiesHandler();
	$all_interests = $interests->get_interest_with_activity();
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
				<td colspan="4" align="center">
					<form class="form-inline" method="GET" action="studentForm.php">
						<input class="form-control" type="text" name="qrStr" placeholder="Search name" required />
						<input class="form-control" type="submit" name="search" value="Search" class="bg-success">
					</form>
				</td>
			</tr>
			<tr class="bg-info">
				<th>Interest</th>
				<th>Activity</th>
				<th>Description</th>
				<th>Actions</th>
			</tr>
			<?php
				foreach ($all_interests as $key) {
					echo '
					<tr>
						<td>' . $key["interest_name"] . '</td>
						<td>' . $key["activity_name"] . '</td>
						<td>' . $key["interest_description"] . '</td>
						<td>
							<a href="../wp-content/plugins/interest_plugin/interest_update.php?interest=' . $key["interest_name"] . '" >
								<button class="bg-success">Edit</button>
							</a>
							<a onclick="return redirect()" href="http://localhost/wordpress/wp-admin/?interest=' . $key["interest_name"] . '">
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
			var a = confirm("Do you want to delete this interest?");
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