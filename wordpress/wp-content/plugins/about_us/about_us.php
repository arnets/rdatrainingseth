<!DOCTYPE html>
<html>
<head>
    <title>About_Us</title>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-lg-offset-3 col-lg-6" style="margin: auto;">
                <form method="POST" action="../wp-content/plugins/customized-plugins/serverSide/insert_about_us.php" enctype="multipart/form-data">
                    <div class="form-group">
                        <label>Mission</label>
                        <textarea name="mission" class="form-control" placeholder="enter mission"></textarea>
                    </div>
                    <div class="form-group">
                        <label>More Information</label>
                        <textarea name="information" class="form-control" placeholder="enter information about us"></textarea>
                    </div>
                    <input type="submit" name="submit" value="Submit" class="btn btn-success">
                </form>
            </div>
        </div>
    </div>
</body>
</html>