-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 31, 2025 at 12:17 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flight_mtg03`
--

-- --------------------------------------------------------

--
-- Table structure for table `airport`
--

CREATE TABLE `airport` (
  `airport_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `code` varchar(10) NOT NULL,
  `city` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `airport`
--

INSERT INTO `airport` (`airport_id`, `name`, `code`, `city`, `country`) VALUES
(1, 'Indira Gandhi International Airport', 'DEL', 'Delhi', 'India'),
(2, 'Chhatrapati Shivaji Maharaj International Airport', 'BOM', 'Mumbai', 'India'),
(3, 'Kempegowda International Airport', 'BLR', 'Bengaluru', 'India'),
(4, 'Chennai International Airport', 'MAA', 'Chennai', 'India'),
(5, 'Netaji Subhas Chandra Bose International Airport', 'CCU', 'Kolkata', 'India'),
(6, 'Rajiv Gandhi International Airport', 'HYD', 'Hyderabad', 'India'),
(7, 'Cochin International Airport', 'COK', 'Kochi', 'India'),
(8, 'Sardar Vallabhbhai Patel International Airport', 'AMD', 'Ahmedabad', 'India'),
(9, 'Pune Airport', 'PNQ', 'Pune', 'India'),
(10, 'Jaipur International Airport', 'JAI', 'Jaipur', 'India'),
(11, 'Dabolim Airport', 'GOI', 'Goa', 'India'),
(12, 'Lucknow Airport', 'LKO', 'Lucknow', 'India'),
(13, 'Chaudhary Charan Singh International Airport', 'LKO', 'Lucknow', 'India'),
(14, 'Trivandrum International Airport', 'TRV', 'Thiruvananthapuram', 'India'),
(15, 'Sri Guru Ram Dass Jee International Airport', 'ATQ', 'Amritsar', 'India');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL,
  `passenger_id` int(11) NOT NULL,
  `flight_id` int(11) NOT NULL,
  `booking_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `seat_number` varchar(10) NOT NULL,
  `status` enum('Confirmed','Cancelled','Pending') DEFAULT 'Confirmed'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`booking_id`, `passenger_id`, `flight_id`, `booking_date`, `seat_number`, `status`) VALUES
(1, 1, 1, '2025-05-07 17:06:54', '12A', 'Confirmed'),
(2, 2, 2, '2025-05-07 17:06:54', '15B', 'Confirmed'),
(3, 3, 3, '2025-05-07 17:06:54', '8C', 'Confirmed'),
(4, 4, 4, '2025-05-07 17:06:54', '22D', 'Confirmed'),
(5, 5, 5, '2025-05-07 17:06:54', '10A', 'Confirmed'),
(6, 6, 6, '2025-05-07 17:06:54', '18B', 'Confirmed'),
(7, 7, 7, '2025-05-07 17:06:54', '5C', 'Confirmed'),
(8, 8, 8, '2025-05-07 17:06:54', '20D', 'Confirmed'),
(9, 9, 9, '2025-05-07 17:06:54', '14A', 'Confirmed'),
(10, 10, 10, '2025-05-07 17:06:54', '16B', 'Confirmed'),
(11, 11, 11, '2025-05-07 17:06:54', '7C', 'Confirmed'),
(12, 12, 12, '2025-05-07 17:06:54', '19D', 'Confirmed'),
(13, 13, 13, '2025-05-07 17:06:54', '11A', 'Confirmed'),
(14, 14, 14, '2025-05-07 17:06:54', '13B', 'Confirmed'),
(15, 15, 15, '2025-05-07 17:06:54', '9C', 'Confirmed'),
(16, 16, 5, '2025-05-07 17:08:02', '17', 'Confirmed'),
(17, 18, 8, '2025-05-07 17:10:20', '19', 'Confirmed'),
(18, 19, 9, '2025-05-07 17:13:06', '52', 'Confirmed'),
(19, 20, 10, '2025-05-09 03:53:43', '105', 'Confirmed'),
(20, 21, 4, '2025-05-09 05:58:35', '454', 'Confirmed'),
(21, 22, 6, '2025-05-09 06:44:50', '456', 'Confirmed'),
(22, 23, 3, '2025-05-24 15:30:43', '117', 'Confirmed');

-- --------------------------------------------------------

--
-- Table structure for table `flight`
--

CREATE TABLE `flight` (
  `flight_id` int(11) NOT NULL,
  `flight_number` varchar(10) NOT NULL,
  `airline` varchar(50) NOT NULL,
  `departure_airport_id` int(11) NOT NULL,
  `arrival_airport_id` int(11) NOT NULL,
  `departure_time` datetime NOT NULL,
  `arrival_time` datetime NOT NULL,
  `available_seats` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `flight`
--

INSERT INTO `flight` (`flight_id`, `flight_number`, `airline`, `departure_airport_id`, `arrival_airport_id`, `departure_time`, `arrival_time`, `available_seats`, `price`) VALUES
(1, 'AI101', 'Air India', 1, 2, '2023-06-01 08:00:00', '2023-06-01 10:30:00', 120, 7500.00),
(2, '6E202', 'IndiGo', 2, 3, '2023-06-01 09:15:00', '2023-06-01 11:45:00', 180, 6500.00),
(3, 'SG303', 'SpiceJet', 3, 4, '2023-06-01 10:30:00', '2023-06-01 13:00:00', 150, 7000.00),
(4, 'UK404', 'Vistara', 4, 5, '2023-06-01 11:45:00', '2023-06-01 14:30:00', 160, 9000.00),
(5, 'G805', 'GoAir', 5, 6, '2023-06-01 12:00:00', '2023-06-01 14:15:00', 140, 7200.00),
(6, 'AI606', 'Air India', 6, 7, '2023-06-01 13:15:00', '2023-06-01 16:00:00', 110, 9500.00),
(7, '6E707', 'IndiGo', 7, 8, '2023-06-01 14:30:00', '2023-06-01 17:15:00', 170, 6800.00),
(8, 'SG808', 'SpiceJet', 8, 9, '2023-06-01 15:45:00', '2023-06-01 18:00:00', 130, 7100.00),
(9, 'UK909', 'Vistara', 9, 10, '2023-06-01 16:00:00', '2023-06-01 18:30:00', 190, 7800.00),
(10, 'G101', 'GoAir', 10, 11, '2023-06-01 17:15:00', '2023-06-01 19:45:00', 200, 6900.00),
(11, 'AI202', 'Air India', 11, 12, '2023-06-01 18:30:00', '2023-06-01 21:00:00', 140, 8200.00),
(12, '6E303', 'IndiGo', 12, 13, '2023-06-01 19:45:00', '2023-06-01 22:15:00', 160, 6700.00),
(13, 'SG404', 'SpiceJet', 13, 14, '2023-06-01 20:00:00', '2023-06-01 23:00:00', 120, 7300.00),
(14, 'UK505', 'Vistara', 14, 15, '2023-06-01 21:15:00', '2023-06-02 00:30:00', 180, 8800.00),
(15, 'G606', 'GoAir', 15, 1, '2023-06-01 22:30:00', '2023-06-02 01:15:00', 150, 7100.00);

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE `passenger` (
  `passenger_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `passport_number` varchar(20) NOT NULL,
  `nationality` varchar(50) DEFAULT 'India',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `passenger`
--

INSERT INTO `passenger` (`passenger_id`, `name`, `email`, `phone`, `passport_number`, `nationality`, `created_at`) VALUES
(1, 'Rahul Sharma', 'rahul.sharma@example.com', '9876543210', 'A12345678', 'India', '2025-05-07 17:06:17'),
(2, 'Priya Patel', 'priya.patel@example.com', '8765432109', 'B23456789', 'India', '2025-05-07 17:06:17'),
(3, 'Amit Singh', 'amit.singh@example.com', '7654321098', 'C34567890', 'India', '2025-05-07 17:06:17'),
(4, 'Neha Gupta', 'neha.gupta@example.com', '6543210987', 'D45678901', 'India', '2025-05-07 17:06:17'),
(5, 'Vikram Joshi', 'vikram.joshi@example.com', '9432109876', 'E56789012', 'India', '2025-05-07 17:06:17'),
(6, 'Ananya Reddy', 'ananya.reddy@example.com', '8321098765', 'F67890123', 'India', '2025-05-07 17:06:17'),
(7, 'Rajiv Malhotra', 'rajiv.malhotra@example.com', '7210987654', 'G78901234', 'India', '2025-05-07 17:06:17'),
(8, 'Sneha Iyer', 'sneha.iyer@example.com', '6109876543', 'H89012345', 'India', '2025-05-07 17:06:17'),
(9, 'Arjun Mehta', 'arjun.mehta@example.com', '5098765432', 'I90123456', 'India', '2025-05-07 17:06:17'),
(10, 'Divya Choudhary', 'divya.choudhary@example.com', '4987654321', 'J01234567', 'India', '2025-05-07 17:06:17'),
(11, 'Karan Khanna', 'karan.khanna@example.com', '9876543211', 'K12345679', 'India', '2025-05-07 17:06:17'),
(12, 'Pooja Srinivasan', 'pooja.srinivasan@example.com', '8765432110', 'L23456780', 'India', '2025-05-07 17:06:17'),
(13, 'Rohan Bhatia', 'rohan.bhatia@example.com', '7654321109', 'M34567891', 'India', '2025-05-07 17:06:17'),
(14, 'Isha Nair', 'isha.nair@example.com', '6543211098', 'N45678902', 'India', '2025-05-07 17:06:17'),
(15, 'Aditya Rao', 'aditya.rao@example.com', '5432110987', 'O56789013', 'India', '2025-05-07 17:06:17'),
(16, 'Zen Mehek', 'zen0803@example.com', '8431153750', 'irzsn308', 'India', '2025-05-07 17:08:02'),
(18, 'Sania', 'sania08mehek@example.com', '08431153750', 'irzsn300', 'India', '2025-05-07 17:10:20'),
(19, 'Junaid', 'junadi08@gggmmll.com', '99008877', 'jn0305', 'India', '2025-05-07 17:13:06'),
(20, 'Mads', 'Mads@gmail.com', '7899655890', 'PT770011', 'India', '2025-05-09 03:53:43'),
(21, 'Pavani T', 'ir.358.786@gmail.com', '789965589000', 'PT761277', 'India', '2025-05-09 05:58:35'),
(22, 'vivek', 'vivek@gmail.com', '67676768222', 'PT761244', 'India', '2025-05-09 06:44:50'),
(23, 'mumtaz begum', 'mum.199@gmail.com', '77832983', 'ITIT34350', 'India', '2025-05-24 15:30:43');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `payment_status` enum('Success','Failed','Pending') DEFAULT 'Pending',
  `payment_method` enum('Credit Card','Debit Card','PayPal','Bank Transfer') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `booking_id`, `amount`, `payment_date`, `payment_status`, `payment_method`) VALUES
(1, 1, 7500.00, '2023-05-25 04:45:00', 'Success', 'Credit Card'),
(2, 2, 6500.00, '2023-05-25 06:00:00', 'Success', 'Debit Card'),
(3, 3, 7000.00, '2023-05-26 04:15:00', 'Success', 'Credit Card'),
(4, 4, 8000.00, '2023-05-26 08:50:00', 'Success', 'PayPal'),
(5, 5, 7200.00, '2023-05-27 10:40:00', 'Success', 'Debit Card'),
(6, 6, 8500.00, '2023-05-27 13:00:00', 'Success', 'Credit Card'),
(7, 7, 6800.00, '2023-05-28 07:15:00', 'Success', 'Bank Transfer'),
(8, 8, 7100.00, '2023-05-28 09:50:00', 'Success', 'Credit Card'),
(9, 9, 7800.00, '2023-05-29 05:00:00', 'Success', 'Debit Card'),
(10, 10, 6900.00, '2023-05-29 07:45:00', 'Success', 'PayPal'),
(11, 11, 8200.00, '2023-05-30 12:15:00', 'Success', 'Credit Card'),
(12, 12, 6700.00, '2023-05-30 14:00:00', 'Success', 'Debit Card'),
(13, 13, 7300.00, '2023-05-31 05:50:00', 'Success', 'Bank Transfer'),
(14, 14, 8800.00, '2023-05-31 09:20:00', 'Success', 'Credit Card'),
(15, 15, 7100.00, '2023-06-01 03:40:00', 'Success', 'Debit Card'),
(16, 16, 7200.00, '2025-05-07 17:08:16', 'Success', 'PayPal'),
(17, 17, 7100.00, '2025-05-07 17:10:29', 'Success', 'Debit Card'),
(18, 18, 7800.00, '2025-05-07 17:13:21', 'Success', 'Credit Card'),
(19, 19, 6900.00, '2025-05-09 03:54:05', 'Success', 'Bank Transfer'),
(20, 20, 9000.00, '2025-05-09 05:58:48', 'Success', 'Credit Card'),
(21, 21, 8500.00, '2025-05-09 06:45:37', 'Success', 'Debit Card'),
(22, 21, 9500.00, '2025-05-24 15:32:25', 'Success', 'Credit Card'),
(23, 22, 7000.00, '2025-05-24 15:32:53', 'Success', 'Credit Card');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `airport`
--
ALTER TABLE `airport`
  ADD PRIMARY KEY (`airport_id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `fk_passenger` (`passenger_id`),
  ADD KEY `fk_flight` (`flight_id`);

--
-- Indexes for table `flight`
--
ALTER TABLE `flight`
  ADD PRIMARY KEY (`flight_id`),
  ADD KEY `fk_departure_airport` (`departure_airport_id`),
  ADD KEY `fk_arrival_airport` (`arrival_airport_id`);

--
-- Indexes for table `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`passenger_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `passport_number` (`passport_number`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `fk_booking` (`booking_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `airport`
--
ALTER TABLE `airport`
  MODIFY `airport_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `flight`
--
ALTER TABLE `flight`
  MODIFY `flight_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `passenger`
--
ALTER TABLE `passenger`
  MODIFY `passenger_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `fk_flight` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`flight_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_passenger` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`passenger_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `flight`
--
ALTER TABLE `flight`
  ADD CONSTRAINT `fk_arrival_airport` FOREIGN KEY (`arrival_airport_id`) REFERENCES `airport` (`airport_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_departure_airport` FOREIGN KEY (`departure_airport_id`) REFERENCES `airport` (`airport_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `fk_booking` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
