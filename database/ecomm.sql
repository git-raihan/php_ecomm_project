-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 11, 2025 at 03:43 PM
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
-- Database: `ecomm`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `cus_id` int(11) NOT NULL,
  `nearby` text NOT NULL,
  `house_no` varchar(50) NOT NULL,
  `pin` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `district` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `address_type` enum('Home','Office','Others','') NOT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_id`, `cus_id`, `nearby`, `house_no`, `pin`, `city`, `district`, `state`, `address_type`, `created_at`) VALUES
(1, 4, 'The Meredian Building', 'GP-002', '700003', 'Kolkata', 'Kolkata', 'West Bengal', 'Office', '2025-01-24'),
(2, 4, 'Sealdah Railway Station', 'N0025', '700003', 'Kolkata', 'Kolkata', 'West Bengal', 'Home', '2025-01-24'),
(3, 2, 'The Meredian Building', 'GP-Block', '700145', 'Sec V', 'Kolkata', 'West Bengal', 'Office', '2025-02-16'),
(4, 5, 'Paschim Dandirhat', 'N0025', '743412', 'Basirhat', 'N 24 PGS', 'West Bengal', 'Home', '2025-02-19');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`, `created_at`) VALUES
(1, 'Admin', 'admin@gmail.com', '1234', '2024-11-17');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `cus_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `created_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `cus_id`, `product_id`, `quantity`, `created_at`) VALUES
(2, 3, 6, 5, '2024-12-01'),
(12, 3, 5, 2, '2025-01-27'),
(13, 3, 6, 1, '2025-01-27'),
(47, 4, 6, 10, '2025-03-04');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(100) NOT NULL,
  `cat_created_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cat_id`, `cat_name`, `cat_created_at`) VALUES
(1, 'Mobile', '2024-11-17'),
(2, 'Laptop', '2024-11-17'),
(3, 'TV', '2024-11-17'),
(4, 'AC', '2024-11-17'),
(5, 'Freeze', '2024-11-17'),
(6, 'Fan', '2024-11-17'),
(7, 'Desktop', '2024-11-22'),
(9, 'Washing Machine', '2025-01-27'),
(10, 'Washing Machine', '2025-01-27');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `cus_id` int(11) NOT NULL,
  `cus_name` varchar(100) NOT NULL,
  `cus_email` varchar(250) NOT NULL,
  `cus_password` varchar(150) NOT NULL,
  `cus_created_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`cus_id`, `cus_name`, `cus_email`, `cus_password`, `cus_created_at`) VALUES
(2, 'Techno Exponent', 'technoexponent@gmail.com', '$2y$10$EeJwz4tf9LZoAiWwQhrFC.TkNrn3T2hDg.3z9spOwBK6Hdr/DFZJ.', '2024-12-01'),
(3, 'Euphoria GenX', 'euphoriagenx@gmail.com', '$2y$10$RTn3MmV2eiFWjY3H6y59lOwDRqV9iT0hHNYFbX3zQAYYHdlHjnQJy', '2024-12-01'),
(4, 'Euphoria GenX', 'raihan@euphoriagenx.in', '$2y$10$l8A0XQmz2b2U/gp0YhUBl.phccFerKncmG3vGjsHkV5ifhqiNEXKa', '2025-01-24'),
(5, 'Raihan Mistry', 'info.raihanmistry@gmail.com', '$2y$10$4G/9dreSr9fILHi8HRRb0OJNFM.0WJU/o0sWHBfu8MBYM4bnNbPHq', '2025-02-19');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` varchar(250) NOT NULL,
  `cus_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `total_order_amount` int(11) NOT NULL,
  `payment_mode` enum('cod','razor') NOT NULL,
  `txn_id` varchar(250) NOT NULL DEFAULT 'CodTypeOrder',
  `order_status` enum('pending','approved','hold','delivered') NOT NULL DEFAULT 'pending',
  `order_date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `cus_id`, `address_id`, `total_order_amount`, `payment_mode`, `txn_id`, `order_status`, `order_date`) VALUES
('5YlLcoHknDSvKAFsQphW', 4, 1, 35999, 'cod', 'CodTypeOrder', 'pending', '2025-02-18'),
('8wvA1WFbr7Okno0jqMTH', 2, 3, 35999, 'razor', 'pay_Q0FCJ7n2ZuHDUI', 'pending', '2025-02-26'),
('9zPjHx1m8MtsoDkUFLgh', 4, 2, 13490, '', 'CodTypeOrder', 'pending', '2025-02-25'),
('dnvjy76fKMlHLtGSx3iR', 5, 4, 38980, 'razor', 'CodTypeOrder', 'pending', '2025-02-19'),
('EfNSdYMoRZyCtT3FOxIU', 4, 1, 35999, 'razor', 'pay_PzzmSTZOWvoyEQ', 'pending', '2025-02-25'),
('eWt8sMXYZaFqfhcTpvUo', 4, 2, 13490, '', 'CodTypeOrder', 'pending', '2025-02-25'),
('hmfZnSILV0HDqUcxtyaO', 4, 1, 19490, 'razor', 'pay_PzzvvM2C9jmflA', 'pending', '2025-02-25'),
('irCqhmjaU0oTWDlpM7wF', 4, 1, 13490, 'razor', 'pay_Pzzu1EMJxS7drk', 'pending', '2025-02-25'),
('IVs3iuLocCKejgXpaN0m', 4, 2, 20989, '', 'CodTypeOrder', 'pending', '2025-02-25'),
('lvDa0HeLYBKb4oq2hkms', 2, 3, 35999, 'razor', 'CodTypeOrder', 'pending', '2025-02-16'),
('MsuZ6oIdyNL7T0hgmRxj', 4, 1, 13490, 'razor', 'pay_Q2kl9v7nwOPafl', 'pending', '2025-03-04'),
('NcOgVK78weFIUryW4xZB', 4, 1, 35999, 'razor', 'pay_PzzlhQrPxc4eQu', 'pending', '2025-02-25'),
('NKgu5vRIfawpFGxrmXtW', 4, 1, 19490, 'razor', 'pay_PzzsD5A01FLkmi', 'pending', '2025-02-25'),
('oih65vkgcnLX0etZ4F8a', 2, 3, 175456, 'cod', 'CodTypeOrder', 'pending', '2025-02-18'),
('OtJZ9Fl5I6TjSz0krEVM', 4, 2, 61459, 'cod', 'CodTypeOrder', 'pending', '2025-02-19'),
('QPjADIT6zbZagkSc7qxo', 4, 2, 112439, 'cod', 'CodTypeOrder', 'pending', '2025-02-19'),
('UbGcYrzMQvkSIjmOFBlV', 4, 2, 20989, 'cod', 'CodTypeOrder', 'pending', '2025-02-19'),
('Ug2vjXpB98LkO1zwsmV6', 2, 3, 89968, 'cod', 'CodTypeOrder', 'pending', '2025-02-16'),
('UTrH0qko9FezcRYpNjs8', 5, 4, 40479, 'cod', 'CodTypeOrder', 'pending', '2025-02-19'),
('VEbGH0gC6ruBAymsS1pN', 4, 2, 35999, '', 'CodTypeOrder', 'pending', '2025-02-25'),
('VGyoKzfTC1nMUl2sqXEi', 2, 3, 71998, 'razor', 'CodTypeOrder', 'pending', '2025-02-16'),
('xp2PkZLrQUuWyOfYbeDv', 4, 2, 106477, 'cod', 'CodTypeOrder', 'pending', '2025-02-15'),
('Xwp3OsYZNkSVT2ecdqxD', 4, 1, 20989, 'razor', 'CodTypeOrder', 'pending', '2025-02-19'),
('ZjxGuLM0l2gH3c5yqv9O', 2, 3, 35999, 'razor', 'pay_PzzyMvbSrGOJt7', 'pending', '2025-02-25'),
('ZKFDcVfzonxM7hEqilk4', 4, 1, 35999, 'razor', 'pay_PzzoSpYWuxFlVT', 'pending', '2025-02-25');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` varchar(250) NOT NULL,
  `cus_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `order_date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `cus_id`, `product_id`, `quantity`, `order_date`) VALUES
(8, 'xp2PkZLrQUuWyOfYbeDv', 4, 6, 1, '2025-02-15'),
(9, 'xp2PkZLrQUuWyOfYbeDv', 4, 4, 1, '2025-02-15'),
(10, 'xp2PkZLrQUuWyOfYbeDv', 4, 5, 2, '2025-02-15'),
(11, 'lvDa0HeLYBKb4oq2hkms', 2, 5, 1, '2025-02-16'),
(12, 'Ug2vjXpB98LkO1zwsmV6', 2, 7, 1, '2025-02-16'),
(13, 'Ug2vjXpB98LkO1zwsmV6', 2, 5, 1, '2025-02-16'),
(14, 'Ug2vjXpB98LkO1zwsmV6', 2, 4, 1, '2025-02-16'),
(15, 'Ug2vjXpB98LkO1zwsmV6', 2, 6, 1, '2025-02-16'),
(16, '5YlLcoHknDSvKAFsQphW', 4, 5, 1, '2025-02-18'),
(17, 'oih65vkgcnLX0etZ4F8a', 2, 4, 2, '2025-02-18'),
(18, 'oih65vkgcnLX0etZ4F8a', 2, 6, 1, '2025-02-18'),
(19, 'oih65vkgcnLX0etZ4F8a', 2, 5, 3, '2025-02-18'),
(20, 'oih65vkgcnLX0etZ4F8a', 2, 7, 1, '2025-02-18'),
(21, 'QPjADIT6zbZagkSc7qxo', 4, 7, 1, '2025-02-19'),
(22, 'QPjADIT6zbZagkSc7qxo', 4, 6, 1, '2025-02-19'),
(23, 'QPjADIT6zbZagkSc7qxo', 4, 4, 1, '2025-02-19'),
(24, 'QPjADIT6zbZagkSc7qxo', 4, 7, 3, '2025-02-19'),
(25, 'Xwp3OsYZNkSVT2ecdqxD', 4, 6, 1, '2025-02-19'),
(26, 'UbGcYrzMQvkSIjmOFBlV', 4, 6, 1, '2025-02-19'),
(27, 'UTrH0qko9FezcRYpNjs8', 5, 6, 1, '2025-02-19'),
(28, 'UTrH0qko9FezcRYpNjs8', 5, 7, 1, '2025-02-19'),
(29, 'dnvjy76fKMlHLtGSx3iR', 5, 7, 2, '2025-02-19'),
(30, 'OtJZ9Fl5I6TjSz0krEVM', 4, 4, 1, '2025-02-19'),
(31, 'OtJZ9Fl5I6TjSz0krEVM', 4, 4, 2, '2025-02-19'),
(32, 'OtJZ9Fl5I6TjSz0krEVM', 4, 6, 1, '2025-02-19'),
(33, 'IVs3iuLocCKejgXpaN0m', 4, 6, 1, '2025-02-25'),
(34, 'VEbGH0gC6ruBAymsS1pN', 4, 5, 1, '2025-02-25'),
(35, '9zPjHx1m8MtsoDkUFLgh', 4, 4, 1, '2025-02-25'),
(36, 'eWt8sMXYZaFqfhcTpvUo', 4, 4, 1, '2025-02-25'),
(37, 'NcOgVK78weFIUryW4xZB', 4, 5, 1, '2025-02-25'),
(38, 'NKgu5vRIfawpFGxrmXtW', 4, 7, 1, '2025-02-25'),
(39, 'irCqhmjaU0oTWDlpM7wF', 4, 4, 1, '2025-02-25'),
(40, 'hmfZnSILV0HDqUcxtyaO', 4, 7, 1, '2025-02-25'),
(41, 'ZjxGuLM0l2gH3c5yqv9O', 2, 5, 1, '2025-02-25'),
(42, '8wvA1WFbr7Okno0jqMTH', 2, 5, 1, '2025-02-26'),
(43, 'MsuZ6oIdyNL7T0hgmRxj', 4, 4, 1, '2025-03-04');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `product_name` varchar(400) NOT NULL,
  `product_price` double NOT NULL DEFAULT 0,
  `product_desc` text NOT NULL,
  `product_image` varchar(250) NOT NULL,
  `product_created_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `cat_id`, `product_name`, `product_price`, `product_desc`, `product_image`, `product_created_at`) VALUES
(4, 3, 'LG 80 cm (32 inches) HD Ready Smart LED TV 32LM563BPTC (Dark Iron Gray)', 13490, 'Resolution: HD Ready (1366x768) | Refresh Rate: 50 hertz\r\nConnectivity: 2 HDMI ports to connect set top box, Blu Ray players, gaming console | 1 USB ports to connect hard drives and other USB devices\r\nSound output: 10 Watts Output I 2 Speakers | DTS Virtual:X | Sound Type : Down Firing\r\nSmart TV Features: Web OS Smart TV | Wi-Fi | Home Dashboard | Screen Mirroring | Mini TV Browser | Multi-Tasking | Office 365, Set WXHXD (with Stand ) mm - 739 x 472 x 168\r\nDisplay: Active HDR | Display Type: Flat | BackLight Module: Slim LED\r\nWarranty Information: 1-Year LG India Standard Warranty on Product from the date of purchase (T&C Apply)', 'uploads/29-11-2024/71zFdS29uFL._SX679_.jpg', '2024-11-29'),
(5, 1, 'OnePlus 12R (Cool Blue, 8GB RAM, 128GB Storage)', 35999, 'Fast & Smooth for years: Snapdragon 8 Gen 2 Mobile Platform, Up to 16GB of LPDDR5X RAM with RAM-Vita - Dual Cryo-velocity VC Cooling System, TÜV SÜD 48-Month Fluency Rating A\r\nPristine Display with Aqua Touch: Super-Bright 1.5K LTPO ProXDR Display with Dolby Vision, and a DisplayMate A+ rating, Intellignent Eye Care certified by TÜV Rheinland, 4500 nits Peak Brightness, Aqua Touch helps you stay swiping, even with wet hands\r\nComputational Photography That\'s Incomparable: RAW HDR Algorithm, 50MP Sony IMX890 Camera and Ultra-wide Camera 112° FoV Sony IMX355, Ultra-Clear Image Quality\r\nOur Longest-Lasting Battery Ever: 5500 mAh Battery with 100W SUPERVOOC, Paired with our advanced Battery Health Engine for longevity\r\nSmoother and more stable connectivity: WiFi 7 Ready, Enhanced Wi-Fi, Lower gaming latency, Reduced network recovery time.', 'uploads/29-11-2024/717JX3femML._SX679_.jpg', '2024-11-29'),
(6, 4, 'Sony WH-1000XM4 Industry Leading Wireless Noise Cancellation Bluetooth Over Ear Headphones with Mic for Phone Calls, 30 Hours Battery Life, Quick Charge, AUX, Touch Control and Voice Control - Black', 20989, 'Digital noise cancelling: Industry leading Active Noise Cancellation (ANC) lends a personalized, virtually soundproof experience at any situation;Voice assistant: Alexa, Google Assistant & Siri enabled (In-built) for voice access to music, information and more. Activate with a simple touch\r\nSpeak-to-chat: Headphones use an array of smart technologies to create a seamless, hands-free listening experience. For eg, simply start speaking to automatically pause your music in Speak-to-Chat;Wearing Detection: Proximity sensor and two acceleration sensors in your headphones can detect whether you\'re wearing them or not, then adapt playback accordingly to help save battery power\r\nQuick attention mode: Cover the right ear cup with your palm to turn down music for instant, easy conversation;Smart listening: WH-1000XM4 adjusts the ambient sound to your activity to give you the best noise cancellation\r\nLong battery life/Quick Charge: A single charge provides up to 30 hrs of playtime for reliable all day listening and Quick charge for 10min charge for 5 hours play back;Multipoint connection : It can be paired with two Bluetooth devices at the same time.So when a call comes in, your headphones know which device is ringing and connect to the right one automatically.; Touch controls: Change the track, turn the volume up or down and take or make calls by tapping or swiping the panel with your fingertip\r\n', 'uploads/29-11-2024/61vIICn1JOL._SX679_.jpg', '2024-11-29'),
(7, 5, 'LG 201 L 5 Star Inverter Direct-Cool Single Door Refrigerator (GL-D211HBCZ, Blue Charm, Base stand with drawer)', 19490, 'Direct Cool Refrigerator: Economical and stylish\r\nCapacity 201 liters: Suitable for families with 2 to 3 members/ Couples / Bachelors | Freezer capacity: 24 L, Fresh food capacity: 177 L\r\nEnergy Rating: 5 Star- Best in class efficiency\r\nManufacturer warranty: 1 year on product, 10 years on compressor T&C\r\nSmart inverter compressor: Unmatched performance, great savings and super silent operation\r\nShelf Type: Toughened Glass with Front & Rear Deco | No. Of Shelves: 2\r\nBase stand with Drawer for additional space for non-refrigerated food items like potatoes and onions etc.', 'uploads/29-11-2024/61vkrWAijRL._SY879_.jpg', '2024-11-29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `Foreign Key` (`cus_id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `FK1` (`cus_id`),
  ADD KEY `FK2` (`product_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`cus_id`),
  ADD UNIQUE KEY `cus_email` (`cus_email`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `FK-1` (`cus_id`),
  ADD KEY `FK-2` (`address_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `FK` (`cat_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `cus_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `Foreign Key` FOREIGN KEY (`cus_id`) REFERENCES `customers` (`cus_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `FK1` FOREIGN KEY (`cus_id`) REFERENCES `customers` (`cus_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK-1` FOREIGN KEY (`cus_id`) REFERENCES `customers` (`cus_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK-2` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK` FOREIGN KEY (`cat_id`) REFERENCES `category` (`cat_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
