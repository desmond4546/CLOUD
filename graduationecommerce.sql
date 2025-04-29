-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 26, 2025 at 11:01 AM
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
-- Database: `graduationecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `ID` int(11) NOT NULL,
  `Username` varchar(20) NOT NULL,
  `Password` varchar(200) NOT NULL,
  `Role` char(1) NOT NULL,
  `Status` bit(1) NOT NULL,
  `ImgPath` varchar(200) DEFAULT NULL,
  `DateReg` date NOT NULL DEFAULT current_timestamp(),
  `PersonID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`ID`, `Username`, `Password`, `Role`, `Status`, `ImgPath`, `DateReg`, `PersonID`) VALUES
(1, 'admin', '$2y$10$wKw68gJMvnhBvrD4xAB3lukNS18jG4OteGejw3cs87kLa0yNu4.YK', 'A', b'1', NULL, '2025-04-26', 1),
(2, 'user1', '$2y$10$GK/pMW5X6PbRzxdhhI5X1e41GLSn.Q6eiin3APQRJtuqOh4dMkpTi', 'M', b'1', NULL, '2025-04-26', 2);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `AccountID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `ID` int(11) NOT NULL,
  `Text` varchar(20) NOT NULL,
  `Description` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`ID`, `Text`, `Description`) VALUES
(1, 'Flower', 'Flowers that suitable as a gift on graduation conc'),
(2, 'Souvenir', 'Key chains, magnet etc'),
(3, 'Clothes', 'Various types of clothes suitable for graduation o'),
(4, 'Other', 'Other related to graduation products');

-- --------------------------------------------------------

--
-- Table structure for table `orderlist`
--

CREATE TABLE `orderlist` (
  `OrderID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderlist`
--

INSERT INTO `orderlist` (`OrderID`, `ProductID`, `Quantity`) VALUES
(1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `ID` int(11) NOT NULL,
  `Address` varchar(200) NOT NULL,
  `StatusID` int(11) NOT NULL,
  `Date` date NOT NULL DEFAULT current_timestamp(),
  `AccountID` int(11) NOT NULL,
  `TransactionID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`ID`, `Address`, `StatusID`, `Date`, `AccountID`, `TransactionID`) VALUES
(1, 'Penang TAR UMT', 1, '2025-04-26', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `IC` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`ID`, `Name`, `Email`, `IC`) VALUES
(1, NULL, NULL, NULL),
(2, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Desc` text NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Price` double NOT NULL,
  `ImgPath` varchar(200) DEFAULT NULL,
  `Status` bit(1) NOT NULL DEFAULT b'1',
  `DateRelease` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ID`, `Name`, `Desc`, `Quantity`, `Price`, `ImgPath`, `Status`, `DateRelease`) VALUES
(1, 'Red Flower', 'A bold red flower symbolizing passion, strength, and success — a perfect gift to honor a graduate’s journey, hard work, and the bright future that lies ahead.', 18, 30, '../Img/Product/680c923303e53.jpeg', b'1', '2025-04-26'),
(2, 'Yellow Flower', 'A cheerful yellow flower symbolizing joy, friendship, and new beginnings — a bright, uplifting gift to celebrate a graduate’s success and the exciting path ahead.', 22, 15, '../Img/Product/680c92ec9238a.jpeg', b'1', '2025-04-26'),
(3, 'Graduate Keychain', 'A stylish keychain symbolizing memories and new journeys — a perfect keepsake for a graduate to carry reminders of achievement and the bright road ahead.', 22, 5, '../Img/Product/680c9a2b95fd2.png', b'1', '2025-04-26'),
(4, 'Hat Keychain', 'A charming hat-shaped keychain, symbolizing achievement and adventure — a perfect reminder of graduation success and the exciting journey that follows.', 2, 8, '../Img/Product/680c9aa38dea4.png', b'1', '2025-04-26'),
(5, 'Black Clothes', 'Simple yet powerful, plain black clothes embody elegance, confidence, and versatility — perfect for any occasion with a timeless, effortless style.', 300, 100, '../Img/Product/680c9aeedd4a9.jpg', b'1', '2025-04-26');

-- --------------------------------------------------------

--
-- Table structure for table `productcategory`
--

CREATE TABLE `productcategory` (
  `ProductID` int(11) NOT NULL,
  `CategoryID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `productcategory`
--

INSERT INTO `productcategory` (`ProductID`, `CategoryID`) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `ID` int(11) NOT NULL,
  `Text` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`ID`, `Text`) VALUES
(1, 'Packing'),
(2, 'Packed'),
(3, 'Delivering'),
(4, 'Delivered');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `ID` int(11) NOT NULL,
  `CardNo` varchar(16) NOT NULL,
  `Amount` double NOT NULL,
  `AccountID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`ID`, `CardNo`, `Amount`, `AccountID`) VALUES
(1, '1111111111111111', 69, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `PersonID` (`PersonID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `orderlist`
--
ALTER TABLE `orderlist`
  ADD PRIMARY KEY (`OrderID`,`ProductID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `productcategory`
--
ALTER TABLE `productcategory`
  ADD PRIMARY KEY (`ProductID`,`CategoryID`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `PersonID` FOREIGN KEY (`PersonID`) REFERENCES `person` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
