<?php

if(!defined("Allow_user"))
{
	die('Forbbiden Access');
}
echo "hello session";
session_start();
$dir = isset($dir) ? $dir : '../';
$check =$_SESSION['login_user'];
if(!isset($check))
{
	header('Location: '.$dir.'index.php');
	exit;
}
?>