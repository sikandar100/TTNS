<?php
include('connection.php');

$user = mysqli_real_escape_string($conn,$_POST['userName']);

$query = mysqli_query($conn,"SELECT * FROM users WHERE Username = '".$user."'");
$user = mysqli_fetch_assoc($query);

$sql = "SELECT * FROM `notification` WHERE `User_Id` = ".$user['User_Id']." AND `Checkpoint`=1";
$query = mysqli_query($conn,$sql);

$notifications = mysqli_num_rows($query);

echo $notifications;

?>