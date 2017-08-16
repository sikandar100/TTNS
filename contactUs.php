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
<style>
.contactus 
{
	padding-top:20px;
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
		<div class = "contactus col-md-9">
	<div class="row">
      <div class="col-md-6 col-md-offset-3">
        <div class="well well-sm">
          <form class="form-horizontal" action="" method="post">
          <fieldset>
            <legend class="text-center">Contact us</legend>
    
            <!-- Name input-->
            <div class="form-group">
              <label class="col-md-3 control-label" for="name">Name</label>
              <div class="col-md-9">
                <input id="name" name="name" type="text" placeholder="Your name" class="form-control">
              </div>
            </div>
    
            <!-- Email input-->
            <div class="form-group">
              <label class="col-md-3 control-label" for="email">Your E-mail</label>
              <div class="col-md-9">
                <input id="email" name="email" type="text" placeholder="Your email" class="form-control">
              </div>
            </div>
    
            <!-- Message body -->
            <div class="form-group">
              <label class="col-md-3 control-label" for="message">Your message</label>
              <div class="col-md-9">
                <textarea class="form-control" id="message" name="message" placeholder="Please enter your message here..." rows="5"></textarea>
              </div>
            </div>
    
            <!-- Form actions -->
            <div class="form-group">
              <div class="col-md-12 text-right">
                <button type="submit" class="btn btn-primary btn-lg">Submit</button>
              </div>
            </div>
          </fieldset>
          </form>
        </div>
      </div>
		</div>

</div>
	<div class="footer col-md-12">
   	 <p id="foot">Copy Rights Reserved &copy; Sikandar Waheed</p>
    </div>
</body>
</html>
