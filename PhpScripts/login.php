 <?php
$servername = "localhost";
$user = "root";
$pass = "";

session_start();
$username = $_POST['username'];
$password = $_POST['password'];
$type = $_POST['radiobtn'];
$conn = mysql_connect($servername, $user, $pass);
if ($conn) 
{
	$db = mysql_select_db("timetablenotificationsystem", $conn);
	$query = mysql_query("SELECT * FROM users WHERE Username = '$username' AND password = '$password' AND Type = '$type'",$conn);
	$row = mysql_num_rows($query);
	if($row==1)
	{
		$_SESSION['$connection'] = $conn;
		$_SESSION['login_user']=$username;
		header("Location:../welcome.php");
	}
	else
	{
		mysql_close($conn);
	}
}
else
{
	die("Connection failed: " . mysqli_connect_error());
}
?> 