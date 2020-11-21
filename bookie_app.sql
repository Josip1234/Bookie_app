-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 21, 2020 at 09:49 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookie_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `basket`
--

CREATE TABLE `basket` (
  `id` int(11) NOT NULL,
  `ticket_number` varchar(255) COLLATE utf8_croatian_ci NOT NULL,
  `pair_number` varchar(100) COLLATE utf8_croatian_ci NOT NULL,
  `type_of_sport` enum('football') COLLATE utf8_croatian_ci DEFAULT NULL,
  `club1` varchar(50) COLLATE utf8_croatian_ci NOT NULL,
  `club2` varchar(50) COLLATE utf8_croatian_ci NOT NULL,
  `type_of_bet` enum('win,draw.lose','both score goals') COLLATE utf8_croatian_ci NOT NULL,
  `expected_result` varchar(255) COLLATE utf8_croatian_ci NOT NULL,
  `final_result` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `date_of_play` datetime NOT NULL,
  `coefficient` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

--
-- Dumping data for table `basket`
--

INSERT INTO `basket` (`id`, `ticket_number`, `pair_number`, `type_of_sport`, `club1`, `club2`, `type_of_bet`, `expected_result`, `final_result`, `date_of_play`, `coefficient`) VALUES
(1, '096-01332817', '7326', 'football', 'Tottenham', 'Manchester City', 'both score goals', 'yes', '2-0', '2020-11-21 18:30:00', 1.6),
(2, '096-01332817', '27106', 'football', 'Olympiacos Piraeus', 'Panathinaikos', 'both score goals', 'yes', '1-0', '2020-11-21 18:30:00', 2.2),
(3, '096-01332817', '27256', 'football', 'Young Boys Bern', 'FC Basel', 'both score goals', 'yes', 'yes', '2020-11-21 20:30:00', 1.5);

-- --------------------------------------------------------

--
-- Table structure for table `bookie_shop`
--

CREATE TABLE `bookie_shop` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_croatian_ci NOT NULL,
  `hq_address` varchar(100) COLLATE utf8_croatian_ci NOT NULL,
  `pin` varchar(11) COLLATE utf8_croatian_ci NOT NULL,
  `logo_link` text COLLATE utf8_croatian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

--
-- Dumping data for table `bookie_shop`
--

INSERT INTO `bookie_shop` (`id`, `name`, `hq_address`, `pin`, `logo_link`) VALUES
(1, 'SuperSport D.O.O.', 'KRČKA 18D, 10 000 ZAGREB', '48471634697', 'http://localhost/bs/Booking_app/supersportlogo.png');

-- --------------------------------------------------------

--
-- Table structure for table `heading`
--

CREATE TABLE `heading` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_croatian_ci NOT NULL,
  `address_of_payment` varchar(255) COLLATE utf8_croatian_ci NOT NULL,
  `date_time_of_payment` datetime NOT NULL,
  `ticket_number` varchar(255) COLLATE utf8_croatian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

--
-- Dumping data for table `heading`
--

INSERT INTO `heading` (`id`, `name`, `address_of_payment`, `date_time_of_payment`, `ticket_number`) VALUES
(1, 'SuperSport D.O.O.', 'Požega, Cehovska 8', '2020-11-21 09:40:05', '096-01332817');

-- --------------------------------------------------------

--
-- Table structure for table `win_amount`
--

CREATE TABLE `win_amount` (
  `id` int(11) NOT NULL,
  `ticket_number` varchar(255) COLLATE utf8_croatian_ci NOT NULL,
  `rate` float NOT NULL,
  `stake_without_tax` float NOT NULL,
  `tax_amount` varchar(10) COLLATE utf8_croatian_ci NOT NULL,
  `stake_with_tax` float NOT NULL,
  `possible_payment_without_tax` float NOT NULL,
  `currency` varchar(10) COLLATE utf8_croatian_ci NOT NULL,
  `payment_wiith_tax` float NOT NULL,
  `tax_percentage` varchar(10) COLLATE utf8_croatian_ci NOT NULL,
  `tax_payment_amount` float NOT NULL,
  `payment` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

--
-- Dumping data for table `win_amount`
--

INSERT INTO `win_amount` (`id`, `ticket_number`, `rate`, `stake_without_tax`, `tax_amount`, `stake_with_tax`, `possible_payment_without_tax`, `currency`, `payment_wiith_tax`, `tax_percentage`, `tax_payment_amount`, `payment`) VALUES
(1, '096-01332817', 5.28, 4.75, '5%', 5, 25.08, 'kn', 23.05, '10', 2.03, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `basket`
--
ALTER TABLE `basket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_number` (`ticket_number`);

--
-- Indexes for table `bookie_shop`
--
ALTER TABLE `bookie_shop`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `hq_address` (`hq_address`),
  ADD UNIQUE KEY `pin` (`pin`),
  ADD UNIQUE KEY `logo_link` (`logo_link`) USING HASH;

--
-- Indexes for table `heading`
--
ALTER TABLE `heading`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ticket_number` (`ticket_number`),
  ADD KEY `logo_link` (`name`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `win_amount`
--
ALTER TABLE `win_amount`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_number` (`ticket_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `basket`
--
ALTER TABLE `basket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bookie_shop`
--
ALTER TABLE `bookie_shop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `heading`
--
ALTER TABLE `heading`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `win_amount`
--
ALTER TABLE `win_amount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `basket`
--
ALTER TABLE `basket`
  ADD CONSTRAINT `ticketnofk` FOREIGN KEY (`ticket_number`) REFERENCES `heading` (`ticket_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `heading`
--
ALTER TABLE `heading`
  ADD CONSTRAINT `namefk` FOREIGN KEY (`name`) REFERENCES `bookie_shop` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `win_amount`
--
ALTER TABLE `win_amount`
  ADD CONSTRAINT `ticketnumfk` FOREIGN KEY (`ticket_number`) REFERENCES `heading` (`ticket_number`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
