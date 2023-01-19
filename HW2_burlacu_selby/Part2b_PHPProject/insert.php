<h2>Add New Car </h2>
<form method="POST">
    <table>
        <tr>
            Vehicle ID: <input type="text" name="field1"/><br/>
            Model: <input type="text" name="field2"/><br/>
            Year: <input type="text" name="field3"/><br/>
            Type: <input type="text" name="field4"/><br/><br>
        </tr>
        <button type="submit" name="add-button" > Add </button>
    </table>

</form>
<form action ="main.php" method = "POST">
    <button type="submit" name="button"> Back to Main </button>
</form>

<?php

$servername = "localhost";
$username = "root";
$password = "";
$database = "rental_car";
//
$mysqli = new mysqli($servername, $username, $password, $database);

$field1 = $mysqli->real_escape_string($_POST['field1']);
$field2 = $mysqli->real_escape_string($_POST['field2']);
$field3 = $mysqli->real_escape_string($_POST['field3']);
$field4 = $mysqli->real_escape_string($_POST['field4']);


$query = "INSERT INTO rental_car.car (VEHICLE_ID, MODEL, YEAR, CAR_TYPE_ID)
            VALUES ('$field1','$field2','$field3','$field4')";

$mysqli->query($query);
$mysqli->close();
?>


<form action ="main.php" method = "POST">
    <button type="submit" name="button"> Back to Main </button>
</form>