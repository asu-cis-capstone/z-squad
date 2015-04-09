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
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<!-- Icon Link -->
		<link rel="icon" href="imageFolder/zoophy.ico" />
		<!-- Link tags for CSS -->
		<link type="text/css" rel="stylesheet" href="style/signup_form.css" />
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

							    <form id="signup" action="signupConfirm.php" method="post">
							    	<?php
							    		if ($_GET["sc"] ==1)
							    		{
							    			echo '<p class"logerr">The Email Address you entered has already been registered with another user.</p>';
							    		}
							    	?>
							        <div class="header">
							        
							            <h3>Sign Up</h3>
							            
							        </div>
							        
							        <div class="sep"></div>

							        <div class="inputs">
							        	<!-- First Name -->
							            <input type="text" id="fName" name="fName" placeholder="First Name" autofocus required pattern="[a-zA-Z-' ]{1,25}" />
							            <!-- Last Name -->
							            <input type="text" id="lName" name="lName" placeholder="Last Name" required pattern="[a-zA-Z-' ]{2,30}"/>
							            <!-- Email -->
							            <input type="email" id="email" name="email" placeholder="Email" 
										required maxlength="50" />
							        	<!-- Password -->
							            <input type="password" id="password" name="password" placeholder="Password" 
										required
										pattern="[a-zA-Z0-9-_!$]{5,20}" onchange="form.reenter.pattern=this.value;" />
										<!-- Re-enter -->
										<input type="password" id="reenter" name="reenter" required placeholder="Verify Password" />
										<!-- Institution -->
							            <input type="text" id="institution" name="institution" placeholder="Institution" 
										required
										pattern="[a-zA-Z0-9 ]{2,25}" />
							            
							            <div class="checkboxy">
							                <input name="cecky" id="checky" value="1" type="checkbox" required /><label class="terms">I accept the <a href="terms.html" onclick="window.open(this.href); return false">Terms of Use</a></label>
							            </div>
							            
							            <input type="submit" id="submit" value="REGISTER" />
							        
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
					<p>&copy; Copyright <a href="#">Your Site</a> &#124; <a href="#">Terms of Use</a> &#124; <a href="#">Privacy Policy</a></p>
					<div class="clr"></div>
				</div>
			</footer>
		</div>
	</body>
</html>