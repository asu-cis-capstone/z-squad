<?php
	session_name("user");
	session_start("user");

	if (isset($_SESSION["loggedIn"]))
	{
		header('Location: profile.php');
		exit;
	}

	include('connect/dbConnect.php');

	//Confirmation Code
	$confirm_code=md5(uniqid(rand()));

	//Values from Sign Up Form
	$oFName = $_POST['fName'];
	$fName = mysqli_real_escape_string($dbc, $oFName);
	$oLName = $_POST['lName'];
	$lName = mysqli_real_escape_string($dbc, $oLName);
	$email = mysqli_real_escape_string($dbc, $_POST['email']);
	$pword = $_POST['password'];
	$oInstit = $_POST['institution'];
	$instit = mysqli_real_escape_string($dbc, $oInstit);

	//Check for existing email
	$query = "SELECT * FROM user WHERE email = '$email'";

	$result = mysqli_query($dbc, $query) or die('Email write error');

	if(mysqli_num_rows($result) != 0)
	{
		header('Location: signup.php?sc=1');
		exit;
	}

	//Insert into temp_user table
	$register = "INSERT INTO temp_user(confirmation, lastName, firstName, email, pword, institution)"
	. "VALUES('$confirm_code', '$lName', '$fName', '$email', '$pword', '$instit')";

	$result = mysqli_query($dbc, $register) or die ('Unable to Register User');

	mysqli_close($dbc);
?>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

		<!-- Link tags for CSS -->
		<link type="text/css" rel="stylesheet" href="style/main_style.css" />

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
							<div class="container">
								<?php
									if($result)
									{
										$to=$email;
										$subject="ZooPhy Registration Confirmation";
										$header="From: ZooPhy | Phylogeography for Zoonotic Disease Surveillance <support@bamercado.com>";
										$message="Your ZooPhy Confirmation Link \r\n";
										$message.="Click on this link to activate your account \r\n";
										$message.="http://www.bamercado.com/confirmation.php?passkey=$confirm_code";
										$sentmail=mail($to, $subject, $message, $header);
									}
									else
									{
										echo "<p>User Email not found.</p>";
									}

									if($sentmail)
									{
										echo "<p>Thank you for registering!</p>
										<p>We have sent you a confirmation email.</p>";
									}
									else
									{
										echo "Cannot Send Confirmation Link to your Email Address.";
									}
								?>

								
							    

							</div>
						</div>
					</main>
					
<!-- 					<nav id="sidebar">
						<div class="widget">
							
							<img src="imageFolder/logo.png" alt="Zoophy" />
						</div>

					</nav> -->
					
					<div class="clr"></div>
				</div>
			</div>
		
			
<!-- 			<div id="footerblurb">
				<div id="footerblurb-inner">
				
					<div class="column">
						<h2><span>Step 1:</span></h2>
						<p>Signup by entering your email and password</p>
					</div>	
					<div class="column">
						<h2><span>Step 2:</span></h2>
						<p>We'll send you a confirmation email</p>
					</div>
					<div class="column">
						<h2><span>Step 3:</span></h2>
						<p>Login with your new credentials and start using ZooPhy!</p>
					</div>	
					
					<div class="clr"></div>
				</div>
			</div>  -->

			<footer id="footer">
				<div id="footer-inner">
					<p>&copy; Copyright Zoophy &#124; <a href="terms.php">Terms of Use</a> &#124; <a href="privacy.php">Privacy Policy</a></p>
					<div class="clr">
					</div>
				</div>
			</footer>
		</div>
	</body>
</html>