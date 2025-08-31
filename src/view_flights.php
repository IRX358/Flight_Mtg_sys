<!DOCTYPE html>
<html>
<head>
        <style>
        body { font-family: Arial, sans-serif; margin: 20px; padding: 0px 40px 0px 40px;}
        th,td{border 1px solid rgb(36,38,45);padding:8px;text-align:center;background-color:rgb(243,195,195)}
        th{background-color:#9f5434;color:#ffffff}
        form { padding:1rem;max-width: 500px; }
        label { display: block; margin-top: 10px; }
        input, select { width: 100%; padding: 8px; margin-top: 5px; }
        button { margin-top: 15px; padding: 10px 15px; background: #4CAF50; color: white; border: none; cursor: pointer; }
        button:hover { background: #45a049; }
        nav{ background-color:rgb(95, 41, 27);border-radius:10px;}
        .nav-menu { display: flex; list-style: none;}
        .nav-menu li a {color:white;font-weight:bold;text-decoration: none;padding:1rem;display: block;transition: background-color 0.3s;}
        nav div ul li.rt{margin-left:auto;}
        .nav-menu li a:hover { background-color: rgba(237, 237, 237, 0.1);}
        .container { width: 90%; max-width: 1200px;}
        header {border-radius:10px;background: linear-gradient(135deg, rgb(87, 41, 13), rgb(46, 26, 10));color: white;padding: 1rem 0;box-shadow: 0 2px 5px rgba(0,0,0,0.1);}
        .header-content {display: flex;justify-content: space-between;margin:0 590px;}
        .logo { font-size: 1.8rem; font-weight: bold;}
        </style>
    <title>View Flights</title>
</head>
<body>
    <header>
        <div class="container header-content">
            <div class="logo">View Flights</div>
        </div>
    </header>
    <nav>
    <div class="container">
        <ul class="nav-menu">
            <li><a href="index.html">Home</a></li>
            <!-- <li><a traget="_blank" href="view_flights.php">View Flights</a></li> -->
            <!-- <li ><a href="process_payment.php">Process Payment</a></li>  -->
            <li class="rt"><a target="_blank" href="book_flight.php">Book Flight</a></li>
        </ul>
    </div>
    </nav> 
    <?php
   include("db_connect.php");
   
    $sql = "SELECT f.flight_id, f.flight_number, f.airline, 
                   a1.name AS departure_airport, a1.code AS departure_code,
                   a2.name AS arrival_airport, a2.code AS arrival_code,
                   f.departure_time, f.arrival_time, f.available_seats, f.price
                    FROM flight f
                    JOIN airport a1 ON f.departure_airport_id = a1.airport_id
                    JOIN airport a2 ON f.arrival_airport_id = a2.airport_id";
    $result = $conn->query($sql);
    
    if ($result->num_rows > 0) {
        echo "<table>
                <tr>
                    <th>Flight ID</th>
                    <th>Flight Number</th>
                    <th>Airline</th>
                    <th>Departure</th>
                    <th>Arrival</th>
                    <th>Departure Time</th>
                    <th>Arrival Time</th>
                    <th>Available Seats</th>
                    <th>Price (₹)</th>
                </tr>";
        
        while($row = $result->fetch_assoc()) {
            echo "<tr>
                    <td>".$row["flight_id"]."</td>
                    <td>".$row["flight_number"]."</td>
                    <td>".$row["airline"]."</td>
                    <td>".$row["departure_airport"]." (".$row["departure_code"].")</td>
                    <td>".$row["arrival_airport"]." (".$row["arrival_code"].")</td>
                    <td>".$row["departure_time"]."</td>
                    <td>".$row["arrival_time"]."</td>
                    <td>".$row["available_seats"]."</td>
                    <td>".$row["price"]."</td>
                  </tr>";
        }
        echo "</table>";
    } else {
        echo "No flights found";
    }
    $conn->close();
    ?>
</body>
</html>