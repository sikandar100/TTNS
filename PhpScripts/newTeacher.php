<?php
$dir = isset($dir) ? $dir : '../';
session_start();
define('INCLUDE_CHECK','hmm');
include('connection.php');

if(isset($_POST['username']) && !empty($_POST['username'])){
	$output = array();
	$_POST['username'] = mysqli_real_escape_string($conn,$_POST['username']);
	$_POST['password'] = md5($_POST['password']);
	$_POST['regId'] = mysqli_real_escape_string($conn,$_POST['regId']);
	$sql = "SELECT * FROM users WHERE Username = '".$_POST['username']."' OR Reg_Id = '".$_POST['regId']."'";
	$query = mysqli_query($conn,$sql);
	$result = mysqli_fetch_assoc($query);
	if(!isset($result['User_Id'])){
			$sql = "INSERT INTO `users`(`Username`, `Password`, `Type`, `Reg_Id`, `Semester_Id`) VALUES ('".$_POST['username']."', '".$_POST['password']."', 2, '".$_POST['regId']."', NULL)";
			$query = mysqli_query($conn,$sql);
			if($query){
				$output['success'] = "Teacher added successfully.";
			} else {
				$output['error'] = "Unable to insert user.";
			}
			
	} else {
		$output['error'] = "A user with this username OR Registration ID already exist";
	}
	
	echo json_encode($output);
}
?>