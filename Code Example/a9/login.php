<!DOCTYPE html>

<!--
login.php
CIS-425/78019
Fall 2014
Bryan Mercado
-->

<?php
	// Start a PHP session
	session_name("customer");
	session_start("customer");

	if (isset($_SESSION["customer"]))
	{
		header('Location: welcome.php');
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
    <title>Mercado Login Page</title>

  </head>

  <body>
	<div id="header">
		<p class="sh1">Bryan Mercado</p>
		<p class="sh2">Customer Login Page</p>
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
		<p class="bold">Enter your Username and Password below to login!</p>
	</div>
	
	<form id="joinform" action="process.php" method="post">
		<p class="fh1">Please Login Here:</p>
		
		<?php
			// Check return code from process.php
			if ($_GET["rc"] == 1)
			{
				echo '<p class="logerr">Username not found!</p>';
			}
			if ($_GET["rc"] == 2)
			{
				echo '<p class="logerr">Password not found!</p>';
			}
			if ($_GET["rc"] == 3)
			{
				echo '<p class="logerr">Returned from process.php...</p>';
			}
		?>

		<p>
			<!-- Username -->
			<label for="username">Username:</label>
			<input type="text" id="username" name="username" 
			required onfocus="umsg()" title="Username: 4-15 chars, u/l case letters, 0-9, and - _ or $ only!"
			pattern="[a-zA-Z0-9-_!$]{4,15}"	
			placeholder="Username..."
			autofocus />
			<br />
			
			<!-- Password -->
			<label for="password">Password:</label>
			<input type="password" id="password" name="password" 
			required onfocus="pmsg()" title="Password: 5-15 chars, u/l case letters, 0-9, and - _ or $ only!"
			pattern="[a-zA-Z0-9-_!$]{5,15}"
			placeholder="Password..." />
			<br />
		</p>
		<p class="submit">
			<input type="submit" value="Log me in!" 
			onfocus="limsg()" />
			
			<span class="reset">
				<input type="reset" value="Clear Form!" onclick="history.go(0)" 
				onfocus="cmsg()" />
			</span>	
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
	