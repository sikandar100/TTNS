<?php
if( isset($_POST['n']) && isset($_POST['e']) && isset($_POST['m']) ){
	$n = $_POST['n']; // HINT: use preg_replace() to filter the data
	$e = $_POST['e'];
	$m = nl2br($_POST['m']);
	$to = "ch.sikandar100@gmail.com";
	$from = $e;
	$subject = 'Contact Form Message';
	$message = '<b>Name:</b> '.$n.' <br><b>Email:</b> '.$e.' <p>'.$m.'</p>';
	$headers = "From: $from\n";
	$headers .= "MIME-Version: 1.0\n";
	$headers .= "Content-type: text/html; charset=iso-8859-1\n";
	$msg = array();
	if( mail($to, $subject, $message, $headers) ){
		$msg["success"] = "Worked";
	} else {
		$msg["error"] = "The server failed to send the message. Please try again later.";
	}
	echo json_encode($msg);
}
?>