<!DOCTYPE html>
<html>
<head>
    <title>Uploads</title>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-lg-offset-3 col-lg-6" style="margin: auto;">
                <form method="POST" action="../wp-content/plugins/customized-plugins/serverSide/insert_activity.php" enctype="multipart/form-data">
                    <div class="form-group">
                        <label>Activity_Code</label>
                        <input type="text" name="code" class="form-control" placeholder="enter code for this activity">
                    </div>
                    <div class="form-group">
                        <label>Activity_Name</label>
                        <input type="text" name="name" class="form-control" placeholder="enter name for this activity">
                    </div>
                    <div class="form-group">
                        <label>Description</label>
                        <textarea name="description" class="form-control" placeholder="enter some description for this activity"></textarea>
                    </div>
                    <input type="submit" name="submit" value="Submit" class="btn btn-success">
                </form>
            </div>
        </div>
    </div>
</body>
</html>