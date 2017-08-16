<?php
$dir = "./";
include ('PhpScripts/session.php');
include ('PhpScripts/connection.php');
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
.welcomenote
{ 
	margin-top:8%;
	margin-bottom:8%;
}
h1
{
	margin-left:40%;
}
h2
{
	margin-left:30%;
}
h3
{
	margin-left:15%;
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
			  <li><a href="teacherNotification.php">Send Notification</a></li>
			';
	}
	else if ($_SESSION['login_type']==1) //Admin Menu
	{
    	echo '
			  <li><a href="uploadTimeTable.php">Upload TimeTable</a></li>
			  <li><a href="adminReports.php">Time Table Report</a></li>
			  <li><a href="registerUsers.php">Register Users</a></li>
			';
	}
		?>
			<li><a href="contactUs.php">Contact Us</a></li>
			<li><a href="aboutUs.php">About Us</a></li>
			<li><a href="PhpScripts/logout.php">Logout</a></li>
		</ul>
		<div class=" col-md-10">
			<?php
				$sql = "SELECT * FROM `notification` WHERE `User_Id` = ".$_SESSION['user_id']." AND `Checkpoint`=1";
				$query = mysqli_query($conn,$sql);
				$count = mysqli_num_rows($query);
				if($count>0){
					echo '<br><div class="alert alert-info" role="alert"><span> You have '.$count.' unseen notification</span></div>';
				}
			?>
			<div class="welcomenote">
				<h1>Welcome!</h1>
				<h2>Time Table Notification System</h2>
				<h3>This is The Home Page.Choose From the Menu What you want to do</h3>
			</div>
		</div>
    </div>
    
    <div class="footer col-md-12">
   	 <p id="foot">Copy Rights Reserved &copy; Sikandar Waheed</p>
    </div>
</div>
</body>
</html>
