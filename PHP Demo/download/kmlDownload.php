<?php
session_name("user");
session_start("user");

if (!isset($_SESSION["loggedIn"]))
{
	header('Location: login');
	exit;
}

$kml = 'output.kml';
$string = realpath('../kml'). DIRECTORY_SEPARATOR .$kml;
header('Content-Type: application/octet-stream');
$headerstring = 'Content-Disposition: attachment;filename='.$kml;
header($headerstring);
readfile($string);
?>