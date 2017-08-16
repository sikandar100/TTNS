<?php
$dir = isset($dir) ? $dir : '../';
define('INCLUDE_CHECK','hmm');
include('connection.php');
include ('session.php');

$user = $_SESSION['login_user'];

$curpass = md5(mysqli_real_escape_string($conn,$_POST['cpassword']));
$newpass = md5(mysqli_real_escape_string($conn,$_POST['npassword']));
$cnfpass = md5(mysqli_real_escape_string($conn,$_POST['cnfrmpassword']));
$type = $_POST['radiobtn'];

$query = mysqli_query($conn,"SELECT Password,Type FROM users WHERE Username = '$user'");
$data = mysqli_fetch_assoc($query);
$upass= $data['Password'];
$typ = $data['Type'];

$msg = array();
if($typ == $type AND $cnfpass == $newpass)
{
	
	if( $curpass  == $upass)
	{
		$sql = "UPDATE users SET Password='$cnfpass' WHERE Username='$user'";
		mysqli_query($conn, $sql);
		//header('Location: '.$dir.'changePassword.php');
		//exit;
		$msg["success"] = "true";
	}
	else
	{
		$msg["error"]="Wrong current Password did not match:";
		//header('Location: '.$dir.'changePassword.php');
		//exit;
		
	}
	
}
else
{
	$msg["error"]="new Password and confirm password is not same or the type you selected is not yours:";
		//header('Location: '.$dir.'changePassword.php');
		//exit;
}

echo json_encode($msg);

?>