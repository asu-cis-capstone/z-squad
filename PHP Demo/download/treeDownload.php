<?php
session_name("user");
session_start("user");

if (!isset($_SESSION["loggedIn"]))
{
	header('Location: login');
	exit;
}

$tree = 'carnivore.tree';
$string = realpath('../tree'). DIRECTORY_SEPARATOR .$tree;
header('Content-Type: application/octet-stream');
$headerstring = 'Content-Disposition: attachment;filename='.$tree;
header($headerstring);
readfile($string);
?>