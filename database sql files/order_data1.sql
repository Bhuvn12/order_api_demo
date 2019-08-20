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


-- Dumping database structure for order_data1
DROP DATABASE IF EXISTS `order_data1`;
CREATE DATABASE IF NOT EXISTS `order_data1` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `order_data1`;

-- Dumping structure for table order_data1.order_info
DROP TABLE IF EXISTS `order_info`;
CREATE TABLE IF NOT EXISTS `order_info` (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `restaurant_id` bigint(20) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `item_name` varchar(200) NOT NULL,
  `unit_price` double NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `restaurant_name` varchar(50) NOT NULL,
  `restaurant_city` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL,
  `bill` double NOT NULL,
  PRIMARY KEY (`user_id`,`restaurant_id`,`item_id`),
  KEY `id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table order_data1.order_info: ~1 rows (approximately)
DELETE FROM `order_info`;
/*!40000 ALTER TABLE `order_info` DISABLE KEYS */;
INSERT INTO `order_info` (`order_id`, `user_id`, `restaurant_id`, `item_id`, `item_name`, `unit_price`, `user_name`, `restaurant_name`, `restaurant_city`, `quantity`, `bill`) VALUES
	(1, 1, 1, 1, 'Burger', 20, 'Bhuvnesh', 'KFC', 'Lucknow', 3, 60);
/*!40000 ALTER TABLE `order_info` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
