<?php
session_name("user");
session_start("user");

include("connect/dbConnect.php");

if (!isset($_SESSION["loggedIn"]))
{
	header('Location: login');
	exit;
}

if ($_GET["qc"] == 1)
{
	echo '<script type="text/javascript">alert("Your ZooPhy query has commenced. You will also receive a notification email upon the query\'s completion.");</script>';
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
			<div id="content-inner-jobs">
			To view Phylogenic Trees, please download FigTree by clicking <a id="link" href="http://tree.bio.ed.ac.uk/software/figtree/" onclick="window.open(this.href); return false;">here.</a>
				<div class="userQueries">
					<h2>Active Queries</h2>
					<table id="query_table">
						<?php
							$userId = $_SESSION['loggedIn'];
							$query = "SELECT * FROM query WHERE user_id = '$userId' AND queryEnd IS NULL";
							$result = mysqli_query($dbc, $query) or die ("Error reading database");
							
							if (count($result)) 
							{
								echo '<tr>
								<th>Query Number</th>
								<th>Virus</th>
								<th>Gene</th>
								<th>Host</th>
								<th>From</th>
								<th>To</th>
								<th>Country</th>
								<th>State</th>						
								</tr>';					

								while($row = mysqli_fetch_array($result))
								{
									echo '<tr>			
									<td>' . $row['id'] . '</td>
									<td>' . $row['virus'] . '</td>
									<td>' . $row['gene'] . '</td>
									<td>' . $row['host'] . '</td>
									<td>' . $row['startYear'] . '</td>
									<td>' . $row['endYear'] . '</td>
									<td>' . $row['country'] . '</td>
									<td>' . $row['state'] . '</td>																							
									</tr>
									</br>
									<tr>
									<th>Date Run: ' . $row['queryStart'] . '</th>
									<th>Status: ' . (($row['queryEnd'] == NULL)?'In Process':""). '</th>
									<th>KML Map: <a href="download/kmlDownload">Download /</a><a href="kmlMap" onclick="window.open(this.href); return false;"> View</a></th>
									<th>Phylogenic Tree: <a href="download/treeDownload">Download</a></th>
									</tr>';
								}
							}
							else
							{
								echo '<tr><td>You have no active queries.</td></tr>';
							}
						?>
					</table>
					<h2>Completed Queries</h2>
					<table id="query_table">
						<?php
							$userId = $_SESSION['loggedIn'];
							$query = "SELECT * FROM query WHERE user_id = '$userId' AND queryEnd IS NOT NULL";
							$result = mysqli_query($dbc, $query) or die ("Error reading database");
							
							if (count($result)) 
							{
								echo '<tr>
								<th>Query Number</th>
								<th>Virus</th>
								<th>Gene</th>
								<th>Host</th>
								<th>From</th>
								<th>To</th>
								<th>Country</th>
								<th>State</th>						
								</tr>';					

								while($row = mysqli_fetch_array($result))
								{
									echo '<tr>			
									<td>' . $row['id'] . '</td>
									<td>' . $row['virus'] . '</td>
									<td>' . $row['gene'] . '</td>
									<td>' . $row['host'] . '</td>
									<td>' . $row['startYear'] . '</td>
									<td>' . $row['endYear'] . '</td>
									<td>' . $row['country'] . '</td>
									<td>' . $row['state'] . '</td>																							
									</tr>
									</br>
									<tr>
									<th>Date Run: ' . $row['queryStart'] . '</th>
									<th>Status: ' . (($row['queryEnd'] != NULL)?'Completed':""). '</th>
									<th>KML Map: <a href="download/kmlDownload">Download /</a><a href="kmlMap" onclick="window.open(this.href); return false;"> View</a></th>
									<th>Phylogenic Tree: <a href="download/treeDownload">Download</a></th>
									</tr>';
								}
							}
							else
							{
								echo '<tr><td>You have no completed queries.</td></tr>';
							}
						?>
					</table>
				</div>
				<div class="clr">
				</div>
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