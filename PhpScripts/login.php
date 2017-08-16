 <?php
session_start();
include "./connection.php";
if ($conn) 
{
	$query = mysqli_query("SELECT * FROM users WHERE Username = '$username' AND password = '$password' AND Type = '$type'",$conn);
	$row = mysqli_num_rows($query);
	if($row==1)
	{
		$_SESSION['login_user']=$username;
		header("Location:../welcome.php");
	}
	else
	{
		mysqli_close($conn);
	}
}
else
{
	die("Connection failed: " . mysqli_connect_error());
}
?> 