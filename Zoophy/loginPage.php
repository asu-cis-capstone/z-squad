<!DOCTYPE html>

<?php
	// Start a php session_cache_expire
	session_name("customer");
	session_start("customer");
	
	if(isset($_SESSION["customer"]))
	{
		header('Location: welcome.php');
		exit;
	}
?>

<html>
	<head>
		<meta charset="utf-8" />
		<title>Zoophy Login</title>
	
		<!-- Link tags for CSS -->
		<link type="text/css" rel="stylesheet" href="styleSheets/stylesheet.css" />
		
		
	
	</head>

	<body>
		<div id="signupbanner">
				<img src="imageFolder/logo.png" alt="Zoophy Logo" />
				<h1>Zoophy</h1>
		</div>
	
		<div id="userinfo">
			<form id="signup" action="process.php" method="post">
			<p class="fh1">Sign-in:</p>
			
			<?php
			// Check return code from process.php
			if($_GET["rc"]==1)
			{
				echo '<p class="logger">Username not found!</p>';
			}
			if($_GET["rc"]==2)
			{
				echo '<p class="logger">Password not found!</p>';
			}
			if($_GET["rc"]==3)
			{
				echo '<p class="logger">Return from process.php...</p>';
			}
			?>
	
				<p>	
					<!-- Email -->
					<label for="email">E-mail address:</label>
					<input type="text" id="email" name="email" />
					<br />
					
					<!-- Password -->
					<label for="password">Password:</label>
					<input type="text" id="password" name="password" />
					<br />
				</p>
				
				<p class="submit">
					<input type="submit" value="Submit"
					<button>Submit</button>
					<p>
					New to Zoophy? 
					<a href="signupPage.html">Signup</a>
					</p>
				</p>
		</form>
		</div>
    
		<div id="footer">
			<p>Stub</p>
		</div>
	</body>
</html>