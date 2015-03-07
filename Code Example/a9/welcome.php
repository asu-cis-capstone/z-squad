<!DOCTYPE html>

<!--
welcome.php
CIS-425/78019
Fall 2014
Bryan Mercado
-->

<?php
	// Start a PHP session
	session_name("customer");
	session_start("customer");

	// Check to see if user is NOT logged in
	if (!isset($_SESSION["customer"]))
	{
		header('Location: login.php');
		exit;
	}
?>

<html lang="en">
  	
  <head>
    <!-- Meta tag -->
    <meta charset="utf-8" />
	<meta name="robots" content="noindex,nofollow" />

    <!-- Link tag for CSS -->
    <link type="text/css" rel="stylesheet" href="../stylesheets/css3.css" />

	<!-- JavaScript Tags -->
	<script type="text/javascript" src="../jscode/msgs.js"></script>

    <!-- Web Page Title -->
    <title>Mercado Welcome Page</title>

  </head>

  <body>
	<div id="header">
		<p class="sh1">Bryan Mercado</p>
		<p class="sh2">Customer Welcome Page</p>
	</div>

	<div id="navigation">
		<p  class="sh2">Site Navigation</p>
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
		<p><a href="http://asunews.asu.edu/sports/"
			onclick="window.open(this.href); return false;">
			<img src="../images/sparky.gif" alt="Sparky" /></a></p>
		<p><a href="http://www.kournikova.com"
			onclick="window.open(this.href); return false;">
			<img src="../images/anna.jpg" alt="Anna" /></a></p>
	</div>
	
	<div id="main">
		<p class="bold">Login successful!</p>
	</div>
	
	<form id="joinform" action="logout.php" method="post">

		<p>
			<?php
				echo "Hello! You are logged in as " . $_SESSION["customer"] . ".";
			?>
		</p>

		<p class="submit">
			<input type="submit" value="Log me out!" 
			onfocus="lomsg()" />
		</p>
	</form>

	<div id="messages">
		<p></p>
	</div>
	
		<div id="footer">
			<p>
				<img src="../images/html5.png"	alt="Valid HTML5 Icon"	/>
				<a href="../em/emform.htm">
					<img src="../images/em3.png"	alt="HTML Email Icon"	/></a>
				<img src="../images/css3.png"	alt="Valid CSS3 Icon"	/>
				<br	/>
				&copy;2014, Bryan Mercado
			</p>
		</div>	
	
  </body>

</html>
	