<!doctype html>
<!-- (C) Yeison Montoya ID: 300375916-->
<html>

<head>
    <title>Delete a record of a table</title>
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
        echo "<p style='color:red'> Connection Failed: " . $err->getMessage() . "</p>\r\n";
    }

    try {
        // first, check if the record exists for deleteing. if does not exists, display a message, else delete it.
        $sql = "SELECT PersonID FROM $dbname.Person WHERE PersonID = :pid";
        $stmnt = $conn->prepare($sql);     // read about prepared statements here: https://www.w3schools.com/php/php_mysql_prepared_statements.asp
        $stmnt->bindParam(':pid', $_POST['PersonID']);   // :pid is the variable that we used in $sql, there must be a colon (:) in front of it.
        //  :pid in $_POST['PersonID'] is the name of the element in HTML Form. Make sure it matches exactly the name of the form element in HTML 

        $stmnt->execute();

        if ($stmnt->rowCount() === 0) {
            echo "<p style='color:red'>Record not found. Cannot delete.</p>\r\n";
        } else {
            // Prepare and execute a DELETE query
            $sql = "DELETE FROM $dbname.Person WHERE PersonID = :pid";
            $stmnt = $conn->prepare($sql);     // read about prepared statements here: https://www.w3schools.com/php/php_mysql_prepared_statements.asp
            $stmnt->bindParam(':pid', $_POST['PersonID']);   // :pid is the variable that we used in $sql, there must be a colon (:) in front of it.
            //  :pid in $_POST['PersonID'] is the name of the element in HTML Form. Make sure it matches exactly the name of the form element in HTML 

            $stmnt->execute();
            echo "<p style='color:green'>Record Deleted Successfully</p>";
        }
    } catch (PDOException $err) {
        echo "<p style='color:red'>Record Delete Failed: " . $err->getMessage() . "</p>\r\n";
    }
    // Close the connection
    unset($conn);

    echo "<a href='../index.html'>Back to the Homepage</a>";

    ?>

</body>

</html>