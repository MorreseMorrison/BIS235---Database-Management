-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 19, 2022 at 03:15 PM
-- Server version: 5.5.31
-- PHP Version: 5.4.4-14+deb7u5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `BIS235`
--
CREATE DATABASE `BIS235` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `BIS235`;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `cust_id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_name` char(50) NOT NULL,
  `cust_address` char(50) DEFAULT NULL,
  `cust_city` char(50) DEFAULT NULL,
  `cust_state` char(5) DEFAULT NULL,
  `cust_zip` char(10) DEFAULT NULL,
  `cust_country` char(50) DEFAULT NULL,
  `cust_contact` char(50) DEFAULT NULL,
  `cust_email` char(255) DEFAULT NULL,
  PRIMARY KEY (`cust_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10006 ;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`cust_id`, `cust_name`, `cust_address`, `cust_city`, `cust_state`, `cust_zip`, `cust_country`, `cust_contact`, `cust_email`) VALUES
(10001, 'Coyote Inc.', '200 Maple Lane', 'Detroit', 'MI', '44444', 'USA', 'Y Lee', 'ylee@coyote.com'),
(10002, 'Mouse House', '333 Fromage Lane', 'Columbus', 'OH', '43333', 'USA', 'Jerry Mouse', NULL),
(10003, 'Wascals', '1 Sunny Place', 'Muncie', 'IN', '42222', 'USA', 'Jim Jones', 'rabbit@wascally.com'),
(10004, 'Yosemite Place', '829 Riverside Drive', 'Phoenix', 'AZ', '88888', 'USA', 'Y Sam', 'sam@yosemite.com'),
(10005, 'E Fudd', '4545 53rd Street', 'Chicago', 'IL', '54545', 'USA', 'E Fudd', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orderitems`
--

CREATE TABLE IF NOT EXISTS `orderitems` (
  `order_num` int(11) NOT NULL,
  `order_item` int(11) NOT NULL,
  `prod_id` char(10) NOT NULL,
  `quantity` int(11) NOT NULL,
  `item_price` decimal(8,2) NOT NULL,
  PRIMARY KEY (`order_num`,`order_item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orderitems`
--

INSERT INTO `orderitems` (`order_num`, `order_item`, `prod_id`, `quantity`, `item_price`) VALUES
(20005, 1, 'ANV01', 10, 5.99),
(20005, 2, 'ANV02', 3, 9.99),
(20005, 3, 'TNT2', 5, 10.00),
(20005, 4, 'FB', 1, 10.00),
(20006, 1, 'JP2000', 1, 55.00),
(20007, 1, 'TNT2', 100, 10.00),
(20008, 1, 'FC', 50, 2.50),
(20009, 1, 'FB', 1, 10.00),
(20009, 2, 'OL1', 1, 8.99),
(20009, 3, 'SLING', 1, 4.49),
(20009, 4, 'ANV03', 1, 14.99);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `order_num` int(11) NOT NULL AUTO_INCREMENT,
  `order_date` datetime NOT NULL,
  `cust_id` int(11) NOT NULL,
  PRIMARY KEY (`order_num`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20010 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_num`, `order_date`, `cust_id`) VALUES
(20005, '2015-04-01 00:00:00', 10001),
(20006, '2005-09-12 00:00:00', 10003),
(20007, '2014-12-30 00:00:00', 10004),
(20008, '2011-10-03 00:00:00', 10005),
(20009, '2013-10-08 00:00:00', 10001);

-- --------------------------------------------------------

--
-- Table structure for table `productnotes`
--

CREATE TABLE IF NOT EXISTS `productnotes` (
  `note_id` int(11) NOT NULL AUTO_INCREMENT,
  `prod_id` char(10) NOT NULL,
  `note_date` datetime NOT NULL,
  `note_text` text,
  PRIMARY KEY (`note_id`),
  FULLTEXT KEY `note_text` (`note_text`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=115 ;

--
-- Dumping data for table `productnotes`
--

INSERT INTO `productnotes` (`note_id`, `prod_id`, `note_date`, `note_text`) VALUES
(101, 'TNT2', '2005-08-17 00:00:00', 'Customer complaint:\nSticks not individually wrapped, too easy to mistakenly detonate all at once.\nRecommend individual wrapping.'),
(102, 'OL1', '2005-08-18 00:00:00', 'Can shipped full, refills not available.\nNeed to order new can if refill needed.'),
(103, 'SAFE', '2005-08-18 00:00:00', 'Safe is combination locked, combination not provided with safe.\nThis is rarely a problem as safes are typically blown up or dropped by customers.'),
(104, 'FC', '2005-08-19 00:00:00', 'Quantity varies, sold by the sack load.\nAll guaranteed to be bright and orange, and suitable for use as rabbit bait.'),
(105, 'TNT2', '2005-08-20 00:00:00', 'Included fuses are short and have been known to detonate too quickly for some customers.\nLonger fuses are available (item FU1) and should be recommended.'),
(106, 'TNT2', '2005-08-22 00:00:00', 'Matches not included, recommend purchase of matches or detonator (item DTNTR).'),
(107, 'SAFE', '2005-08-23 00:00:00', 'Please note that no returns will be accepted if safe opened using explosives.'),
(108, 'ANV01', '2005-08-25 00:00:00', 'Multiple customer returns, anvils failing to drop fast enough or falling backwards on purchaser. Recommend that customer considers using heavier anvils.'),
(109, 'ANV03', '2005-09-01 00:00:00', 'Item is extremely heavy. Designed for dropping, not recommended for use with slings, ropes, pulleys, or tightropes.'),
(110, 'FC', '2005-09-01 00:00:00', 'Customer complaint: rabbit has been able to detect trap, food apparently less effective now.'),
(111, 'SLING', '2005-09-02 00:00:00', 'Shipped unassembled, requires common tools (including oversized hammer).'),
(112, 'SAFE', '2005-09-02 00:00:00', 'Customer complaint:\nCircular hole in safe floor can apparently be easily cut with handsaw.'),
(113, 'ANV01', '2005-09-05 00:00:00', 'Customer complaint:\nNot heavy enough to generate flying stars around head of victim. If being purchased for dropping, recommend ANV02 or ANV03 instead.'),
(114, 'SAFE', '2005-09-07 00:00:00', 'Call from individual trapped in safe plummeting to the ground, suggests an escape hatch be added.\nComment forwarded to vendor.');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `prod_id` char(10) NOT NULL,
  `vend_id` int(11) NOT NULL,
  `prod_name` char(255) NOT NULL,
  `prod_price` decimal(8,2) NOT NULL,
  `prod_desc` text,
  PRIMARY KEY (`prod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`prod_id`, `vend_id`, `prod_name`, `prod_price`, `prod_desc`) VALUES
('ANV01', 1001, '.5 ton anvil', 5.99, '.5 ton anvil, black, complete with handy hook'),
('ANV02', 1001, '1 ton anvil', 9.99, '1 ton anvil, black, complete with handy hook and carrying case'),
('ANV03', 1001, '2 ton anvil', 14.99, '2 ton anvil, black, complete with handy hook and carrying case'),
('DTNTR', 1003, 'Detonator', 13.00, 'Detonator (plunger powered), fuses not included'),
('FB', 1003, 'Bird seed', 10.00, 'Large bag (suitable for road runners)'),
('FC', 1003, 'Carrots', 2.50, 'Carrots (rabbit hunting season only)'),
('FU1', 1002, 'Fuses', 3.42, '1 dozen, extra long'),
('JP1000', 1005, 'JetPack 1000', 35.00, 'JetPack 1000, intended for single use'),
('JP2000', 1005, 'JetPack 2000', 55.00, 'JetPack 2000, multi-use'),
('OL1', 1002, 'Oil can', 8.99, 'Oil can, red'),
('SAFE', 1003, 'Safe', 50.00, 'Safe with combination lock'),
('SLING', 1003, 'Sling', 4.49, 'Sling, one size fits all'),
('TNT1', 1003, 'TNT (1 stick)', 2.50, 'TNT, red, single stick'),
('TNT2', 1003, 'TNT (5 sticks)', 10.00, 'TNT, red, pack of 10 sticks');

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE IF NOT EXISTS `vendors` (
  `vend_id` int(11) NOT NULL AUTO_INCREMENT,
  `vend_name` char(50) NOT NULL,
  `vend_address` char(50) DEFAULT NULL,
  `vend_city` char(50) DEFAULT NULL,
  `vend_state` char(5) DEFAULT NULL,
  `vend_zip` char(10) DEFAULT NULL,
  `vend_country` char(50) DEFAULT NULL,
  PRIMARY KEY (`vend_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1007 ;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`vend_id`, `vend_name`, `vend_address`, `vend_city`, `vend_state`, `vend_zip`, `vend_country`) VALUES
(1001, 'Anvils R Us', '123 Main Street', 'Southfield', 'MI', '48075', 'USA'),
(1002, 'LT Supplies', '500 Park Street', 'Anytown', 'OH', '44333', 'USA'),
(1003, 'ACME', '555 High Street', 'Los Angeles', 'CA', '90046', 'USA'),
(1004, 'Furball Inc.', '1000 5th Avenue', 'New York', 'NY', '11111', 'USA'),
(1005, 'Jet Set', '42 Galaxy Road', 'London', NULL, 'N16 6PS', 'England'),
(1006, 'Jouets Et Ours', '1 Rue Amusement', 'Paris', NULL, '45678', 'France');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
