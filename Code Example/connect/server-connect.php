<?php
	// server-connect.php

	// Variables
	$host = 'localhost';
	$user = 'bamercad';
	$pw = 'cis425';
	$db = 'bamercad';

	// Connect to the DB
	$dbc = mysqli_connect($host, $user, $pw, $db) or die('Unable to connect! (SERVER)');

?>