<!DOCTYPE html>

<?php
	// Start a php session_cache_expire
	session_name("customer");
	session_start("customer");
	
	//Check to see if user is NOT logged in
	if(!isset($_SESSION["customer"]))
	{
		header('Location: loginPage.php');
		exit;
	}
?>
<html>
	<head>
		<meta charset="utf-8" />
		<title>Zoophy Homepage</title>
	
		<!-- Link tag for CSS -->
		<link type="text/css" rel="stylesheet" href="styleSheets/styleSheet.css" />
		
	
	</head>

	<body>
		<div id="nav">
				<img src="imageFolder/logo.png" alt="Zoophy Logo" />
				<h1>Zoophy</h1>
				<a class="h0" href="viewJobs.html">View Jobs</a>
				<a class="h0" href="profilePage.html">View Profile</a>
				<a class="h0" href="loginPage.html">Login</a>
		</div>
		
		<div id="search">
			<form id="joinform" action="logout.php" method="post">
	
			<p>
				<?php
					echo "Hello! You are logged in as " .
						$_SESSION["customer"] . ".";
				?>
			</p>
		
			<p class="submit">
				<input type="submit" value="Logout" 
				onfocus="lomsg()" 
				/>
			</p>
	
		</form>

		</div>
    
		<div id="footer">
			<p>Stub</p>
		</div>	
	</body>
</html>