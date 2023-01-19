-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2022 at 02:08 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rental_car`
--

-- --------------------------------------------------------

--
-- Table structure for table `active_rental`
--

CREATE TABLE `active_rental` (
  `VEHICLE_ID` int(11) NOT NULL,
  `STATUS` char(5) DEFAULT NULL,
  `PERIOD_FROM` date DEFAULT NULL,
  `PERIOD_TO` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `VEHICLE_ID` int(11) NOT NULL,
  `MODEL` varchar(45) NOT NULL,
  `YEAR` int(11) DEFAULT NULL,
  `CAR_TYPE_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `car_type`
--

CREATE TABLE `car_type` (
  `CAR_TYPE_ID` int(11) NOT NULL,
  `CAR_TYPE` varchar(45) NOT NULL,
  `DAILY_RATE` float DEFAULT NULL,
  `WEEKLY_RATE` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `CUSTOMER_ID` int(11) NOT NULL,
  `CUSTOMERS_NAME` varchar(45) NOT NULL,
  `PHONE` char(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `daily_rental`
--

CREATE TABLE `daily_rental` (
  `RENTAL_ID` int(11) NOT NULL,
  `VEHICLE_ID` int(11) DEFAULT NULL,
  `CUSTOMER_ID` int(11) DEFAULT NULL,
  `NO_OF_DAYS` float DEFAULT NULL,
  `START_DATE` date DEFAULT NULL,
  `END_DATE` date DEFAULT NULL,
  `AMOUNT_DUE` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `weekly_rental`
--

CREATE TABLE `weekly_rental` (
  `RENTAL_ID` int(11) NOT NULL,
  `CUSTOMER_ID` int(11) DEFAULT NULL,
  `VEHICLE_ID` int(11) NOT NULL,
  `NO_OF_WEEKS` float DEFAULT NULL,
  `START_DATE` date DEFAULT NULL,
  `END_DATE` date DEFAULT NULL,
  `AMOUNT_DUE` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `active_rental`
--
ALTER TABLE `active_rental`
  ADD PRIMARY KEY (`VEHICLE_ID`);

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`VEHICLE_ID`),
  ADD KEY `FK_CARTYPE` (`CAR_TYPE_ID`);

--
-- Indexes for table `car_type`
--
ALTER TABLE `car_type`
  ADD PRIMARY KEY (`CAR_TYPE_ID`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`CUSTOMER_ID`);

--
-- Indexes for table `daily_rental`
--
ALTER TABLE `daily_rental`
  ADD PRIMARY KEY (`RENTAL_ID`),
  ADD KEY `FK_CUSTOMER_DAILY` (`CUSTOMER_ID`),
  ADD KEY `FK_VEHICLE_DAILY` (`VEHICLE_ID`);

--
-- Indexes for table `weekly_rental`
--
ALTER TABLE `weekly_rental`
  ADD PRIMARY KEY (`RENTAL_ID`,`VEHICLE_ID`),
  ADD KEY `FK_CUSTOMER_WEEKLY` (`CUSTOMER_ID`),
  ADD KEY `FK_VEHICLE_WEEKLY` (`VEHICLE_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `CUSTOMER_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `active_rental`
--
ALTER TABLE `active_rental`
  ADD CONSTRAINT `FK_VEHICLE_ACTIVE` FOREIGN KEY (`VEHICLE_ID`) REFERENCES `car` (`VEHICLE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `FK_CARTYPE` FOREIGN KEY (`CAR_TYPE_ID`) REFERENCES `car_type` (`CAR_TYPE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `daily_rental`
--
ALTER TABLE `daily_rental`
  ADD CONSTRAINT `FK_CUSTOMER_DAILY` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customers` (`CUSTOMER_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_VEHICLE_DAILY` FOREIGN KEY (`VEHICLE_ID`) REFERENCES `car` (`VEHICLE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `weekly_rental`
--
ALTER TABLE `weekly_rental`
  ADD CONSTRAINT `FK_CUSTOMER_WEEKLY` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customers` (`CUSTOMER_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_VEHICLE_WEEKLY` FOREIGN KEY (`VEHICLE_ID`) REFERENCES `car` (`VEHICLE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
