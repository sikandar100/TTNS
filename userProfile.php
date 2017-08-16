<?
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
.profileTable
{
	margin-bottom:3%;
	margin-left:10%;
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
			  <li><a href="#contact">Time Table</a></li>
			  <li><a href="changePassword.php">Change Password</a></li>
			  <li><a href="userProfile.php">User Profile</a></li>
			  <li><a href="editProfile.php">Edit Profile</a></li>
			  <li><a href="#news">News</a></li>
			  <li><a href="contactUs.php">Contact Us</a></li>
			  <li><a href="aboutUs.php">About Us</a></li>
			  <li><a href="PhpScripts/logout.php">Logout</a></li>
		</ul>
		<div class = "profileTable col-md-6">
		<h2>Profile:</h2>
		<table class="table table-hover">
		<tr>
		<th>First Name:</th>
		<th style="font-weight: bold;"></th>
		</tr>
		<tr>
		<th>Last Name:</th>
		<th style="font-weight: bold;"></th>
		</tr>
		<tr>
		<th>Address:</th>
		<th style="font-weight: bold;"></th>
		</tr>
		<tr>
		<th>Contact No:</th>
		<th style="font-weight: bold;"></th>
		</tr>
		<tr>
		<th>Email:</th>
		<th style="font-weight: bold;"></th>
		</tr>
		<tr>
		<th>Department:</th>
		<th style="font-weight: bold;"></th>
		</tr>
		<tr>
		<th>StudentId:</th>
		<th style="font-weight: bold;"></th>
		</tr>
	
		</table>
        
		</div>
    </div>
    
    <div class="footer col-md-12">
   	 <p id="foot">Copy Rights Reserved &copy; Sikandar Waheed</p>
    </div>
</div>
</body>
</html>
