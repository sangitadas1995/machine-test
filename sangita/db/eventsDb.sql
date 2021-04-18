-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 18, 2021 at 10:06 PM
-- Server version: 8.0.23-0ubuntu0.20.04.1
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eventsDb`
--

-- --------------------------------------------------------

--
-- Table structure for table `custom_markers`
--

CREATE TABLE `custom_markers` (
  `id` int NOT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `marker_type` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `status` enum('0','1') COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `custom_markers`
--

INSERT INTO `custom_markers` (`id`, `latitude`, `longitude`, `marker_type`, `status`, `created_at`, `updated_at`) VALUES
(1, '22.5751', '88.3629', 'info', '1', '2021-04-18 14:54:08', '2021-04-18 21:30:39'),
(2, '22.7391', '88.4351', 'info', '1', '2021-04-18 14:54:08', '2021-04-18 21:30:42'),
(3, '22.7674', '88.3883', 'info', '1', '2021-04-18 14:55:00', '2021-04-18 21:30:45'),
(4, '22.5883', '88.4085', 'parking', '1', '2021-04-18 14:55:00', '2021-04-18 21:31:09'),
(5, '22.5676', '88.3707', 'parking', '1', '2021-04-18 14:56:01', '2021-04-18 21:31:12'),
(6, '22.5332', '88.3334', 'library', '1', '2021-04-18 14:56:01', '2021-04-18 21:31:16'),
(7, '22.5726', '88.3639', 'library', '1', '2021-04-18 14:56:34', '2021-04-18 21:31:17');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int NOT NULL,
  `event_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `is_active` enum('0','1') COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `event_name`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'on focus', '1', '2021-04-17 00:35:47', NULL),
(2, 'mouse hover', '1', '2021-04-17 00:35:54', NULL),
(3, 'on focus', '1', '2021-04-17 00:35:56', NULL),
(4, 'on blur', '1', '2021-04-17 00:35:59', NULL),
(5, 'on focus', '1', '2021-04-17 00:35:59', NULL),
(6, 'Sangita(on click event)', '1', '2021-04-17 00:35:59', NULL),
(7, 'on blur', '1', '2021-04-17 00:36:06', NULL),
(8, 'on blur', '1', '2021-04-17 00:36:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mainMap`
--

CREATE TABLE `mainMap` (
  `id` int NOT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `status` enum('0','1') COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mainMap`
--

INSERT INTO `mainMap` (`id`, `latitude`, `longitude`, `status`, `created_at`, `updated_at`) VALUES
(1, '22.9868', '87.8550', '1', '2021-04-18 18:03:44', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `custom_markers`
--
ALTER TABLE `custom_markers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mainMap`
--
ALTER TABLE `mainMap`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `custom_markers`
--
ALTER TABLE `custom_markers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `mainMap`
--
ALTER TABLE `mainMap`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
