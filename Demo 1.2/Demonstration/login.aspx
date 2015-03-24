<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Demonstration.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Meta Tag -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

	<!-- Icon Link -->
	<link rel="icon" href="imageFolder/zoophy.ico" />

    <!-- Link tags for CSS -->
	<link type="text/css" rel="stylesheet" href="Style/signup_form.css" />
	<link type="text/css" rel="stylesheet" href="Style/main_style.css" />

    <title>ZooPhy | Login</title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="page">
			<header id="header">
				<div id="header-inner">	
					<div id="top-nav">
						<ul><li>
							Profile
							<ul>
							  <a href="login.aspx"><li>Login</li></a>
							  <a href="signup.aspx"><li>Register</li></a>
							</ul>
						  </li>
						  <li>
							Queries
							<ul>
							  <a href="login.aspx"><li>New Query</li></a>
							  <a href="login.aspx"><li>View Queries</li></a>
							</ul>
						  </li>
						  <a href="about.aspx"><li>About</li></a>
						  <a href="contact.aspx"><li>Contact</li></a>
						</ul>
					</div>
					<div class="clr"></div>
				</div>
			</header>
			<div class="feature">
				<div class="feature-inner">
				<h1>ZooPhy | Phylogeography for Zoonotic Disease Surveillance</h1>
				</div>
			</div>
		
	
			<div id="content">
				<div id="content-inner">
				
					<main id="contentbar">
						<div class="article">
							<div class="container">

							    <form id="signup" action="" method="post">

							        <div class="header">
							            <h3>Log In</h3>
							        </div>
							        
							        <div class="sep"></div>

							        <div class="inputs">
							        
							            <input type="text" id="email" name="email" placeholder="Email" 
										autofocus 
										required
										pattern="[a-z0-9.$-]+@[a-z0-9-]+\.[a-z]{2,16}"
										maxlength="50" />
							        
							            <input type="password" id="password" name="email" placeholder="Password" 
										required
										pattern="[a-zA-Z0-9-_!$]{5,15}"/>
							            							            
							            <input type="submit" id="submit" value="LOG IN" />
							        
							        </div>

							    </form>

							</div>
						</div>
					</main>
					
					<nav id="sidebar">
						<div class="widget">
							
							<img src="imageFolder/zoophy.ico" alt="Zoophy" />
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
					<p>&copy; Copyright Zoophy &#124; <a href="terms.aspx">Terms of Use</a> &#124; <a href="privacy.aspx">Privacy Policy</a></p>
					<div class="clr"></div>
				</div>
			</footer>
		</div>
    </form>
</body>
</html>
