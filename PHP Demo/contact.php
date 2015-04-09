<?php
	session_name("user");
	session_start("user");

	if (!isset($_SESSION["loggedIn"]))
	{
		header('Location: login.php');
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
				<a href="index.php"><img src="imageFolder/zoophy.png"></a>	
			</div>
	
			<div id="content">
				<div id="content-inner">	
					<main id="contentbar">

<!-- 					        <div class="inputs">

					        	<h3><?php echo $_SESSION["name"] ?></h3>
					        	<h3><?php echo $_SESSION["email"] ?></h3>					        	
					        	<label for="institution"><?php echo $_SESSION["institution"] ?></label>

					            <div class="checkboxy">
					                <input name="cecky" id="checky" value="1" type="checkbox" required /><label class="terms">I accept the <a href="terms.html" onclick="window.open(this.href); return false">Terms of Use</a></label>
					            </div>
					            Comments:
					            <br />
					            <textarea name="comments" id="comments" rows="2" cols="49" required maxlength "500" title="500 character limit.."></textarea>

					            <input type="submit" id="submit" value="REGISTER" />
					        
					        </div>

					    </form> -->

					    <form id="signup" action="support@asu" method="post">
					        <div class="header">
					        
					            <h3>Comments? Questions? Feedback?</h3>
					            
					        </div>
					        
					        <div class="sep"></div>


					        <div class="inputs">
					        	<h3><?php echo $_SESSION["name"] ?></h3>
					        	<h3><?php echo $_SESSION["email"] ?></h3>					        	
					        	<label for="institution"><?php echo $_SESSION["institution"] ?></label>

					            <div class="checkboxy">
					                <input name="cecky" id="checky" value="1" type="checkbox" required /><label class="terms">I accept the <a href="terms.html" onclick="window.open(this.href); return false">Terms of Use</a></label>
					            </div>
					            <br />
					            <textarea name="comments" id="comments" rows="5" cols="50" required maxlength "500" placeholder="Comments (500 word max)..."></textarea>
					            <br />
					            <input type="submit" id="submit" value="Submit" />					            
					        </div>
					        </div>

					    </form>
					</main>
					
<!-- 					<nav id="sidebar">
						<div class="widget">						
						</div>
						<img src="imageFolder/logo.png" alt="Zoophy" />
					</nav>	 -->		
					
					<div class="clr">
					</div>
				</div>
			</div>
		
<!-- 			<div id="footerblurb">
				<div id="footerblurb-inner">			
					
					<div class="clr">
					</div>
				</div>
			</div> -->
		
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