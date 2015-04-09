<?php
	// Variables
	$host = 'metro704.hostmetro.com';
	$user = 'bamercad';
	$pw = 'zsquad440';
	$db = 'bamercad_zoophy';
	$port = '3306';

	// Connect to the DB
	$dbc = mysqli_connect($host, $user, $pw, $db, $port) or die('Unable to connect! (SERVER)');
?>