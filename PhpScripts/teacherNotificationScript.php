<?php
$dir = isset($dir) ? $dir : '../';
define('INCLUDE_CHECK','hmm');
include ('session.php');
include('connection.php');

if(isset($_POST['courses']) && isset($_POST['notification']) && isset($_POST['sendBy'])){
	$output = array();
	$course = (int) mysqli_real_escape_string($conn, $_POST['courses']);
	$message = mysqli_real_escape_string($conn, $_POST['message']); 

	$sql = "SELECT * FROM `courses` WHERE `Course_Id` = ".$course;
	$result = mysqli_query($conn,$sql);
	$result = mysqli_fetch_assoc($result);
	
	switch($_POST['sendBy']){
		case 2:
		
			//SMS API HERE
		
		break;
		case 3:
			$sql = "SELECT * FROM `enrolled_courses` WHERE `Course_Id` = ".$course;
			$query = mysqli_query($conn,$sql);
			$msg = $result['Course_Title'].' ('.$result['Course_Code'].')';
			while($row = mysqli_fetch_assoc($query)){
				$sql = "SELECT `Email` FROM `profile` WHERE `User_Id` = '".$row['User_Id']."'";
				$result2 = mysqli_query($conn,$sql);
				$result2 = mysqli_fetch_assoc($result2);
				if(isset($result2['Email']) && !empty($result2['Email'])){
					$to = $result2['Email'];
					$subject = "Time Table Notification System";
					$txt = $message;
					$headers = "From: no-reply@localhost\r\n";

					$output['s'] = mail($to,$subject,$txt,$headers);
				}
			}
			$output['success'] = "true";
		break;
		default:
			$msg = $result['Course_Title'].' ('.$result['Course_Code'].')';

			$sql = "INSERT INTO `notification_statics`(`notification_type`, `course`, `sender_id`, `sent_date`) VALUES (2,'".$msg."',".$_SESSION['user_id'].",'".date("Y-m-d H:i:s")."')";
			$result = mysqli_query($conn,$sql);
			if($result){
				$id = mysqli_insert_id($conn);
				$sql = "SELECT * FROM `enrolled_courses` WHERE `Course_Id` = ".$course;
				$query = mysqli_query($conn,$sql);
				while($row = mysqli_fetch_assoc($query)){
					$sql = "INSERT INTO `notification`(`Msg`, `Checkpoint`, `User_Id`, `p_id`) VALUES ('".$message."', 1, ".$row['User_Id'].", ".$id.")";
					mysqli_query($conn,$sql);
				}
				$output['success'] = "true";
			} else {
				$output['error'] = "Faild to Insert Data";
			}
		
	}
	echo json_encode($output);
}

?>