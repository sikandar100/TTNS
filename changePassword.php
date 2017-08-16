<?
include ('session.php');
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
.content form
{
		margin-left:40%;
		margin-top:80px;
		margin-bottom:100px;
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
		<div class="content col-md-8">
            <form class="form-horizontal">
			<table>
              <tr><td><p style="font-size:150%;">Current Password:</p></td><td><input type="password" name="cpassword" placeholder="Current Password:"></p></td></tr>
              <tr><td><p style="font-size:150%;">New Password:</p></td><td><input type="password" name="npassword" placeholder="New Password"></p></td></tr>
			  <tr><td><p style="font-size:150%;">Confirm Password:</p></td><td><input type="password" name="cnfrmpassword" placeholder="Confirm Password:"></p></td></tr>
			</table>
			   <p style="font-size:150%;">Admin:<input type="radio" value="1" name="radiobtn">&nbsp;&nbsp; 
                Teacher:<input type="radio" value="2" name="radiobtn">&nbsp;&nbsp;
                Student:<input type="radio" value="3" name="radiobtn"></p>
                <p><input style="font-size:150%;" type="reset" Value="Cancel">&nbsp;&nbsp;&nbsp;
                <input style="font-size:150%;" type="submit" value="Done"></p>
            </form>
        </div>
    </div>
    
    <div class="footer col-md-12">
   	 <p id="foot">Copy Rights Reserved &copy; Sikandar Waheed</p>
    </div>
</div>
</body>
</html>
