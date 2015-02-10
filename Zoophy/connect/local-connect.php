<?php
	//local-connect.php
	
	// Variables
	$host = 'localhost';
	$user = 'root';
	$pw = '';
	$db = 'users';

	// Connect to the DB
	$dbc = mysqli_connect($host, $user, $pw, $db)
		or die('Unable to connect! (LOCAL)');

?>