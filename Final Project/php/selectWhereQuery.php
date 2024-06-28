<!doctype html>
<!-- (C) Yeison Montoya ID: 300375916-->
<html>
<head>
    <title>Display Records of a table</title>
    <link rel="stylesheet" href="../css/style.css" />
</head>

<body>
    <?php
    $servername = "localhost";
    $dbname = "Facility_Fusion_Database";
    $username = "root";
    $password = "";

    try {
        $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        echo "<p style='color:green'>Connection Was Successful</p>";
    } catch (PDOException $err) {
        echo "<p style='color:red'> Connection Failed: " . $err->getMessage() . "</p>\r\n";
    }

    try {
        $sql = "SELECT PersonID, FName, LName, E_mail, PhoneNumber, PersonType FROM Person WHERE PersonType = '$_POST[PersonType]'"; 
        $stmnt = $conn->prepare($sql);

        $stmnt->execute();

        $row = $stmnt->fetch();
        if ($row) {
            echo '<table>';
            echo '<tr> <th>Person ID</th> <th>First Name</th> <th>Last Name</th> <th>Email</th> <th>Phone Number</th> <th>Person Type</th> </tr>';
            do {
                echo "<tr><td>$row[PersonID]</td><td>$row[FName]</td><td>$row[LName]</td><td>$row[E_mail]</td><td>$row[PhoneNumber]</td><td>$row[PersonType]</td></tr>";
            } while ($row = $stmnt->fetch());
            echo '</table>';
        } else {
            echo "<p> No Record Found!</p>";
        }
    } catch (PDOException $err) {
        echo "<p style='color:red'>Record Retrieval Failed: " . $err->getMessage() . "</p>\r\n";
    }
    // Close the connection
    unset($conn);

    echo "<a href='../index.html'>Back to the Homepage</a>";

    ?>
</body>

</html>