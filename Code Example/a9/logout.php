<?php
	// logout.php
	// Bryan Mercado

	session_name("customer");
	session_start("customer");
	session_unset("customer");
	session_destroy("customer");
	header('Location: login.php');
?>