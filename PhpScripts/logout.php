<?php
$dir = "../";
session_start();

session_destroy();

header("refresh:1;url=".$dir."index.php");

exit;
?>