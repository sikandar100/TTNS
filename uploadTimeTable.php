<?php
$dir = "./";
define('INCLUDE_CHECK', 'hmm');
include ('PhpScripts/session.php');

if($_SESSION['login_type'] != 1){
	die('Forbidden Access');
}
?>
<!doctype html>
<html>
<head>
 <meta charset="utf-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1">
<link href="CSS/bootstrap.min.css" rel="stylesheet">
<link href="CSS/homestyle.css" rel="stylesheet" type="text/css">
<title>Time Table Notification System</title>
<style>
.divide2
{ 
	margin-top:120px;
	
}
.footer{
	margin-top:30px;
}
</style>
</head>
<body>
<div class="container col-md-12">

	<div class="header col-md-12">
    	<p id="webtitle">Time Table Notification System</p>
    </div>
    
    <div class="content">
    <ul class="menu col-md-3">
			 <li><a class="active" href="welcome.php">Home</a></li>
			 <li><a href="timeTable.php">Time Table</a></li>
			 <li><a href="changePassword.php">Change Password</a></li>
	<?php
	if($_SESSION['login_type']==3) //Student Menu
	{
    	echo '
			  <li><a href="userProfile.php">User Profile</a></li>
			  <li><a href="editProfile.php">Edit Profile</a></li>
			  <li><a href="Notifications.php">Notifications</a></li>
			';
	}
	else if ($_SESSION['login_type']==2) //Teacher Menu
	{
    	echo '
			  <li><a href="userProfile.php">User Profile</a></li>
			  <li><a href="editProfile.php">Edit Profile</a></li>
			  <li><a href="teacherNotification.php">Send Notification</a></li>
			';
	}
	else if ($_SESSION['login_type']==1) //Admin Menu
	{
    	echo '
			  <li><a href="uploadTimeTable.php">Upload TimeTable</a></li>
			  <li><a href="adminReports.php">Time Table Report</a></li>
			  <li><a href="registerUsers.php">Register Users</a></li>
			  <li><a href="adminTeacher.php">Course Allocation</a></li>
			';
	}
		?>
			<li><a href="contactUs.php">Contact Us</a></li>
			<li><a href="aboutUs.php">About Us</a></li>
			<li><a href="PhpScripts/logout.php">Logout</a></li>
		</ul>
		<div class = "registerusers col-md-10">
			<div class = " divide2 col-md-8">
			<?php
				if(isset($_GET['error'])){
					if((int)$_GET['error'] === 1){
						echo '<div class="alert alert-success" role="alert">Time Table Uploaded Successfully</div>';
					} else {
						echo '<div class="alert alert-danger" role="alert">'.$_GET['error'].'</div>';
					}
				}
			?>
				<form class="form-horizontal" action="PhpScripts/parseTimeTable.php" method="post" enctype="multipart/form-data">
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-4 control-label">Time Table Type:</label>
						<div class="col-sm-8">
							<select class="form-control" name="type" id="type" onchange="askmore(event)">
								<option value="1">New Time Table</option>
								<option value="2">Update Time Table</option>
							</select>
						</div>
					</div>
					<div class="form-group" id="askedMore" style="display:none;">
						<label for="reason" class="col-sm-4 control-label">Reason:</label>
						<div class="col-sm-8">
							<select class="form-control" name="reason" id="reason">
								<option value="1">Teacher Clashes</option>
								<option value="2">Student Clashes</option>
								<option value="3">Department Issues</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="fileToUpload" class="col-sm-4 control-label">Select File to upload:</label>
						<div class="col-sm-8">
						  <input type="file" name="fileToUpload" id="fileToUpload" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
						  <button type="submit" class="btn btn-default" value="Upload" name="submit">Upload</button>
						</div>
					</div>
				</form>
			</div>
		</div>
    </div>
    
    <div class="footer col-md-12">
   	 <p id="foot">Copy Rights Reserved &copy; Sikandar Waheed</p>
    </div>
</div>
<script src="./JavaScripts/js/jquery.min.js"></script>
<script src="./JavaScripts/js/bootstrap.min.js"></script>
<script>
	function askmore(e){
		var elm = $(e.target);
		if(elm.val() == 1){
			$("#askedMore").fadeOut( "slow" );
		} else {
			$("#askedMore").fadeIn( "slow" );
		}
	}
</script>
</body>
</html>
