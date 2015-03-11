<?php
	include('../connect/dbConnect.php');

	$email = $_POST['email'];
	$password = $_POST['password'];

	$login = "SELECT * FROM user WHERE email = '$email'";

	$result = mysqli_query($dbc, $login) or die('Email read error');

	if (mysqli_num_rows($result) == 0)
	{
		header('Location: login.php?rc=1');
		exit;
	}

	$login = "SELECT * FROM user WHERE email = '$email' AND pword = '$password'";

	$result = mysqli_query($dbc, $login) or die ('Password read error!');

	if (mysqli_num_rows($result) == 0)
	{
		header('Location: login.php?rc=2');
		exit;
	}

	mysqli_close($dbc);

	session_name('user');
	session_start('user');

	$row = mysqli_fetch_array($result);
	$_SESSION['user'] = $row['name'];
	header('Location: main.html');
	exit;

	header('Location: login.php?rc=3');
	exit;
?>