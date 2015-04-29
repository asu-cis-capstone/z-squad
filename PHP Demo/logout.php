<?php
	session_name("user");
	session_start("user");
	session_unset("user");
	session_destroy();
	header('Location: index');
?>