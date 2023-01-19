<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "rental_car";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// create SQL query
$sql = "select vehicle_id, model, year, car_type_id from car";
$result = $conn->query($sql);
?>
<h1>Car Rentals</h1>

    <form action ="avail.php" method = "POST">

        <button type="submit" name="button" >Check Car Availability</button>
    </form>

    <form action="insert.php" method="post">
        <button type="submit" name="button2" >Add New Car to Database</button>

    </form>