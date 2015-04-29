<?php
	session_name("user");
	session_start("user");

	if (!isset($_SESSION["loggedIn"]))
	{
		header('Location: login');
		exit;
	}

	include("connect/dbConnect.php");

	$vName = $_POST['vName'];
	$vGene = $_POST['vGene'];
	$vHost = $_POST['vHost'];
	$startYear = $_POST['startYear'];
	$endYear = $_POST['endYear'];	
	$vCountry = $_POST['vCountry'];
	$vState = $_POST['vState'];
	$chain = $_POST['chain'];
	$sample = $_POST['sample'];
	$model = $_POST['model'];
	$siteHeter = $_POST['siteHeter'];
	$userId = $_SESSION['loggedIn'];

	$query = "INSERT INTO query(virus, gene, host, startYear, endYear, country, state, chainLength, sampleFreq, modelSelect, siteHeter, user_id, queryStart)"
	. "VALUES('$vName', '$vGene', '$vHost', '$startYear', '$endYear', '$vCountry', '$vState', '$chain', '$sample', '$model', '$siteHeter', '$userId', '".date("Y-m-d H:i:s")."')";

	$result = mysqli_query($dbc, $query) or die ('Unable to Submit Query');
	mysqli_close($dbc);

	if ($result)
	{
		$to=$_SESSION['email'];
		$subject="ZooPhy Query Confirmation";
		$header="From: ZooPhy | Phylogeography for Zoonotic Disease Surveillance <support@bamercado.com>";
		$message="Your ZooPhy Query has Commenced. An additional confirmation email will be sent when your query is complete. \r\n";
		$message.="Click on this link to check on the status of your query. \r\n";
		$message.="http://www.bamercado.com/viewJobs";
		$sentmail=mail($to, $subject, $message, $header);		
	}
	else
	{
		echo "<p>User Email not found.</p>";
	}

	if($sentmail)
	{
		header('Location: viewJobs?qc=1');
		exit;
	}
	else
	{
		echo "Cannot Send Confirmation Link to your Email Address.";
	}
?>