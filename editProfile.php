<?php
$dir = "./";
define('INCLUDE_CHECK', 'hmm');
include ('PhpScripts/session.php');

if($_SESSION['login_type'] != 3 && $_SESSION['login_type'] != 2){
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

<script>
function _(id){ return document.getElementById(id); }

function submitForm()
{
	_("mybtn").disabled = true;
	_("status").innerHTML = 'please wait ...';
	var formdata = new FormData();
	formdata.append( "Fname", _("Fname").value );
	formdata.append( "Lname", _("Lname").value );
	formdata.append( "Address", _("Address").value );
	formdata.append( "Contact", _("Contact").value );
	formdata.append( "Email", _("Email").value );
	formdata.append( "RegistrationId", _("RegistrationId").value );
	
	var ajax = new XMLHttpRequest();
	ajax.open( "POST", "PhpScripts/profileEntry.php" );
	ajax.onreadystatechange = function() {
		if(ajax.readyState == 4 && ajax.status == 200) {
			var response = JSON.parse(ajax.responseText);
			if(response.success){
				_("status").innerHTML = "";
				_("status").innerHTML = response.success;
			} else {
				_("status").innerHTML = response.error;
				_("mybtn").disabled = false;
			}
		}
	}
	ajax.send( formdata );
}
</script>
<title>Time Table Notification System</title>
<style>
#status
{
	text-align: center;
	 color: red;
	 font-size: 40px;
	
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
		<div class="col-md-10">
			<form method="post" class="form-horizontal" onsubmit="submitForm(); return false;">
				<p style="font-size:250%;">Profile:</p>
				<table>
				<tr><td><p style="font-size:150%;">FirstName:</p></td><td> <input type="text" id="Fname" name="Fname" oninput="input_check(event, 'name')" placeholder="FirstName" required></p></td></tr>
				<tr><td><p style="font-size:150%;">LastName:</p></td> <td><input type="text" id="Lname" name="Lname" oninput="input_check(event, 'name')" placeholder="LastName" required></p></td></tr>
				<tr><td><p style="font-size:150%;">Address:</p></td><td> <input type="text" id="Address" name="Address" placeholder="Address" required></p></td></tr>
				<tr><td><p style="font-size:150%;">ContactNo:</p></td><td> <input type="number" id="Contact" oninput="input_check(event, 'number')" name="Contact" placeholder="Contact#" required></p></td></tr>
				<tr><td><p style="font-size:150%;">Email:</p></td><td> <input type="email" id="Email" name="Email" placeholder="EmailAddress" required></p></td></tr>
				<tr><td><p style="font-size:150%;">RegistrationId:</p></td><td> <input type="number" id="RegistrationId" oninput="input_check(event, 'number')" name="RegistrationId" placeholder="Registration_Id" required></p></td></tr>
			   </table>
				<p><input style="font-size:150%;" type="reset" Value="Clear">&nbsp;&nbsp;&nbsp;
				<input style="font-size:150%;" type="submit" id="mybtn" value="Submit"></p>
			</form>
			 
			<p id = "status"></p>
		</div>
    </div>
    
    <div class="footer col-md-12">
   	 <p id="foot">Copy Rights Reserved &copy; Sikandar Waheed</p>
    </div>
</div>
<script src= "JavaScripts/myScript.js"></script>
</body>
</html>
