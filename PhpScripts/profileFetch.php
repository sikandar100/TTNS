<?php
if(!defined('INCLUDE_CHECK')){
	die('get lost.');
}
$dir ='../';
include('connection.php');

$user = $_SESSION['login_user'];

$query = mysqli_query($conn,"SELECT User_Id FROM users WHERE Username = '$user'");
$id = mysqli_fetch_assoc($query);
$uId= $id['User_Id'];

$queryy = mysqli_query($conn,"SELECT * FROM profile WHERE User_Id = '$uId'");
$row = mysqli_fetch_assoc($queryy);

if(is_array($row) && isset($row['User_Id']))
{
	$str="<tr><th>First Name:</th><th>".$row['Fname']."</th></tr>";
	$str.="<tr><th>Last Name:</th><th>".$row['Lname']."</th></tr>";
	$str.="<tr><th>Address:</th><th>".$row['Address']."</th></tr>";
	$str.="<tr><th>Contact No:</th><th>".$row['ContactNo']."</th></tr>";
	$str.="<tr><th>Email:</th><th>".$row['Email']."</th></tr>";
}
else
{
	$str="<tr><th>First Name:</th><th></th></tr>";
	$str.="<tr><th>Last Name:</th><th></th></tr>";
	$str.="<tr><th>Address:</th><th></th></tr>";
	$str.="<tr><th>Contact No:</th><th></th></tr>";
	$str.="<tr><th>Email:</th><th></th></tr>";
	
}


?>