<?php
$dir = "./";
define('INCLUDE_CHECK', 'hmm');
include ('PhpScripts/session.php');

if($_SESSION['login_type'] != 1){
	die('Forbidden Access');
}
include('PhpScripts/connection.php');
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
#status
{
	text-align: center;
	 color: red;
	 font-size: 40px;
	
}
</style>
<script>
function _(id){ return document.getElementById(id); }
function submitForm()
{
	_("mybtn").disabled = true;
	_("status").innerHTML = 'please wait ...';
	var formdata = new FormData();
	formdata.append( "username", _("username").value );
	formdata.append( "password", _("password").value );
	formdata.append( "regId", _("regId").value );
	var ajax = new XMLHttpRequest();
	ajax.open( "POST", "PhpScripts/newTeacher.php" );
	ajax.onreadystatechange = function() {
		if(ajax.readyState == 4 && ajax.status == 200) {
			var response = JSON.parse(ajax.responseText);
			if(response.success){
				_("status").innerHTML = response.success;
				_("mybtn").disabled = false;
				_("teacherForm").reset();
				setTimeout(function(){
					_("status").innerHTML = '';
				}, 4000);
			} else {
				_("status").innerHTML = response.error;
				_("mybtn").disabled = false;
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
		<div class ="col-md-5">
		</br>
		<?php
			if(isset($_GET['error'])){
				if((int)$_GET['error'] === 1){
					echo '<div class="alert alert-success" role="alert">User registered successfully</div>';
				} else {
					echo '<div class="alert alert-danger" role="alert">'.$_GET['error'].'</div>';
				}
			}
		?>
			<form  class="form-horizontal"  action="PhpScripts/upload_users.php" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label for="dept" class="col-sm-4 control-label">Department:</label>
					<div class="col-sm-8">
						<select class="form-control" name="dept" id="dept" required>
						<?php
						$str="";
						$query = mysqli_query($conn,"SELECT * FROM department WHERE 1");
						while($row=mysqli_fetch_assoc($query))
						{
							$str .= '<option value="'.$row['Dept_Id'].'">'.$row['Dept_Name'].'</option>';
						}
						echo $str;
						?>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label for="semester" class="col-sm-4 control-label">Semester:</label>
					<div class="col-sm-8">
						<select class="form-control" name="semester" id="semester" required>
							<option value="1st">1st</option>
							<option value="2nd">2nd</option>
							<option value="3rd">3rd</option>
							<option value="4th">4th</option>
							</ul>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label for="deleteS" class="col-sm-4 control-label">Delete Old Student of:</label>
					<div class="col-sm-8">
						<select class="form-control" name="deleteS" id="deleteS">
							<option value="0" selected>None</option>
							<option value="4th">4th Semester</option>
							<option value="3rd">3rd Semester</option>
							<option value="2nd">2nd Semester</option>
							<option value="1st">1st Semester</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label for="fileToUpload" class="col-sm-4 control-label">Select File to upload:</label>
					<div class="col-sm-8">
						<input type="file" name="fileToUpload" id="fileToUpload">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-12">
						<input class="pull-right" type="submit" value="Upload" name="submit">
					</div>
				</div>
			</form>
		</div>
		<div class ="col-md-4">
		</br>
		<h3>Register Single Teacher From This Form</h3>
		<form method="post" class="form-horizontal" id="teacherForm" onsubmit="submitForm(); return false;">
			<p style="font-size:250%;">Profile:</p>
			<table>
				<tr><td><p style="font-size:150%;">Username:</p></td><td> <input type="text" id="username" name="username" placeholder="Username" required></p></td></tr>
				<tr><td><p style="font-size:150%;">Password:</p></td> <td><input type="password" id="password" name="password" placeholder="Password" required></p></td></tr>
				<tr><td><p style="font-size:150%;">RegistrationId:</p></td><td> <input type="text" id="regId" name="regId" required></p></td></tr>
			</table>
			<p><input style="font-size:150%;" type="reset" Value="Clear">&nbsp;&nbsp;&nbsp;
			<input style="font-size:150%;" type="submit" id="mybtn" value="Submit"></p>
         </form>
		<p id = "status"></p>
		</div>
    <div class="footer col-md-12">
   	 <p id="foot">Copy Rights Reserved &copy; Sikandar Waheed</p>
    </div>
</div>
<script src="./JavaScripts/js/jquery.min.js"></script>
<script src="./JavaScripts/js/bootstrap.min.js"></script>
</body>
</html>
