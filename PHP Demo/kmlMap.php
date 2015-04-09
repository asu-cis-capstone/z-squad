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
		
		<!-- CSS link -->
		<link type="text/css" rel="stylesheet" href="style/main_style.css" />

		<script src="https://maps.googleapis.com/maps/api/js"></script>
		
		<script>
			function initialize() {
				var mapCanvas = document.getElementById('map-canvas');
				var mapOptions = {
					center: new google.maps.LatLng(44.5403, -78.5463),
					zoom: 8,
					mapTypeId: google.maps.MapTypeId.ROADMAP
				}
				var map = new google.maps.Map(mapCanvas, mapOptions);
			}
			google.maps.event.addDomListener(window, 'load', initialize);
		</script>
		<title>ZooPhy | Phylogeography for Zoonotic Disease Surveillance</title>	
	</head>
	
	<body>
		<div id="page">
			<header id="header">
				<div id="header-inner">	
					<div id="logo">	
					</div>
					<div id="top-nav">
						<ul><li>
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
							  		echo "<a href='logout.php'><li>Logout</li></a>";
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
					<!-- Header Spacing -->
					<div class="clr">
					</div>
				</div>
			</header>
			
			<!-- <div class="feature">
				<div class="feature-inner">
					<span class="maintext">

						 <h1>ZooPhy | Phylogeography for Zoonotic Disease Surveillance</h1>
					</span>
				</div>
			</div> -->
			<div id="banner">
				<a href="index.php"><img src="imageFolder/zoophy.png"></a>	
			</div>
		
			<div id="content">
				<div id="content-innerKML">
				
					<main id="article">
						<div id="map-canvas">
						
						</div>
					</main>
					
					<div class="clr"></div>
				</div>
				
			</div>
			
			<div class="clr"></div>
<!-- 					<nav id="sidebar">
						<div class="widget">							
						</div>
						 <img src="imageFolder/logo.png" alt="Zoophy" /> 
					</nav>	 -->
				</div>
		
<!-- 			<div id="footerblurb">
				<div id="footerblurb-inner">
				
					<div class="column">
						<p></p>
					</div>	
					
					<div class="clr"></div>
				</div>
			</div> -->
			<footer id="footer">
				<div id="footer-inner">
					<p>&copy; Copyright Zoophy &#124; <a href="terms.php">Terms of Use</a> &#124; <a href="privacy.php">Privacy Policy</a></p>
					<div class="clr"></div>
				</div>
			</footer>
		</div>
	</body>
</html>