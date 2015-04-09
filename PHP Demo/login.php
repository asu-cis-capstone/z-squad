<?php
	session_name("user");
	session_start("user");

	if (isset($_SESSION["loggedIn"]))
	{
		header('Location: profile.php');
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
		<link type="text/css" rel="stylesheet" href="style/signup_form.css" />
		
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
				<a href="index.html"><img src="imageFolder/zoophy.png"></a>	
			</div>
		
	
			<div id="content">
				<div id="content-inner">
				
					<main id="contentbar">
						<div class="article">
							<div class="container">

							    <form id="signup" action="process.php" method="post">
							    	<?php
							    		if ($_GET["rc"] == 1)
							    		{
							    			echo '<p class="logerr">Invalid Email Address</p>';
							    		}
							    		if ($_GET["rc"] == 2)
							    		{
							    			echo '<p class="logerr">Invalid Password</p>';
							    		}
							    	?>

							        <div class="header">
							        
							            <h3>Log In</h3>
							            
							        </div>
							        
							        <div class="sep"></div>

							        <div class="inputs">
							        
							            <input type="email" id="email" name="email" placeholder="Email" 
										autofocus 
										required
										pattern="[a-z0-9.$-]+@[a-z0-9-]+\.[a-z]{2,16}"
										maxlength="50" />
							        
							            <input type="password" id="password" name="password" placeholder="Password" 
										required
										pattern="[a-zA-Z0-9-_!$]{5,15}"/>
							            							            
							            <input type="submit" id="submit" value="LOG IN" />
							        
							        </div>

							    </form>

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
					<p>&copy; Copyright Zoophy &#124; <a href="terms.html">Terms of Use</a> &#124; <a href="privacy.html">Privacy Policy</a></p>
					<div class="clr"></div>
				</div>
			</footer>
		</div>
	</body>
</html>