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

		<!-- Title -->
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
				<div id="content-inner">	
					<main id="contentbar">
						<div class="article">
							<!-- MAIN/CENTER -->
						
									 <form id="search" action="#" method="#">
											<?php
												echo "<p>Welcome," . " " . $_SESSION["name"] . ".</p>";
											?>											
											<p class="search">
												<!-- Search Virus Name -->
												<label for="vName">Virus Name:</label>
												<input type="text" id="vName" name="vName"
												required autofocus/>

												<!-- Search Virus Subtype -->
												<label for="vSubtype">Virus Subtype:</label>
												<input type="text" id="vSubtype" name="vSubtype"
												required/>

												<!-- Search Virus Host -->
												<label for="vHost">Virus Host:</label>
												<input type="text" id="vHost" name="vHost"
												required/>
											</p>
											<p class="submit">
												<input type="submit" value="Search Virus" />
												<span class="reset">
													<input type="reset" value="Clear Search" onclick="history.go(0)" />
												</span>
											</p>

											<a id="advSearchLink" href="#">Advanced Search</a>
											<p id="advSearch">

												<!-- Geographic Location -->
												<label for="vGeo">Geographic Location:</label>
												<input type="text" id="vGeo" name="vGeo" />

												<!-- Time Period -->
												<label for"vTime">Time Period:</label>
												<input type="date" id="vStartDate" name="vTime" />
											</p>
										</form>
									
								
						</div>
					</main>
					
<!-- 					<nav id="sidebar">
						<div class="widget">						
						</div>
						<img src="imageFolder/logo.png" alt="Zoophy" />
					</nav>	 -->		
					
					<div class="clr">
					</div>
				</div>
			</div>
		
<!-- 			<div id="footerblurb">
				<div id="footerblurb-inner">
				
					<div class="column">
						<h2><span>Search</span></h2>
						<p>Use Zoophy to query multiple databases 
							of virus genomes across the nation.</p> 
					</div>	
					<div class="column">
						<h2><span>Find</span></h2>
						<p>Find virus trajectory by selecting specific RNA sequences.</p> 
					</div>
					<div class="column">
						<h2><span>Map It</span></h2>
						<p>Once complete, recceive a map over 
							Google Earth of your queries results.</p> 
					</div>	
					
					<div class="clr"></div>
				</div>
			</div> -->
		
			<footer id="footer">
				<div id="footer-inner">
					<p>&copy; Copyright Zoophy &#124; <a href="terms.html">Terms of Use</a> &#124; <a href="privacy.html">Privacy Policy</a></p>
					<div class="clr">
					</div>
				</div>
			</footer>
		</div>
	</body>
</html>