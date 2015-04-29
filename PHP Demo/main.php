<?php
session_name("user");
session_start("user");

if (!isset($_SESSION["loggedIn"]))
{
	header('Location: login');
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

	<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true&libraries=places"></script>

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
						<!-- MAIN/CENTER -->

						<form id="search" action="query" method="post">
							<?php
							echo "<p>Welcome," . " " . $_SESSION["name"] . ".</p>";
							?>											
							<p class="search">
								<!-- Search Virus Name -->
								<label for="vName">Virus:</label>
								<select name="vName" id="vName" required size="5">
									<option Selected="True" Value="119210">H3N2 Influenza A</option>
									<option Value="114727">H1N1 pdm09 Influenza A</option>
									<option Value="102793">H5N1 Influenza A</option>
									<option Value="11292">Rabies</option>
									<option Value="11082">West Nile Virus</option>
									<option Value="11081">Zombie Virus</option>
								</select>								

								<!-- Search Virus Subtype -->
								<label for="vGene">Gene:</label>
								<select name="vGene" id="vGene" required size="5">
									<option Selected="True">PB2</option>
									<option>PB1</option>
									<option>PA</option>
									<option>HA</option>
									<option>NP</option>
									<option>NA</option>
									<option>M</option>
									<option>NS</option>
									<option>Whole Genome</option>												
								</select>

								<!-- Search Virus Host -->
								<label for="vHost">Virus Host:</label>
								<select name="vHost" id="vHost" required size="5">
									<option Selected="True" Value="32523">All</option>
									<option Value="8782">Avian</option>
									<option Value="9397">Bat</option>
									<option Value="9913">Bovine</option>
									<option Value="9836">Camel</option>
									<option Value="9673">Civet</option>
									<option Value="9615">Dog</option>
									<option Value="9685">Cat</option>
									<option Value="9793">Donkey</option>
									<option Value="9669">Ferret</option>
									<option Value="9796">Horse</option>
									<option Value="9606">Human</option>
									<option Value="319699">Mule</option>
									<option Value="10060">Muskrat</option>
									<option Value="212257">Panda</option>
									<option Value="9654">Raccoon</option>
									<option Value="9823">Swine</option>
								</select>

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
								<label for"vTime">Time Frame:</label>
								<input type="date" id="vStartDate" name="vTime" />
							</p>
						</form>
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