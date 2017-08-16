<?php

session_start();

session_destroy();

header("refresh:3;url=".$dir."index.php");

exit;
?>