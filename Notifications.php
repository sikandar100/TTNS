<?php
$dir = "./";
define('INCLUDE_CHECK', 'hmm');
include ('PhpScripts/session.php');

if($_SESSION['login_type'] != 3){
	die('Forbidden Access');
}
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
.message {
	background-color:#EEEEEE;
	padding: 20px;
	padding-top: 15px;
	margin-bottom: 5px;
	border-radius: 5px;
}
.blue {
	background-color: #4285F4;
	color:#F1F1F1;
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
		<br>
			<?php
				$sql = "SELECT * FROM `notification` WHERE `User_Id` = ".$_SESSION['user_id']." AND `Checkpoint`=1";
				$query = mysqli_query($conn,$sql);
				while($row = mysqli_fetch_assoc($query)){
					$date = strtotime($row['time_rec']);
					echo '<div class="message blue">
							  <h3>'.$row['Msg'].'</h3>
							  <p><b>Date: <b>'.date("l jS \of F Y h:i:s A",$date).'</p>
						</div>';
				}
				$sql = "SELECT * FROM `notification` WHERE `User_Id` = ".$_SESSION['user_id']." AND `Checkpoint`=0";
				$query = mysqli_query($conn,$sql);
				while($row = mysqli_fetch_assoc($query)){
					$date = strtotime($row['time_rec']);
					echo '<div class="message">
							  <h3>'.$row['Msg'].'</h3>
							  <p><b>Date: </b>'.date("l jS \of F Y h:i:s A",$date).'</p>
						</div>';
				}
				$sql = "UPDATE `notification` SET `Checkpoint`=0 WHERE `User_Id` = ".$_SESSION['user_id'];
				$query = mysqli_query($conn,$sql);
			?>
		</div>
    </div>
    
    <div class="footer col-md-12">
   	 <p id="foot">Copy Rights Reserved &copy; Sikandar Waheed</p>
    </div>
</div>
</body>
</html>
