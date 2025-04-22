-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2025 at 04:31 AM
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

INSERT INTO `account` (`Username`, `Password`, `Role`, `Status`, `ImgPath`, `DateReg`, `PersonID`) VALUES
('aaa', '$2y$10$ZW7oOtOAuHI5Wu9TztHC6ezbbe1H.Lm586YKN9SLP//iS8BKEqaEy', 'M', b'1', NULL, '2025-04-07', 14),
('i hate username', '$2y$10$h1/H/OLcp.hKnVqJ/ZvYc.sUfxpBG3FzWT7W8pxas6D3A5DD5.44.', 'M', b'1', NULL, '2025-04-05', 7),
('lim', '$2y$10$PuxqAtVPar.ANcc2J4VxjesnggbCCLVSvmf0R8Qyk1kYyHoyY8aaK', 'M', b'1', '../Img/Profile/67f0c894b0a06.png', '2025-04-05', 9),
('lim new', '$2y$10$y5BF84YEtKRpobLNTXVG2.TKVb9U0suLZs09uIxoG.sfH/erfGJ2S', 'M', b'1', NULL, '2025-04-02', 3),
('newacc', '$2y$10$BEqkfJGXW2F6grP6KpsfMuf9n0MXnLWGSvL33QcUh8N7y0LbUt9Gi', 'M', b'1', NULL, '2025-04-02', 4),
('newacc2', '$2y$10$XvmehiOHDBZlKAZ7yDD9ou4yKmzpTA7O8EKIyJIW0m0G.laj3tElW', 'M', b'1', NULL, '2025-04-02', 5),
('newTest', '$2y$10$N5IndgFbh2RY.E4jtbTa.OyQThFpXGmYj5m5HUPTcqbk1CFG5GkP2', 'M', b'1', '../Img/Profile/NoProfile.png', '2025-04-06', 12),
('test', '$2y$10$rXSMMQMj9/Z99XxF3St5se2GmoUOqvZ3NXzcjXzeyxze5K501MDMO', 'M', b'1', '../Img/Profile/67f252c44687a.png', '2025-04-06', 13),
('testa', '$2y$10$G6pdL0irDPiAT61VbuoH5.dMXeh6T4EPlsGVLeZaT6Gblojz0ydsW', 'M', b'1', '../Img/Profile/67f0ca21c600e.png', '2025-04-05', 8),
('testing', '$2y$10$zCAYq.29FK7Gm2j.ixfrd.8khSihA6/Lr/8.HI5YMGMJE6gbzRg1K', 'M', b'1', NULL, '2025-04-06', 11),
('testingtest', '$2y$10$R4QZOuiRkbYyluEUbmguzuFIy./gULXpWDNr9vbG.DX84dOOnCXDm', 'M', b'1', NULL, '2025-04-02', 6),
('tests', '$2y$10$jXRk6sN49TwI8hH4fP0AFOq89wWsLs9Ru0j5VQd/fh.hvf4vovJ6S', 'M', b'1', NULL, '2025-04-05', 10);

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
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `ID` int(11) NOT NULL,
  `Address` varchar(200) NOT NULL,
  `Username` int(11) NOT NULL,
  `TransactionID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orderlist`
--

CREATE TABLE `orderlist` (
  `OrderID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(3, 'lol ', '', ''),
(4, NULL, NULL, NULL),
(5, NULL, NULL, NULL),
(6, NULL, NULL, NULL),
(7, 'name', '', ''),
(8, '', '', ''),
(9, '', '', ''),
(10, NULL, NULL, NULL),
(11, NULL, NULL, NULL),
(12, NULL, NULL, NULL),
(13, '', '', ''),
(14, NULL, NULL, NULL);

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
  `DateRelease` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ID`, `Name`, `Desc`, `Quantity`, `Price`, `ImgPath`, `DateRelease`) VALUES
(1, 'Red Flower', 'A striking red flower that makes a perfect graduation gift — vibrant, elegant, and full of meaning. Its bold color symbolizes achievement and celebration, making it a popular choice among buyers looking to honor graduates on their special day. Whether you\'re congratulating a friend, family member, or loved one, this flower adds a beautiful and memorable touch to any graduation celebration.', 20, 100, NULL, '2025-04-06');

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
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `ID` int(11) NOT NULL,
  `PaymentMethod` varchar(20) NOT NULL,
  `Amount` double NOT NULL,
  `Date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`Username`),
  ADD KEY `PersonID` (`PersonID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `orderlist`
--
ALTER TABLE `orderlist`
  ADD PRIMARY KEY (`OrderID`,`ProductID`);

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
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

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
