<?php
define("Allow_user", true);
include('connection.php');
include ('session.php');

$Fname = $_POST['Fname'];
$Lname = $_POST['Lname'];
$Address = $_POST['Address'];
$ContactNo = $_POST['Contact'];
$Email = $_POST['Email'];
$Depart = $_POST['Department'];
$RegId = $_POST['RegistrationId'];
$user = $_SESSION['login_user'];

stripslashes($Fname);
stripslashes($Lname);
stripslashes($Address);
stripslashes($ContactNo);
stripslashes($Email);
stripslashes($Depart);
stripslashes($RegId);

mysqli_real_escape_string($con, $Fname);
mysqli_real_escape_string($con, $Lname);
mysqli_real_escape_string($con, $Address);
mysqli_real_escape_string($con, $ContactNo);
mysqli_real_escape_string($con, $Email);
mysqli_real_escape_string($con, $Depart);
mysqli_real_escape_string($con, $RegId);




$query = mysqli_query($conn,"SELECT RegistrationNo FROM users WHERE Username = '$user'");
$row = mysqli_fetch_assoc($query);
if(strcmp($row['RegistrationNo'],$RegId)==0)
{
	$quer = ($conn,"SELECT UserId FROM users WHERE Username = '$user'");
	$id = mysqli_fetch_assoc($quer);
	$quer2 = ($conn,"SELECT UserId FROM Profile WHERE UserId = '$id['UserId']'");
	$profId = mysqli_fetch_assoc($quer2);
	if( $id['UserId'] == $profId['UserId'] )
	{
		$sql = "UPDATE profile SET Firstname='$Fname', LastName='$Lname', Address='$Address', ContactNo='ContactNo', Email='$Email', Department='Department' WHERE UserId='$id['UserId']'";
		mysqli_query($conn, $sql);
		
	}
	else
	{
		$sql = "INSERT INTO users (Firstname,LastName,Address,ContactNo,Email,Department,$UserId) VALUES ('$Fname','$Lname','$Address','ContactNo','$Email','Department','$id['UserId']')";
		mysqli_query($conn, $sql);
	}
	
}
else
{
	echo "Provided RegistrationID is not correct:";
	
}