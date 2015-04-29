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
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<!-- Icon Link -->
	<link rel="icon" href="imageFolder/zoophy.ico" />
	<!-- Link tags for CSS -->
	<link type="text/css" rel="stylesheet" href="style/signup_form.css" />
	<link type="text/css" rel="stylesheet" href="style/main_style.css" />

	<!-- Java Sript -->
	<script>
		function confLogout()
		{
			var href="logout";
			if (confirm("Are you sure you want to Logout of ZooPhy?") == true)
			{
				window.location=href;
			}
		}
	</script>
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
								<?php
								if(isset($_SESSION["loggedIn"])) {
									echo "<a href='profile'><li>My Account</li></a>";
								}	
								?>
								<?php
								if(isset($_SESSION["loggedIn"])) {
									echo "<a href='#' onclick=\"confLogout();\"><li>Logout</li></a>";
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
							<form id="signup" action="signupConfirm" method="post">
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
										<input name="cecky" id="checky" value="1" type="checkbox" required /><label class="terms">I accept the <a href="terms" onclick="window.open(this.href); return false">Terms of Use</a></label>
									</div>

									<input type="submit" id="submit" value="REGISTER" />
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