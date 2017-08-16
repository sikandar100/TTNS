<?php
$dir = isset($dir) ? $dir : '../';
session_start();
if(isset($_SESSION['login_user']))
{
	header('Location: '.$dir.'welcome.php');
	exit;
}

include('connection.php');

if(isset($_POST['username']) && !empty($_POST['username'])){
	$output = array();
	$_POST['username'] = mysqli_real_escape_string($conn,$_POST['username']);
	$sql = "SELECT users.*, profile.* FROM `users` JOIN profile ON profile.User_Id = users.User_Id WHERE users.Username = '".$_POST['username']."'";
	$query = mysqli_query($conn,$sql);
	if($query){
		$result = mysqli_fetch_assoc($query);
		if(!empty($result['Email'])){
			$key = md5(rand().$result['Reg_Id'].$result['User_Id'].$result['Semester_Id'].$result['User_Id'].$result['Profile_Id'].rand());
			$sql = "DELETE FROM `security_keys` WHERE user_id = ".$result['User_Id'];
			mysqli_query($conn,$sql);
			$sql = "INSERT INTO `security_keys`(`user_id`, `key`) VALUES (".$result['User_Id'].",'".$key."')";
			mysqli_query($conn,$sql);
			
			sendMail($key, $result['Email'], $result['Fname'].' '.$result['Lname']);
			
			$output['success'] = "An email is submitted for confirmation.";
			
		} else {
			$output['error'] = "This user didn't provide any email for password recovery.";
		}
	} else {
		$output['error'] = "No user exsit with this username";
	}
	
	echo json_encode($output);
}

function sendMail($key,$email, $name){
	$to      = $email;
	$subject = 'TTNS: Password Recovery';
	$message = 'Hi '.$name.",\n You have requested for password recovery at QAU Time Table Notification System. By click below link you will be able to reset your password.\n\n";
	$message .= 'http://localhost/TTNS/forgetPassword.php?newPass='.$key;
	$headers = 'From: Sikandar@example.com' . "\r\n" .
		'Reply-To: no-reply@example.com' . "\r\n" .
		'X-Mailer: PHP/' . phpversion();

	mail($to, $subject, $message, $headers);
}
?>