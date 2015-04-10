<?php
session_name("user");
session_start("user");

if (!isset($_SESSION["loggedIn"]))
{
	header('Location: login.php');
	exit;
}
?>

<!DOCTYPE html>
<html>
<head>
	<!-- Meta Tag -->
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

	<!-- Icon Link -->
	<link rel="icon" href="imageFolder/zoophy.ico" />

	<!-- CSS Link -->
	<link type="text/css" rel="stylesheet" href="style/main_style.css" />

	<!-- jQuery Link -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js">
	</script>

	<!-- jQuery Search Function-->
	<script>
		$(document).ready(function(){
			$("#advSearchLink").click(function(){
				$("#advSearch").toggle();
			});
		});
	</script>

	<!-- Java Sript -->
	<script>
		function confLogout()
		{
			var href="logout.php";
			if (confirm("Are you sure you want to Logout of ZooPhy?") == true)
			{
				window.location=href;
			}
		}
	</script>
	<!-- Title -->
	<title>ZooPhy | Phylogeography for Zoonotic Disease Surveillance</title>	
</head>

<body>
	<div id="page">
		<header id="header">
			<div id="banner">
				<a href="index.php"><img src="imageFolder/zoophy.png"></a>	
			</div>
			<div id="header-inner">	
				<div id="top-nav">
					<ul>
						<li>
							Profile
							<ul>
								<?php
								if(!isset($_SESSION["loggedIn"])) {
									echo "<a href='login.php'><li>Login</li></a>";
								}
								?>
								<?php
								if(!isset($_SESSION["loggedIn"])) {
									echo "<a href='signup.php'><li>Register</li></a>";
								}	
								?>
								<?php
								if(isset($_SESSION["loggedIn"])) {
									echo "<a href='profile.php'><li>My Account</li></a>";
								}	
								?>
								<?php
								if(isset($_SESSION["loggedIn"])) {
									echo "<a href='#' onclick=\"confLogout();\"><li>Logout</li></a>";
								}	
								?>							  			
							</ul>
						</li>
						<li>
							Queries
							<ul>
								<a href="main.php"><li>New Query</li></a>
								<a href="viewJobs.php"><li>View Queries</li></a>
							</ul>
						</li>
						<a href="index.php"><li>About</li></a>
						<a href="contact.php"><li>Contact</li></a>
					</ul>
				</div>
			</div>
		</header>
		<!-- Header Spacing -->
		<div class="clr">
		</div>
	</div>
</body>

<div id="content">
	<div id="content-inner-jobs">
		<div class="currentjobs">
			<h2>Current Jobs</h2>
			<div id="daterun">
				<p>Date Run: 12/24/2014</p>
				<p>Status: complete</p>
				<p>Query Info: </p>
				<p>Percent complete: 100%</p>
				<p><a href="kml.html">Phylogeographic Map</a></p>
			</div>
		</div>
		<div class="clr">
		</div>
	</div>
</div>

<footer id="footer">
	<div id="footer-inner">
		<p>&copy; Copyright Zoophy &#124; <a href="terms.php">Terms of Use</a> &#124; <a href="privacy.php">Privacy Policy</a></p>
		<div class="clr">
		</div>
	</div>
</footer>
</body>
</html>