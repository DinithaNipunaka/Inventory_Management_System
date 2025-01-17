-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 21, 2024 at 07:46 AM
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
-- Database: `ims`
--

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`) VALUES
(2, 'Finance'),
(1, 'HR'),
(5, 'IT Support'),
(4, 'Marketing'),
(3, 'Sales');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(11) NOT NULL,
  `item_name` varchar(150) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `img_path` varchar(2048) DEFAULT NULL,
  `status` enum('IN STOCK','OUT OF STOCK') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `item_name`, `description`, `quantity`, `img_path`, `status`, `created_at`, `updated_at`) VALUES
(15, 'Side Glasses', 'Toyota Brands', 10, NULL, 'IN STOCK', '2024-12-18 04:43:50', '2024-12-21 05:42:28'),
(17, 'Oil Filters', 'Isuzu Brands', 10, NULL, 'IN STOCK', '2024-12-18 04:44:26', '2024-12-21 05:34:10'),
(19, 'Engines', 'Suzuki Brands', 30, NULL, 'IN STOCK', '2024-12-21 05:34:03', '2024-12-21 05:34:03'),
(20, 'Break Pads', 'Any Vehicle Brand', 30, NULL, 'IN STOCK', '2024-12-21 05:34:59', '2024-12-21 05:34:59'),
(21, 'Tyers', 'Any Vehicle Brand', 50, NULL, 'IN STOCK', '2024-12-21 05:35:34', '2024-12-21 05:35:34'),
(22, 'Wipers', 'Any Vehicle Branda', 20, NULL, 'IN STOCK', '2024-12-21 05:36:20', '2024-12-21 05:36:20'),
(23, 'Sheet Covers', 'Suzuki Brands', 30, NULL, 'IN STOCK', '2024-12-21 05:36:54', '2024-12-21 05:36:54'),
(24, 'Alloweels', 'Toyota Brands', 36, NULL, 'IN STOCK', '2024-12-21 05:38:15', '2024-12-21 05:42:15'),
(25, 'Head Lights', 'Any Vehicle Branda', 40, NULL, 'IN STOCK', '2024-12-21 05:38:56', '2024-12-21 05:38:56'),
(26, 'Fog Lights', 'Toyota Brands', 40, NULL, 'IN STOCK', '2024-12-21 05:39:32', '2024-12-21 05:42:45');

-- --------------------------------------------------------

--
-- Table structure for table `inventoryhistory`
--

CREATE TABLE `inventoryhistory` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `change_type` enum('ADDED','UPDATED','REMOVED') NOT NULL,
  `old_quantity` int(11) DEFAULT NULL,
  `new_quantity` int(11) NOT NULL,
  `changed_by` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventoryhistory`
--

INSERT INTO `inventoryhistory` (`id`, `item_id`, `change_type`, `old_quantity`, `new_quantity`, `changed_by`, `timestamp`) VALUES
(70, 15, 'REMOVED', 12, 10, 32, '2024-12-18 04:45:36'),
(71, 17, 'REMOVED', 1, 0, 32, '2024-12-18 04:45:55'),
(72, 15, 'REMOVED', 10, 0, 32, '2024-12-18 05:23:45'),
(73, 15, 'ADDED', 0, 2, 32, '2024-12-18 05:26:34'),
(74, 17, 'ADDED', 0, 1, 32, '2024-12-18 06:38:38'),
(75, 15, 'REMOVED', 5, 3, 33, '2024-12-18 06:42:46'),
(76, 15, 'REMOVED', 10, 8, 33, '2024-12-21 05:42:05'),
(77, 24, 'REMOVED', 40, 36, 33, '2024-12-21 05:42:15'),
(78, 15, 'ADDED', 8, 10, 33, '2024-12-21 05:42:28'),
(79, 26, 'REMOVED', 40, 38, 33, '2024-12-21 05:42:38'),
(80, 26, 'ADDED', 38, 40, 33, '2024-12-21 05:42:45');

-- --------------------------------------------------------

--
-- Table structure for table `issued_items`
--

CREATE TABLE `issued_items` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `status` enum('Brought','Returned') NOT NULL DEFAULT 'Brought',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `issued_items`
--

INSERT INTO `issued_items` (`id`, `item_id`, `user_id`, `quantity`, `status`, `created_at`, `updated_at`) VALUES
(34, 15, 32, 2, 'Returned', '2024-12-18 04:45:36', '2024-12-18 04:45:36'),
(35, 17, 32, 1, 'Returned', '2024-12-18 04:45:55', '2024-12-18 04:45:55'),
(36, 15, 32, 10, 'Brought', '2024-12-18 05:23:45', '2024-12-18 05:23:45'),
(37, 15, 33, 2, 'Brought', '2024-12-18 06:42:46', '2024-12-18 06:42:46'),
(38, 15, 33, 2, 'Returned', '2024-12-21 05:42:05', '2024-12-21 05:42:05'),
(39, 24, 33, 4, 'Brought', '2024-12-21 05:42:15', '2024-12-21 05:42:15'),
(40, 26, 33, 2, 'Returned', '2024-12-21 05:42:38', '2024-12-21 05:42:38');

-- --------------------------------------------------------

--
-- Stand-in structure for view `issued_items_view`
-- (See below for the actual view)
--
CREATE TABLE `issued_items_view` (
`status` enum('Brought','Returned')
,`quantity` int(11)
,`created_at` date
,`item_name` varchar(150)
,`full_name` varchar(150)
);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('Admin','User') NOT NULL DEFAULT 'User',
  `email` varchar(100) NOT NULL,
  `full_name` varchar(150) NOT NULL,
  `img_path` varchar(2048) DEFAULT NULL,
  `department_id` int(11) NOT NULL,
  `status` enum('ACTIVE','INACTIVE') DEFAULT 'ACTIVE',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `email`, `full_name`, `img_path`, `department_id`, `status`, `created_at`, `updated_at`) VALUES
(32, 'nipunaka', '1234', 'Admin', 'nipunaka@gmail.com', 'Nipunaka', 'img/32_1734757674376_image.png', 1, 'ACTIVE', '2024-12-18 04:29:52', '2024-12-21 05:44:34'),
(33, 'dilhara', '1234', 'User', 'dilhara@gmail.com', 'Dilhara', 'img/33_1734759782418_img.jpg', 5, 'ACTIVE', '2024-12-18 04:30:37', '2024-12-21 05:43:02');

-- --------------------------------------------------------

--
-- Structure for view `issued_items_view`
--
DROP TABLE IF EXISTS `issued_items_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `issued_items_view`  AS SELECT `ii`.`status` AS `status`, `ii`.`quantity` AS `quantity`, cast(`ii`.`created_at` as date) AS `created_at`, `inv`.`item_name` AS `item_name`, `usr`.`full_name` AS `full_name` FROM ((`issued_items` `ii` join `inventory` `inv` on(`ii`.`item_id` = `inv`.`id`)) join `users` `usr` on(`ii`.`user_id` = `usr`.`id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventoryhistory`
--
ALTER TABLE `inventoryhistory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `changed_by` (`changed_by`);

--
-- Indexes for table `issued_items`
--
ALTER TABLE `issued_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `forign key to inventory` (`item_id`),
  ADD KEY `forign key to users` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `idx_username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `inventoryhistory`
--
ALTER TABLE `inventoryhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `issued_items`
--
ALTER TABLE `issued_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `inventoryhistory`
--
ALTER TABLE `inventoryhistory`
  ADD CONSTRAINT `inventoryhistory_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `inventory` (`id`),
  ADD CONSTRAINT `inventoryhistory_ibfk_2` FOREIGN KEY (`changed_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `issued_items`
--
ALTER TABLE `issued_items`
  ADD CONSTRAINT `forign key to inventory` FOREIGN KEY (`item_id`) REFERENCES `inventory` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `forign key to users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
