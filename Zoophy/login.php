 <!DOCTYPE html>

<?php
	session_name("user");
	session_start("user");

	if (isset($_SESSION["user"]))
	{
		header('Location: profile.html')
		exit;
	}

?>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

		<!-- Icon Link -->
		<link rel="icon" href="imageFolder/zoophy.ico" />

		<!-- Link tags for CSS -->
		<link type="text/css" rel="stylesheet" href="style/signup_form.css" />
		<link type="text/css" rel="stylesheet" href="style/main_style.css" />

		<title>Signup Page</title>
		
	</head>
	<body>
		<div id="page">
			<header id="header">
				<div id="header-inner">	
					<div id="top-nav">
						<ul><li>
							Profile
							<ul>
							  <a href="login.html"><li>Login</li></a>
							  <a href="signup.html"><li>Register</li></a>
							</ul>
						  </li>
						  <li>
							Queries
							<ul>
							  <a href="login.html"><li>New Query</li></a>
							  <a href="login.html"><li>View Queries</li></a>
							</ul>
						  </li>
						  <a href="index.html"><li>About</li></a>
						  <a href="login.html"><li>Contact</li></a>
						</ul>
					</div>
					<div class="clr"></div>
				</div>
			</header>
			<div class="feature">
				<div class="feature-inner">
				<h1>ZooPhy - Signup Page</h1>
				</div>
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
							    			echo '<p class="logerr">Username not found</p>';
							    		}
							    		if ($_GET["rc"] == 2)
							    		{
							    			echo '<p class="logerr">Password not found</p>';
							    		}
							    		if ($_GET["rc"] == 3)
							    		{
							    			echo '<p class="logerr">Returned from previous</p>';
							    		}
							    	?>

							        <div class="header">
							        
							            <h3>Log In</h3>
							            
							        </div>
							        
							        <div class="sep"></div>

							        <div class="inputs">
							        
							            <input type="email" placeholder="e-mail" autofocus />
							        
							            <input type="password" placeholder="Password" />
							            							            
							            <a id="submit" href="main.html">LOG IN</a>
							        
							        </div>

							    </form>

							</div>
						</div>
					</main>
					
					<nav id="sidebar">
						<div class="widget">
							
							<img src="../Zoophy/imageFolder/logo.png" alt="Zoophy" />
						</div>

					</nav>
					
					<div class="clr"></div>
				</div>
			</div>
		
			
			<div id="footerblurb">
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
			</div> 

			<footer id="footer">
				<div id="footer-inner">
					<p>&copy; Copyright Zoophy &#124; <a href="terms.html">Terms of Use</a> &#124; <a href="privacy.html">Privacy Policy</a></p>
					<div class="clr"></div>
				</div>
			</footer>
		</div>
	</body>
</html>