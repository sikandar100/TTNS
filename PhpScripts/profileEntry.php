<?php
define('INCLUDE_CHECK','hmm');
include('connection.php');
include ('session.php');

$Fname = $_POST['Fname'];
$Lname = $_POST['Lname'];
$Address = $_POST['Address'];
$ContactNo = $_POST['Contact'];
$Email = $_POST['Email'];
$RegId = $_POST['RegistrationId'];
$user = $_SESSION['login_user'];

stripslashes($Fname);
stripslashes($Lname);
stripslashes($Address);
stripslashes($ContactNo);
stripslashes($Email);
stripslashes($RegId);

mysqli_real_escape_string($conn, $Fname);
mysqli_real_escape_string($conn, $Lname);
mysqli_real_escape_string($conn, $Address);
mysqli_real_escape_string($conn, $ContactNo);
mysqli_real_escape_string($conn, $Email);
mysqli_real_escape_string($conn, $RegId);




$query = mysqli_query($conn,"SELECT Reg_Id FROM users WHERE Username = '$user'");
$row = mysqli_fetch_assoc($query);

$msg = array();
if(strcmp($row['Reg_Id'],$RegId)==0)
{
	$quer = mysqli_query($conn,"SELECT User_Id FROM users WHERE Username = '$user'");
	$id = mysqli_fetch_assoc($quer);
	$chkId = $id['User_Id'];
	$quer2 = mysqli_query($conn,"SELECT User_Id FROM profile WHERE User_Id = '$chkId'");
	$profId = mysqli_fetch_assoc($quer2);
	if( $id['User_Id'] == $profId['User_Id'] )
	{
		$sql = "UPDATE profile SET Fname='$Fname', Lname='$Lname', Address='$Address', ContactNo='$ContactNo', Email='$Email' WHERE User_Id='$chkId'";
		mysqli_query($conn, $sql);
		//header('Location: '.$dir.'editProfile.php');
		//exit;
		$msg["success"] = "Your Profile Has Been Successfully Updated:";
	}
	else
	{
		$sql = "INSERT INTO profile (Fname,Lname,Address,ContactNo,Email,User_Id) VALUES ('$Fname','$Lname','$Address','$ContactNo','$Email','$chkId')";
		mysqli_query($conn, $sql);
		//header('Location: '.$dir.'editProfile.php');
		//exit;
		$msg["success"] = "Your Profile Has Been Successfully Inserted or Created:";
	}
	
}
else
{
	//echo "Provided RegistrationID is not correct:";
	//header('Location: '.$dir.'editProfile.php');
	//exit;
	$msg["error"]= "Provided registration Id did not Match:";
}
echo json_encode($msg);

?>