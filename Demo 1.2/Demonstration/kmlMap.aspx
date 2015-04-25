<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="kmlMap.aspx.cs" Inherits="Demonstration.kmlMap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Meta Tag -->
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

	<!-- Icon Link -->
	<link rel="icon" href="imageFolder/zoophy.ico" />
		
	<!-- CSS link -->
	<link type="text/css" rel="stylesheet" href="style/main_style.css" />
		
	<script src="https://maps.googleapis.com/maps/api/js"></script>
		
	<script>
		function initialize() {
		    var mapCanvas = document.getElementById('map-canvas');
		    var mapOptions = {
		        center: new google.maps.LatLng(44.5403, -78.5463),
		        zoom: 8,
		        mapTypeId: google.maps.MapTypeId.ROADMAP
		    }
		    var map = new google.maps.Map(mapCanvas, mapOptions);
		}
		google.maps.event.addDomListener(window, 'load', initialize);
	</script>
    <title>Map</title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="page">
		<!-- header section -->
			<header id="header">
				<header id="header">
			
				<div id="header-inner">	
				
					<div id="logo">
						 <!-- <h1><a href="#">Cool<span>Logo</span></a></h1> -->
						<!-- <img src="logo.png" alt="Zoophy" /> -->
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
						  <a href="Default.aspx"><li>About</li></a>
						  <a href="contact.aspx"><li>Contact</li></a>
						</ul>
					</div>
					<div class="clr"></div>
						
				</div>
			</header>
			<!-- <img src="logo.png" alt="Zoophy" /> -->
			<div class="feature">
				<div class="feature-inner">
				<h1>ZooPhy - Phylogeography for Zoonotic Disease Surveillance</h1>
				</div>
			</div>
		
			<div id="content">
				<div id="content-innerKML">
				
					<main id="article">
						<div id="map-canvas">
						
						</div>
					</main>
					
					<div class="clr"></div>
				</div>
				
			</div>
			
			<div class="clr"></div>
					<nav id="sidebar">
						<div class="widget">							
						</div>
						 <img src="imageFolder/zoophy.ico" alt="Zoophy" /> 
					</nav>	
				</div>
		
			<div id="footerblurb">
				<div id="footerblurb-inner">
				
					<div class="column">
						<p></p>
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
