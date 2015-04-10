<?php
session_name("user");
session_start("user");
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
	<div id="content-inner">	
		<main id="contentbar">
			<div class="article">
				<h1>About ZooPhy</h1>
				<p>ZooPhy is a public health informatics application for phylogeography of zoonotic RNA viruses . The intended users of ZooPhy are health agencies, agriculture agencies, wildlife agencies, and any other researcher interest in surveillance of zoonotic diseases in either animals or humans. Phylogeography of viruses, such as zoonotic viruses (animal-human transmission) can support public health and disease surveillance. For example, it can help epidemiologists answer questions such as ‘For a particular geographical area and timeframe:</p>
					<ul>
						<li>Which animal hosts most impact virus propagation?</li>
						<li>For a particular virus, what was the migration path?</li>
						<li>Where is it going?</li>
						<li>What was the trend of the estimated viral population within a specific animal host?</li>
					</ul>
				<p>Once it is live, ZooPhy will be freely available to the public with the hope that it will help enhance population surveillance of human and animal zoonotic diseases and inform public health decision making.</p>
			</div>
		</main>
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