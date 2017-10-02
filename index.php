<?php
$dir = './';
session_start();
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
<script>
function _(id){ return document.getElementById(id); }
function submitForm()
{
	_("mybtn").disabled = true;
	_("status").innerHTML = 'please wait ...';
	var formdata = new FormData();
	formdata.append( "username", _("username").value );
	formdata.append( "password", _("password").value );
	var radios = document.getElementsByName('radiobtn');
	for (var i = 0; i < radios.length; i++) {
		if (radios[i].checked) {
			formdata.append( "radiobtn", radios[i].value);
			break;
		}
	}
	var ajax = new XMLHttpRequest();
	ajax.open( "POST", "PhpScripts/login.php" );
	ajax.onreadystatechange = function() {
		if(ajax.readyState == 4 && ajax.status == 200) {
			var response = JSON.parse(ajax.responseText);
			if(response.success){
				_("status").innerHTML = "";
				window.location.href = "./welcome.php";
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
		margin-top:100px;
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
     	 <div class="content col-md-12">
            <form method="post" class="form-horizontal" onsubmit="submitForm(); return false;">
			<table>
              <tr><td><p style="font-size:150%;">Username:</p></td><td><input type="text" id="username" name="username" oninput="input_check(event, 'username')" placeholder="Username" required></td></tr>
                <tr><td><p style="font-size:150%;">Password:</p></td><td><input type="password" id="password" name="password" placeholder="Password" required></td></tr>
			</table>
                <p style="font-size:150%;">Admin:<input type="radio" value="1" name="radiobtn" required>&nbsp;&nbsp; 
                Teacher:<input type="radio" value="2" name="radiobtn">&nbsp;&nbsp;
                Student:<input type="radio" value="3" name="radiobtn"></p>
                <p><input style="font-size:150%;" type="reset" Value="Cancel">&nbsp;&nbsp;&nbsp;
                <input id="mybtn" style="font-size:150%;" type="submit" value="Login">
				</p>
				<br>
				<a href="./forgetPassword.php"><h4>Forget Password?</h4></a>
            </form>
			<p id = "status"></p>
        </div>
        
        <div class="footer col-md-12">
         <p id="foot">Copy Rights Reserved &copy; Sikandar Waheed</p>
        </div>
    </div>
<script src= "JavaScripts/myScript.js"></script>
</body>
</html>
