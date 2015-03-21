<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="Demonstration.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Meta Tag -->
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

	<!-- Icon Link -->
	<link rel="icon" href="imageFolder/zoophy.ico" />
		
	<!-- CSS Link -->
	<link type="text/css" rel="stylesheet" href="Style/main_style.css" />

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
							  <a href="main.aspx"><li>New Query</li></a>
							  <a href="viewJobs.aspx"><li>View Queries</li></a>
							</ul>
						  </li>
						  <a href="about.aspx"><li>About</li></a>
						  <a href="contact.aspx"><li>Contact</li></a>
						</ul>
					</div>
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
							<h1>About ZooPhy</h1>
							<p>ZooPhy is a public health informatics application for phylogeography of zoonotic RNA viruses . The intended users of ZooPhy are health agencies, agriculture agencies, wildlife agencies, and any other researcher interest in surveillance of zoonotic diseases in either animals or humans. Phylogeography of viruses, such as zoonotic viruses (animal-human transmission) can support public health and disease surveillance. For example, it can help epidemiologists answer questions such as ‘For a particular geographical area and timeframe:
								<br>
								<ul>
									<li>Which animal hosts most impact virus propagation?</li>
									<li>For a particular virus, what was the migration path?</li>
									<li>Where is it going?</li>
									<li>What was the trend of the estimated viral population within a specific animal host?</li>
								</ul>
								<br />
								Once it is live, ZooPhy will be freely available to the public with the hope that it will help enhance population surveillance of human and animal zoonotic diseases and inform public health decision making.
							</p>
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
					<!-- <div class="column">
						<h2><span>Bayesian phylogeographic trees</span></h2>
						<p>ZooPhy includes its own webservice for Bayesian Evolutionary Analysis by Sampling Trees (BEAST) to produce different models of evolution.</p>
						</div>
										
					<div class="column">
						<h2><span>Bayesian skyline plots</span></h2>
						<p>Through BEAST, ZooPhy can produce Bayesian skyline plots for analysis of population genetics and estimates of viral population over time.</p>
					</div>
					 -->
					<div class="clr">
					</div>
				</div>
			</div>
		
			<footer id="footer">
				<div id="footer-inner">
					<p>&copy; Copyright Zoophy &#124; <a href="terms.html">Terms of Use</a> &#124; <a href="privacy.html">Privacy Policy</a></p>
					<div class="clr">
					</div>
				</div>
			</footer>
		</div>
    </form>
</body>
</html>
