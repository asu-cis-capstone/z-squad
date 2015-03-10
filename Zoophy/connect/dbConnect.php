<?php
	// Variables
	$host = 'localhost';
	$user = 'bamercad';
	$pw = 'zsquad440';
	$db = 'bamercad_zoophy';

	// Connect to the DB
	$dbc = mysqli_connect($host, $user, $pw, $db) or die('Unable to connect! (SERVER)');
?>