<?php
$dir = "./";
define('INCLUDE_CHECK', 'hmm');
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
<script>
function _(id){ return document.getElementById(id); }
function submitForm()
{
	_("mybtn").disabled = true;
	_("status").innerHTML = 'please wait ...';
	var formdata = new FormData();
	formdata.append( "cpassword", _("cpassword").value );
	formdata.append( "npassword", _("npassword").value );
	formdata.append( "cnfrmpassword", _("cnfrmpassword").value );
	var radios = document.getElementsByName('radiobtn');
	for (var i = 0; i < radios.length; i++) {
		if (radios[i].checked) {
			formdata.append( "radiobtn", radios[i].value);
			break;
		}
	}
	var ajax = new XMLHttpRequest();
	ajax.open( "POST", "PhpScripts/passwordEntry.php" );
	ajax.onreadystatechange = function() {
		if(ajax.readyState == 4 && ajax.status == 200) {
			var response = JSON.parse(ajax.responseText);
			if(response.success){
				_("status").innerHTML = "";
				_("status").innerHTML = "Password Has Been Changed Successfully";
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
.content form
{
		margin-left:40%;
		margin-top:80px;
		margin-bottom:100px;
}
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
		<div class="content col-md-8">
            <form method="post" class="form-horizontal" onsubmit="submitForm(); return false;">
			<table>
              <tr><td><p style="font-size:150%;">Current Password:</p></td><td><input type="password" id="cpassword" name="cpassword" placeholder="Current Password:" required></td></tr>
              <tr><td><p style="font-size:150%;">New Password:</p></td><td><input type="password" id="npassword" name="npassword" placeholder="New Password" required></td></tr>
			  <tr><td><p style="font-size:150%;">Confirm Password:</p></td><td><input type="password" id="cnfrmpassword" name="cnfrmpassword" placeholder="Confirm Password:" required></td></tr>
			</table>
			   <p style="font-size:150%;">Admin:<input type="radio" value="1" name="radiobtn" required>&nbsp;&nbsp; 
                Teacher:<input type="radio" value="2" name="radiobtn">&nbsp;&nbsp;
                Student:<input type="radio" value="3" name="radiobtn"></p>
                <p><input style="font-size:150%;" type="reset" Value="Cancel">&nbsp;&nbsp;&nbsp;
                <input id="mybtn" style="font-size:150%;" type="submit" value="Done"></p>
            </form>
			<p id = "status"></p>
        </div>
    </div>
    
    <div class="footer col-md-12">
   	 <p id="foot">Copy Rights Reserved &copy; Sikandar Waheed</p>
    </div>
</div>
</body>
</html>
