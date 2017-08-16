<?php
$dir = '../';
session_start();
if(isset($_SESSION['login_user']))
{
	header('Location: '.$dir.'welcome.php');
	exit;
}

include('connection.php');
if ($conn) 
{
	$username = $_POST['username'];
	$password = $_POST['password'];
	$type = $_POST['radiobtn'];
	
	$username =stripslashes($username);
	$password =stripslashes($password);
	$type =stripslashes($type);
	
	$username = mysqli_real_escape_string($conn, $username);
	$password = md5(mysqli_real_escape_string($conn, $password));
	$type = mysqli_real_escape_string($conn, $type);
	
	$msg = array();
	$query = mysqli_query($conn,"SELECT * FROM users WHERE Username = '$username' AND Password = '$password' AND Type = '$type'");
	$row = mysqli_num_rows($query);
	if($row==1)
	{
		$row = mysqli_fetch_assoc($query);
		$_SESSION['user_id'] = $row['User_Id'];
		$_SESSION['login_user']= $row['Username'];
		$_SESSION['login_type']= $row['Type'];
		$msg["success"] = "true";
		//header('Location: '.$dir.'welcome.php');
	}
	else
	{
		//mysql_close($conn);
		$msg["error"]= "Username or password  or Type did not match:";
		//header("refresh:10;url=".$dir."index.php");
	}
	echo json_encode($msg);
}
else
{
	die("Connection failed: " . mysqli_connect_error());
}


?> 