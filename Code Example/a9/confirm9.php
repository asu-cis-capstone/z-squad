<!DOCTYPE html>

<!--
confirm9.php
Bryan Mercado
CIS-425
Fall 2014
-->

<?php
	//Connect to the db (LOCAL or SERVER)
	include('../connect/local-connect.php');

	// Values from HTML
	$oname = $_POST['name'];
	$name = mysqli_real_escape_string($dbc, $oname);
	$uname  = $_POST['username'];
	$pword = $_POST['password'];
	$email = mysqli_real_escape_string($dbc, $_POST['email']);
	$prob = $_POST['probation'];
	$hot = $_POST['hotornot'];
	$smart = $_POST['smartornot'];
	$beers = $_POST['beers'];
	$comments = mysqli_real_escape_string($dbc, $_POST['consider']);


	// Build our SQL statement
	$query = "INSERT INTO hw8(name, uname, pword, email, prob, hot, smart, beers, comments)" 
	. "VALUES('$name', '$uname', '$pword', '$email', '$prob', '$hot', '$smart', '$beers', '$comments')";

	// Run the query
	$result = mysqli_query($dbc, $query) or die('Unable to write to DB!');

	// Close the SQL connection
	mysqli_close($dbc);
?>

<html lang="en">
  	
  <head>
    <!-- Meta tag -->
	<meta charset="utf-8" />
    <meta name="robots" content="noindex,nofollow" />
    <meta http-equiv="refresh" content="5; url=login.php" />

    <!-- Link tag for CSS -->
    <link type="text/css" rel="stylesheet" href="../stylesheets/css3.css" />
	
	<!-- JavaScript Tag -->
	
    <!-- Web Page Title -->
    <title>Confirmation Page</title>

  </head>

  <body>
	<div id="header">
		<p class="sh1">Bryan Mercado</p>
		<p class="sh2">Confirmation Page</p>
	</div>
	
	<div id="navigation">
		<p  class="sh2">Site Navigation</p>
		<p><a href="../index.htm">Home</a></p>
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
		<p class="bold">
			<?php
				date_default_timezone_set('MST');
				$time = date('H');
				if ($time < '12')
				{
					echo "Good Morning " . $oname . " - Thank you for registering";
				}
				elseif ($time < '17')
				{
					echo "Good Afternoon " . $oname . " - Thank you for registering";
				}
				else
				{
					echo "Good Evening " . $oname . " - Thank you for registering";
				}
			?>
		</p>

		<p>Your information has been added to our database.</p>

		<p>You may click the "Login" link below, or this page will automatically re-direct you to the Login page in 5 seconds...</p>

		<p class="bold">
			Click <a href="login.php">here</a> to login now..
		</p>
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
	