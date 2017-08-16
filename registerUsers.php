<?php
$dir = "./";
include ('PhpScripts/session.php');
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
.divide1
{ 
	margin-top:80px;
	
}
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
    	<?php
		if($_SESSION['login_type']==3)
	{
    	echo '<ul class="menu col-md-3">
			 <li><a class="active" href="welcome.php">Home</a></li>
			  <li><a href="timeTable.php">Time Table</a></li>
			  <li><a href="changePassword.php">Change Password</a></li>
			  <li><a href="userProfile.php">User Profile</a></li>
			  <li><a href="editProfile.php">Edit Profile</a></li>
			  <li><a href="#news">News</a></li>
			  <li><a href="contactUs.php">Contact Us</a></li>
			  <li><a href="aboutUs.php">About Us</a></li>
			  <li><a href="PhpScripts/logout.php">Logout</a></li>
		</ul>';
	}
	else if ($_SESSION['login_type']==2)
	{
    	echo '<ul class="menu col-md-3">
			 <li><a class="active" href="welcome.php">Home</a></li>
			  <li><a href="timeTable.php">Time Table</a></li>
			  <li><a href="changePassword.php">Change Password</a></li>
			  <li><a href="#">Send Notification</a></li>
			  <li><a href="contactUs.php">Contact Us</a></li>
			  <li><a href="aboutUs.php">About Us</a></li>
			  <li><a href="PhpScripts/logout.php">Logout</a></li>
		</ul>';
	}
	else if ($_SESSION['login_type']==1)
	{
    	echo '<ul class="menu col-md-3">
			 <li><a class="active" href="welcome.php">Home</a></li>
			  <li><a href="timeTable.php">Time Table</a></li>
			  <li><a href="uploadTimeTable.php">upload TimeTable</a></li>
			  <li><a href="changePassword.php">Change Password</a></li>
			  <li><a href="registerUsers.php">Register Users</a></li>
			  <li><a href="contactUs.php">Contact Us</a></li>
			  <li><a href="aboutUs.php">About Us</a></li>
			  <li><a href="PhpScripts/logout.php">Logout</a></li>
		</ul>';
	}
		?>
		<div class = "registerusers col-md-10">
			<div class = " divide1 col-md-5">
				<div class="dropdown">
					<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Select Department
					<span class="caret"></span></button>
					<ul class="dropdown-menu">
						<li><a href="#">CS</a></li>
						<li><a href="#">IT</a></li>
						<li><a href="#">Eco</a></li>
					</ul>
				</div>
				</br></br></br></br></br>
				<div class="dropdown">
					<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Select Semester
					<span class="caret"></span></button>
					<ul class="dropdown-menu">
						<li><a href="#">1st</a></li>
						<li><a href="#">2nd</a></li>
						<li><a href="#">3rd</a></li>
						<li><a href="#">4th</a></li>
					</ul>
				</div>
			</div>
			
			<div class = " divide2 col-md-5">
				<form action="PhpScripts/upload_users.php" method="post" enctype="multipart/form-data">
					Select File to upload:
					<input type="file" name="fileToUpload" id="fileToUpload"></br></br>
					<input type="submit" value="Upload" name="submit">
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
</body>
</html>
