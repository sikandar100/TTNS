<?php
$dir = isset($dir) ? $dir : '../';
session_start();

if(!isset($_SESSION['login_user']))
{
	header('Location: '.$dir.'index.php');
	exit;
}
?>