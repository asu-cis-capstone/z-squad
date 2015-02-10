<?php
	// process.php
	// Mehrad Noghrehchi
	
	
	// Set up DB connection...
	include('../connect/local-connect.php');
	
	// PHP varibales for the HTML elements
	$email = $_POST['email'];
	$pword = $_POST['password'];
	
	// Build the email query
	$query = "SELECT * FROM accounts WHERE pass = '$email'";
	
	// Run the email query
	$result = mysqli_query($dbc, $query) or die('Email read error!');
	
	// Check to see if we got any rows
	if (mysqli_num_rows($result) == 0)
	{
		header('Location: loginPage.php?rc=1');
		exit;
	}
	
	// If we got here, we can verify email
	// Build the password query
	$query = "SELECT * FROM accounts WHERE email = '$email' AND password = '$pword'";
	
	// Run the username query
	$result = mysqli_query($dbc, $query) or die('Password read error!');
	
	// Check to see if we got any rows
	if (mysqli_num_rows($result)==0)
	{
		header('Location: loginPage.php?rc=2');
		exit;
	}
	
	// If we get here, we can verify a email and password
	
	// Close the DB connection
	mysqli_close($dbc);
	
	// Start a PHP session
	session_name('customer');
	session_start('customer');
	
	// Get and store our PHP session variables
	$row = mysqli_fetch_array($result);
	$_SESSION['customer'] = $row['name'];
	header('Location: welcome.php');
	exit;

	
	// This block of code must be the last block of code in this file
	// Pass a return code of 3 back to login.php
	header('Location: loginPage.php?rc=3');
	exit;

?>