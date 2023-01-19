<!--<h2>Add New Search </h2>-->
<!--<form method="POST">-->
<!--    <table>-->
<!--        <tr>-->
<!--            Search Vehicle ID: <input type="text" name="vehicle_id"/><br/>-->
<!--        </tr>-->
<!--        <button type="submit" name="add-button" > Add </button>-->
<!--    </table>-->
<!---->
<!--</form>-->
<!---->

<?php
$servername = "localhost";
$username = "root";
$password = "";
$database = "rental_car";
//
$conn = new mysqli($servername, $username, $password, $database);

$vehicle_id=$_POST["vehicle_id"];
$status=$_POST["status"];
$start_period=$_POST["start_period"];
$end_period=$_POST["end_period"];

$res="select vehicle_id, model, year, car_type_id from car 
        where VEHICLE_ID not in (SELECT VEHICLE_ID FROM active_rental)";
$result=mysqli_query($conn,$res);
?>

<?php
if ($result) { ?>

    <h2>Available Rentals:</h2>
    <table>
        <thead>
        <tr>
            <th>Vehicle ID:</th>
            <th>Model:</th>
            <th>Year:</th>
            <th>Car Type:</th>
        </tr>
        </thead>
        <tbody>
        <?php foreach ($result as $row) { ?>
            <tr>
                <td><?php echo($row["vehicle_id"]); ?></td>
                <td><?php echo($row["model"]); ?></td>
                <td><?php echo($row["year"]); ?></td>
                <td><?php
                    switch ($row["car_type_id"]) {
                        case '1':
                            echo "Compact";
                            break;
                        case '2':
                            echo "Medium";
                            break;
                        case '3':
                            echo "Large";
                            break;
                        case '4':
                            echo "SUV";
                            break;
                        case '5':
                            echo "Van";
                            break;
                        case '6':
                            echo "Truck";
                            break;
                    } ?></td>
            </tr>
    }
        </tbody>
    </table>

}


<!--<form action ="main.php" method = "POST">-->
<!--    <button type="submit" name="button"> Back to Main </button>-->
<!--</form>-->