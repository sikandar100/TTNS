<?
$check =$_SESSION['$login_user'];
if(!isset($check)
{
	header('Location:../index.php');
}
?>