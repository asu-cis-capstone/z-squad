<?php
session_name("user");
session_start("user");

if (isset($_SESSION["loggedIn"]))
{
	header('Location: profile');
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
			<div id="banner">
				<a href="index"><img src="imageFolder/zoophy.png"></a>	
			</div>
			<div id="header-inner">	
				<div id="top-nav">
					<ul>
						<li>
							Profile
							<ul>
								<?php
								if(!isset($_SESSION["loggedIn"])) {
									echo "<a href='login'><li>Login</li></a>";
								}
								?>
								<?php
								if(!isset($_SESSION["loggedIn"])) {
									echo "<a href='signup'><li>Register</li></a>";
								}	
								?>						  			
							</ul>
						</li>
						<li>
							Queries
							<ul>
								<a href="main"><li>New Query</li></a>
								<a href="viewJobs"><li>View Queries</li></a>
							</ul>
						</li>
						<a href="index"><li>About</li></a>
						<a href="contact"><li>Contact</li></a>
					</ul>
				</div>
			</div>
		</header>
		<!-- Header Spacing -->
		<div class="clr">
		</div>	
	
		<div id="content">
			<div id="content-inner">
			
				<main id="contentbar">
					<div class="article">
						<div class="container">

						    <form id="signup" action="process" method="post">
						    	<?php
						    		if ($_GET["rc"] == 1)
						    		{
						    			echo '<p class="logerr">Invalid Email Address</p>';
						    		}
						    		if ($_GET["rc"] == 2)
						    		{
						    			echo '<p class="logerr">Invalid Password</p>';
						    		}
						    		if ($_GET["rc"] == 3)
						    		{
						    			echo '<p class="logerr">Your account has been activated. Please log in below.</p>';
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
			</div>
		</div>
		

		<footer id="footer">
			<div id="footer-inner">
				<p>&copy; Copyright Zoophy &#124; <a href="terms">Terms of Use</a> &#124; <a href="privacy">Privacy Policy</a></p>
				<div class="clr">
				</div>
			</div>
		</footer>
	</div>
</body>
</html>