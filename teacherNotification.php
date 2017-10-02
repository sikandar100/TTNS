<?php
$dir = "./";
define('INCLUDE_CHECK', 'hmm');
include ('PhpScripts/session.php');

if($_SESSION['login_type'] != 2){
	die('Forbidden Access');
}
include('PhpScripts/connection.php');

if(isset($_GET['d'])){
	$id = (int) $_GET['d'];
	$sql = "DELETE FROM `notification_statics` WHERE `id`=".$id;
	mysqli_query($conn,$sql);
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
#status
{
	text-align: center;
	 color: red;
	 font-size: 40px;
	
}
</style>
<script>
function _(id){ return document.getElementById(id); }
function submitForm2()
{
	_("status2").innerHTML = 'please wait ...';
	var formdata = new FormData();
	formdata.append( "courses", _("courses").value );
	formdata.append( "sendBy", _("sendBy").value );
	formdata.append( "message", _("message").value );
	formdata.append( "notification", _("notification").value );
	_("notification").disabled = true;
	
	var ajax = new XMLHttpRequest();
	ajax.open( "POST", "PhpScripts/teacherNotificationScript.php" );
	ajax.onreadystatechange = function() {
		if(ajax.readyState == 4 && ajax.status == 200) {
			var response = JSON.parse(ajax.responseText);
			if(response.success){
				_("status2").innerHTML = "";
				_("notification").disabled = false;
				window.location.reload();
			} else {
				_("status2").innerHTML = response.error;
				_("notification").disabled = false;
			}
		}
	}
	ajax.send( formdata );
}
</script>
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
		<div class = "col-md-10">
			<br>
			<div class="row border-between">
					<form class="form-horizontal col-md-12" action="PHPScripts/teacherNotificationScript.php" method="post" onsubmit="submitForm2(); return false;">
						<div class="form-group">
							<label for="semester" class="col-md-3 control-label">Course:</label>
							<div class="col-md-6">
								<select class="form-control" name="courses" id="courses" required>
								<?php
								$str="";
								$query = mysqli_query($conn,"SELECT * FROM `enrolled_courses` WHERE `User_Id` = " . $_SESSION['user_id']);
								while($row=mysqli_fetch_assoc($query))
								{
									$query2 = mysqli_query($conn,"SELECT * FROM `courses` WHERE `Course_Id` = " . $row['Course_Id']);
									$row2 = mysqli_fetch_assoc($query2);
									$str .= '<option value="'.$row2['Course_Id'].'">'.$row2['Course_Title'].' ('.$row2['Course_Code'].')'.'</option>';
								}
								echo $str;
								?>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="sendBy" class="col-md-3 control-label">Send By:</label>
							<div class="col-md-6">
								<select class="form-control" name="sendBy" id="sendBy" required>
									<option value="1">Default</option>
									<option value="3">Email</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="semester" class="col-md-3 control-label">Message:</label>
							<div class="col-md-6">
								<textarea class="form-control" rows="4" name="message" id="message" required></textarea>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-default" value="notification" name="notification" id="notification">Send Notification</button>
							</div>
						</div>
						<p id="status2" class="col-md-12"></p>
						<p><b>Note</b>: Below statics are only for send by default</p>
					</form>
			</div>
			<hr>
			<div class="col-md-12">
				<table id="TimeTable" class="table table-striped table-bordered" cellspacing="0" width="100%">
					<thead>
						<tr>
							<th>Day</th>
							<th>Course</th>
							<th>Action</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>Day</th>
							<th>Course</th>
							<th>Action</th>
						</tr>
					</tfoot>
					<tbody>
					<?php
						$str = "";
						$sql = "SELECT * FROM `notification_statics` WHERE `notification_type` = 2 AND `sender_id` = ".$_SESSION['user_id'];
						$query = mysqli_query($conn,$sql);
						while($row = mysqli_fetch_assoc($query)){
							$date = strtotime($row['sent_date']);
							$str .= "<tr>";
							$str .= "<td>".date("l F j, Y, g:i a",$date)."</td>";
							$str .= "<td>".$row['course']."</td>";
							$str .= '<td><a class="btn btn-primary" href="./notificationStatic.php?static='.$row['id'].'">Show Static</a> <a class="btn btn-danger" href="?d='.$row['id'].'">Delete</a></td>';
							$str .= "</tr>";
						}
						echo $str;
					?>
					</tbody>
				</table>
			</div>
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
