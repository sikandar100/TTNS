<?
$servername = "localhost";
$user = "root";
$pass = "code";

$conn = mysqli_connect($servername, $user, $pass, "ttns");
var_dump($conn);
if(!$conn)
{
	die("Connection failed: " . mysqli_connect_error());
}
echo "fuck";
?>