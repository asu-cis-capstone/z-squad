<?php
	//server-connect.php
	
	// Variables
	$host = 'localhost';
	$user = 'mnoghreh';
	$pw = 'cis425';
	$db = 'mnoghreh';

	// Connect to the DB
	$dbc = mysqli_connect($host, $user, $pw, $db)
		or die('Unable to connect! (SERVER)');
?>