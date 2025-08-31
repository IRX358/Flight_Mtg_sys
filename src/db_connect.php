  <?php
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "flight_mtg03";
    
    $conn = new mysqli($servername, $username, $password, $dbname);
    if(!conn){
        die("Database connection failed : ".mysqli_connect_error());
    }
    ?>