<?php
if(!defined('INCLUDE_CHECK')){
	die('get lost.');
}
$dir = isset($dir) ? $dir : '../';
session_start();

if(!isset($_SESSION['login_user']))
{
	header('Location: '.$dir.'index.php');
	exit;
}
?>