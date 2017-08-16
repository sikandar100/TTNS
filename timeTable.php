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
<link href="CSS/dataTables.bootstrap.min.css" rel="stylesheet">
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
	<div class="col-md-9">
	<br>
		<table id="TimeTable" class="table table-striped table-bordered" cellspacing="0" width="100%">
			<thead>
				<tr>
					<th>Day</th>
					<th>Semester</th>
					<th>Subject</th>
					<th>Room</th>
					<th>Time</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<th>Day</th>
					<th>Semester</th>
					<th>Subject</th>
					<th>Room</th>
					<th>Time</th>
				</tr>
			</tfoot>
			<tbody>
				<?php
					$sql = "SELECT * FROM timetable";
					$result = mysqli_query($conn,$sql);
					$TRs = "";
					while($row = mysqli_fetch_assoc($result)){
						$TRs .= "<tr>";
						$TRs .= "<td>".$row['day']."</td>";
						$TRs .= "<td>".$row['semester']."</td>";
						$TRs .= "<td>".$row['course']."</td>";
						$TRs .= "<td>".$row['room']."</td>";
						$TRs .= "<td>".$row['time']."</td>";
						$TRs .= "</tr>";
					}
					echo $TRs;
				?>
			</tbody>
		</table>
		<br>
	</div>
    </div>
    
    <div class="footer col-md-12">
   	 <p id="foot">Copy Rights Reserved &copy; Sikandar Waheed</p>
    </div>
</div>
<script src="./JavaScripts/js/jquery.min.js"></script>
<script src="./JavaScripts/js/bootstrap.min.js"></script>
<script src="./JavaScripts/js/jquery.dataTables.min.js"></script>
<script src="./JavaScripts/js/dataTables.bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
		$('#TimeTable').DataTable();
	} );
</script>
</body>
</html>
