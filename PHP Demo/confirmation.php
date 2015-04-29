<?php
	include('connect/dbConnect.php');

	$passkey = $_GET['passkey'];

	$sql1 = "SELECT * FROM temp_user WHERE confirmation ='$passkey'";
	$result1 = mysqli_query($dbc, $sql1);

	if ($result1)
	{
		$count = mysqli_num_rows($result1);
		if ($count == 1)
		{
			$rows = mysqli_fetch_array($result1);
			$lName = $rows['lastName'];
			$fName = $rows['firstName'];
			$email = $rows['email'];
			$pword = $rows['pword'];
			$instit = $rows['institution'];

			$sql2 = "INSERT INTO user(lastName, firstName, email, pword, institution)"
			. "VALUES('$lName', '$fName', '$email', '$pword', '$instit')";
			$result2 = mysqli_query($dbc, $sql2);
		}
		else
		{
			echo "Wrong Confirmation code.";
		}

		if ($result2)
		{
			$sql3 = "DELETE FROM temp_user WHERE confirmation = '$passkey'";
			$result3 = mysqli_query($dbc, $sql3);

			header('Location: login?rc=3');
			exit;
		}

	}

?>

