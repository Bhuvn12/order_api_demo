-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.2.14-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for order_data2
DROP DATABASE IF EXISTS `order_data2`;
CREATE DATABASE IF NOT EXISTS `order_data2` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `order_data2`;

-- Dumping structure for table order_data2.item_info
DROP TABLE IF EXISTS `item_info`;
CREATE TABLE IF NOT EXISTS `item_info` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `restaurant_id` int(11) DEFAULT NULL,
  `item_name` varchar(50) DEFAULT NULL,
  `unit_price` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table order_data2.item_info: ~7 rows (approximately)
DELETE FROM `item_info`;
/*!40000 ALTER TABLE `item_info` DISABLE KEYS */;
INSERT INTO `item_info` (`item_id`, `restaurant_id`, `item_name`, `unit_price`) VALUES
	(1, 1, 'Burger', 50),
	(2, 1, 'Pizza', 220),
	(3, 2, 'Chicken Biryani', 200),
	(4, 2, 'Mutton Biryani', 280),
	(5, 2, 'Roasted Chicken', 250),
	(6, 2, 'Cold Drink', 40),
	(7, 1, 'Cold Drink', 40);
/*!40000 ALTER TABLE `item_info` ENABLE KEYS */;

-- Dumping structure for table order_data2.order_info
DROP TABLE IF EXISTS `order_info`;
CREATE TABLE IF NOT EXISTS `order_info` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `restaurant_id` int(11) NOT NULL DEFAULT 0,
  `item_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`restaurant_id`,`item_id`,`user_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table order_data2.order_info: ~5 rows (approximately)
DELETE FROM `order_info`;
/*!40000 ALTER TABLE `order_info` DISABLE KEYS */;
INSERT INTO `order_info` (`order_id`, `restaurant_id`, `item_id`, `user_id`, `quantity`) VALUES
	(1, 1, 1, 1, 3),
	(2, 1, 2, 1, 1),
	(3, 2, 3, 2, 1),
	(4, 2, 5, 2, 1),
	(5, 3, 3, 1, 2);
/*!40000 ALTER TABLE `order_info` ENABLE KEYS */;

-- Dumping structure for table order_data2.restaurant_info
DROP TABLE IF EXISTS `restaurant_info`;
CREATE TABLE IF NOT EXISTS `restaurant_info` (
  `restaurant_id` int(11) NOT NULL AUTO_INCREMENT,
  `restaurant_name` varchar(50) DEFAULT NULL,
  `locality` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`restaurant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table order_data2.restaurant_info: ~2 rows (approximately)
DELETE FROM `restaurant_info`;
/*!40000 ALTER TABLE `restaurant_info` DISABLE KEYS */;
INSERT INTO `restaurant_info` (`restaurant_id`, `restaurant_name`, `locality`, `city`, `state`, `country`) VALUES
	(1, 'Rest 1', 'Rajajipuram', 'Lucknow', 'UP', 'India'),
	(2, 'Rest 2', 'Mayur Vihar', 'New Delhi', 'Delhi', 'India');
/*!40000 ALTER TABLE `restaurant_info` ENABLE KEYS */;

-- Dumping structure for table order_data2.user_info
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE IF NOT EXISTS `user_info` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) DEFAULT NULL,
  `user_email` varchar(50) DEFAULT NULL,
  `user_password` varchar(50) DEFAULT NULL,
  UNIQUE KEY `user_email` (`user_email`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table order_data2.user_info: ~2 rows (approximately)
DELETE FROM `user_info`;
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
INSERT INTO `user_info` (`user_id`, `user_name`, `user_email`, `user_password`) VALUES
	(1, 'faiz', 'test@mail.com', 'hhjvksbnjkr'),
	(2, 'bhuvn', 'bhuvn@mail.com', 'dkjhsf');
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
