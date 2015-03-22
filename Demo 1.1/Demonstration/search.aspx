<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="search.aspx.cs" Inherits="Demonstration.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Meta Tag -->
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

	<!-- Icon Link -->
	<link rel="icon" href="imageFolder/zoophy.ico" />
		
	<!-- CSS Link -->
	<link type="text/css" rel="stylesheet" href="style/main_style.css" />

    <!-- jQuery Link -->
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js">
		</script>

	<!-- jQuery Search Function-->
		<script>
		    $(document).ready(function () {
		        $("#advSearchLink").click(function () {
		            $("#advSearch").toggle();
		        });
		    });
		</script>

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
							  <a href="profile.aspx"><li>Profile</li></a>
							  <a href="about.aspx"><li>Logout</li></a>
							</ul>
						  </li>
						  <li>
							Queries
							<ul>
							  <a href="search.aspx"><li>New Query</li></a>
							  <a href="viewjobs.aspx"><li>View Queries</li></a>
							</ul>
						  </li>
						  <a href="index.aspx"><li>About</li></a>
						  <a href="contact.aspx"><li>Contact</li></a>
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
				<div id="content-inner">	
					<main id="contentbar">
						<div class="article">
							<!-- MAIN/CENTER -->
						
									 <form id="search" action="#" method="#">
											<p class="search">
												<!-- Search Virus Name -->
												<label for="vName">Virus Name:</label>
												<input type="text" id="vName" name="vName"
												required autofocus/>

												<!-- Search Virus Subtype -->
												<label for="vSubtype">Virus Subtype:</label>
												<input type="text" id="vSubtype" name="vSubtype"
												required/>

												<!-- Search Virus Host -->
												<label for="vHost">Virus Host:</label>
												<input type="text" id="vHost" name="vHost"
												required/>
											</p>
											<p class="submit">
												<input type="submit" value="Search Virus" />
												<span class="reset">
													<input type="reset" value="Clear Search" onclick="history.go(0)" />
												</span>
											</p>

											<a id="advSearchLink" href="#">Advanced Search</a>
											<p id="advSearch">

												<!-- Geographic Location -->
												<label for="vGeo">Geographic Location:</label>
												<input type="text" id="vGeo" name="vGeo" />

												<!-- Time Period -->
												<label for"vTime">Time Period:</label>
												<input type="date" id="vStartDate" name="vTime" />
											</p>
										</form>
									
								
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
				
					<div class="column">
						<!-- BOTTOM LEFT -->
						<h2><span>Search</span></h2>
						<p>Use Zoophy to query multiple databases 
							of virus genomes across the nation.</p> 
						<!-- <p><script>generateText(2)</script></p> -->
					</div>	
					<div class="column">
						<!-- BOTTOM MIDDLE -->
						<h2><span>Find</span></h2>
						<p>Find virus trajectory by selecting specific RNA sequences.</p> 
						<!-- <p><script>generateText(2)</script></p> -->
					</div>
					<div class="column">
						<!-- BOTTOM RIGHT -->
						<h2><span>Map It</span></h2>
						<p>Once complete, recceive a map over 
							Google Earth of your queries results.</p> 
						<!-- <p><script>generateText(2)</script></p> -->
					</div>	
					
					<div class="clr"></div>
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
