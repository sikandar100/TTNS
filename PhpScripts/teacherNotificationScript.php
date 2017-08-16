<?php
$dir = isset($dir) ? $dir : '../';
include ('session.php');
include('connection.php');

if(isset($_POST['courses']) && isset($_POST['notification'])){
	$output = array();
	$course = (int) mysqli_real_escape_string($conn, $_POST['courses']);
	$message = mysqli_real_escape_string($conn, $_POST['message']); 

	$sql = "SELECT * FROM `courses` WHERE `Course_Id` = ".$course;
	$result = mysqli_query($conn,$sql);
	$result = mysqli_fetch_assoc($result);
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
	echo json_encode($output);
} elseif(isset($_POST['dept']) && isset($_POST['semester'])){
	$output = array();
	$dept = (int) mysqli_real_escape_string($conn, $_POST['dept']);
	$semester = mysqli_real_escape_string($conn, $_POST['semester']);
	$sql = "SELECT `Semester_Id` FROM `semester` WHERE `Semester_Name` = '".$semester."' AND `Dept_Id` = ".$dept;
	$result = mysqli_query($conn, $sql);
	if($result){
		$result = mysqli_fetch_assoc($result);
		$sql = "SELECT * FROM `courses` WHERE `Semester_Id` = ".$result['Semester_Id'];
		$query = mysqli_query($conn,$sql);
		$opt = "";
		while($row = mysqli_fetch_assoc($query)){
			$opt .= '<option value="'.$row['Course_Id'].'">'.$row['Course_Title'].' ('.$row['Course_Code'].')'.'</option>';
		}
		
		if(!empty($opt)){
			$output['success'] = 'true';
			
			$output['form'] = '<form class="form-horizontal col-md-12" action="PHPScripts/teacherNotificationScript.php" method="post" onsubmit="submitForm2(); return false;">
									<div class="form-group">
										<label for="semester" class="col-md-4 control-label">Course:</label>
										<div class="col-md-8">
											<select class="form-control" name="courses" id="courses" required>'.$opt.'
											</select>
										</div>
									</div>
									<div class="form-group">
										<label for="semester" class="col-md-4 control-label">Message:</label>
										<div class="col-md-8">
											<textarea class="form-control" rows="4" name="message" id="message" required></textarea>
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-10">
											<button type="submit" class="btn btn-default" value="notification" name="notification" id="notification">Send Notification</button>
										</div>
									</div>
									<p id="status2" class="col-md-12"></p>
								</form>';
		} else {
			$output['error'] = "No Course Exist for this Combination";
		}
	} else {
		$output['error'] = "Invalid Combination";
	}
	echo json_encode($output);
}

?>