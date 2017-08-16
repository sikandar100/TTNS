<?php
$dir = './';
session_start();
define("Allow_user", true);
if(isset($_SESSION['login_user']))
{
	header('Location: '.$dir.'welcome.php');
	exit;
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
.content form
{
		margin-left:40%;
		margin-top:100px;
		margin-bottom:100px;
}
</style>
</head>
<body>
    <div class="container col-md-12">
    
        <div class="header col-md-12">
         <p id="webtitle">Time Table Notification System</p>
        </div>
     	 <div class="content col-md-12">
            <form action="PhpScripts/login.php" method="post" class="form-horizontal">
                <p style="font-size:150%;">Username:<input type="text" name="username" placeholder="Username"></p>
                <p style="font-size:150%;">Password:&nbsp;<input type="password" name="password" placeholder="Password">   </p>
                <p style="font-size:150%;">Admin:<input type="radio" value="1" name="radiobtn">&nbsp;&nbsp; 
                Teacher:<input type="radio" value="2" name="radiobtn">&nbsp;&nbsp;
                Student:<input type="radio" value="3" name="radiobtn"></p>
                <p><input style="font-size:150%;" type="reset" Value="Cancel">&nbsp;&nbsp;&nbsp;
                <input style="font-size:150%;" type="submit" value="Login"></p>
            </form>
        </div>
        
        <div class="footer col-md-12">
         <p id="foot">Copy Rights Reserved &copy; Sikandar Waheed</p>
        </div>
    </div>
</body>
</html>
