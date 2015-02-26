<!DOCTYPE html>

<!--
Mehrad Noghrehchi
A9- Assignment 9- Login.php
CIS-425
Fall 2014
-->

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

<html lang="en">
  	
  <head>
    <!-- Meta tag -->
	<meta name="robots" content="noindex,nofollow" />
    <meta charset="utf-8" />

    <!-- Link tag for CSS -->
    <link type="text/css" rel="stylesheet" href="../stylesheet/css3.css" />

	<!-- JavaScript Tags -->
	<script type="text/javascript" src="../jscode/msgs.js"></script>
	
	<!-- Favicon Element -->
	<link rel="icon" href="../images/favicon.ico" />

    <!-- Web Page Title -->
    <title>Noghrehchi Login Page</title>

  </head>

  <body>
	<div id="header">	
		<p class="sh1">Mehrad Noghrehchi</p>
		<p class="sh2">Login</p>
	</div>
	
	<div id="navigation">
		<p class="sh2">Site Navigation</p>
		<p><a href="../">Home</a></p>
		<p><a href="../a2/">A2</a></p>
		<p><a href="../a3/">A3</a></p>
		<p><a href="../a4/">A4</a></p>
		<p><a href="../a5/">A5</a></p>
		<p><a href="../a6/">A6</a></p>
		<p><a href="../a7/">A7</a></p>
		<p><a href="../a8/">A8</a></p>
		<p><a href="../a9/">A9</a></p>
		<p><a href="../project/">Project</a></p>
	</div>
	
	<div id="external">
		<p class="sh2">External Links</p>
		<p><a href="http://www.redbull.com">Red Bull</a></p>
		
		<p><a href="https://asunews.asu.edu/sports/" 
			onclick="window.open(this.href); return false">
			<img src="../images/sparky.gif" alt="Sparky" /> </a></p>
			
		<p><a href="http://kournikova.com" 
			onclick="window.open(this.href); return false">
			<img src="../images/anna.jpg" alt="My girlfriend" /> </a></p>

	</div>
	
	<div id="main">
		<p class="bold">Enter your username and password below to login</p>
	</div>
	
	<form id="joinform" action="process.php" method="post">
		<p class="fh1">
			Please log in here:
		</p>
	
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
			<!-- Username -->
			<label for="username">Username</label>
			<input type="text" id="username" name="username" 
			required
			pattern="[a-zA-Z0-9-_!$]{4,15}"
			title="Username: 4-15 letters, u/l, special chars -_!$"
			onfocus="unmsg()" 
			placeholder="Choose cool username..."
			autofocus />
			
			<br />
			
			<!-- Password -->
			<label for="password">Password</label>
			<input type="password" id="password" name="password" 
			required
			pattern="[a-zA-Z0-9-_!$]{5,15}"
			title="Password: 5-15 letters, u/l, special chars -_!$"
			onfocus="pwmsg()" 
			placeholder="Enter NSA proof password..."
			/>
			<br />
		</p>
	
		<p class="submit">
			<input type="submit" value="Log In" 
			onfocus="limsg()" 
			/>
				 
			
			<span class="reset">
				<input type="reset" value="Clear Form" 
				onclick="history.go(0)"
				onfocus="rtmsg()" 
				/>
					
			</span>
		</p>
	
	</form>
	<div id="messages">
		<p></p>
	</div>
	
	
		<div id="footer">
			<p>
				<img src="../Images/css3.Png" alt="Valid CSS 3 Icon" />
				<a href="../em/emform.htm">
					<img src="../images/em3.png" alt="HTML Email Icon" />
				</a>
				<img src="../Images/html5.png" alt="Valid HTML 5 Icon" />
				<br />
				&copy;2014, Mehrad Noghrehchi
			</p>
		</div>

	
	
  </body>

</html>