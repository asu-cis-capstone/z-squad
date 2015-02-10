<?php
	// logout.php
	// Mehrad Noghrehchi
	
	session_name("customer");
	session_start("customer");
	session_unset("customer");
	session_destroy("customer");
	header('Location: loginPage.php');
	
	
?>