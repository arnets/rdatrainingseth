<?php
    
    require '../customized-plugins/Database_Handler/ActivitiesHandler.php';
    if (isset($_GET["activity"])) {
        $activity = new ActivitiesHandler();
        $data = $activity->get_one_Activity($_GET["activity"]);
        foreach ($data as $key) {
            
        }
    }
?>
<!DOCTYPE html>
<html>
<head>
    <title>Interest Update</title>
    <link rel="stylesheet" type="text/css" href="../customized-plugins/css/bootstrap4.css">
</head>
<body style="background-image: url(../../images/bg.png);">
    <div class="container mt-5">
        <div class="row">
            <div class="col-lg-offset-3 col-lg-6" style="margin: auto;">
                <form method="POST" action="../customized-plugins/serverSide/update_activity.php" enctype="multipart/form-data">
                    <div class="form-group">
                        <label>Activity_Code</label>
                        <input type="text" name="code" readonly class="form-control" value="<?php echo $key['activity_code'] ?>">
                    </div>
                    <div class="form-group">
                        <label>Activity_Name</label>
                        <input type="text" name="name" class="form-control" value="<?php echo $key['activity_name'] ?>">
                    </div>
                    <div class="form-group">
                        <label>Description</label>
                        <input name="description" class="form-control" value="<?php echo $key['activity_description'] ?>"></input>
                    </div>
                    <input type="submit" name="update" value="update" class="btn btn-success">
                </form>
            </div>
        </div>
    </div>
</body>
</html>