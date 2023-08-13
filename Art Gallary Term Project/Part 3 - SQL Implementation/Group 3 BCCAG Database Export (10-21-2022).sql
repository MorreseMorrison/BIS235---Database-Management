-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 19, 2022 at 01:14 PM
-- Server version: 5.5.31
-- PHP Version: 5.4.4-14+deb7u5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `BCCAG`
--
CREATE DATABASE `BCCAG` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `BCCAG`;

-- --------------------------------------------------------

--
-- Table structure for table `Artist`
--

CREATE TABLE IF NOT EXISTS `Artist` (
  `Artist_ID` int(10) NOT NULL AUTO_INCREMENT,
  `Artist_SSN` char(35) NOT NULL,
  `First_Name` char(35) NOT NULL,
  `Last_Name` char(35) NOT NULL,
  `Interview_Date` date NOT NULL,
  `Street` char(35) NOT NULL,
  `City` char(35) NOT NULL,
  `State` char(2) NOT NULL,
  `ZIP` int(5) NOT NULL,
  `Phone` int(11) NOT NULL,
  `Usual_Type` char(35) NOT NULL,
  `Usual_Style` char(35) NOT NULL,
  `Usual_Medium` char(35) NOT NULL,
  `Staff_ID` int(10) NOT NULL,
  PRIMARY KEY (`Artist_ID`),
  UNIQUE KEY `Artist_SSN` (`Artist_SSN`),
  UNIQUE KEY `Staff_ID` (`Staff_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `Artist`
--

INSERT INTO `Artist` (`Artist_ID`, `Artist_SSN`, `First_Name`, `Last_Name`, `Interview_Date`, `Street`, `City`, `State`, `ZIP`, `Phone`, `Usual_Type`, `Usual_Style`, `Usual_Medium`, `Staff_ID`) VALUES
(1, '156666969', 'Jean', 'Basquiat', '2022-10-12', '57 Great Jones Street', 'New York', 'NY', 10012, 2147483647, 'Painting', 'Contemporary', 'Large', 1),
(2, '123659999', 'Andy', 'Warhol', '2022-10-02', '321 East 6th Street', 'New York', 'NY', 10003, 2147483645, 'Painting', 'Modern', 'Large', 3),
(3, '168989456', 'Grant', 'Wood', '2022-09-05', '5 Turner Alley, 810 Second Ave SE', 'Cedar Rapids', 'IA', 52401, 1223232547, 'Painting', 'Regionalism', 'Medium', 2);

-- --------------------------------------------------------

--
-- Table structure for table `Artwork`
--

CREATE TABLE IF NOT EXISTS `Artwork` (
  `Inventory_ID` int(10) NOT NULL AUTO_INCREMENT,
  `Invoice_Num` int(35) NOT NULL,
  `Title` char(35) NOT NULL,
  `Year_Completed` date NOT NULL,
  `Type` char(35) NOT NULL,
  `Medium` char(35) NOT NULL,
  `Style` char(35) NOT NULL,
  `Size` char(6) NOT NULL,
  `Date_Listed` date NOT NULL,
  `Date_Sold` date NOT NULL,
  `Asking_Price` int(10) NOT NULL,
  `Artist_ID` int(10) NOT NULL,
  PRIMARY KEY (`Inventory_ID`),
  UNIQUE KEY `Invoice_Num` (`Invoice_Num`),
  UNIQUE KEY `Artist_ID` (`Artist_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Collector`
--

CREATE TABLE IF NOT EXISTS `Collector` (
  `Collector_ID` int(10) NOT NULL AUTO_INCREMENT,
  `Collector_SSN` char(10) NOT NULL,
  `First_Name` char(35) NOT NULL,
  `Last_Name` char(35) NOT NULL,
  `Interview_Date` date NOT NULL,
  `Staff_ID` int(10) NOT NULL,
  `Street` char(35) NOT NULL,
  `City` char(35) NOT NULL,
  `State` char(2) NOT NULL,
  `Zip` int(5) NOT NULL,
  `Phone` int(11) NOT NULL,
  `Artist_ID` int(10) NOT NULL,
  `Usual_Type` char(35) NOT NULL,
  `Usual_Style` char(35) NOT NULL,
  `Usual_Medium` char(35) NOT NULL,
  UNIQUE KEY `Artist_ID` (`Artist_ID`),
  UNIQUE KEY `Collector_SSN` (`Collector_SSN`),
  UNIQUE KEY `Staff_ID` (`Staff_ID`),
  KEY `Collector_ID` (`Collector_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--

CREATE TABLE IF NOT EXISTS `Customer` (
  `Customer_ID` int(10) NOT NULL AUTO_INCREMENT,
  `First_Name` char(35) NOT NULL,
  `Last_Name` char(35) NOT NULL,
  `Street` char(35) NOT NULL,
  `City` char(35) NOT NULL,
  `State` int(2) NOT NULL,
  `Zip` int(5) NOT NULL,
  `Phone` int(11) NOT NULL,
  `Artist_ID` int(10) NOT NULL,
  `Usual_Type` char(35) NOT NULL,
  `Usual_Style` char(35) NOT NULL,
  `Preferred_Medium` char(35) NOT NULL,
  `Show_ID` int(10) NOT NULL,
  PRIMARY KEY (`Customer_ID`),
  UNIQUE KEY `Artist_ID` (`Artist_ID`),
  UNIQUE KEY `Show_ID` (`Show_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Sale`
--

CREATE TABLE IF NOT EXISTS `Sale` (
  `Invoice_Num` int(35) NOT NULL AUTO_INCREMENT,
  `Inventory_ID` int(10) NOT NULL,
  `Artist_ID` int(10) NOT NULL,
  `Customer_ID` int(10) NOT NULL,
  `Staff_ID` int(10) NOT NULL,
  `Sale_Date` date NOT NULL,
  `Sale_Price` int(10) NOT NULL,
  `Staff_Commission` int(6) NOT NULL,
  PRIMARY KEY (`Invoice_Num`),
  UNIQUE KEY `Inventory_ID` (`Inventory_ID`),
  UNIQUE KEY `Artist_ID` (`Artist_ID`),
  UNIQUE KEY `Customer_ID` (`Customer_ID`),
  UNIQUE KEY `Staff_ID` (`Staff_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Show`
--

CREATE TABLE IF NOT EXISTS `Show` (
  `Show_ID` int(10) NOT NULL AUTO_INCREMENT,
  `Show_Date` date NOT NULL,
  `Artist_Theme` char(35) NOT NULL,
  `Inventory_ID` int(10) NOT NULL,
  PRIMARY KEY (`Show_ID`),
  UNIQUE KEY `Inventory_ID` (`Inventory_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Staff`
--

CREATE TABLE IF NOT EXISTS `Staff` (
  `Staff_ID` int(10) NOT NULL AUTO_INCREMENT,
  `Staff_SSN` char(10) NOT NULL,
  `First_Name` char(35) NOT NULL,
  `Last_Name` char(35) NOT NULL,
  PRIMARY KEY (`Staff_ID`),
  UNIQUE KEY `Staff_SSN` (`Staff_SSN`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `Staff`
--

INSERT INTO `Staff` (`Staff_ID`, `Staff_SSN`, `First_Name`, `Last_Name`) VALUES
(1, '165653652', 'John', 'Harrison'),
(2, '156656569', 'Leslie', 'Ford'),
(3, '188969985', 'Tommy', 'Robinson'),
(4, '155658985', 'Heather', 'Barnes');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Artist`
--
ALTER TABLE `Artist`
  ADD CONSTRAINT `Artist_ibfk_1` FOREIGN KEY (`Staff_ID`) REFERENCES `Staff` (`Staff_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `Artwork`
--
ALTER TABLE `Artwork`
  ADD CONSTRAINT `Artwork_ibfk_1` FOREIGN KEY (`Artist_ID`) REFERENCES `Artist` (`Artist_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Artwork_ibfk_2` FOREIGN KEY (`Invoice_Num`) REFERENCES `Sale` (`Invoice_Num`) ON UPDATE CASCADE;

--
-- Constraints for table `Collector`
--
ALTER TABLE `Collector`
  ADD CONSTRAINT `Collector_ibfk_2` FOREIGN KEY (`Artist_ID`) REFERENCES `Artist` (`Artist_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Collector_ibfk_3` FOREIGN KEY (`Staff_ID`) REFERENCES `Staff` (`Staff_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `Customer`
--
ALTER TABLE `Customer`
  ADD CONSTRAINT `Customer_ibfk_1` FOREIGN KEY (`Artist_ID`) REFERENCES `Artist` (`Artist_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Customer_ibfk_2` FOREIGN KEY (`Show_ID`) REFERENCES `Show` (`Show_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `Sale`
--
ALTER TABLE `Sale`
  ADD CONSTRAINT `Sale_ibfk_1` FOREIGN KEY (`Staff_ID`) REFERENCES `Staff` (`Staff_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Sale_ibfk_2` FOREIGN KEY (`Artist_ID`) REFERENCES `Artist` (`Artist_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Sale_ibfk_3` FOREIGN KEY (`Inventory_ID`) REFERENCES `Artwork` (`Inventory_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Sale_ibfk_4` FOREIGN KEY (`Customer_ID`) REFERENCES `Customer` (`Customer_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `Show`
--
ALTER TABLE `Show`
  ADD CONSTRAINT `Show_ibfk_1` FOREIGN KEY (`Inventory_ID`) REFERENCES `Artwork` (`Inventory_ID`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
