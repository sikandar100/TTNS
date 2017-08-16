<?php
$dir = './';
session_start();
if(isset($_SESSION['login_user']))
{
	header('Location: '.$dir.'welcome.php');
	exit;
}

include "PhpScripts/connection.php";
if(isset($_GET['newPass'])){
	$_GET['newPass'] = preg_replace('/[^a-fA-F0-9]/', '', $_GET['newPass']);
	if(!empty($_GET['newPass'])){
		$sql = "SELECT * FROM `security_keys` WHERE `key` = '".$_GET['newPass']."'";
		$query = mysqli_query($conn,$sql);
		$result = mysqli_fetch_assoc($query);
		if($result){
			if(isset($_POST['mybtn2']) && $_POST['mybtn2'] == "Reset Password"){
				if($_POST['password'] == $_POST['rePassword']){
					$password = md5($_POST['password']);
					$sql = "UPDATE `users` SET `Password`='".$password."' WHERE `User_Id`=".$result['User_Id'];
					mysqli_query($conn,$sql);
					$sql = "DELETE FROM `security_keys` WHERE id=".$result['id'];
					mysqli_query($conn,$sql);
					$message = "Password reset successfully.";
				} else {
					$message = "New Password & Re-Type Password did not mach.";
				}
			} else {
				$message = false;
			}
		} else {
			$message = "Incorrect Key.";
		}
	} else {
		$message = "Incorrect Key.";
	}
	
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
	var ajax = new XMLHttpRequest();
	ajax.open( "POST", "PhpScripts/reqPassword.php" );
	ajax.onreadystatechange = function() {
		if(ajax.readyState == 4 && ajax.status == 200) {
			var response = JSON.parse(ajax.responseText);
			if(response.success){
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

		<?php if(isset($_GET['newPass'])):?>
			<?php if(empty($message)):?>
				<div class="content col-md-12">
					<form method="post" class="form-horizontal" action="">
					<table>
					  <tr><td><p style="font-size:150%;">New Password:</p></td><td><input type="password" id="password" name="password" placeholder="password" required></td></tr>
						<tr><td><p style="font-size:150%;">Re-Type Password:</p></td><td><input type="password" id="password" name="rePassword" placeholder="password" required></td></tr>
					</table>
						<p><input style="font-size:150%;" type="reset" Value="Clear">&nbsp;&nbsp;&nbsp;
						<input id="mybtn" name="mybtn2" style="font-size:150%;" type="submit" value="Reset Password"></p>
					</form>
					<p id = "status"></p>
				</div>
			<?php else: ?>
			<br><br><br><br><br><br><br><br><br><br>
				<h2 style="text-align:center"><?php echo $message; ?></h2>
			<br><br>
			<?php endif; ?>
		<?php else:?>

        <div class="content col-md-12">
            <form method="post" class="form-horizontal" onsubmit="submitForm(); return false;">
			<table>
              <tr><td><p style="font-size:150%;">Username:</p></td><td><input type="text" id="username" name="username" placeholder="Username" required></td></tr>
            </table><br>
                <p><input style="font-size:150%;" type="reset" Value="Clear">&nbsp;&nbsp;&nbsp;
                <input id="mybtn" style="font-size:150%;" type="submit" value="Request New Paswword"></p>
            </form>
			<p id = "status"></p>
        </div>

		<?php endif; ?>
		
		<a href="./index.php"><h4 style="text-align:center">Return to Login Page</h4></a>
        <div class="footer col-md-12">
         <p id="foot">Copy Rights Reserved &copy; Sikandar Waheed</p>
        </div>
    </div>
</body>
</html>
