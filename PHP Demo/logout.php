<?php
	session_name("user");
	session_start("user");
	session_unset("user");
	session_destroy("user");
	header('Location: index.php');
?>