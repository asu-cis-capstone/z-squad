<?php
	include("connect/dbConnect.php");

	$email = $_POST['email'];
	$password = $_POST['password'];

	$query = "SELECT * FROM user WHERE email = '$email'";

	$result = mysqli_query($dbc, $query) or die('Email read error');

	if(mysqli_num_rows($result) == 0)
	{
		header('Location: login?rc=1');
		exit;
	}

	$query = "SELECT * FROM user WHERE email = '$email' AND pword = '$password'";

	$result = mysqli_query($dbc, $query) or die ('Password read error!');

	if(mysqli_num_rows($result) == 0)
	{
		header('Location: login?rc=2');
		exit;
	}

	mysqli_close($dbc);

	session_name("user");
	session_start("user");

	$row = mysqli_fetch_array($result);
	$_SESSION["loggedIn"] = $row['id'];	
	$fullName = $row['firstName'] . " " . $row['lastName'];
	$_SESSION["name"] = $fullName;
	$_SESSION["email"] = $row['email'];
	$_SESSION["institution"] = $row['institution'];
	header('Location: main');
	exit;
?>