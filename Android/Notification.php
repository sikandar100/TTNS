<?php
include('./connection.php');

$user = mysqli_real_escape_string($conn,$_POST['user']);

$query = mysqli_query($conn,"SELECT * FROM users WHERE Username = '".$user."'");
$user = mysqli_fetch_assoc($query);

$sql = "SELECT * FROM `notification` WHERE `User_Id` = ".$user['User_Id']." AND `Checkpoint`=1";
$query = mysqli_query($conn,$sql);

$Divs = '';
while($row = mysqli_fetch_assoc($query)){
	$date = strtotime($row['time_rec']);
	$Divs .= '<div class="message blue">
			  <h3>'.$row['Msg'].'</h3>
			  <p><b>Date: <b>'.date("l jS \of F Y h:i:s A",$date).'</p>
		</div>';
}
$sql = "SELECT * FROM `notification` WHERE `User_Id` = ".$user['User_Id']." AND `Checkpoint`=0";
$query = mysqli_query($conn,$sql);
while($row = mysqli_fetch_assoc($query)){
	$date = strtotime($row['time_rec']);
	$Divs .= '<div class="message">
			  <h3>'.$row['Msg'].'</h3>
			  <p><b>Date: </b>'.date("l jS \of F Y h:i:s A",$date).'</p>
		</div>';
}
$sql = "UPDATE `notification` SET `Checkpoint`=0 WHERE `User_Id` = ".$user['User_Id'];
$query = mysqli_query($conn,$sql);

if(empty($Divs)){
	$Divs = '<h2>No Notification</h2>';
}
echo json_encode(array( 'data' => $Divs ));

?>