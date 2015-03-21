<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewJobs.aspx.cs" Inherits="Demonstration.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <!-- Meta Tag -->
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

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
							  <a href="profile.html"><li>Profile</li></a>
							  <a href="index.html"><li>Logout</li></a>
							</ul>
						  </li>
						  <li>
							Queries
							<ul>
							  <a href="main.html"><li>New Query</li></a>
							  <a href="viewjobs.html"><li>View Queries</li></a>
							</ul>
						  </li>
						  <a href="index.html"><li>About</li></a>
						  <a href="contact.html"><li>Contact</li></a>
						</ul>
					
					
						<!-- <ul>
						<li><a href="login.html">Profile</a></li>
						<li><a href="main.html">Queries</a></li> 
						<li><a href="about.html">About</a></li> 
						<li><a href="contact.html">Contact</a></li> 
						</ul> -->
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
				<div id="content-inner-jobs">
				
					<main id="article">
						<div class="currentjobs">
							<h2>Current Jobs</h2>
							<div id="daterun">
							<p>Date Run: 12/24/2014</p>
							</div>
							
							<div id="queryinfo">
							<p>Status: complete</p>
							<p>Query Info: </p>
							<p>Percent complete: 100%</p>
							<p><a href="kmlMap.html">Phylogeographic Map</a></p>
							</div>
						</div>
						
						<div class="clr"></div>
					</main>
					
			
			<nav id="sidebar">
						<div class="widget">
						</div>
						<img src="imageFolder/logo.png" alt="Zoophy" />
					</nav>
					
					<div class="clr"></div>
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