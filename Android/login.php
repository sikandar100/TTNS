<?php

include('connection.php');
if ($conn) 
{
	$username = $_POST['username'];
	$password = $_POST['password'];
	$type = 3;
	
	$username =stripslashes($username);
	$password =stripslashes($password);
	
	$username = mysqli_real_escape_string($conn, $username);
	$password = md5(mysqli_real_escape_string($conn, $password));
	
	$query = mysqli_query($conn,"SELECT * FROM users WHERE Username = '$username' AND Password = '$password' AND Type = '$type'");
	$row = mysqli_num_rows($query);
	if($row==1)
	{
		echo"success";
	}
	else
	{
		
		echo"Username or password  or Type did not match:";
		//header("refresh:10;url=".$dir."index.php");
	}
}
else
{
	die("Connection failed: " . mysqli_connect_error());
}


?> 