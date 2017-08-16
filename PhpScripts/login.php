<?php
echo "hello login";
$dir = '../';
define("Allow_user", true);
include('connection.php');
include('session.php');
if ($conn) 
{
	$username = $_POST['username'];
	$password = $_POST['password'];
	$type = $_POST['radiobtn'];
	/*
	stripslashes($username);
	stripslashes($password);
	stripslashes($type);
	
	mysqli_real_escape_string($conn, $username);
	mysqli_real_escape_string($conn, $password);
	mysqli_real_escape_string($conn, $type);*/
	
	$query = mysqli_query($conn,"SELECT * FROM users WHERE Username = '$username' AND Password = '$password' AND Type = '$type'");
	$row = mysqli_num_rows($query);
	
	if($row==1)
	{
		$_SESSION['login_user']=$username;
		header('Location: '.$dir.'welcome.php');
		exit;
	}
	else
	{
		mysql_close($conn);
		echo "Username and password did not match:";
		header("refresh:10;url=".$dir."index.php");
	}
}
else
{
	die("Connection failed: " . mysqli_connect_error());
}
?> 