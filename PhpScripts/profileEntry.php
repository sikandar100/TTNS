<?

$Fname = $_POST['Fname'];
$Lname = $_POST['Lname'];
$Address = $_POST['Address'];
$ContactNo = $_POST['Contact'];
$Email = $_POST['Email'];
$Depart = $_POST['Department'];
$RegId = $_POST['RegistrationId'];
$user = $_SESSION['login_user'];
mysql_select_db("timetablenotificationsystem", $_SESSION['connection']);
$query = mysql_query("SELECT RegistrationNo FROM users WHERE Username = '$user'",$_SESSION['connection']);
$row = mysql_fetch_assoc($query);
if(strcmp($row['RegistrationNo'],$RegId)==0)
{
	echo "Mission Successfull";
}
else
{
	echo "failed";
	echo $row['RegistrationNo'];
	echo $RegId;
}

