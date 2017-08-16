<?
$dir = isset($dir) ? $dir : '../';

$check =$_SESSION['$login_user'];
if(!isset($check)
{
	header('Location: '.$dir.'index.php');
}
?>