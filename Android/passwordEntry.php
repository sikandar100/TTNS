<?php
include('connection.php');

$user = $_POST['userName'];
$curpass = md5(mysqli_real_escape_string($conn,$_POST['cpassword']));
$newpass = md5(mysqli_real_escape_string($conn,$_POST['npassword']));
$cnfpass = md5(mysqli_real_escape_string($conn,$_POST['cnfrmpassword']));

$query = mysqli_query($conn,"SELECT Password FROM users WHERE Username = '$user'");
$data = mysqli_fetch_assoc($query);
$upass= $data['Password'];

if($cnfpass == $newpass)
{
	
	if($curpass == $upass)
	{
		$sql = "UPDATE users SET Password='$cnfpass' WHERE Username='$user'";
		mysqli_query($conn, $sql);
		echo "success";
	}
	else
	{
		echo "Wrong current Password did not match:";
		
	}
	
}
else
{
	echo "new Password and confirm password is not same or the type is not yours:";
}
?>