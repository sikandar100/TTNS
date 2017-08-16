<?php

$servername = "localhost";
$user = "root";
$pass = "";

$conn = mysqli_connect($servername, $user, $pass,'ttns');
if(!$conn)
{
	die("Connection failed: " . mysqli_connect_error());
}
?>