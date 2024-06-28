<!doctype html>
<!-- (C) Yeison Montoya ID: 300375916-->
<html>

<head>
	<title>Insert Data Into a Database</title>
	<link rel="stylesheet" href="../css/style.css" />
</head>

<body>

	<?php
	require 'config.php';

	/* Try MySQL server connection. Assuming you are running MySQL
server with default setting (user 'root' with no password).
If the connection was tried and it was successful the code between braces after try is executed, if any error happened while running the code in try-block, 
the code in catch-block is executed. */
	try {
		$conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
		$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); // Sets the error mode of PHP engine to Exception to display all the errors
		echo "<p style='color:green'>Connection Was Successful</p>";
	} catch (PDOException $err) {
		echo "<p style='color:red'>Connection Failed: " . $err->getMessage() . "</p>\r\n";
	}

	try {
		$sql = "INSERT INTO Person (PersonID, FName, LName, E_mail, PhoneNumber, PersonType) VALUES (:pid, :fn, :ln, :em, :pn, :pt);";   // all the variable names must start with a colon (:)
		$stmnt = $conn->prepare($sql);    // read about prepared statement here: https://www.w3schools.com/php/php_mysql_prepared_statements.asp
		$stmnt->bindParam(':pid', $_POST['PersonID']);   // PersonID in $_POST['PersonID'] in the exact name of the input element in HTML. if any typo, your code does not work   
		$stmnt->bindParam(':fn', $_POST['FName']);   // note the single quotes, If you forget to put single quotes, your code does not work.
		$stmnt->bindParam(':ln', $_POST['LName']);
		$stmnt->bindParam(':em', $_POST['E_mail']);
		$stmnt->bindParam(':pn', $_POST['PhoneNumber']);
		$stmnt->bindParam(':pt', $_POST['PersonType']);

		$stmnt->execute();

		echo "<p style='color:green'>Data Inserted Into Table Successfully</p>";
	} catch (PDOException $err) {
		echo "<p style='color:red'>Data Insertion Failed: " . $err->getMessage() . "</p>\r\n";
	}
	// Close the connection
	unset($conn);

	echo "<a href='../insertData.html'>Insert More Values</a> <br />";

	echo "<a href='../index.html'>Back to the Homepage</a>";

	?>

</body>

</html>