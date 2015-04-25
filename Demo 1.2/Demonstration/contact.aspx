<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="Demonstration.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Meta Tag -->
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

	<!-- Icon Link -->
	<link rel="icon" href="imageFolder/zoophy.ico" />
		
	<!-- CSS Link -->
	<link type="text/css" rel="stylesheet" href="style/main_style.css" />
		
	<!-- Title -->
    <title>ZooPhy | Phylogeography for Zoonotic Disease Surveillance</title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="page">
			<header id="header">
				<div id="header-inner">	
					<div id="logo">	
					</div>
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
						  <a href="Default.aspx"><li>About</li></a>
						  <a href="contact.aspx"><li>Contact</li></a>
						</ul>
					</div>
					<!-- Header Spacing -->
					<div class="clr">
					</div>
				</div>
			</header>
			
			<div class="feature">
				<div class="feature-inner">
					<span class="maintext">
						<h1>ZooPhy | Phylogeography for Zoonotic Disease Surveillance</h1>
					</span>
				</div>
			</div>
	
			<div id="content">
				<div id="content-inner">	
					<main id="contentbar">
						<div class="article">
							<h1>Contact ZooPhy</h1>
							<br />
                            <p><b><u>Mailing Adress</u></b>:</p>
                            <p class="address">ASU Department of Biomedical Informatics<br />
                                13212 East Shea Blvd<br />
                                Scottsdale, AZ 85259 <br />
                            </p>
                            
                            <p><b>Phone</b>: 480-884-0220<br />
                             <b>Fax</b>: 480-884-0239</p>
							<p>Email us at: <a href="#"><b>ZooPhy@asu.edu</b></a></p>
						</div>
					</main>
					
					<nav id="sidebar">
						<div class="widget">						
						</div>
						<img src="imageFolder/logo.png" alt="Zoophy" />
					</nav>			
					
					<div class="clr">
					</div>
				</div>
			</div>
		
			<div id="footerblurb">
				<div id="footerblurb-inner">			
					
					<div class="clr">
					</div>
				</div>
			</div>
		
			<footer id="footer">
				<div id="footer-inner">
					<p>&copy; Copyright Zoophy &#124; <a href="terms.aspx">Terms of Use</a> &#124; <a href="privacy.aspx">Privacy Policy</a></p>
					<div class="clr">
					</div>
				</div>
			</footer>
		</div>
    </form>
</body>
</html>
