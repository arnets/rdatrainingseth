<!DOCTYPE html>
<html>
<head>
    <title>Home | Page</title>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-lg-offset-3 col-lg-6" style="margin: auto;">
                <form method="POST" action="../wp-content/plugins/customized-plugins/serverSide/insert_home_page.php" enctype="multipart/form-data">
                    <div class="form-group">
                        <label>Left Column information</label>
                        <textarea name="left_column" class="form-control" placeholder="enter information for left column"></textarea>
                    </div>
                    <div class="form-group">
                        <label>Right Column information</label>
                        <textarea name="rigth_column" class="form-control" placeholder="enter information for right column"></textarea>
                    </div>
                    <input type="submit" name="submit" value="Submit" class="btn btn-success">
                </form>
            </div>
        </div>
    </div>
</body>
</html>