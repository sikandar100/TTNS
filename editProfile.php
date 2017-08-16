<?php
$dir = "./";
define("Allow_user", true);
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
        <form action="PhpScripts/profileEntry.php" method="post" class="form-horizontal">
		<p style="font-size:250%;">Profile:</p>
		<table>
        <tr><td><p style="font-size:150%;">FirstName:</p></td><td> <input type="text" name="Fname" placeholder="FirstName"></p></td></tr>
        <tr><td><p style="font-size:150%;">LastName:</p></td> <td><input type="text" name="Lname" placeholder="LastName"></p></td></tr>
        <tr><td><p style="font-size:150%;">Address:</p></td><td> <input type="text" name="Address" placeholder="Address"></p></td></tr>
        <tr><td><p style="font-size:150%;">ContactNo:</p></td><td> <input type="text" name="Contact" placeholder="Contact#"></p></td></tr>
        <tr><td><p style="font-size:150%;">Email:</p></td><td> <input type="text" name="Email" placeholder="EmailAddress"></p></td></tr>
        <tr><td><p style="font-size:150%;">Department:</p></td><td> <input type="text" name="Department" placeholder="Department"></p></td></tr>
        <tr><td><p style="font-size:150%;">RegistrationId:</p></td><td> <input type="text" name="RegistrationId" placeholder="Registration_Id"></p></td></tr>
       </table>
        <p><input style="font-size:150%;" type="reset" Value="Clear">&nbsp;&nbsp;&nbsp;
        <input style="font-size:150%;" type="submit" value="Submit"></p>
         </form>
    </div>
    
    <div class="footer col-md-12">
   	 <p id="foot">Copy Rights Reserved &copy; Sikandar Waheed</p>
    </div>
</div>
</body>
</html>
