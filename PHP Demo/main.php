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

	<!-- Java Sript -->
	<script>
		function confLogout()
		{
			var href="logout.php";
			if (confirm("Are you sure you want to Logout of ZooPhy?") == true)
			{
				window.location=href;
			}
		}
	</script>

	<!-- jQuery Link -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js">
	</script>

	<!-- jQuery Search Function-->
	<script>
		$(document).ready(function(){
			$("#advSearchLink").click(function(){
				$("#advSearch").toggle();
			});
		});
	</script>

	<style>
		html, body, #map-canvas {
			height: 100%;
			margin: 0px;
			padding: 0px
		}
		.controls {
			margin-top: 16px;
			border: 1px solid transparent;
			border-radius: 2px 0 0 2px;
			box-sizing: border-box;
			-moz-box-sizing: border-box;
			height: 32px;
			outline: none;
			box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
		}

		#pac-input {
			background-color: #fff;
			font-family: Roboto;
			font-size: 15px;
			font-weight: 300;
			margin-left: 12px;
			padding: 0 11px 0 13px;
			text-overflow: ellipsis;
			width: 400px;
		}

		#pac-input:focus {
			border-color: #4d90fe;
		}

		.pac-container {
			font-family: Roboto;
		}

		#type-selector {
			color: #fff;
			background-color: #4d90fe;
			padding: 5px 11px 0px 11px;
		}

		#type-selector label {
			font-family: Roboto;
			font-size: 13px;
			font-weight: 300;
		}

	</style>
	<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true&libraries=places"></script>

	<script>
		function initialize() {
			var mapOptions = {
				center: new google.maps.LatLng(-33.8688, 151.2195),
				zoom: 13
			};
			var map = new google.maps.Map(document.getElementById('map-canvas'),
				mapOptions);

			var input = /** @type {HTMLInputElement} */(
				document.getElementById('pac-input'));

			var types = document.getElementById('type-selector');
			map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
			map.controls[google.maps.ControlPosition.TOP_LEFT].push(types);

			var autocomplete = new google.maps.places.Autocomplete(input);
			autocomplete.bindTo('bounds', map);

			var infowindow = new google.maps.InfoWindow();
			var marker = new google.maps.Marker({
				map: map,
				anchorPoint: new google.maps.Point(0, -29)
			});

			google.maps.event.addListener(autocomplete, 'place_changed', function() {
				infowindow.close();
				marker.setVisible(false);
				var place = autocomplete.getPlace();
				if (!place.geometry) {
					return;
				}

			    // If the place has a geometry, then present it on a map.
			    if (place.geometry.viewport) {
			    	map.fitBounds(place.geometry.viewport);
			    } else {
			    	map.setCenter(place.geometry.location);
			      map.setZoom(17);  // Why 17? Because it looks good.
			  }
			  marker.setIcon(/** @type {google.maps.Icon} */({
			  	url: place.icon,
			  	size: new google.maps.Size(71, 71),
			  	origin: new google.maps.Point(0, 0),
			  	anchor: new google.maps.Point(17, 34),
			  	scaledSize: new google.maps.Size(35, 35)
			  }));
			  marker.setPosition(place.geometry.location);
			  marker.setVisible(true);

			  var address = '';
			  if (place.address_components) {
			  	address = [
			  	(place.address_components[0] && place.address_components[0].short_name || ''),
			  	(place.address_components[1] && place.address_components[1].short_name || ''),
			  	(place.address_components[2] && place.address_components[2].short_name || '')
			  	].join(' ');
			  }

			  infowindow.setContent('<div><strong>' + place.name + '</strong><br>' + address);
			  infowindow.open(map, marker);
			});

			  // Sets a listener on a radio button to change the filter type on Places
			  // Autocomplete.
			  function setupClickListener(id, types) {
			  	var radioButton = document.getElementById(id);
			  	google.maps.event.addDomListener(radioButton, 'click', function() {
			  		autocomplete.setTypes(types);
			  	});
			  }

			  setupClickListener('changetype-all', []);
			  setupClickListener('changetype-address', ['address']);
			  setupClickListener('changetype-establishment', ['establishment']);
			  setupClickListener('changetype-geocode', ['geocode']);
			}

			google.maps.event.addDomListener(window, 'load', initialize);

		</script>

	<!-- Title -->
	<title>ZooPhy | Phylogeography for Zoonotic Disease Surveillance</title>	
</head>

<body>
	<div id="page">
		<header id="header">
			<div id="banner">
				<a href="index.php"><img src="imageFolder/zoophy.png"></a>	
			</div>
			<div id="header-inner">	
				<div id="top-nav">
					<ul>
						<li>
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
									echo "<a href='#' onclick=\"confLogout();\"><li>Logout</li></a>";
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
		</header>
		<!-- Header Spacing -->
		<div class="clr">
		</div>
	</div>
</body>

<div id="content">
	<div id="content-inner">	
		<main id="contentbar">
			<div class="article">
				<!-- MAIN/CENTER -->

				<form id="search" action="#" method="#">
					<?php
					echo "<p>Welcome," . " " . $_SESSION["name"] . ".</p>";
					?>											
					<p class="search">
						<!-- Search Virus Name -->
						<label for="vName">Virus:</label>
						<select name="vName" id="vName" required size="5">
							<option Selected="True" Value="119210">H3N2 Influenza A</option>
							<option Value="114727">H1N1 pdm09 Influenza A</option>
							<option Value="102793">H5N1 Influenza A</option>
							<option Value="11292">Rabies</option>
							<option Value="11082">West Nile Virus</option>
							<option Value="11081">Zombie Virus</option>
						</select>								

						<!-- Search Virus Subtype -->
						<label for="vGene">Gene:</label>
						<select name="vGene" id="vGene" required size="5">
							<option Selected="True">PB2</option>
							<option>PB1</option>
							<option>PA</option>
							<option>HA</option>
							<option>NP</option>
							<option>NA</option>
							<option>M</option>
							<option>NS</option>
							<option>Whole Genome</option>												
						</select>

						<!-- Search Virus Host -->
						<label for="vHost">Virus Host:</label>
						<select name="vHost" id="vHost" required size="5">
							<option Selected="True" Value="32523">All</option>
							<option Value="8782">Avian</option>
							<option Value="9397">Bat</option>
							<option Value="9913">Bovine</option>
							<option Value="9836">Camel</option>
							<option Value="9673">Civet</option>
							<option Value="9615">Dog</option>
							<option Value="9685">Cat</option>
							<option Value="9793">Donkey</option>
							<option Value="9669">Ferret</option>
							<option Value="9796">Horse</option>
							<option Value="9606">Human</option>
							<option Value="319699">Mule</option>
							<option Value="10060">Muskrat</option>
							<option Value="212257">Panda</option>
							<option Value="9654">Raccoon</option>
							<option Value="9823">Swine</option>
						</select>

					</p>

					<input id="pac-input" class="controls" type="text"
					placeholder="Enter a location">
					<div id="type-selector" class="controls">
						<input type="radio" name="type" id="changetype-all" checked="checked">
						<label for="changetype-all">All</label>

						<input type="radio" name="type" id="changetype-establishment">
						<label for="changetype-establishment">Establishments</label>

						<input type="radio" name="type" id="changetype-address">
						<label for="changetype-address">Addresses</label>

						<input type="radio" name="type" id="changetype-geocode">
						<label for="changetype-geocode">Geocodes</label>
					</div>
					<div id="map-canvas"></div>

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
						<label for"vTime">Time Frame:</label>
						<input type="date" id="vStartDate" name="vTime" />
					</p>
				</form>
			</div>
		</main>
		<div class="clr">
		</div>
	</div>
</div>

<footer id="footer">
	<div id="footer-inner">
		<p>&copy; Copyright Zoophy &#124; <a href="terms.php">Terms of Use</a> &#124; <a href="privacy.php">Privacy Policy</a></p>
		<div class="clr">
		</div>
	</div>
</footer>
</body>
</html>