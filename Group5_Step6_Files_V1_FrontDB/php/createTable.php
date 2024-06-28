<!doctype html>
<!-- (C) Yeison Montoya ID: 300375916 -->
<html>

<head>
	<title>Create a Table</title>
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
		$conn = new PDO("mysql:host=$GLOBALS[servername];dbname=$GLOBALS[dbname]", $GLOBALS['username'], $GLOBALS['password']);
		$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); // Sets the error mode of PHP engine to Exception to display all the errors
		echo "<p style='color:green'>Connection Was Successful</p>";
	} catch (PDOException $err) {
		echo "<p style='color:red'>Connection Failed: " . $err->getMessage() . "</p>\r\n";
	}

	$sql = "CREATE TABLE Person (
		PersonID INT NULL,
		FName VARCHAR(25) NULL,
		LName VARCHAR(25)  NULL,
		E_mail VARCHAR(50)  NULL UNIQUE,
		PhoneNumber VARCHAR(20) NULL,
		PersonType VARCHAR(50) NULL,

		PRIMARY KEY (PersonID)
	);";

	try {
		$conn->exec($sql);
		echo "<p style='color:green'>Table Created Successfully</p>";
	} catch (PDOException $err) {
		echo "<p style='color:red'>Table Creation Failed: " . $err->getMessage() . "</p>\r\n";
	}

	// Close the connection
	unset($conn);

	echo "<a href='../index.html'>Back to the Homepage</a>";

	?>

</body>

</html>