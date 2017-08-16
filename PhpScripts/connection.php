<?
$servername = "localhost";
$user = "root";
$pass = "";

$username = $_POST['username'];
$password = $_POST['password'];
$type = $_POST['radiobtn'];

$conn = mysql_connect($servername, $user, $pass);
if(!$conn)
{
	die("Connection failed: " . mysqli_connect_error());
}
?>