<!DOCTYPE html>
<html>
    <head>
        <style>
        body { font-family: Arial, sans-serif; margin: 20px; padding: 8px;}
        form { padding:1rem;max-width: 500px; }
        label { display: block; margin-top: 10px; }
        input, select { width: 100%; padding: 8px; margin-top: 5px; }
        button { margin-top: 15px; padding: 10px 15px; background: #4CAF50; color: white; border: none; cursor: pointer; }
        button:hover { background: #45a049; }
        nav{ background-color:rgb(95, 41, 27);border-radius:10px;}
        .nav-menu { display: flex; list-style: none;}
        .nav-menu li a {color: white;text-decoration: none;padding:1rem;display: block;transition: background-color 0.3s;}
        nav div ul li.rt{margin-left:auto;}
        .nav-menu li a:hover { background-color: rgba(237, 237, 237, 0.1);}
        .container { width: 90%; max-width: 1200px;}
        header {border-radius:10px;background: linear-gradient(135deg, rgb(87, 41, 13), rgb(46, 26, 10));color: white;padding: 1rem 0;box-shadow: 0 2px 5px rgba(0,0,0,0.1);}
        .header-content {display: flex;justify-content: space-between;margin:0 590px;}
        .logo { font-size: 1.8rem; font-weight: bold;}
        </style>
    <title>Book a Flight</title>
</head>
<body>
    <header>
        <div class="container header-content">
            <div class="logo">Book Flights</div>
        </div>
    </header>
    <nav>
    <div class="container">
        <ul class="nav-menu">
            <li><a href="index.html">Home</a></li>
            <li><a traget="_blank" href="view_flights.php">View Flights</a></li>
            <!-- <li><a href="book_flight.php">Book Flight</a></li> -->
            <li class="rt"><a traget="_blank" href="process_payment.php">Process Payment</a></li> 
        </ul>
    </div>
    </nav>  
    
    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        include("db_connect.php");
        
        $stmt = $conn->prepare("INSERT INTO passenger (name, email, phone, passport_number) VALUES (?, ?, ?, ?)");
        $stmt->bind_param("ssss", $_POST['name'], $_POST['email'], $_POST['phone'], $_POST['passport']);
        
        if ($stmt->execute()) {
            $passenger_id = $stmt->insert_id;
            //now inserting the values in the booking table
            $stmt = $conn->prepare("INSERT INTO booking (passenger_id, flight_id, seat_number) VALUES (?, ?, ?)");
            $stmt->bind_param("iis", $passenger_id, $_POST['flight_id'], $_POST['seat_number']);
            
            if ($stmt->execute()) {
                echo "<p style='color:green;'>Booking successful! Passenger ID: $passenger_id, Booking ID: " . $stmt->insert_id . "</p>";
            } else {
                echo "<p style='color:red;'>Error creating booking: " . $conn->error . "</p>";
            }
        } else {
            echo "<p style='color:red;'>Error creating passenger: " . $conn->error . "</p>";
        }
        
        $conn->close();
    }
    ?>
    <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
        <h3>Passenger Details</h3>
        <label for="name">Full Name:</label>
        <input type="text" id="name" name="name" required>
        
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>
        
        <label for="phone">Phone:</label>
        <input type="tel" id="phone" name="phone" required>
        
        <label for="passport">Passport Number:</label>
        <input type="text" id="passport" name="passport" required>
        
        <h3>Flight Details</h3>
        <label for="flight_id">Flight ID:</label>
        <input type="number" id="flight_id" name="flight_id" required>
        
        <label for="seat_number">Seat Number:</label>
        <input type="text" id="seat_number" name="seat_number" required>
        
        <button type="submit">Book Flight</button>
    </form>
</body>
</html>