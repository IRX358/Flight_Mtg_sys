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
    <title>Process Payments</title>
</head>
<body>
    <header>
        <div class="container header-content">
            <div class="logo">Process Payments</div>
        </div>
    </header>
    <nav>
    <div class="container">
        <ul class="nav-menu">
            <li><a href="index.html">Home</a></li>
            <li><a traget="_blank" href="view_flights.php">View Flights</a></li>
            <li class="rt"><a target="_blank" href="book_flight.php">Book Flight</a></li>
            <!-- <li class="rt"><a traget="_blank" href="process_payment.php">Process Payment</a></li>  -->
        </ul>
    </div>
    </nav>     
    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        include("db_connect.php");
        
        // we shld also get booking amount
        $booking_id = $_POST['booking_id'];
        $sql = "SELECT f.price FROM booking b JOIN flight f ON b.flight_id = f.flight_id WHERE b.booking_id = $booking_id";
        $result = $conn->query($sql);
        
        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            $amount = $row['price'];
            
            // now inserting values
            $stmt = $conn->prepare("INSERT INTO payment (booking_id, amount, payment_method, payment_status) VALUES (?, ?, ?, 'Success')");
            $stmt->bind_param("ids", $_POST['booking_id'], $amount, $_POST['payment_method']);
            
            if ($stmt->execute()) {
                echo "<p style='color:green;'>Payment processed successfully! Payment ID: " . $stmt->insert_id . "</p>";
                
                // next updAting the status attribute
                $conn->query("UPDATE booking SET status = 'Confirmed' WHERE booking_id = $booking_id");
            } else {
                echo "<p style='color:red;'>Error processing payment: " . $conn->error . "</p>";
            }
        } else {
            echo "<p style='color:red;'>Booking not found</p>";
        }
        
        $conn->close();
    }
    ?>
    
    <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
        <label for="booking_id">Booking ID:</label>
        <input type="number" id="booking_id" name="booking_id" required>
        
        <label for="payment_method">Payment Method:</label>
        <select id="payment_method" name="payment_method" required>
            <option value="">Select Payment Method</option>
            <option value="Credit Card">Credit Card</option>
            <option value="Debit Card">Debit Card</option>
            <option value="PayPal">PayPal</option>
            <option value="Bank Transfer">Bank Transfer</option>
        </select>
        
        <button type="submit">Process Payment</button>
    </form>
</body>
</html>