-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 01, 2017 at 01:50 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bjts`
--
CREATE DATABASE IF NOT EXISTS `bjts` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `bjts`;

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `branchID` int(11) NOT NULL,
  `branchName` varchar(100) NOT NULL,
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `branchAddress` varchar(200) NOT NULL,
  `telephoneNo` varchar(15) NOT NULL,
  `mobilePhoneNo` varchar(15) NOT NULL,
  `companyID` int(11) NOT NULL,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`branchID`, `branchName`, `dateAdded`, `branchAddress`, `telephoneNo`, `mobilePhoneNo`, `companyID`, `userID`) VALUES
(1, 'dff', '2016-07-21 00:43:43', 'rtrtrtr', 't4et', '65656', 1, 1),
(11, 'Bosuokan', '2016-07-26 11:43:32', 'Box 344, Accra', '0209898987', '', 1, 1),
(21, 'BRANCH', '2016-07-28 08:52:08', '123 Anna salai', '12334534534464', '9884098840', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cartID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `transactionID` varchar(10) NOT NULL,
  `userID` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cartID`, `productID`, `qty`, `transactionID`, `userID`, `status`, `dateAdded`) VALUES
(733, 1, 1, '10001', 1, 1, '2017-10-24 17:55:15'),
(734, 1, 1, '10001', 1, 1, '2017-10-24 17:55:29'),
(735, 71, 1, '10001', 1, 1, '2017-10-29 15:37:52'),
(736, 3, 1, '10001', 1, 1, '2017-10-29 16:10:56'),
(745, 3, 1, '10001', 1, 1, '2017-10-29 17:33:37'),
(746, 1, 1, '10001', 1, 1, '2017-10-29 17:36:20'),
(747, 71, 1, '10001', 1, 1, '2017-10-29 18:10:11'),
(748, 71, 1, '10001', 1, 1, '2017-10-29 18:20:07'),
(749, 71, 1, '10001', 1, 1, '2017-10-29 18:26:10'),
(750, 71, 1, '10001', 1, 1, '2017-10-29 18:28:09'),
(751, 71, 1, '10001', 1, 1, '2017-10-29 18:30:20');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `companyID` int(11) NOT NULL DEFAULT '1',
  `companyName` varchar(100) NOT NULL,
  `logo` blob NOT NULL,
  `userID` int(11) NOT NULL,
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`companyID`, `companyName`, `logo`, `userID`, `dateAdded`) VALUES
(1, 'Tropical Parts &amp; Services', 0x545053206c6f676f2e706e67, 1, '2016-07-19 05:13:37');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `countryID` int(11) NOT NULL,
  `countryName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`countryID`, `countryName`) VALUES
(1, 'GHANA'),
(2, 'UK');

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE `discount` (
  `discountID` int(11) NOT NULL,
  `percentDiscountRate` decimal(6,2) NOT NULL,
  `amountDiscountRate` decimal(6,2) NOT NULL,
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` bit(1) NOT NULL DEFAULT b'1',
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `discount`
--

INSERT INTO `discount` (`discountID`, `percentDiscountRate`, `amountDiscountRate`, `dateAdded`, `status`, `userID`) VALUES
(1, '10.00', '3.00', '2016-07-25 18:51:18', b'1111111111111111111111111111111', 1),
(11, '4.03', '9.99', '2016-07-25 18:52:06', b'1111111111111111111111111111111', 1);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employeeID` int(11) NOT NULL,
  `personID` int(11) NOT NULL,
  `jobtitle` varchar(100) NOT NULL,
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userID` int(11) NOT NULL,
  `hiredDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gender`
--

CREATE TABLE `gender` (
  `sexid` int(11) NOT NULL,
  `sex` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gender`
--

INSERT INTO `gender` (`sexid`, `sex`) VALUES
(1, 'Male'),
(2, 'Female');

-- --------------------------------------------------------

--
-- Table structure for table `gentrans`
--

CREATE TABLE `gentrans` (
  `transID` int(11) NOT NULL,
  `fName` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gentrans`
--

INSERT INTO `gentrans` (`transID`, `fName`) VALUES
(10001, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jobtitles`
--

CREATE TABLE `jobtitles` (
  `jobtitleID` int(11) NOT NULL,
  `jobtitle` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jobtitles`
--

INSERT INTO `jobtitles` (`jobtitleID`, `jobtitle`) VALUES
(1, 'Managing Director'),
(2, 'Sales Person');

-- --------------------------------------------------------

--
-- Table structure for table `locationdetails`
--

CREATE TABLE `locationdetails` (
  `locationID` int(11) NOT NULL,
  `locationName` varchar(100) NOT NULL,
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `locationdetails`
--

INSERT INTO `locationdetails` (`locationID`, `locationName`, `dateAdded`) VALUES
(1, 'Warehouse', '2016-07-21 01:48:54'),
(2, 'SalesFloor', '2016-07-21 01:58:51');

-- --------------------------------------------------------

--
-- Table structure for table `markup`
--

CREATE TABLE `markup` (
  `markupID` int(11) NOT NULL,
  `percentMarkup` decimal(6,2) NOT NULL,
  `amountMarkup` decimal(6,2) NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `markup`
--

INSERT INTO `markup` (`markupID`, `percentMarkup`, `amountMarkup`, `status`, `dateAdded`, `userID`) VALUES
(1, '50.00', '100.00', b'1111111111111111111111111111111', '2016-07-25 19:17:39', 1);

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `personID` int(11) NOT NULL,
  `title` varchar(10) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `othername` varchar(100) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `DOB` date NOT NULL,
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`personID`, `title`, `firstName`, `surname`, `othername`, `Gender`, `DOB`, `dateAdded`, `userID`) VALUES
(1, 'Mr', 'Prosper', 'Yeng', '', 'Male', '1991-06-29', '2016-05-29 22:16:06', 1),
(5, 'ms', 'elen', 'yeng', '', 'f', '2008-06-07', '2016-06-12 05:40:43', 1),
(6, 'ms', 'elen', 'yeng', '', 'f', '2008-06-07', '2016-06-12 06:04:42', 1),
(9, 'mr', 'pro', 'yeng', 'kand', 'm', '1977-09-27', '2016-06-12 20:22:21', 1),
(10, 'Mr.', 'Kanda', 'Yeng', '', 'Male', '2016-06-22', '2016-06-17 20:07:25', 1),
(11, 'Mr.', 'Kanda', 'Yeng', '', 'Male', '2016-06-22', '2016-06-17 20:08:24', 1),
(12, 'Mr.', 'Kanda', 'Yeng', '', 'Male', '2016-06-22', '2016-06-17 20:08:39', 1),
(13, 'Choose Tit', 'nn', 'vb', '', 'Choose Gen', '2016-06-18', '2016-06-17 21:36:37', 1),
(14, 'Mr.', 'Pros', 'Yeng', '', 'Male', '2016-06-14', '2016-06-18 04:43:01', 1),
(15, 'Mr.', 'Pros', 'Yeng', '', 'Male', '2016-06-14', '2016-06-18 05:33:58', 1),
(21, 'Dr.', 'Eva', 'Yeng', '', 'Female', '2015-08-04', '2016-08-06 20:41:58', 1);

-- --------------------------------------------------------

--
-- Table structure for table `personaddress`
--

CREATE TABLE `personaddress` (
  `addressID` int(11) NOT NULL,
  `personID` int(11) NOT NULL,
  `addressline1` varchar(100) NOT NULL,
  `addressline2` varchar(100) DEFAULT NULL,
  `postBox` varchar(20) NOT NULL,
  `town` varchar(100) NOT NULL,
  `region` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `hometell` varchar(15) NOT NULL,
  `mobilephoneNo` varchar(15) NOT NULL,
  `emailAddress` varchar(50) NOT NULL,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `personaddress`
--

INSERT INTO `personaddress` (`addressID`, `personID`, `addressline1`, `addressline2`, `postBox`, `town`, `region`, `country`, `hometell`, `mobilephoneNo`, `emailAddress`, `userID`) VALUES
(2, 1, 'Drapes Systems', 'Brekum Road', '4', 'Sunyani', 'BRONG-AHAFO', 'GHANA', '', '07404388212', 'kandagh2000@gmail.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `personphoto`
--

CREATE TABLE `personphoto` (
  `photoID` int(11) NOT NULL,
  `targetfile` blob NOT NULL,
  `personID` int(11) NOT NULL,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `personphoto`
--

INSERT INTO `personphoto` (`photoID`, `targetfile`, `personID`, `userID`) VALUES
(1, 0x68682e6a7067, 1, 1),
(11, 0x3030312e6a7067, 11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

CREATE TABLE `positions` (
  `positionID` int(11) NOT NULL,
  `partPosition` varchar(100) NOT NULL,
  `userID` int(11) NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `positions`
--

INSERT INTO `positions` (`positionID`, `partPosition`, `userID`, `active`, `dateAdded`) VALUES
(1, 'BACK-RIGHT', 1, b'1111111111111111111111111111111', '2016-07-22 05:37:28');

-- --------------------------------------------------------

--
-- Table structure for table `proclassification`
--

CREATE TABLE `proclassification` (
  `ClassID` int(11) NOT NULL,
  `proClass` varchar(50) NOT NULL,
  `proTypeID` int(11) NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `proclassification`
--

INSERT INTO `proclassification` (`ClassID`, `proClass`, `proTypeID`, `status`, `dateAdded`, `userID`) VALUES
(1, 'Oil&Lubs', 11, b'1111111111111111111111111111111', '2016-07-26 20:42:44', 1),
(11, 'BrakePads', 1, b'1111111111111111111111111111111', '2016-07-26 22:21:47', 1),
(21, 'ShucksAbsurber', 1, b'1111111111111111111111111111111', '2016-07-26 22:22:23', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `productID` int(11) NOT NULL,
  `proTypeID` int(11) NOT NULL,
  `partNumber` varchar(100) DEFAULT NULL,
  `partName` varchar(100) NOT NULL,
  `barcode` varchar(100) DEFAULT NULL,
  `OEM` varchar(100) DEFAULT NULL,
  `proClassID` varchar(100) NOT NULL,
  `origin` varchar(100) DEFAULT NULL,
  `partPosition` varchar(100) DEFAULT NULL,
  `proDescription` text,
  `Remark` text,
  `userID` int(11) NOT NULL,
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productID`, `proTypeID`, `partNumber`, `partName`, `barcode`, `OEM`, `proClassID`, `origin`, `partPosition`, `proDescription`, `Remark`, `userID`, `dateAdded`, `status`) VALUES
(1, 1, '09090ss', 'AirCondition ', 'ddfdfdreffdf', 'ff3ref', '1', '1', '1', '5/3 part aircon motor', '', 1, '2016-07-25 10:37:22', b'1111111111111111111111111111111'),
(3, 1, '999', 'brakeBands', '', '999', '21', '1', '1', 'sfsdss', 'xcx', 1, '2016-07-27 16:07:19', b'1111111111111111111111111111111'),
(11, 1, '0909Z', 'SBN', '', '0908Z', '21', '1', '1', '2/5 Asorber', '0909', 1, '2016-08-06 17:38:07', b'1111111111111111111111111111111'),
(61, 1, '2001', 'CSS3DD', '', '090C', '11', '1', '1', '&lt;script&gt;\\r\\n\\\'http://webpos-project.azurewebsites.net/addEmployeeForm.php?id=\\\'+document.cookie\\r\\n&lt;/script&gt;\\r\\n', 'Testing XSS Attack on WebPOS', 1, '2016-08-06 18:03:03', b'1111111111111111111111111111111'),
(71, 1, '0909DD', 'XSS', '', 'DD090', '21', '2', '1', '&lt;script&gt;\\r\\n\\\'http://webpos-project.azurewebsites.net/addEmployeeForm.php?id=\\\'+document.cookie\\r\\n&lt;/script&gt;\\r\\n', 'Test XSS attack', 1, '2016-08-06 20:02:31', b'1111111111111111111111111111111'),
(81, 1, 'TT5', 'backPad', '', 'TTB', '11', '2', '1', '', '', 1, '2016-08-07 20:02:03', b'1111111111111111111111111111111'),
(91, 1, 'BSSB', 'BSS', '', 'BSSB', '11', '1', '1', '', '', 1, '2016-08-07 20:10:39', b'1111111111111111111111111111111'),
(101, 11, 'FDDFD', 'DDD', '', 'DFDFD', '21', '1', '1', '', '', 1, '2016-08-07 20:17:13', b'1111111111111111111111111111111'),
(111, 1, 'CSRF', 'CSRF', '', 'CSRF', '21', '1', '1', 'Testing Anti CSRF', '', 1, '2016-08-08 10:46:05', b'1111111111111111111111111111111'),
(112, 1, 'FFF', 'FFF', 'FFF', 'FFF', '11', '2', '1', '', '', 1, '2016-08-08 11:49:18', b'1111111111111111111111111111111'),
(251, 1, 'AntiCSRF', 'AntiCSRF', 'AntiCSRF', 'AntiCSRF', '21', '2', '1', 'AntiCSRF', 'AntiCSRF', 1, '2016-08-08 12:56:16', b'1111111111111111111111111111111'),
(263, 1, 'dd', 'ddgg', '', 'ddhg', '21', '2', '1', '', '', 1, '2016-08-08 16:29:17', b'1111111111111111111111111111111'),
(264, 1, 'dd5', 'dy', 'dd5', 'dd5', '21', '2', '1', '', '', 1, '2016-08-08 16:31:53', b'1111111111111111111111111111111'),
(265, 1, 'fg', 'fg', 'dd', 'fg', '21', '2', '1', '', '', 1, '2016-08-08 17:50:10', b'1111111111111111111111111111111'),
(268, 1, 'ddf', 'ddt', 'ddf', 'ddf', '21', '2', '1', 'ddf', 'ddf', 1, '2016-08-08 18:05:20', b'1111111111111111111111111111111'),
(269, 1, 'TestAntiCSRF', 'TestAntiCSRF', 'TestAntiCSRF', 'TestAntiCSRF', '21', '1', '1', 'Test AntiCSRF', 'Test AntiCSRF', 1, '2016-08-08 18:07:29', b'1111111111111111111111111111111'),
(270, 1, 'dduu', 'dduu', 'dduu', 'dduu', '21', '2', '1', 'dduu', 'dduu', 1, '2016-08-08 18:22:46', b'1111111111111111111111111111111'),
(271, 1, 'ddtr', 'ddtr', '', 'ddtr', '21', '2', '1', '', '', 1, '2016-08-09 02:48:28', b'1111111111111111111111111111111'),
(272, 1, 'jjjj', 'jjj', 'jjj', 'jjj', '21', '2', '1', '', '', 1, '2016-08-09 13:05:48', b'1111111111111111111111111111111'),
(273, 1, 'dff', 'fdfd', 'dfdfd', 'dfd', '21', '2', '1', '&lt;script&gt;\\r\\nwindow.location=\\\'http://finalwebpos.azurewebsites.net/addEmployeeForm.php?id=\\\'+document.cookie\\r\\n&lt;/script&gt;\\r\\n', 'try XSS', 1, '2016-08-24 19:59:00', b'1111111111111111111111111111111'),
(274, 1, 'hhfhf', 'xxxxx', 'gfgf', 'gfgfgf', '21', '1', '1', '&lt;script&gt;\\r\\nwindow.location=\\\'http://finalwebpos.azurewebsites.net/addEmployeeForm.php?id=\\\'+document.cookie\\r\\n&lt;/script&gt;\\r\\n', 'fss', 1, '2016-08-25 11:56:26', b'1111111111111111111111111111111'),
(275, 11, '1232', 'HD', '', '1232', '0', '2', '1', '', '', 1, '2017-03-03 09:18:40', b'1111111111111111111111111111111'),
(276, 1, '234', 'sentus', '', 'vgt5', '21', '1', '1', '', '', 1, '2017-10-29 16:07:53', b'1111111111111111111111111111111');

-- --------------------------------------------------------

--
-- Table structure for table `producttype`
--

CREATE TABLE `producttype` (
  `productTypeID` int(11) NOT NULL,
  `proType` varchar(100) NOT NULL,
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userID` int(11) NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `producttype`
--

INSERT INTO `producttype` (`productTypeID`, `proType`, `dateAdded`, `userID`, `status`) VALUES
(1, 'Part', '2016-07-22 06:00:46', 1, b'1111111111111111111111111111111'),
(11, 'Consumable', '2016-07-26 21:36:05', 1, b'1111111111111111111111111111111');

-- --------------------------------------------------------

--
-- Table structure for table `rack`
--

CREATE TABLE `rack` (
  `rackID` int(11) NOT NULL,
  `rackName` varchar(200) NOT NULL,
  `numberOfShelves` int(11) NOT NULL,
  `sectionID` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rack`
--

INSERT INTO `rack` (`rackID`, `rackName`, `numberOfShelves`, `sectionID`, `userid`, `dateAdded`) VALUES
(102, '001', 6, 1, 1, '2016-07-21 15:47:46');

-- --------------------------------------------------------

--
-- Table structure for table `region`
--

CREATE TABLE `region` (
  `regionID` int(11) NOT NULL,
  `regionName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `region`
--

INSERT INTO `region` (`regionID`, `regionName`) VALUES
(2, 'BRONG-AHAFO'),
(1, 'UPPER WEST');

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `sectionID` int(11) NOT NULL,
  `sectionName` varchar(100) NOT NULL,
  `SectionType` int(11) NOT NULL,
  `branchID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`sectionID`, `sectionName`, `SectionType`, `branchID`, `userID`, `dateAdded`) VALUES
(1, 'Belts', 2, 1, 1, '2016-07-24 22:13:00'),
(51, 'Lubricants', 2, 11, 1, '2016-07-26 11:48:19');

-- --------------------------------------------------------

--
-- Table structure for table `shelve`
--

CREATE TABLE `shelve` (
  `shelveID` int(11) NOT NULL,
  `shelveName` varchar(100) NOT NULL,
  `rackID` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shelve`
--

INSERT INTO `shelve` (`shelveID`, `shelveName`, `rackID`, `userid`, `dateAdded`) VALUES
(2, '0030', 102, 1, '2016-07-21 17:37:59'),
(11, '0040', 102, 1, '2016-07-22 00:54:13');

-- --------------------------------------------------------

--
-- Table structure for table `suppliedproduct`
--

CREATE TABLE `suppliedproduct` (
  `spID` int(11) NOT NULL,
  `supplierID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `costPrice` decimal(6,2) NOT NULL,
  `currencyID` int(10) NOT NULL,
  `qty` decimal(6,2) NOT NULL,
  `suppliedDate` date NOT NULL,
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userID` int(11) NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `suppliedproduct`
--

INSERT INTO `suppliedproduct` (`spID`, `supplierID`, `productID`, `costPrice`, `currencyID`, `qty`, `suppliedDate`, `dateAdded`, `userID`, `status`) VALUES
(1, 101, 1, '90.00', 1, '90.00', '2016-07-21', '2016-07-25 16:36:22', 1, b'1111111111111111111111111111111'),
(41, 101, 1, '44.00', 1, '33.00', '2016-07-11', '2016-07-25 16:52:32', 1, b'1111111111111111111111111111111'),
(51, 101, 1, '90.70', 1, '77.00', '2016-07-12', '2016-07-25 16:55:06', 1, b'1111111111111111111111111111111');

-- --------------------------------------------------------

--
-- Table structure for table `suppliedstuck`
--

CREATE TABLE `suppliedstuck` (
  `stuckID` int(11) NOT NULL,
  `supplierID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `stuckqty` decimal(6,2) NOT NULL,
  `sellPrice` decimal(6,2) NOT NULL,
  `costPrice` decimal(6,2) DEFAULT NULL,
  `shelfID` int(11) NOT NULL,
  `taxID1` int(11) NOT NULL,
  `taxID2` int(11) NOT NULL,
  `Discount` decimal(6,2) DEFAULT NULL,
  `markup` decimal(6,2) NOT NULL,
  `InvoiceNumber` varchar(50) DEFAULT NULL,
  `reorderLevel` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `userID` int(11) NOT NULL,
  `suppliedDate` date DEFAULT NULL,
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `suppliedstuck`
--

INSERT INTO `suppliedstuck` (`stuckID`, `supplierID`, `productID`, `stuckqty`, `sellPrice`, `costPrice`, `shelfID`, `taxID1`, `taxID2`, `Discount`, `markup`, `InvoiceNumber`, `reorderLevel`, `status`, `userID`, `suppliedDate`, `dateAdded`) VALUES
(32, 111, 3, '260.00', '200.00', '90.00', 2, 1, 11, '4.03', '50.00', '0099', 0, 1, 1, '2016-07-14', '2016-07-28 05:04:36'),
(41, 111, 1, '175.00', '90.00', '20.00', 11, 11, 1, '4.03', '50.00', '9090', 10, 1, 1, '2016-07-12', '2016-07-29 04:19:00'),
(51, 111, 71, '406.00', '300.00', '20.00', 2, 1, 1, '4.03', '50.00', '008787', 10, 1, 1, '2016-08-06', '2016-08-06 20:26:12');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplierID` int(11) NOT NULL,
  `supplierName` varchar(100) NOT NULL,
  `personID` int(11) DEFAULT NULL,
  `userid` int(11) NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplierID`, `supplierName`, `personID`, `userid`, `active`, `dateAdded`) VALUES
(111, 'I-data', 1, 1, b'1111111111111111111111111111111', '2016-07-27 18:27:27');

-- --------------------------------------------------------

--
-- Table structure for table `tax`
--

CREATE TABLE `tax` (
  `taxID` int(11) NOT NULL,
  `taxName` varchar(100) NOT NULL,
  `taxRate` decimal(6,2) NOT NULL,
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userID` int(11) NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tax`
--

INSERT INTO `tax` (`taxID`, `taxName`, `taxRate`, `dateAdded`, `userID`, `status`) VALUES
(1, 'NHIL', '15.00', '2016-07-25 18:14:15', 1, b'1111111111111111111111111111111'),
(11, 'VAT', '15.00', '2016-07-25 18:18:20', 1, b'1111111111111111111111111111111');

-- --------------------------------------------------------

--
-- Table structure for table `titles`
--

CREATE TABLE `titles` (
  `titleID` int(11) NOT NULL,
  `titleName` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `titles`
--

INSERT INTO `titles` (`titleID`, `titleName`) VALUES
(1, 'Mr.'),
(2, 'Ms.'),
(3, 'Dr.');

-- --------------------------------------------------------

--
-- Table structure for table `tradecurrency`
--

CREATE TABLE `tradecurrency` (
  `CurrencyID` int(11) NOT NULL,
  `currency` varchar(10) NOT NULL DEFAULT 'GHS',
  `status` bit(1) NOT NULL DEFAULT b'1',
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tradecurrency`
--

INSERT INTO `tradecurrency` (`CurrencyID`, `currency`, `status`, `dateAdded`, `userID`) VALUES
(1, '$', b'1111111111111111111111111111111', '2016-07-25 14:40:45', 1);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transCode` int(11) NOT NULL COMMENT 'Unique code to identify transaction',
  `transactionID` int(11) NOT NULL COMMENT 'code that identify a product or group of products purchased',
  `cartID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `qty` decimal(6,2) NOT NULL,
  `sellPrice` decimal(6,2) NOT NULL,
  `discountID` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userID` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`transCode`, `transactionID`, `cartID`, `productID`, `qty`, `sellPrice`, `discountID`, `status`, `dateAdded`, `userID`) VALUES
(1, 10001, 692, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:09', 1),
(2, 10001, 693, 3, '1.00', '200.00', 4, 1, '2017-03-10 01:48:09', 1),
(3, 10001, 694, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:09', 1),
(4, 10001, 695, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:09', 1),
(5, 10001, 696, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:10', 1),
(6, 10001, 697, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:10', 1),
(7, 10001, 698, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:10', 1),
(8, 10001, 699, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:10', 1),
(9, 10001, 700, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:10', 1),
(10, 10001, 701, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:10', 1),
(11, 10001, 702, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:10', 1),
(12, 10001, 703, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:10', 1),
(13, 10001, 704, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:10', 1),
(14, 10001, 705, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:11', 1),
(15, 10001, 706, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:11', 1),
(16, 10001, 707, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:11', 1),
(17, 10001, 708, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:11', 1),
(18, 10001, 709, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:11', 1),
(19, 10001, 710, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:11', 1),
(20, 10001, 711, 3, '1.00', '200.00', 4, 1, '2017-03-10 01:48:12', 1),
(21, 10001, 712, 3, '1.00', '200.00', 4, 1, '2017-03-10 01:48:12', 1),
(22, 10001, 713, 3, '1.00', '200.00', 4, 1, '2017-03-10 01:48:12', 1),
(23, 10001, 714, 3, '1.00', '200.00', 4, 1, '2017-03-10 01:48:12', 1),
(24, 10001, 692, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:12', 1),
(25, 10001, 693, 3, '1.00', '200.00', 4, 1, '2017-03-10 01:48:13', 1),
(26, 10001, 694, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:13', 1),
(27, 10001, 695, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:13', 1),
(28, 10001, 696, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:13', 1),
(29, 10001, 697, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:13', 1),
(30, 10001, 698, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:13', 1),
(31, 10001, 699, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:13', 1),
(32, 10001, 700, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:14', 1),
(33, 10001, 701, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:14', 1),
(34, 10001, 702, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:14', 1),
(35, 10001, 703, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:14', 1),
(36, 10001, 704, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:14', 1),
(37, 10001, 705, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:14', 1),
(38, 10001, 706, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:14', 1),
(39, 10001, 707, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:14', 1),
(40, 10001, 708, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:15', 1),
(41, 10001, 709, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:15', 1),
(42, 10001, 710, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:15', 1),
(43, 10001, 711, 3, '1.00', '200.00', 4, 1, '2017-03-10 01:48:15', 1),
(44, 10001, 712, 3, '1.00', '200.00', 4, 1, '2017-03-10 01:48:15', 1),
(45, 10001, 713, 3, '1.00', '200.00', 4, 1, '2017-03-10 01:48:15', 1),
(46, 10001, 714, 3, '1.00', '200.00', 4, 1, '2017-03-10 01:48:15', 1),
(47, 10001, 692, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:15', 1),
(48, 10001, 693, 3, '1.00', '200.00', 4, 1, '2017-03-10 01:48:15', 1),
(49, 10001, 694, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:15', 1),
(50, 10001, 695, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:15', 1),
(51, 10001, 696, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:15', 1),
(52, 10001, 697, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:16', 1),
(53, 10001, 698, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:16', 1),
(54, 10001, 699, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:16', 1),
(55, 10001, 700, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:16', 1),
(56, 10001, 701, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:16', 1),
(57, 10001, 702, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:16', 1),
(58, 10001, 703, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:16', 1),
(59, 10001, 704, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:16', 1),
(60, 10001, 705, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:16', 1),
(61, 10001, 706, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:16', 1),
(62, 10001, 707, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:16', 1),
(63, 10001, 708, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:16', 1),
(64, 10001, 709, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:16', 1),
(65, 10001, 710, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:16', 1),
(66, 10001, 711, 3, '1.00', '200.00', 4, 1, '2017-03-10 01:48:17', 1),
(67, 10001, 712, 3, '1.00', '200.00', 4, 1, '2017-03-10 01:48:17', 1),
(68, 10001, 713, 3, '1.00', '200.00', 4, 1, '2017-03-10 01:48:17', 1),
(69, 10001, 714, 3, '1.00', '200.00', 4, 1, '2017-03-10 01:48:17', 1),
(70, 10001, 728, 3, '1.00', '200.00', 4, 1, '2017-08-06 11:36:45', 1),
(71, 10001, 729, 71, '2.00', '300.00', 4, 1, '2017-08-06 11:36:45', 1),
(72, 10001, 730, 71, '1.00', '300.00', 4, 1, '2017-08-06 11:36:45', 1),
(73, 10001, 731, 71, '11.00', '300.00', 4, 1, '2017-08-06 11:36:45', 1),
(74, 10001, 728, 3, '1.00', '200.00', 4, 1, '2017-08-06 11:37:05', 1),
(75, 10001, 729, 71, '2.00', '300.00', 4, 1, '2017-08-06 11:37:05', 1),
(76, 10001, 730, 71, '1.00', '300.00', 4, 1, '2017-08-06 11:37:05', 1),
(77, 10001, 731, 71, '11.00', '300.00', 4, 1, '2017-08-06 11:37:05', 1),
(78, 10001, 728, 3, '1.00', '200.00', 4, 1, '2017-08-06 11:47:14', 1),
(79, 10001, 729, 71, '2.00', '300.00', 4, 1, '2017-08-06 11:47:14', 1),
(80, 10001, 730, 71, '1.00', '300.00', 4, 1, '2017-08-06 11:47:14', 1),
(81, 10001, 731, 71, '11.00', '300.00', 4, 1, '2017-08-06 11:47:14', 1),
(82, 10001, 732, 3, '1.00', '200.00', 4, 1, '2017-08-06 11:47:14', 1),
(83, 10001, 728, 3, '1.00', '200.00', 4, 1, '2017-10-24 17:55:25', 1),
(84, 10001, 729, 71, '2.00', '300.00', 4, 1, '2017-10-24 17:55:25', 1),
(85, 10001, 730, 71, '1.00', '300.00', 4, 1, '2017-10-24 17:55:25', 1),
(86, 10001, 731, 71, '11.00', '300.00', 4, 1, '2017-10-24 17:55:25', 1),
(87, 10001, 732, 3, '1.00', '200.00', 4, 1, '2017-10-24 17:55:25', 1),
(88, 10001, 733, 1, '1.00', '90.00', 4, 1, '2017-10-24 17:55:25', 1),
(89, 10001, 728, 3, '1.00', '200.00', 4, 1, '2017-10-29 15:38:03', 1),
(90, 10001, 729, 71, '2.00', '300.00', 4, 1, '2017-10-29 15:38:03', 1),
(91, 10001, 730, 71, '1.00', '300.00', 4, 1, '2017-10-29 15:38:03', 1),
(92, 10001, 731, 71, '11.00', '300.00', 4, 1, '2017-10-29 15:38:03', 1),
(93, 10001, 732, 3, '1.00', '200.00', 4, 1, '2017-10-29 15:38:03', 1),
(94, 10001, 733, 1, '1.00', '90.00', 4, 1, '2017-10-29 15:38:03', 1),
(95, 10001, 734, 1, '1.00', '90.00', 4, 1, '2017-10-29 15:38:03', 1),
(96, 10001, 735, 71, '1.00', '300.00', 4, 1, '2017-10-29 15:38:03', 1),
(97, 10001, 728, 3, '1.00', '200.00', 4, 1, '2017-10-29 16:11:17', 1),
(98, 10001, 729, 71, '2.00', '300.00', 4, 1, '2017-10-29 16:11:17', 1),
(99, 10001, 730, 71, '1.00', '300.00', 4, 1, '2017-10-29 16:11:17', 1),
(100, 10001, 731, 71, '11.00', '300.00', 4, 1, '2017-10-29 16:11:17', 1),
(101, 10001, 732, 3, '1.00', '200.00', 4, 1, '2017-10-29 16:11:17', 1),
(102, 10001, 733, 1, '1.00', '90.00', 4, 1, '2017-10-29 16:11:17', 1),
(103, 10001, 734, 1, '1.00', '90.00', 4, 1, '2017-10-29 16:11:17', 1),
(104, 10001, 735, 71, '1.00', '300.00', 4, 1, '2017-10-29 16:11:17', 1),
(105, 10001, 736, 3, '1.00', '200.00', 4, 1, '2017-10-29 16:11:17', 1),
(106, 10001, 737, 3, '1.00', '200.00', 4, 1, '2017-10-29 16:11:17', 1),
(107, 10001, 738, 3, '1.00', '200.00', 4, 1, '2017-10-29 16:11:17', 1),
(108, 10001, 728, 3, '1.00', '200.00', 4, 1, '2017-10-29 16:42:30', 1),
(109, 10001, 729, 71, '2.00', '300.00', 4, 1, '2017-10-29 16:42:30', 1),
(110, 10001, 730, 71, '1.00', '300.00', 4, 1, '2017-10-29 16:42:30', 1),
(111, 10001, 731, 71, '11.00', '300.00', 4, 1, '2017-10-29 16:42:30', 1),
(112, 10001, 732, 3, '1.00', '200.00', 4, 1, '2017-10-29 16:42:30', 1),
(113, 10001, 733, 1, '1.00', '90.00', 4, 1, '2017-10-29 16:42:30', 1),
(114, 10001, 734, 1, '1.00', '90.00', 4, 1, '2017-10-29 16:42:30', 1),
(115, 10001, 735, 71, '1.00', '300.00', 4, 1, '2017-10-29 16:42:31', 1),
(116, 10001, 736, 3, '1.00', '200.00', 4, 1, '2017-10-29 16:42:31', 1),
(117, 10001, 737, 3, '1.00', '200.00', 4, 1, '2017-10-29 16:42:31', 1),
(118, 10001, 738, 3, '1.00', '200.00', 4, 1, '2017-10-29 16:42:31', 1),
(119, 10001, 739, 71, '1.00', '300.00', 4, 1, '2017-10-29 16:42:31', 1),
(120, 10001, 740, 71, '1.00', '300.00', 4, 1, '2017-10-29 16:42:31', 1),
(121, 10001, 741, 71, '1.00', '300.00', 4, 1, '2017-10-29 16:42:31', 1),
(122, 10001, 733, 1, '1.00', '90.00', 4, 1, '2017-10-29 18:04:42', 1),
(123, 10001, 734, 1, '1.00', '90.00', 4, 1, '2017-10-29 18:04:42', 1),
(124, 10001, 735, 71, '1.00', '300.00', 4, 1, '2017-10-29 18:04:42', 1),
(125, 10001, 736, 3, '1.00', '200.00', 4, 1, '2017-10-29 18:04:42', 1),
(126, 10001, 745, 3, '1.00', '200.00', 4, 1, '2017-10-29 18:04:42', 1),
(127, 10001, 746, 1, '1.00', '90.00', 4, 1, '2017-10-29 18:04:42', 1),
(128, 10001, 733, 1, '1.00', '90.00', 4, 1, '2017-10-29 18:08:16', 1),
(129, 10001, 734, 1, '1.00', '90.00', 4, 1, '2017-10-29 18:08:16', 1),
(130, 10001, 735, 71, '1.00', '300.00', 4, 1, '2017-10-29 18:08:17', 1),
(131, 10001, 736, 3, '1.00', '200.00', 4, 1, '2017-10-29 18:08:17', 1),
(132, 10001, 745, 3, '1.00', '200.00', 4, 1, '2017-10-29 18:08:17', 1),
(133, 10001, 746, 1, '1.00', '90.00', 4, 1, '2017-10-29 18:08:17', 1),
(134, 10001, 733, 1, '1.00', '90.00', 4, 1, '2017-10-29 18:19:56', 1),
(135, 10001, 734, 1, '1.00', '90.00', 4, 1, '2017-10-29 18:19:56', 1),
(136, 10001, 735, 71, '1.00', '300.00', 4, 1, '2017-10-29 18:19:56', 1),
(137, 10001, 736, 3, '1.00', '200.00', 4, 1, '2017-10-29 18:19:56', 1),
(138, 10001, 745, 3, '1.00', '200.00', 4, 1, '2017-10-29 18:19:57', 1),
(139, 10001, 746, 1, '1.00', '90.00', 4, 1, '2017-10-29 18:19:57', 1),
(140, 10001, 747, 71, '1.00', '300.00', 4, 1, '2017-10-29 18:19:57', 1),
(141, 10001, 733, 1, '1.00', '90.00', 4, 1, '2017-10-29 18:20:08', 1),
(142, 10001, 734, 1, '1.00', '90.00', 4, 1, '2017-10-29 18:20:08', 1),
(143, 10001, 735, 71, '1.00', '300.00', 4, 1, '2017-10-29 18:20:08', 1),
(144, 10001, 736, 3, '1.00', '200.00', 4, 1, '2017-10-29 18:20:08', 1),
(145, 10001, 745, 3, '1.00', '200.00', 4, 1, '2017-10-29 18:20:08', 1),
(146, 10001, 746, 1, '1.00', '90.00', 4, 1, '2017-10-29 18:20:08', 1),
(147, 10001, 747, 71, '1.00', '300.00', 4, 1, '2017-10-29 18:20:08', 1),
(148, 10001, 748, 71, '1.00', '300.00', 4, 1, '2017-10-29 18:20:08', 1);

-- --------------------------------------------------------

--
-- Table structure for table `webpos_user`
--

CREATE TABLE `webpos_user` (
  `userID` int(11) NOT NULL,
  `employeeID` int(11) NOT NULL,
  `userName` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `typeAdmin` tinyint(1) NOT NULL DEFAULT '0',
  `userStatus` tinyint(1) DEFAULT '0',
  `loginAttempt` int(11) NOT NULL DEFAULT '0',
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `webpos_user`
--

INSERT INTO `webpos_user` (`userID`, `employeeID`, `userName`, `password`, `typeAdmin`, `userStatus`, `loginAttempt`, `dateAdded`) VALUES
(1, 1, 'maluu', 'pass', 1, 1, -96, '2016-06-20 16:46:08'),
(2, 5, 'kanda', 'pass', 0, 0, 0, '2016-06-20 17:08:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`branchID`),
  ADD UNIQUE KEY `branchName` (`branchName`),
  ADD UNIQUE KEY `branchName_2` (`branchName`),
  ADD KEY `companyID` (`companyID`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cartID`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`companyID`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`countryID`),
  ADD UNIQUE KEY `countryName` (`countryName`);

--
-- Indexes for table `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`discountID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employeeID`),
  ADD UNIQUE KEY `personID` (`personID`);

--
-- Indexes for table `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`sexid`);

--
-- Indexes for table `gentrans`
--
ALTER TABLE `gentrans`
  ADD PRIMARY KEY (`transID`);

--
-- Indexes for table `jobtitles`
--
ALTER TABLE `jobtitles`
  ADD PRIMARY KEY (`jobtitleID`);

--
-- Indexes for table `locationdetails`
--
ALTER TABLE `locationdetails`
  ADD PRIMARY KEY (`locationID`),
  ADD UNIQUE KEY `locationName` (`locationName`);

--
-- Indexes for table `markup`
--
ALTER TABLE `markup`
  ADD PRIMARY KEY (`markupID`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`personID`);

--
-- Indexes for table `personaddress`
--
ALTER TABLE `personaddress`
  ADD PRIMARY KEY (`addressID`),
  ADD UNIQUE KEY `personID` (`personID`);

--
-- Indexes for table `personphoto`
--
ALTER TABLE `personphoto`
  ADD PRIMARY KEY (`photoID`),
  ADD UNIQUE KEY `personID` (`personID`);

--
-- Indexes for table `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`positionID`);

--
-- Indexes for table `proclassification`
--
ALTER TABLE `proclassification`
  ADD PRIMARY KEY (`ClassID`),
  ADD UNIQUE KEY `proClass` (`proClass`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productID`),
  ADD UNIQUE KEY `partName` (`partName`),
  ADD UNIQUE KEY `partNumber` (`partNumber`);

--
-- Indexes for table `producttype`
--
ALTER TABLE `producttype`
  ADD PRIMARY KEY (`productTypeID`),
  ADD UNIQUE KEY `proType` (`proType`);

--
-- Indexes for table `rack`
--
ALTER TABLE `rack`
  ADD PRIMARY KEY (`rackID`),
  ADD UNIQUE KEY `rackName` (`rackName`);

--
-- Indexes for table `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`regionID`),
  ADD UNIQUE KEY `regionName` (`regionName`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`sectionID`),
  ADD UNIQUE KEY `sectionName` (`sectionName`),
  ADD UNIQUE KEY `branchID` (`branchID`);

--
-- Indexes for table `shelve`
--
ALTER TABLE `shelve`
  ADD PRIMARY KEY (`shelveID`),
  ADD UNIQUE KEY `shelveName` (`shelveName`);

--
-- Indexes for table `suppliedproduct`
--
ALTER TABLE `suppliedproduct`
  ADD PRIMARY KEY (`spID`);

--
-- Indexes for table `suppliedstuck`
--
ALTER TABLE `suppliedstuck`
  ADD PRIMARY KEY (`stuckID`),
  ADD UNIQUE KEY `unique_index` (`supplierID`,`productID`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplierID`);

--
-- Indexes for table `tax`
--
ALTER TABLE `tax`
  ADD PRIMARY KEY (`taxID`),
  ADD UNIQUE KEY `taxName` (`taxName`);

--
-- Indexes for table `titles`
--
ALTER TABLE `titles`
  ADD PRIMARY KEY (`titleID`);

--
-- Indexes for table `tradecurrency`
--
ALTER TABLE `tradecurrency`
  ADD PRIMARY KEY (`CurrencyID`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transCode`);

--
-- Indexes for table `webpos_user`
--
ALTER TABLE `webpos_user`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `employeeID` (`employeeID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `branchID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cartID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=752;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `countryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `discount`
--
ALTER TABLE `discount`
  MODIFY `discountID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employeeID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gender`
--
ALTER TABLE `gender`
  MODIFY `sexid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `gentrans`
--
ALTER TABLE `gentrans`
  MODIFY `transID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10002;

--
-- AUTO_INCREMENT for table `jobtitles`
--
ALTER TABLE `jobtitles`
  MODIFY `jobtitleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `locationdetails`
--
ALTER TABLE `locationdetails`
  MODIFY `locationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `markup`
--
ALTER TABLE `markup`
  MODIFY `markupID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `personID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `personaddress`
--
ALTER TABLE `personaddress`
  MODIFY `addressID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personphoto`
--
ALTER TABLE `personphoto`
  MODIFY `photoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `positions`
--
ALTER TABLE `positions`
  MODIFY `positionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `proclassification`
--
ALTER TABLE `proclassification`
  MODIFY `ClassID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `productID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=277;

--
-- AUTO_INCREMENT for table `producttype`
--
ALTER TABLE `producttype`
  MODIFY `productTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `rack`
--
ALTER TABLE `rack`
  MODIFY `rackID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `region`
--
ALTER TABLE `region`
  MODIFY `regionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `section`
--
ALTER TABLE `section`
  MODIFY `sectionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `shelve`
--
ALTER TABLE `shelve`
  MODIFY `shelveID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `suppliedproduct`
--
ALTER TABLE `suppliedproduct`
  MODIFY `spID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `suppliedstuck`
--
ALTER TABLE `suppliedstuck`
  MODIFY `stuckID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `supplierID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `tax`
--
ALTER TABLE `tax`
  MODIFY `taxID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `titles`
--
ALTER TABLE `titles`
  MODIFY `titleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tradecurrency`
--
ALTER TABLE `tradecurrency`
  MODIFY `CurrencyID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transCode` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique code to identify transaction', AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT for table `webpos_user`
--
ALTER TABLE `webpos_user`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `branch`
--
ALTER TABLE `branch`
  ADD CONSTRAINT `branch_ibfk_1` FOREIGN KEY (`companyID`) REFERENCES `branch` (`branchID`),
  ADD CONSTRAINT `branch_ibfk_2` FOREIGN KEY (`companyID`) REFERENCES `company` (`companyID`);

--
-- Constraints for table `section`
--
ALTER TABLE `section`
  ADD CONSTRAINT `section_ibfk_1` FOREIGN KEY (`branchID`) REFERENCES `branch` (`branchID`);
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"bjts\",\"table\":\"cart\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2017-10-24 16:58:56', '{\"collation_connection\":\"utf8mb4_unicode_ci\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `branchID` int(11) NOT NULL,
  `branchName` varchar(100) NOT NULL,
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `branchAddress` varchar(200) NOT NULL,
  `telephoneNo` varchar(15) NOT NULL,
  `mobilePhoneNo` varchar(15) NOT NULL,
  `companyID` int(11) NOT NULL,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`branchID`, `branchName`, `dateAdded`, `branchAddress`, `telephoneNo`, `mobilePhoneNo`, `companyID`, `userID`) VALUES
(1, 'dff', '2016-07-21 00:43:43', 'rtrtrtr', 't4et', '65656', 1, 1),
(11, 'Bosuokan', '2016-07-26 11:43:32', 'Box 344, Accra', '0209898987', '', 1, 1),
(21, 'BRANCH', '2016-07-28 08:52:08', '123 Anna salai', '12334534534464', '9884098840', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cartID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `transactionID` varchar(10) NOT NULL,
  `userID` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cartID`, `productID`, `qty`, `transactionID`, `userID`, `status`, `dateAdded`) VALUES
(728, 3, 1, '10001', 1, 1, '2017-03-10 05:24:23'),
(729, 71, 2, '10001', 1, 1, '2017-03-10 05:38:50'),
(730, 71, 1, '10001', 1, 1, '2017-03-10 05:58:09'),
(731, 71, 11, '10001', 1, 1, '2017-08-06 11:35:55'),
(732, 3, 1, '10001', 1, 1, '2017-08-06 11:46:54');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `companyID` int(11) NOT NULL DEFAULT '1',
  `companyName` varchar(100) NOT NULL,
  `logo` blob NOT NULL,
  `userID` int(11) NOT NULL,
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`companyID`, `companyName`, `logo`, `userID`, `dateAdded`) VALUES
(1, 'Tropical Parts &amp; Services', 0x545053206c6f676f2e706e67, 1, '2016-07-19 05:13:37');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `countryID` int(11) NOT NULL,
  `countryName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`countryID`, `countryName`) VALUES
(1, 'GHANA'),
(2, 'UK');

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE `discount` (
  `discountID` int(11) NOT NULL,
  `percentDiscountRate` decimal(6,2) NOT NULL,
  `amountDiscountRate` decimal(6,2) NOT NULL,
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` bit(1) NOT NULL DEFAULT b'1',
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `discount`
--

INSERT INTO `discount` (`discountID`, `percentDiscountRate`, `amountDiscountRate`, `dateAdded`, `status`, `userID`) VALUES
(1, '10.00', '3.00', '2016-07-25 18:51:18', b'1111111111111111111111111111111', 1),
(11, '4.03', '9.99', '2016-07-25 18:52:06', b'1111111111111111111111111111111', 1);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employeeID` int(11) NOT NULL,
  `personID` int(11) NOT NULL,
  `jobtitle` varchar(100) NOT NULL,
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userID` int(11) NOT NULL,
  `hiredDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gender`
--

CREATE TABLE `gender` (
  `sexid` int(11) NOT NULL,
  `sex` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gender`
--

INSERT INTO `gender` (`sexid`, `sex`) VALUES
(1, 'Male'),
(2, 'Female');

-- --------------------------------------------------------

--
-- Table structure for table `gentrans`
--

CREATE TABLE `gentrans` (
  `transID` int(11) NOT NULL,
  `fName` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gentrans`
--

INSERT INTO `gentrans` (`transID`, `fName`) VALUES
(10001, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jobtitles`
--

CREATE TABLE `jobtitles` (
  `jobtitleID` int(11) NOT NULL,
  `jobtitle` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jobtitles`
--

INSERT INTO `jobtitles` (`jobtitleID`, `jobtitle`) VALUES
(1, 'Managing Director'),
(2, 'Sales Person');

-- --------------------------------------------------------

--
-- Table structure for table `locationdetails`
--

CREATE TABLE `locationdetails` (
  `locationID` int(11) NOT NULL,
  `locationName` varchar(100) NOT NULL,
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `locationdetails`
--

INSERT INTO `locationdetails` (`locationID`, `locationName`, `dateAdded`) VALUES
(1, 'Warehouse', '2016-07-21 01:48:54'),
(2, 'SalesFloor', '2016-07-21 01:58:51');

-- --------------------------------------------------------

--
-- Table structure for table `markup`
--

CREATE TABLE `markup` (
  `markupID` int(11) NOT NULL,
  `percentMarkup` decimal(6,2) NOT NULL,
  `amountMarkup` decimal(6,2) NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `markup`
--

INSERT INTO `markup` (`markupID`, `percentMarkup`, `amountMarkup`, `status`, `dateAdded`, `userID`) VALUES
(1, '50.00', '100.00', b'1111111111111111111111111111111', '2016-07-25 19:17:39', 1);

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `personID` int(11) NOT NULL,
  `title` varchar(10) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `othername` varchar(100) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `DOB` date NOT NULL,
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`personID`, `title`, `firstName`, `surname`, `othername`, `Gender`, `DOB`, `dateAdded`, `userID`) VALUES
(1, 'Mr', 'Prosper', 'Yeng', '', 'Male', '1991-06-29', '2016-05-29 22:16:06', 1),
(5, 'ms', 'elen', 'yeng', '', 'f', '2008-06-07', '2016-06-12 05:40:43', 1),
(6, 'ms', 'elen', 'yeng', '', 'f', '2008-06-07', '2016-06-12 06:04:42', 1),
(9, 'mr', 'pro', 'yeng', 'kand', 'm', '1977-09-27', '2016-06-12 20:22:21', 1),
(10, 'Mr.', 'Kanda', 'Yeng', '', 'Male', '2016-06-22', '2016-06-17 20:07:25', 1),
(11, 'Mr.', 'Kanda', 'Yeng', '', 'Male', '2016-06-22', '2016-06-17 20:08:24', 1),
(12, 'Mr.', 'Kanda', 'Yeng', '', 'Male', '2016-06-22', '2016-06-17 20:08:39', 1),
(13, 'Choose Tit', 'nn', 'vb', '', 'Choose Gen', '2016-06-18', '2016-06-17 21:36:37', 1),
(14, 'Mr.', 'Pros', 'Yeng', '', 'Male', '2016-06-14', '2016-06-18 04:43:01', 1),
(15, 'Mr.', 'Pros', 'Yeng', '', 'Male', '2016-06-14', '2016-06-18 05:33:58', 1),
(21, 'Dr.', 'Eva', 'Yeng', '', 'Female', '2015-08-04', '2016-08-06 20:41:58', 1);

-- --------------------------------------------------------

--
-- Table structure for table `personaddress`
--

CREATE TABLE `personaddress` (
  `addressID` int(11) NOT NULL,
  `personID` int(11) NOT NULL,
  `addressline1` varchar(100) NOT NULL,
  `addressline2` varchar(100) DEFAULT NULL,
  `postBox` varchar(20) NOT NULL,
  `town` varchar(100) NOT NULL,
  `region` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `hometell` varchar(15) NOT NULL,
  `mobilephoneNo` varchar(15) NOT NULL,
  `emailAddress` varchar(50) NOT NULL,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `personaddress`
--

INSERT INTO `personaddress` (`addressID`, `personID`, `addressline1`, `addressline2`, `postBox`, `town`, `region`, `country`, `hometell`, `mobilephoneNo`, `emailAddress`, `userID`) VALUES
(2, 1, 'Drapes Systems', 'Brekum Road', '4', 'Sunyani', 'BRONG-AHAFO', 'GHANA', '', '07404388212', 'kandagh2000@gmail.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `personphoto`
--

CREATE TABLE `personphoto` (
  `photoID` int(11) NOT NULL,
  `targetfile` blob NOT NULL,
  `personID` int(11) NOT NULL,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `personphoto`
--

INSERT INTO `personphoto` (`photoID`, `targetfile`, `personID`, `userID`) VALUES
(1, 0x68682e6a7067, 1, 1),
(11, 0x3030312e6a7067, 11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

CREATE TABLE `positions` (
  `positionID` int(11) NOT NULL,
  `partPosition` varchar(100) NOT NULL,
  `userID` int(11) NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `positions`
--

INSERT INTO `positions` (`positionID`, `partPosition`, `userID`, `active`, `dateAdded`) VALUES
(1, 'BACK-RIGHT', 1, b'1111111111111111111111111111111', '2016-07-22 05:37:28');

-- --------------------------------------------------------

--
-- Table structure for table `proclassification`
--

CREATE TABLE `proclassification` (
  `ClassID` int(11) NOT NULL,
  `proClass` varchar(50) NOT NULL,
  `proTypeID` int(11) NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `proclassification`
--

INSERT INTO `proclassification` (`ClassID`, `proClass`, `proTypeID`, `status`, `dateAdded`, `userID`) VALUES
(1, 'Oil&Lubs', 11, b'1111111111111111111111111111111', '2016-07-26 20:42:44', 1),
(11, 'BrakePads', 1, b'1111111111111111111111111111111', '2016-07-26 22:21:47', 1),
(21, 'ShucksAbsurber', 1, b'1111111111111111111111111111111', '2016-07-26 22:22:23', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `productID` int(11) NOT NULL,
  `proTypeID` int(11) NOT NULL,
  `partNumber` varchar(100) DEFAULT NULL,
  `partName` varchar(100) NOT NULL,
  `barcode` varchar(100) DEFAULT NULL,
  `OEM` varchar(100) DEFAULT NULL,
  `proClassID` varchar(100) NOT NULL,
  `origin` varchar(100) DEFAULT NULL,
  `partPosition` varchar(100) DEFAULT NULL,
  `proDescription` text,
  `Remark` text,
  `userID` int(11) NOT NULL,
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productID`, `proTypeID`, `partNumber`, `partName`, `barcode`, `OEM`, `proClassID`, `origin`, `partPosition`, `proDescription`, `Remark`, `userID`, `dateAdded`, `status`) VALUES
(1, 1, '09090ss', 'AirCondition ', 'ddfdfdreffdf', 'ff3ref', '1', '1', '1', '5/3 part aircon motor', '', 1, '2016-07-25 10:37:22', b'1111111111111111111111111111111'),
(3, 1, '999', 'brakeBands', '', '999', '21', '1', '1', 'sfsdss', 'xcx', 1, '2016-07-27 16:07:19', b'1111111111111111111111111111111'),
(11, 1, '0909Z', 'SBN', '', '0908Z', '21', '1', '1', '2/5 Asorber', '0909', 1, '2016-08-06 17:38:07', b'1111111111111111111111111111111'),
(61, 1, '2001', 'CSS3DD', '', '090C', '11', '1', '1', '&lt;script&gt;\\r\\n\\\'http://webpos-project.azurewebsites.net/addEmployeeForm.php?id=\\\'+document.cookie\\r\\n&lt;/script&gt;\\r\\n', 'Testing XSS Attack on WebPOS', 1, '2016-08-06 18:03:03', b'1111111111111111111111111111111'),
(71, 1, '0909DD', 'XSS', '', 'DD090', '21', '2', '1', '&lt;script&gt;\\r\\n\\\'http://webpos-project.azurewebsites.net/addEmployeeForm.php?id=\\\'+document.cookie\\r\\n&lt;/script&gt;\\r\\n', 'Test XSS attack', 1, '2016-08-06 20:02:31', b'1111111111111111111111111111111'),
(81, 1, 'TT5', 'backPad', '', 'TTB', '11', '2', '1', '', '', 1, '2016-08-07 20:02:03', b'1111111111111111111111111111111'),
(91, 1, 'BSSB', 'BSS', '', 'BSSB', '11', '1', '1', '', '', 1, '2016-08-07 20:10:39', b'1111111111111111111111111111111'),
(101, 11, 'FDDFD', 'DDD', '', 'DFDFD', '21', '1', '1', '', '', 1, '2016-08-07 20:17:13', b'1111111111111111111111111111111'),
(111, 1, 'CSRF', 'CSRF', '', 'CSRF', '21', '1', '1', 'Testing Anti CSRF', '', 1, '2016-08-08 10:46:05', b'1111111111111111111111111111111'),
(112, 1, 'FFF', 'FFF', 'FFF', 'FFF', '11', '2', '1', '', '', 1, '2016-08-08 11:49:18', b'1111111111111111111111111111111'),
(251, 1, 'AntiCSRF', 'AntiCSRF', 'AntiCSRF', 'AntiCSRF', '21', '2', '1', 'AntiCSRF', 'AntiCSRF', 1, '2016-08-08 12:56:16', b'1111111111111111111111111111111'),
(263, 1, 'dd', 'ddgg', '', 'ddhg', '21', '2', '1', '', '', 1, '2016-08-08 16:29:17', b'1111111111111111111111111111111'),
(264, 1, 'dd5', 'dy', 'dd5', 'dd5', '21', '2', '1', '', '', 1, '2016-08-08 16:31:53', b'1111111111111111111111111111111'),
(265, 1, 'fg', 'fg', 'dd', 'fg', '21', '2', '1', '', '', 1, '2016-08-08 17:50:10', b'1111111111111111111111111111111'),
(268, 1, 'ddf', 'ddt', 'ddf', 'ddf', '21', '2', '1', 'ddf', 'ddf', 1, '2016-08-08 18:05:20', b'1111111111111111111111111111111'),
(269, 1, 'TestAntiCSRF', 'TestAntiCSRF', 'TestAntiCSRF', 'TestAntiCSRF', '21', '1', '1', 'Test AntiCSRF', 'Test AntiCSRF', 1, '2016-08-08 18:07:29', b'1111111111111111111111111111111'),
(270, 1, 'dduu', 'dduu', 'dduu', 'dduu', '21', '2', '1', 'dduu', 'dduu', 1, '2016-08-08 18:22:46', b'1111111111111111111111111111111'),
(271, 1, 'ddtr', 'ddtr', '', 'ddtr', '21', '2', '1', '', '', 1, '2016-08-09 02:48:28', b'1111111111111111111111111111111'),
(272, 1, 'jjjj', 'jjj', 'jjj', 'jjj', '21', '2', '1', '', '', 1, '2016-08-09 13:05:48', b'1111111111111111111111111111111'),
(273, 1, 'dff', 'fdfd', 'dfdfd', 'dfd', '21', '2', '1', '&lt;script&gt;\\r\\nwindow.location=\\\'http://finalwebpos.azurewebsites.net/addEmployeeForm.php?id=\\\'+document.cookie\\r\\n&lt;/script&gt;\\r\\n', 'try XSS', 1, '2016-08-24 19:59:00', b'1111111111111111111111111111111'),
(274, 1, 'hhfhf', 'xxxxx', 'gfgf', 'gfgfgf', '21', '1', '1', '&lt;script&gt;\\r\\nwindow.location=\\\'http://finalwebpos.azurewebsites.net/addEmployeeForm.php?id=\\\'+document.cookie\\r\\n&lt;/script&gt;\\r\\n', 'fss', 1, '2016-08-25 11:56:26', b'1111111111111111111111111111111'),
(275, 11, '1232', 'HD', '', '1232', '0', '2', '1', '', '', 1, '2017-03-03 09:18:40', b'1111111111111111111111111111111');

-- --------------------------------------------------------

--
-- Table structure for table `producttype`
--

CREATE TABLE `producttype` (
  `productTypeID` int(11) NOT NULL,
  `proType` varchar(100) NOT NULL,
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userID` int(11) NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `producttype`
--

INSERT INTO `producttype` (`productTypeID`, `proType`, `dateAdded`, `userID`, `status`) VALUES
(1, 'Part', '2016-07-22 06:00:46', 1, b'1111111111111111111111111111111'),
(11, 'Consumable', '2016-07-26 21:36:05', 1, b'1111111111111111111111111111111');

-- --------------------------------------------------------

--
-- Table structure for table `rack`
--

CREATE TABLE `rack` (
  `rackID` int(11) NOT NULL,
  `rackName` varchar(200) NOT NULL,
  `numberOfShelves` int(11) NOT NULL,
  `sectionID` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rack`
--

INSERT INTO `rack` (`rackID`, `rackName`, `numberOfShelves`, `sectionID`, `userid`, `dateAdded`) VALUES
(102, '001', 6, 1, 1, '2016-07-21 15:47:46');

-- --------------------------------------------------------

--
-- Table structure for table `region`
--

CREATE TABLE `region` (
  `regionID` int(11) NOT NULL,
  `regionName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `region`
--

INSERT INTO `region` (`regionID`, `regionName`) VALUES
(2, 'BRONG-AHAFO'),
(1, 'UPPER WEST');

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `sectionID` int(11) NOT NULL,
  `sectionName` varchar(100) NOT NULL,
  `SectionType` int(11) NOT NULL,
  `branchID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`sectionID`, `sectionName`, `SectionType`, `branchID`, `userID`, `dateAdded`) VALUES
(1, 'Belts', 2, 1, 1, '2016-07-24 22:13:00'),
(51, 'Lubricants', 2, 11, 1, '2016-07-26 11:48:19');

-- --------------------------------------------------------

--
-- Table structure for table `shelve`
--

CREATE TABLE `shelve` (
  `shelveID` int(11) NOT NULL,
  `shelveName` varchar(100) NOT NULL,
  `rackID` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shelve`
--

INSERT INTO `shelve` (`shelveID`, `shelveName`, `rackID`, `userid`, `dateAdded`) VALUES
(2, '0030', 102, 1, '2016-07-21 17:37:59'),
(11, '0040', 102, 1, '2016-07-22 00:54:13');

-- --------------------------------------------------------

--
-- Table structure for table `suppliedproduct`
--

CREATE TABLE `suppliedproduct` (
  `spID` int(11) NOT NULL,
  `supplierID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `costPrice` decimal(6,2) NOT NULL,
  `currencyID` int(10) NOT NULL,
  `qty` decimal(6,2) NOT NULL,
  `suppliedDate` date NOT NULL,
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userID` int(11) NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `suppliedproduct`
--

INSERT INTO `suppliedproduct` (`spID`, `supplierID`, `productID`, `costPrice`, `currencyID`, `qty`, `suppliedDate`, `dateAdded`, `userID`, `status`) VALUES
(1, 101, 1, '90.00', 1, '90.00', '2016-07-21', '2016-07-25 16:36:22', 1, b'1111111111111111111111111111111'),
(41, 101, 1, '44.00', 1, '33.00', '2016-07-11', '2016-07-25 16:52:32', 1, b'1111111111111111111111111111111'),
(51, 101, 1, '90.70', 1, '77.00', '2016-07-12', '2016-07-25 16:55:06', 1, b'1111111111111111111111111111111');

-- --------------------------------------------------------

--
-- Table structure for table `suppliedstuck`
--

CREATE TABLE `suppliedstuck` (
  `stuckID` int(11) NOT NULL,
  `supplierID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `stuckqty` decimal(6,2) NOT NULL,
  `sellPrice` decimal(6,2) NOT NULL,
  `costPrice` decimal(6,2) DEFAULT NULL,
  `shelfID` int(11) NOT NULL,
  `taxID1` int(11) NOT NULL,
  `taxID2` int(11) NOT NULL,
  `Discount` decimal(6,2) DEFAULT NULL,
  `markup` decimal(6,2) NOT NULL,
  `InvoiceNumber` varchar(50) DEFAULT NULL,
  `reorderLevel` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `userID` int(11) NOT NULL,
  `suppliedDate` date DEFAULT NULL,
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `suppliedstuck`
--

INSERT INTO `suppliedstuck` (`stuckID`, `supplierID`, `productID`, `stuckqty`, `sellPrice`, `costPrice`, `shelfID`, `taxID1`, `taxID2`, `Discount`, `markup`, `InvoiceNumber`, `reorderLevel`, `status`, `userID`, `suppliedDate`, `dateAdded`) VALUES
(32, 111, 3, '282.00', '200.00', '90.00', 2, 1, 11, '4.03', '50.00', '0099', 0, 1, 1, '2016-07-14', '2016-07-28 05:04:36'),
(41, 111, 1, '194.00', '90.00', '20.00', 11, 11, 1, '4.03', '50.00', '9090', 10, 1, 1, '2016-07-12', '2016-07-29 04:19:00'),
(51, 111, 71, '475.00', '300.00', '20.00', 2, 1, 1, '4.03', '50.00', '008787', 10, 1, 1, '2016-08-06', '2016-08-06 20:26:12');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplierID` int(11) NOT NULL,
  `supplierName` varchar(100) NOT NULL,
  `personID` int(11) DEFAULT NULL,
  `userid` int(11) NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplierID`, `supplierName`, `personID`, `userid`, `active`, `dateAdded`) VALUES
(111, 'I-data', 1, 1, b'1111111111111111111111111111111', '2016-07-27 18:27:27');

-- --------------------------------------------------------

--
-- Table structure for table `tax`
--

CREATE TABLE `tax` (
  `taxID` int(11) NOT NULL,
  `taxName` varchar(100) NOT NULL,
  `taxRate` decimal(6,2) NOT NULL,
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userID` int(11) NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tax`
--

INSERT INTO `tax` (`taxID`, `taxName`, `taxRate`, `dateAdded`, `userID`, `status`) VALUES
(1, 'NHIL', '15.00', '2016-07-25 18:14:15', 1, b'1111111111111111111111111111111'),
(11, 'VAT', '15.00', '2016-07-25 18:18:20', 1, b'1111111111111111111111111111111');

-- --------------------------------------------------------

--
-- Table structure for table `titles`
--

CREATE TABLE `titles` (
  `titleID` int(11) NOT NULL,
  `titleName` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `titles`
--

INSERT INTO `titles` (`titleID`, `titleName`) VALUES
(1, 'Mr.'),
(2, 'Ms.'),
(3, 'Dr.');

-- --------------------------------------------------------

--
-- Table structure for table `tradecurrency`
--

CREATE TABLE `tradecurrency` (
  `CurrencyID` int(11) NOT NULL,
  `currency` varchar(10) NOT NULL DEFAULT 'GHS',
  `status` bit(1) NOT NULL DEFAULT b'1',
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tradecurrency`
--

INSERT INTO `tradecurrency` (`CurrencyID`, `currency`, `status`, `dateAdded`, `userID`) VALUES
(1, '$', b'1111111111111111111111111111111', '2016-07-25 14:40:45', 1);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transCode` int(11) NOT NULL COMMENT 'Unique code to identify transaction',
  `transactionID` int(11) NOT NULL COMMENT 'code that identify a product or group of products purchased',
  `cartID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `qty` decimal(6,2) NOT NULL,
  `sellPrice` decimal(6,2) NOT NULL,
  `discountID` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userID` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`transCode`, `transactionID`, `cartID`, `productID`, `qty`, `sellPrice`, `discountID`, `status`, `dateAdded`, `userID`) VALUES
(1, 10001, 692, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:09', 1),
(2, 10001, 693, 3, '1.00', '200.00', 4, 1, '2017-03-10 01:48:09', 1),
(3, 10001, 694, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:09', 1),
(4, 10001, 695, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:09', 1),
(5, 10001, 696, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:10', 1),
(6, 10001, 697, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:10', 1),
(7, 10001, 698, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:10', 1),
(8, 10001, 699, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:10', 1),
(9, 10001, 700, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:10', 1),
(10, 10001, 701, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:10', 1),
(11, 10001, 702, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:10', 1),
(12, 10001, 703, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:10', 1),
(13, 10001, 704, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:10', 1),
(14, 10001, 705, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:11', 1),
(15, 10001, 706, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:11', 1),
(16, 10001, 707, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:11', 1),
(17, 10001, 708, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:11', 1),
(18, 10001, 709, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:11', 1),
(19, 10001, 710, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:11', 1),
(20, 10001, 711, 3, '1.00', '200.00', 4, 1, '2017-03-10 01:48:12', 1),
(21, 10001, 712, 3, '1.00', '200.00', 4, 1, '2017-03-10 01:48:12', 1),
(22, 10001, 713, 3, '1.00', '200.00', 4, 1, '2017-03-10 01:48:12', 1),
(23, 10001, 714, 3, '1.00', '200.00', 4, 1, '2017-03-10 01:48:12', 1),
(24, 10001, 692, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:12', 1),
(25, 10001, 693, 3, '1.00', '200.00', 4, 1, '2017-03-10 01:48:13', 1),
(26, 10001, 694, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:13', 1),
(27, 10001, 695, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:13', 1),
(28, 10001, 696, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:13', 1),
(29, 10001, 697, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:13', 1),
(30, 10001, 698, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:13', 1),
(31, 10001, 699, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:13', 1),
(32, 10001, 700, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:14', 1),
(33, 10001, 701, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:14', 1),
(34, 10001, 702, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:14', 1),
(35, 10001, 703, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:14', 1),
(36, 10001, 704, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:14', 1),
(37, 10001, 705, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:14', 1),
(38, 10001, 706, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:14', 1),
(39, 10001, 707, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:14', 1),
(40, 10001, 708, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:15', 1),
(41, 10001, 709, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:15', 1),
(42, 10001, 710, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:15', 1),
(43, 10001, 711, 3, '1.00', '200.00', 4, 1, '2017-03-10 01:48:15', 1),
(44, 10001, 712, 3, '1.00', '200.00', 4, 1, '2017-03-10 01:48:15', 1),
(45, 10001, 713, 3, '1.00', '200.00', 4, 1, '2017-03-10 01:48:15', 1),
(46, 10001, 714, 3, '1.00', '200.00', 4, 1, '2017-03-10 01:48:15', 1),
(47, 10001, 692, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:15', 1),
(48, 10001, 693, 3, '1.00', '200.00', 4, 1, '2017-03-10 01:48:15', 1),
(49, 10001, 694, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:15', 1),
(50, 10001, 695, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:15', 1),
(51, 10001, 696, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:15', 1),
(52, 10001, 697, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:16', 1),
(53, 10001, 698, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:16', 1),
(54, 10001, 699, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:16', 1),
(55, 10001, 700, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:16', 1),
(56, 10001, 701, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:16', 1),
(57, 10001, 702, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:16', 1),
(58, 10001, 703, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:16', 1),
(59, 10001, 704, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:16', 1),
(60, 10001, 705, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:16', 1),
(61, 10001, 706, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:16', 1),
(62, 10001, 707, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:16', 1),
(63, 10001, 708, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:16', 1),
(64, 10001, 709, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:16', 1),
(65, 10001, 710, 71, '1.00', '300.00', 4, 1, '2017-03-10 01:48:16', 1),
(66, 10001, 711, 3, '1.00', '200.00', 4, 1, '2017-03-10 01:48:17', 1),
(67, 10001, 712, 3, '1.00', '200.00', 4, 1, '2017-03-10 01:48:17', 1),
(68, 10001, 713, 3, '1.00', '200.00', 4, 1, '2017-03-10 01:48:17', 1),
(69, 10001, 714, 3, '1.00', '200.00', 4, 1, '2017-03-10 01:48:17', 1),
(70, 10001, 728, 3, '1.00', '200.00', 4, 1, '2017-08-06 11:36:45', 1),
(71, 10001, 729, 71, '2.00', '300.00', 4, 1, '2017-08-06 11:36:45', 1),
(72, 10001, 730, 71, '1.00', '300.00', 4, 1, '2017-08-06 11:36:45', 1),
(73, 10001, 731, 71, '11.00', '300.00', 4, 1, '2017-08-06 11:36:45', 1),
(74, 10001, 728, 3, '1.00', '200.00', 4, 1, '2017-08-06 11:37:05', 1),
(75, 10001, 729, 71, '2.00', '300.00', 4, 1, '2017-08-06 11:37:05', 1),
(76, 10001, 730, 71, '1.00', '300.00', 4, 1, '2017-08-06 11:37:05', 1),
(77, 10001, 731, 71, '11.00', '300.00', 4, 1, '2017-08-06 11:37:05', 1),
(78, 10001, 728, 3, '1.00', '200.00', 4, 1, '2017-08-06 11:47:14', 1),
(79, 10001, 729, 71, '2.00', '300.00', 4, 1, '2017-08-06 11:47:14', 1),
(80, 10001, 730, 71, '1.00', '300.00', 4, 1, '2017-08-06 11:47:14', 1),
(81, 10001, 731, 71, '11.00', '300.00', 4, 1, '2017-08-06 11:47:14', 1),
(82, 10001, 732, 3, '1.00', '200.00', 4, 1, '2017-08-06 11:47:14', 1);

-- --------------------------------------------------------

--
-- Table structure for table `webpos_user`
--

CREATE TABLE `webpos_user` (
  `userID` int(11) NOT NULL,
  `employeeID` int(11) NOT NULL,
  `userName` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `typeAdmin` tinyint(1) NOT NULL DEFAULT '0',
  `userStatus` tinyint(1) DEFAULT '0',
  `loginAttempt` int(11) NOT NULL DEFAULT '0',
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `webpos_user`
--

INSERT INTO `webpos_user` (`userID`, `employeeID`, `userName`, `password`, `typeAdmin`, `userStatus`, `loginAttempt`, `dateAdded`) VALUES
(1, 1, 'maluu', 'pass', 1, 1, -96, '2016-06-20 16:46:08'),
(2, 5, 'kanda', 'pass', 0, 0, 0, '2016-06-20 17:08:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`branchID`),
  ADD UNIQUE KEY `branchName` (`branchName`),
  ADD UNIQUE KEY `branchName_2` (`branchName`),
  ADD KEY `companyID` (`companyID`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cartID`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`companyID`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`countryID`),
  ADD UNIQUE KEY `countryName` (`countryName`);

--
-- Indexes for table `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`discountID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employeeID`),
  ADD UNIQUE KEY `personID` (`personID`);

--
-- Indexes for table `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`sexid`);

--
-- Indexes for table `gentrans`
--
ALTER TABLE `gentrans`
  ADD PRIMARY KEY (`transID`);

--
-- Indexes for table `jobtitles`
--
ALTER TABLE `jobtitles`
  ADD PRIMARY KEY (`jobtitleID`);

--
-- Indexes for table `locationdetails`
--
ALTER TABLE `locationdetails`
  ADD PRIMARY KEY (`locationID`),
  ADD UNIQUE KEY `locationName` (`locationName`);

--
-- Indexes for table `markup`
--
ALTER TABLE `markup`
  ADD PRIMARY KEY (`markupID`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`personID`);

--
-- Indexes for table `personaddress`
--
ALTER TABLE `personaddress`
  ADD PRIMARY KEY (`addressID`),
  ADD UNIQUE KEY `personID` (`personID`);

--
-- Indexes for table `personphoto`
--
ALTER TABLE `personphoto`
  ADD PRIMARY KEY (`photoID`),
  ADD UNIQUE KEY `personID` (`personID`);

--
-- Indexes for table `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`positionID`);

--
-- Indexes for table `proclassification`
--
ALTER TABLE `proclassification`
  ADD PRIMARY KEY (`ClassID`),
  ADD UNIQUE KEY `proClass` (`proClass`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productID`),
  ADD UNIQUE KEY `partName` (`partName`),
  ADD UNIQUE KEY `partNumber` (`partNumber`);

--
-- Indexes for table `producttype`
--
ALTER TABLE `producttype`
  ADD PRIMARY KEY (`productTypeID`),
  ADD UNIQUE KEY `proType` (`proType`);

--
-- Indexes for table `rack`
--
ALTER TABLE `rack`
  ADD PRIMARY KEY (`rackID`),
  ADD UNIQUE KEY `rackName` (`rackName`);

--
-- Indexes for table `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`regionID`),
  ADD UNIQUE KEY `regionName` (`regionName`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`sectionID`),
  ADD UNIQUE KEY `sectionName` (`sectionName`),
  ADD UNIQUE KEY `branchID` (`branchID`);

--
-- Indexes for table `shelve`
--
ALTER TABLE `shelve`
  ADD PRIMARY KEY (`shelveID`),
  ADD UNIQUE KEY `shelveName` (`shelveName`);

--
-- Indexes for table `suppliedproduct`
--
ALTER TABLE `suppliedproduct`
  ADD PRIMARY KEY (`spID`);

--
-- Indexes for table `suppliedstuck`
--
ALTER TABLE `suppliedstuck`
  ADD PRIMARY KEY (`stuckID`),
  ADD UNIQUE KEY `unique_index` (`supplierID`,`productID`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplierID`);

--
-- Indexes for table `tax`
--
ALTER TABLE `tax`
  ADD PRIMARY KEY (`taxID`),
  ADD UNIQUE KEY `taxName` (`taxName`);

--
-- Indexes for table `titles`
--
ALTER TABLE `titles`
  ADD PRIMARY KEY (`titleID`);

--
-- Indexes for table `tradecurrency`
--
ALTER TABLE `tradecurrency`
  ADD PRIMARY KEY (`CurrencyID`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transCode`);

--
-- Indexes for table `webpos_user`
--
ALTER TABLE `webpos_user`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `employeeID` (`employeeID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `branchID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cartID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=733;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `countryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `discount`
--
ALTER TABLE `discount`
  MODIFY `discountID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employeeID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gender`
--
ALTER TABLE `gender`
  MODIFY `sexid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `gentrans`
--
ALTER TABLE `gentrans`
  MODIFY `transID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10002;

--
-- AUTO_INCREMENT for table `jobtitles`
--
ALTER TABLE `jobtitles`
  MODIFY `jobtitleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `locationdetails`
--
ALTER TABLE `locationdetails`
  MODIFY `locationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `markup`
--
ALTER TABLE `markup`
  MODIFY `markupID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `personID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `personaddress`
--
ALTER TABLE `personaddress`
  MODIFY `addressID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personphoto`
--
ALTER TABLE `personphoto`
  MODIFY `photoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `positions`
--
ALTER TABLE `positions`
  MODIFY `positionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `proclassification`
--
ALTER TABLE `proclassification`
  MODIFY `ClassID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `productID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=276;

--
-- AUTO_INCREMENT for table `producttype`
--
ALTER TABLE `producttype`
  MODIFY `productTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `rack`
--
ALTER TABLE `rack`
  MODIFY `rackID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `region`
--
ALTER TABLE `region`
  MODIFY `regionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `section`
--
ALTER TABLE `section`
  MODIFY `sectionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `shelve`
--
ALTER TABLE `shelve`
  MODIFY `shelveID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `suppliedproduct`
--
ALTER TABLE `suppliedproduct`
  MODIFY `spID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `suppliedstuck`
--
ALTER TABLE `suppliedstuck`
  MODIFY `stuckID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `supplierID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `tax`
--
ALTER TABLE `tax`
  MODIFY `taxID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `titles`
--
ALTER TABLE `titles`
  MODIFY `titleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tradecurrency`
--
ALTER TABLE `tradecurrency`
  MODIFY `CurrencyID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transCode` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique code to identify transaction', AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `webpos_user`
--
ALTER TABLE `webpos_user`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `branch`
--
ALTER TABLE `branch`
  ADD CONSTRAINT `branch_ibfk_1` FOREIGN KEY (`companyID`) REFERENCES `branch` (`branchID`),
  ADD CONSTRAINT `branch_ibfk_2` FOREIGN KEY (`companyID`) REFERENCES `company` (`companyID`);

--
-- Constraints for table `section`
--
ALTER TABLE `section`
  ADD CONSTRAINT `section_ibfk_1` FOREIGN KEY (`branchID`) REFERENCES `branch` (`branchID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
