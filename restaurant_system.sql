-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 05, 2026 at 09:25 PM
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
-- Database: `restaurant_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`) VALUES
(1, 'Beer', '2026-04-25 10:39:21'),
(3, 'soda', '2026-04-27 17:25:22'),
(4, 'Testing', '2026-04-28 11:09:26');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `notes` varchar(400) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `title`, `amount`, `notes`, `created_at`) VALUES
(1, 'Transport', 200.00, 'Boda payments for coke sodas transport from the depot', '2026-04-28 19:12:10'),
(2, 'Soap', 50.00, 'soap for washing the premises', '2026-04-28 19:26:27'),
(3, 'Transport', 50.00, 'Fare for employee', '2026-04-29 17:38:17'),
(4, 'Food', 120.00, 'lunch', '2026-04-29 17:39:05');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_logs`
--

CREATE TABLE `inventory_logs` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `change_qty` int(11) DEFAULT NULL,
  `type` enum('in','out') DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `order_number` varchar(50) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `status` enum('pending','paid') DEFAULT 'pending',
  `order_type` enum('takeaway','dine-in','delivery') DEFAULT NULL,
  `payment_method` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `etims_status` enum('pending','sent','failed') DEFAULT 'pending',
  `etims_invoice_no` varchar(100) DEFAULT NULL,
  `etims_qr` text DEFAULT NULL,
  `paid_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `total_amount`, `status`, `order_type`, `payment_method`, `created_at`, `etims_status`, `etims_invoice_no`, `etims_qr`, `paid_at`) VALUES
(1, 'ORD-1777310457', 200.00, 'paid', 'takeaway', 'Cash', '2026-04-27 17:20:57', 'pending', NULL, NULL, NULL),
(2, 'ORD-1777311504', 280.00, 'paid', 'dine-in', 'CASH', '2026-04-27 17:38:24', 'pending', NULL, NULL, NULL),
(3, 'ORD-1777483214', 280.00, 'paid', 'dine-in', 'cash', '2026-04-29 17:36:17', 'pending', NULL, NULL, NULL),
(4, 'ORD-1777483309', 160.00, 'paid', 'delivery', 'cash', '2026-04-29 17:28:08', 'pending', NULL, NULL, NULL),
(5, 'ORD-1777484204', 200.00, 'pending', 'dine-in', '', '2026-04-29 17:36:44', 'pending', NULL, NULL, NULL),
(6, 'ORD-1777484215', 60.00, 'pending', 'takeaway', '', '2026-04-29 17:36:55', 'pending', NULL, NULL, NULL),
(7, 'ORD-1777484231', 140.00, 'pending', 'dine-in', '', '2026-04-29 17:37:11', 'pending', NULL, NULL, NULL),
(8, 'ORD-1777484242', 260.00, 'pending', 'delivery', '', '2026-04-29 17:37:22', 'pending', NULL, NULL, NULL),
(9, 'ORD-1777484741', 1.00, 'paid', 'delivery', 'Mpesa', '2026-04-29 17:45:41', 'pending', NULL, NULL, NULL),
(10, 'ORD-1778006752', 60.00, 'pending', 'takeaway', '', '2026-05-05 18:45:52', 'pending', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
(1, 1, 2, 1, 200.00),
(2, 2, 4, 1, 80.00),
(3, 2, 2, 1, 200.00),
(4, 3, 4, 1, 80.00),
(5, 3, 2, 1, 200.00),
(6, 4, 4, 1, 80.00),
(7, 4, 3, 1, 80.00),
(8, 5, 2, 1, 200.00),
(9, 6, 6, 1, 60.00),
(10, 7, 3, 1, 80.00),
(11, 7, 6, 1, 60.00),
(12, 8, 2, 1, 200.00),
(13, 8, 6, 1, 60.00),
(14, 9, 7, 1, 1.00),
(15, 10, 6, 1, 60.00);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `method` enum('cash','mpesa') DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `mpesa_code` varchar(50) DEFAULT NULL,
  `status` enum('pending','paid','failed') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `order_id`, `amount`, `method`, `phone`, `mpesa_code`, `status`, `created_at`) VALUES
(1, 2, 280.00, 'cash', NULL, NULL, 'paid', '2026-04-27 18:06:15'),
(2, 1, 200.00, 'cash', NULL, NULL, 'paid', '2026-04-29 17:07:20'),
(8, 9, 1.00, 'mpesa', '254701094189', 'UDT5W2OYYX', 'paid', '2026-04-29 18:42:49'),
(9, 9, 1.00, 'mpesa', '254701094189', 'UDT5W2OYYX', 'paid', '2026-04-29 18:43:37'),
(10, 9, 1.00, 'mpesa', '0701094189', NULL, 'pending', '2026-04-29 18:44:28'),
(11, 9, 1.00, 'mpesa', '254701094189', 'UDT5W2OYYX', 'paid', '2026-04-29 20:35:54'),
(12, 9, 1.00, 'mpesa', '254701094189', 'UDT5W2OYYX', 'paid', '2026-04-29 20:41:48');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `stock_qty` int(11) DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `price`, `stock_qty`, `image`, `created_at`) VALUES
(2, 1, 'Tusker', 200.00, 25, '1777116434_lg 12 inch.jpg', '2026-04-25 11:27:14'),
(3, 3, 'Coke', 80.00, 18, '1777311244_lg 12 inch.jpg', '2026-04-27 17:34:04'),
(4, 3, 'Sprite', 80.00, 17, '1777311276_Susung Galaxy s25.jpg', '2026-04-27 17:34:36'),
(6, 3, 'stonny', 60.00, 6, '1777401960_6783.jpeg', '2026-04-28 18:46:00'),
(7, 4, 'test product', 1.00, 11, '1777484727_9348.jpeg', '2026-04-29 17:45:27');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` enum('admin','cashier') DEFAULT 'cashier',
  `show_p` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `role`, `show_p`, `created_at`) VALUES
(1, 'Admin', 'admin', '$2y$10$5OnRz8vQwU5Grt7pqhOlOu8i6Q3DB7wLEj.A9SmpLOMdr/fYudB5q', 'admin', '123456', '2026-04-23 18:32:07'),
(2, 'Cashier No 1', 'cashier1', '$2y$10$FAPQwIU8Mu5JQXAQBQL/s.3Cwpj6aAkXV800n0reqg5z079/akAnO', 'cashier', '123456', '2026-04-25 10:42:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory_logs`
--
ALTER TABLE `inventory_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_number` (`order_number`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `inventory_logs`
--
ALTER TABLE `inventory_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
