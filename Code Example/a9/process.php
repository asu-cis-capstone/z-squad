<?php
	// process.php for A9
	// Bryan Mercado

	// Set up a db connection
	include('../connect/local-connect.php');

	// PHP variables for the HTML elements
	$uname = $_POST['username'];
	$pword = $_POST['password'];

	//Build the username query
	$query = "SELECT * FROM hw8 WHERE uname = '$uname'";

	//Run the username query
	$result = mysqli_query($dbc, $query) or die('Username read error!');

	//Check to see if we have any rows
	if (mysqli_num_rows($result) == 0)
	{
		header('Location: login.php?rc=1');
		exit;
	}

	// If we got here, we can verify a username

	//Build the password query
	$query = "SELECT * FROM hw8 WHERE uname = '$uname' AND pword = '$pword'";

	//Run the username query
	$result = mysqli_query($dbc, $query) or die('Password read error!');

	//Check to see if we have any rows
	if (mysqli_num_rows($result) == 0)
	{
		header('Location: login.php?rc=2');
		exit;
	}

	// If we got here, we can verify a username and password combo

	// Close the db connection
	mysqli_close($dbc);

	// Start a PHP sesion
	session_name('customer');
	session_start('customer');

	// Get and store our PHP session variables
	$row = mysqli_fetch_array($result);
	$_SESSION['customer'] = $row['name'];
	header('Location: welcome.php');
	exit;

	// This block of code must be the last block of code in this file
	// Pass a return code of 3 back to login.php
	header('Location: login.php?rc=3');
	exit;
?>