
# 🛫 Flight Management System

[![PHP](https://img.shields.io/badge/php-%23777BB4.svg?style=for-the-badge&logo=php&logoColor=white)](https://www.php.net) 
[![XAMPP](https://img.shields.io/badge/xampp-%23F37623.svg?style=for-the-badge&logo=xampp&logoColor=white)](https://www.apachefriends.org)
[![MySQL](https://img.shields.io/badge/mysql-%2300f.svg?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com)


##✈ Project Name

Flight Management System (FMS)

##📝 Short Introduction

A Flight Booking & Management System built using PHP (backend) and MySQL (database) running on XAMPP.
This project demonstrates CRUD operations (Create, Read, Update, Delete) for managing flights, passengers, bookings, tickets, and payments.


---

##🌟 Features

🗂 Passenger Management → Add, edit, and delete passenger records

🎫 Ticket System → Issue, update, and cancel tickets

📅 Booking Module → Handle booking confirmations and changes

✈ Flight Details → Store flight numbers, schedules, and destinations

💳 Payment Records → Track transactions and booking payments



---

##🛠 Tech Stack

🖥 Frontend: HTML + CSS

⚙ Backend: PHP

🗄 Database: MySQL (via XAMPP)

🛠 Server: Apache (via XAMPP)



---

##⚡ Setup Instructions

###📂 Repo Setup

1. Clone the repo:
   
```bash
git clone https://github.com/irx358/Flight_Mtg_sys.git
cd Flight_Mtg_sys
```

2. Repo structure:
   
```
/Flight_mtg_sys
│── src/
│   ├── admin_panel.html
│   ├── alter_flights.php
│   ├── book_flight.php
│   ├── index.html
│   ├── db_connect.php
│   ├── process_payment.php
│   ├── view_bookings.php
│   ├── view_flights.php
│── sql/
│   ├── flight_mtg03.sql
│   ├── Schema_Diagram_Dark.png
│   ├── Schema_Diagram.png
│── README.md
│── .gitignore

```


---

###🗄 Database Setup

1. Start Apache and MySQL from XAMPP.


2. Open phpMyAdmin.


3. Create a database:
```
flight_mtg03
```

4. Import sql/flight_mtg03.sql into this database.


5. Update DB connection in your db_connect.php file if needed:

```
<?php
$conn = mysqli_connect("localhost", "root", "", "flight_mtg03");
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
?>
```

---

##▶ Running Instructions

1. Place the src/ folder inside your XAMPP htdocs/.


2. Navigate to:

```
http://localhost/src/index.php
```

3. The system should now connect to your MySQL DB and work normally.




---

##🤝 Connect

🐙 GitHub: <a href="https://github.com/IRX358">IRX358</a>

💼 LinkedIn: <a href="https://www.linkedin.com/in/irfan-basha-396b97282/"> Irfan Basha </a>

---

>  © 2025 Irfan IR || 
            Built with great MOOD😎 , EXCITEMENT🤩 and CURIOSITY🤔
