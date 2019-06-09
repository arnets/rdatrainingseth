<?php
    
    require '../customized-plugins/Database_Handler/ActivitiesHandler.php';
    if (isset($_GET["interest"])) {
        $activity = new ActivitiesHandler();
        $rows = $activity->get_Activity();
        $data = $activity->get_one_interest($_GET["interest"]);
        foreach ($data as $key) {    
        }
        foreach ($rows as $value) {
            
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
                <form method="POST" action="../customized-plugins/serverSide/update_interest.php" enctype="multipart/form-data">
                    <div class="form-group">
                        <label>Interest name</label>
                        <input type="text" name="name" readonly class="form-control" value="<?php echo $key['interest_name'] ?>">
                    </div>
                    <div class="form-group">
                        <label>Description</label>
                        <input name="description" class="form-control " value="<?php echo $key['interest_description'] ?>"></input>
                    </div>
                    <div class="form-group">
                        <label>Select Activity type</label>
                        <select class="form-control" name="activity_code" place>
                            <?php
                                foreach ($rows as $key) {
                                    echo "<option value=".$key['activity_code'].">";
                                    echo $key['activity_name'];
                                    echo "</option>";
                                }
                            ?>
                        </select>
                        
                    </div>
                    <input type="submit" name="update" value="update" class="btn btn-success">
                </form>
            </div>
        </div>
    </div>
</body>
</html>