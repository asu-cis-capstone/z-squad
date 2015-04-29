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
			var href="logout";
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
				<a href="index"><img src="imageFolder/zoophy.png"></a>	
			</div>
			<div id="header-inner">	
				<div id="top-nav">
					<ul>
						<li>
							Profile
							<ul>
								<?php
								if(!isset($_SESSION["loggedIn"])) {
									echo "<a href='login'><li>Login</li></a>";
								}
								?>
								<?php
								if(!isset($_SESSION["loggedIn"])) {
									echo "<a href='signup'><li>Register</li></a>";
								}	
								?>
								<?php
								if(isset($_SESSION["loggedIn"])) {
									echo "<a href='profile'><li>My Account</li></a>";
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
								<a href="main"><li>New Query</li></a>
								<a href="viewJobs"><li>View Queries</li></a>
							</ul>
						</li>
						<a href="index"><li>About</li></a>
						<a href="contact"><li>Contact</li></a>
					</ul>
				</div>
			</div>
		</header>
		<!-- Header Spacing -->
		<div class="clr">
		</div>

		<div id="content">
			<div id="content-inner">	
				<main id="contentbar">
					<div class="article">
						<h1>Contact ZooPhy</h1>
						<br />
		                <p><b><u>Mailing Address</u></b>:</p>
		                <p class="address">ASU Department of Biomedical Informatics<br />
		                    13212 East Shea Blvd<br />
		                    Scottsdale, AZ 85259 <br />
		                </p>
		                
		                <p><b>Phone</b>: 480-884-0220<br />
		                 <b>Fax</b>: 480-884-0239</p>
						<p>Email us at: <a href="#"><b>ZooPhy@asu.edu</b></a></p>
					</div>
				</main>		
				<div class="clr">
				</div>
			</div>
		</div>
	
		<footer id="footer">
			<div id="footer-inner">
				<p>&copy; Copyright Zoophy &#124; <a href="terms">Terms of Use</a> &#124; <a href="privacy">Privacy Policy</a></p>
				<div class="clr">
				</div>
			</div>
		</footer>
	</div>
</body>
</html>