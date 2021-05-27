-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.7.24 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for ecommerce
-- CREATE DATABASE IF NOT EXISTS `ecommerce` /*!40100 DEFAULT CHARACTER SET latin1 */;
-- USE `ecommerce`;

-- Dumping structure for table ecommerce.businesses
CREATE TABLE IF NOT EXISTS `businesses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `categoryId` varchar(50) NOT NULL,
  `longitude` float NOT NULL,
  `latitude` float NOT NULL,
  `ownerId` int(11) NOT NULL,
  `businessImage` text,
  `description` text NOT NULL,
  `location` text NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `featured` enum('true','false') DEFAULT 'false',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- Dumping data for table ecommerce.businesses: ~11 rows (approximately)
DELETE FROM `businesses`;
/*!40000 ALTER TABLE `businesses` DISABLE KEYS */;
INSERT INTO `businesses` (`id`, `name`, `categoryId`, `longitude`, `latitude`, `ownerId`, `businessImage`, `description`, `location`, `createdAt`, `updatedAt`, `featured`) VALUES
	(1, 'MyBusiness', '2', 98765500000, 23456800000, 38, 'userAssets/businessImages/MyBusiness602a97147d0f9.jpg', 'my business is the best so go hoem kid ', '', '2021-02-17 16:47:11', '2021-02-17 16:47:11', 'true'),
	(3, 'MyBusiness', '2', 98765500000, 23456800000, 28, 'userAssets/businessImages/dummy.jpeg', 'my business is the best so go hoem kid ', '', '2021-02-17 16:47:11', '2021-02-17 16:47:11', 'false'),
	(4, 'MyBusiness', '2', 98765500000, 23456800000, 28, 'userAssets/businessImages/dummy.jpeg', 'my business is the best so go hoem kid ', '', '2021-02-17 16:47:11', '2021-02-17 16:47:11', 'false'),
	(5, 'MyBusiness', '2', 98765500000, 23456800000, 28, 'userAssets/businessImages/dummy.jpeg', 'my business is the best so go hoem kid ', '', '2021-02-17 16:47:11', '2021-02-17 16:47:11', 'false'),
	(6, 'MyBusiness', '2', 98765500000, 23456800000, 28, 'userAssets/businessImages/dummy.jpeg', 'my business is the best so go hoem kid ', '', '2021-02-17 16:47:11', '2021-02-17 16:47:11', 'false'),
	(7, 'aasdfghj', '3', 456, 456, 38, 'userAssets/businessImages/aasdfghj602d0e35bae27.jpg', 'sdfghjkd   dfghjnk fgvhbjnkm frgvhbjnkm fgthbj', '', '2021-02-17 17:38:13', '2021-02-17 17:38:13', 'false'),
	(8, 'edrfgthyu', '2', 543, 54, 38, 'userAssets/businessImages/edrfgthyu602d102c434fb.jpg', 'wertyu', '', '2021-02-17 17:46:36', '2021-02-17 17:46:36', 'false'),
	(9, 'Applicon Soft', '3', 328, 566, 38, 'userAssets/businessImages/AppliconSoft602d1375e444c.jpg', 'software house', 'faisal tw', '2021-02-17 18:00:37', '2021-02-17 18:00:37', 'false'),
	(10, 'djlvnsjd', '3', 323, 786, 40, 'userAssets/businessImages/djlvnsjd602d29022afe4.jpg', 'hvghcyc', '', '2021-02-17 19:32:34', '2021-02-17 19:32:34', 'false'),
	(11, 'AppliconSoft', '1', 74.3094, 31.4702, 38, 'userAssets/businessImages/dummy.jpeg', 'A Software Development Organization', 'plot 388 faisal town block d lahore pakistan', '2021-02-18 14:34:50', '2021-02-18 14:34:52', 'false'),
	(19, 'Bussiness 1', '3', 74.3094, 31.4702, 40, 'userAssets/businessImages/dummy.jpeg', 'Bussines near applicon soft', 'plot 389 faisal town clock d ', '2021-02-18 14:37:54', '2021-02-18 14:37:54', 'false');
/*!40000 ALTER TABLE `businesses` ENABLE KEYS */;

-- Dumping structure for table ecommerce.cart
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` tinytext NOT NULL,
  `itemPrice` mediumint(9) NOT NULL,
  `quantity` int(5) NOT NULL,
  `description` mediumtext NOT NULL,
  `businessId` int(11) NOT NULL,
  `type` enum('item','event') NOT NULL,
  `itemId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

-- Dumping data for table ecommerce.cart: ~5 rows (approximately)
DELETE FROM `cart`;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` (`id`, `name`, `itemPrice`, `quantity`, `description`, `businessId`, `type`, `itemId`, `userId`) VALUES
	(40, 'Barwa group Meeting', 15000, 10, 'Waadai paen termination', 0, 'event', 6, 0),
	(41, 'apple', 4000, 4, 'my description', 0, 'item', 3, 0),
	(42, 'jkdsbskjd', 3432, 1, 'dksbvskvd', 0, 'event', 10, 0),
	(43, 'Barwa group Meeting', 9000, 6, 'Waadai paen termination', 1, 'event', 6, 40),
	(44, 'Barwa group Meeting', 9000, 6, 'Waadai paen termination', 1, 'event', 6, 40);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;

-- Dumping structure for table ecommerce.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table ecommerce.categories: ~3 rows (approximately)
DELETE FROM `categories`;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `name`) VALUES
	(1, 'Food'),
	(2, 'Clothings'),
	(3, 'I.T');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Dumping structure for table ecommerce.comments
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(50) NOT NULL,
  `likes` int(11) NOT NULL DEFAULT '0',
  `parentId` int(11) NOT NULL,
  `type` enum('event','item') NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- Dumping data for table ecommerce.comments: ~22 rows (approximately)
DELETE FROM `comments`;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` (`id`, `text`, `likes`, `parentId`, `type`, `userId`) VALUES
	(1, 'My first Comment', 13, 21, 'event', 38),
	(2, 'My first Comment', 0, 21, 'event', 38),
	(3, 'My first Comment', 4, 21, 'event', 38),
	(4, 'My first Comment', 0, 21, 'event', 38),
	(5, 'My first Comment', 0, 21, 'event', 38),
	(6, 'My first Comment', 0, 21, 'event', 38),
	(7, 'My first Comment', 0, 21, 'event', 38),
	(8, 'My first Comment', 0, 21, 'event', 38),
	(9, 'My first Comment', 0, 21, 'event', 38),
	(10, 'My first Comment', 0, 21, 'event', 38),
	(11, 'My first Comment', 0, 21, 'event', 38),
	(12, 'My first Comment', 0, 21, 'event', 38),
	(13, 'My first Comment', 0, 21, 'event', 38),
	(14, 'My first Comment', 0, 21, 'event', 38),
	(15, 'My first Comment', 0, 21, 'event', 38),
	(16, 'My first Comment', 0, 21, 'event', 38),
	(17, 'My first Comment', 0, 21, 'event', 38),
	(18, 'My first Comment', 0, 21, 'event', 38),
	(19, 'My first Comment', 0, 21, 'event', 38),
	(20, 'My first Comment', 0, 21, 'event', 38),
	(21, 'My first Comment', 0, 21, 'event', 38),
	(22, 'My first Comment', 0, 21, 'event', 38),
	(23, 'My first Comment', 0, 21, 'event', 38);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;

-- Dumping structure for table ecommerce.events
CREATE TABLE IF NOT EXISTS `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `venue` text NOT NULL,
  `businessId` int(11) NOT NULL,
  `location` text NOT NULL,
  `ticketPrice` int(11) NOT NULL,
  `eventImage` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `rating` tinyint(4) DEFAULT NULL,
  `time` datetime NOT NULL,
  `longitude` float NOT NULL,
  `type` enum('item','event') NOT NULL,
  `latitude` float NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `featured` enum('true','false') DEFAULT 'false',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- Dumping data for table ecommerce.events: ~17 rows (approximately)
DELETE FROM `events`;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` (`id`, `name`, `venue`, `businessId`, `location`, `ticketPrice`, `eventImage`, `description`, `rating`, `time`, `longitude`, `type`, `latitude`, `createdAt`, `updatedAt`, `featured`) VALUES
	(6, 'Barwa group Meeting', 'Barwa Association PVT LMT', 1, 'Sath Mansion Anarkali Old Lahore', 1500, 'userAssets/eventImages/dummy.jpg', 'Waadai paen termination', NULL, '2021-04-14 11:30:00', 12435300000, 'event', 13122100000000, '2021-02-17 16:48:03', '2021-02-17 16:48:03', 'true'),
	(7, 'css', 'qweqwgfdbn ', 9, '838kjdsbskjdb', 7473, 'userAssets/eventImages/css602d1ef8407c8.png', 'gcu cs event', NULL, '2021-05-17 13:46:56', 748383, 'event', 388383, '2021-02-17 18:49:44', '2021-02-17 18:49:44', 'false'),
	(8, 'Css', 'qwesdv', 9, 'jdbs3232', 48923, 'userAssets/eventImages/Css602d1f561e449.jpg', 'gcu cs event', NULL, '2021-02-17 13:48:30', 233, 'event', 2323, '2021-02-17 18:51:18', '2021-02-17 18:51:18', 'true'),
	(9, 'css', 'JFKVSKJDB', 9, 'fkjvbsjkdbvsjdb', 6543, 'userAssets/eventImages/dummy.jpg', 'dhvashdc', NULL, '2021-02-17 13:52:09', 433, 'event', 433, '2021-02-17 18:54:54', '2021-02-17 18:54:54', 'true'),
	(10, 'jkdsbskjd', 'DKJSBVSJKDBV', 9, 'jhvhvk', 3432, 'userAssets/eventImages/jkdsbskjd602d20693d77a.jpg', 'dksbvskvd', NULL, '2021-02-17 13:53:02', 656, 'event', 876, '2021-02-17 18:55:53', '2021-02-17 18:55:53', 'true'),
	(11, 'css', 'jkdbsjkbdv', 10, 'sdjallfbudjbfqwwjb', 834928, 'userAssets/eventImages/css602d292d468e2.jpg', 'wuefbwj', NULL, '2021-02-17 14:30:28', 3829, 'event', 239847, '2021-02-17 19:33:17', '2021-02-17 19:33:17', 'true'),
	(12, 'css', 'jkdbsjkbdv', 10, 'sdjallfbudjbfqwwjb', 834928, 'userAssets/eventImages/css602d29468338d.jpg', 'wuefbwj', NULL, '2021-02-17 14:30:28', 3829, 'event', 239847, '2021-02-17 19:33:42', '2021-02-17 19:33:42', 'false'),
	(13, 'css', 'jkdbsjkbdv', 10, 'sdjallfbudjbfqwwjb', 834928, 'userAssets/eventImages/css602d294f99a05.jpg', 'wuefbwj', NULL, '2021-02-17 14:30:28', 3829, 'event', 239847, '2021-02-17 19:33:51', '2021-02-17 19:33:51', 'true'),
	(14, 'css', 'jkdbsjkbdv', 10, 'sdjallfbudjbfqwwjb', 834928, 'userAssets/eventImages/css602d2950dee5c.jpg', 'wuefbwj', NULL, '2021-02-17 14:30:28', 3829, 'event', 239847, '2021-02-17 19:33:52', '2021-02-17 19:33:52', 'true'),
	(15, 'css', 'jkdbsjkbdv', 10, 'sdjallfbudjbfqwwjb', 834928, 'userAssets/eventImages/css602d2951ef328.jpg', 'wuefbwj', NULL, '2021-02-17 14:30:28', 3829, 'event', 239847, '2021-02-17 19:33:53', '2021-02-17 19:33:53', 'true'),
	(16, 'css', 'jkdbsjkbdv', 10, 'sdjallfbudjbfqwwjb', 834928, 'userAssets/eventImages/css602d2953138f4.jpg', 'wuefbwj', NULL, '2021-02-17 14:30:28', 3829, 'event', 239847, '2021-02-17 19:33:55', '2021-02-17 19:33:55', 'true'),
	(17, 'css', 'jkdbsjkbdv', 10, 'sdjallfbudjbfqwwjb', 834928, 'userAssets/eventImages/css602d295427a9b.jpg', 'wuefbwj', NULL, '2021-02-17 14:30:28', 3829, 'event', 239847, '2021-02-17 19:33:56', '2021-02-17 19:33:56', 'false'),
	(18, 'css', 'jkdbsjkbdv', 10, 'sdjallfbudjbfqwwjb', 834928, 'userAssets/eventImages/css602d295525ee3.jpg', 'wuefbwj', NULL, '2021-02-17 14:30:28', 3829, 'event', 239847, '2021-02-17 19:33:57', '2021-02-17 19:33:57', 'true'),
	(19, 'css', 'jkdbsjkbdv', 10, 'sdjallfbudjbfqwwjb', 834928, 'userAssets/eventImages/css602d29562ecb5.jpg', 'wuefbwj', NULL, '2021-02-17 14:30:28', 3829, 'event', 239847, '2021-02-17 19:33:58', '2021-02-17 19:33:58', 'true'),
	(20, 'css', 'jkdbsjkbdv', 10, 'sdjallfbudjbfqwwjb', 834928, 'userAssets/eventImages/css602d29572107e.jpg', 'wuefbwj', NULL, '2021-02-17 14:30:28', 3829, 'event', 239847, '2021-02-17 19:33:59', '2021-02-17 19:33:59', 'true'),
	(21, 'BBQ party', 'therw', 11, 'lahore', 345678, 'userAssets/eventImages/BBQparty602e3b26f16ad.jpg', 'everyone is invited', NULL, '2021-06-18 09:58:38', 74.3086, 'event', 31.4702, '2021-02-18 15:02:15', '2021-02-18 15:02:15', 'true'),
	(22, 'Beer party', 'strip club', 11, 'lahore', 345678, 'userAssets/eventImages/Beerparty602e3b714221e.jpg', 'private', NULL, '2021-06-18 09:58:38', 74.3096, 'event', 31.4711, '2021-02-18 15:03:29', '2021-02-18 15:03:29', 'true');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;

-- Dumping structure for table ecommerce.eventtags
CREATE TABLE IF NOT EXISTS `eventtags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventId` int(11) NOT NULL,
  `tagId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

-- Dumping data for table ecommerce.eventtags: ~28 rows (approximately)
DELETE FROM `eventtags`;
/*!40000 ALTER TABLE `eventtags` DISABLE KEYS */;
INSERT INTO `eventtags` (`id`, `eventId`, `tagId`) VALUES
	(4, 6, 1),
	(5, 6, 2),
	(6, 6, 3),
	(7, 11, 2),
	(8, 11, 3),
	(9, 12, 2),
	(10, 12, 3),
	(11, 13, 2),
	(12, 13, 3),
	(13, 14, 2),
	(14, 14, 3),
	(15, 15, 2),
	(16, 15, 3),
	(17, 16, 2),
	(18, 16, 3),
	(19, 17, 2),
	(20, 17, 3),
	(21, 18, 2),
	(22, 18, 3),
	(23, 19, 2),
	(24, 19, 3),
	(25, 20, 2),
	(26, 20, 3),
	(27, 21, 2),
	(28, 21, 3),
	(29, 22, 1),
	(30, 22, 2),
	(31, 22, 3);
/*!40000 ALTER TABLE `eventtags` ENABLE KEYS */;

-- Dumping structure for table ecommerce.invites
CREATE TABLE IF NOT EXISTS `invites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `invitationCode` tinytext NOT NULL,
  `email` tinytext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table ecommerce.invites: ~7 rows (approximately)
DELETE FROM `invites`;
/*!40000 ALTER TABLE `invites` DISABLE KEYS */;
INSERT INTO `invites` (`id`, `userId`, `invitationCode`, `email`) VALUES
	(1, 38, '6037a30861d776037a30861d886037a30861d8f', 'malikzaman133@gmail.com'),
	(2, 38, '6037ab09e53f66037ab09e6f196037ab09e6f1b', 'malikzaman133@gmail.com'),
	(3, 38, '6037ab2a4fab96037ab2a4fac16037ab2a4fac3', 'malikzaman133@gmail.com'),
	(4, 38, '6037ab3935f3f6037ab3935f426037ab3935f44', 'malikzaman133@gmail.com'),
	(5, 38, '6037ab3f8ab746037ab3f8ab7b6037ab3f8ab7f', 'malikzaman133@gmail.com'),
	(6, 38, '6037ace17d4806037ace17f8ad6037ace17f8b5', 'malikzaman133@gmail.com'),
	(7, 38, '6037ad456ae446037ad456ae526037ad456ae57', 'malikzaman133@gmail.com');
/*!40000 ALTER TABLE `invites` ENABLE KEYS */;

-- Dumping structure for table ecommerce.items
CREATE TABLE IF NOT EXISTS `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` tinytext NOT NULL,
  `itemPrice` mediumint(9) NOT NULL,
  `businessId` int(11) NOT NULL,
  `description` mediumtext NOT NULL,
  `itemImage` text NOT NULL,
  `rating` tinyint(4) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` enum('item','event') NOT NULL,
  `featured` enum('true','false') DEFAULT 'false',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- Dumping data for table ecommerce.items: ~19 rows (approximately)
DELETE FROM `items`;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` (`id`, `name`, `itemPrice`, `businessId`, `description`, `itemImage`, `rating`, `createdAt`, `updatedAt`, `type`, `featured`) VALUES
	(3, 'apple', 1000, 1, 'my description', 'userAssets/itemImages/dummy.jpg', NULL, '0000-00-00 00:00:00', '2021-02-17 16:46:32', 'item', 'false'),
	(4, 'banana', 12, 1, 'my banana', 'userAssets/itemImages/dummy.jpg', NULL, '2021-02-17 18:09:32', '2021-02-17 18:09:33', 'item', 'false'),
	(5, 'cake', 123, 1, 'my description', 'userAssets/itemImages/dummy.jpg', NULL, '2021-02-17 19:20:50', '2021-02-17 19:20:50', 'item', 'true'),
	(6, 'pastery', 123, 1, 'my description', 'userAssets/itemImages/dummy.jpg', NULL, '2021-02-17 19:20:57', '2021-02-17 19:20:57', 'item', 'true'),
	(7, 'iron', 123, 1, 'my description', 'userAssets/itemImages/dummy.jpg', NULL, '2021-02-17 19:21:02', '2021-02-17 19:21:02', 'item', 'false'),
	(8, 'plastic', 123, 1, 'my description', 'userAssets/itemImages/dummy.jpg', NULL, '2021-02-17 19:21:07', '2021-02-17 19:21:07', 'item', 'false'),
	(9, 'tv', 123, 1, 'my description', 'userAssets/itemImages/dummy.jpg', NULL, '2021-02-17 19:21:13', '2021-02-17 19:21:13', 'item', 'true'),
	(10, 'tea', 123, 1, 'my description', 'userAssets/itemImages/dummy.jpg', NULL, '2021-02-17 19:21:16', '2021-02-17 19:21:16', 'item', 'false'),
	(11, 'water', 123, 1, 'my description', 'userAssets/itemImages/dummy.jpg', NULL, '2021-02-17 19:21:19', '2021-02-17 19:21:19', 'item', 'false'),
	(12, 'mango', 123, 1, 'my description', 'userAssets/itemImages/dummy.jpg', NULL, '2021-02-17 19:21:23', '2021-02-17 19:21:23', 'item', 'false'),
	(13, 'engine', 123, 1, 'my description', 'userAssets/itemImages/dummy.jpg', NULL, '2021-02-17 19:21:27', '2021-02-17 19:21:27', 'item', 'false'),
	(14, 'bachi', 123, 1, 'my description', 'userAssets/itemImages/dummy.jpg', NULL, '2021-02-17 19:21:30', '2021-02-17 19:21:30', 'item', 'false'),
	(15, 'syed', 123, 1, 'my description', 'userAssets/itemImages/dummy.jpg', NULL, '2021-02-17 19:21:39', '2021-02-17 19:21:39', 'item', 'false'),
	(16, 'raja', 123, 1, 'my description', 'userAssets/itemImages/dummy.jpg', NULL, '2021-02-17 19:21:42', '2021-02-17 19:21:42', 'item', 'false'),
	(17, 'waddai paen', 123, 1, 'my description', 'userAssets/itemImages/dummy.jpg', NULL, '2021-02-17 19:21:45', '2021-02-17 19:21:45', 'item', 'false'),
	(18, 'moochi', 123, 1, 'my description', 'userAssets/itemImages/dummy.jpg', NULL, '2021-02-17 19:21:49', '2021-02-17 19:21:49', 'item', 'false'),
	(19, 'murshad', 123, 1, 'my description', 'userAssets/itemImages/dummy.jpg', NULL, '2021-02-17 19:21:54', '2021-02-17 19:21:54', 'item', 'false'),
	(20, 'user', 0, 9, 'ksdbfakjeebdf', 'userAssets/itemImages/user602d2e660b941.png', NULL, '2021-02-17 19:55:34', '2021-02-17 19:55:34', 'item', 'false'),
	(21, 'heelo', 0, 9, 'djsbskj', 'userAssets/itemImages/heelo602d2e99ec0f8.jpg', NULL, '2021-02-17 19:56:26', '2021-02-17 19:56:26', 'item', 'false');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;

-- Dumping structure for table ecommerce.itemtags
CREATE TABLE IF NOT EXISTS `itemtags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemId` int(11) NOT NULL,
  `tagId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;

-- Dumping data for table ecommerce.itemtags: ~52 rows (approximately)
DELETE FROM `itemtags`;
/*!40000 ALTER TABLE `itemtags` DISABLE KEYS */;
INSERT INTO `itemtags` (`id`, `itemId`, `tagId`) VALUES
	(7, 3, 1),
	(8, 3, 2),
	(9, 3, 3),
	(10, 5, 1),
	(11, 5, 2),
	(12, 5, 3),
	(13, 6, 1),
	(14, 6, 2),
	(15, 6, 3),
	(16, 7, 1),
	(17, 7, 2),
	(18, 7, 3),
	(19, 8, 1),
	(20, 8, 2),
	(21, 8, 3),
	(22, 9, 1),
	(23, 9, 2),
	(24, 9, 3),
	(25, 10, 1),
	(26, 10, 2),
	(27, 10, 3),
	(28, 11, 1),
	(29, 11, 2),
	(30, 11, 3),
	(31, 12, 1),
	(32, 12, 2),
	(33, 12, 3),
	(34, 13, 1),
	(35, 13, 2),
	(36, 13, 3),
	(37, 14, 1),
	(38, 14, 2),
	(39, 14, 3),
	(40, 15, 1),
	(41, 15, 2),
	(42, 15, 3),
	(43, 16, 1),
	(44, 16, 2),
	(45, 16, 3),
	(46, 17, 1),
	(47, 17, 2),
	(48, 17, 3),
	(49, 18, 1),
	(50, 18, 2),
	(51, 18, 3),
	(52, 19, 1),
	(53, 19, 2),
	(54, 19, 3),
	(55, 20, 2),
	(56, 20, 3),
	(57, 21, 2),
	(58, 21, 3);
/*!40000 ALTER TABLE `itemtags` ENABLE KEYS */;

-- Dumping structure for table ecommerce.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` char(50) NOT NULL,
  `businessId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `status` enum('delivered','shipped','placed','accepted','processing','in queue') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;

-- Dumping data for table ecommerce.orders: ~50 rows (approximately)
DELETE FROM `orders`;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`id`, `orderId`, `businessId`, `userId`, `status`) VALUES
	(18, '60365f2fe0035', 19, 38, 'placed'),
	(19, '60366ba8507f3', 9, 38, 'placed'),
	(20, '60366ba8d1556', 19, 38, 'placed'),
	(21, '60378d4ce6d1e', 9, 38, 'placed'),
	(22, '60378d4d8c879', 19, 38, 'placed'),
	(23, '60378d865f12e', 9, 38, 'placed'),
	(24, '60378d86980fc', 19, 38, 'placed'),
	(25, '60378f8bc0589', 9, 38, 'placed'),
	(26, '60378f8c0f18e', 19, 38, 'placed'),
	(27, '6037920d77530', 9, 38, 'placed'),
	(28, '6037920da7ac6', 19, 38, 'placed'),
	(29, '603792339d42b', 9, 38, 'placed'),
	(30, '603792344ace1', 19, 38, 'placed'),
	(32, '6037924da70ff', 19, 38, 'placed'),
	(33, '6037927504e7b', 9, 38, 'placed'),
	(34, '60379275236e2', 19, 38, 'placed'),
	(35, '603792e90d504', 9, 38, 'placed'),
	(36, '603792e94f0fe', 19, 38, 'placed'),
	(37, '603793827ca96', 9, 38, 'in queue'),
	(38, '60379382b95e2', 19, 38, 'placed'),
	(39, '603793b157247', 9, 38, 'placed'),
	(40, '603793b16f7bc', 19, 38, 'placed'),
	(41, '60379404d6731', 9, 38, 'placed'),
	(42, '603794051364b', 19, 38, 'placed'),
	(43, '6037945eb12d4', 9, 38, 'placed'),
	(44, '6037945ec7e8b', 19, 38, 'placed'),
	(45, '6037955004ec7', 9, 38, 'placed'),
	(46, '603795505a496', 19, 38, 'placed'),
	(47, '6037956fcb7a0', 9, 38, 'placed'),
	(48, '6037956fe1a4b', 19, 38, 'placed'),
	(49, '603795c0dae6d', 9, 38, 'placed'),
	(50, '603795c1086ef', 19, 38, 'placed'),
	(51, '603795d5a0b29', 9, 38, 'placed'),
	(52, '603795d5c6ec0', 19, 38, 'placed'),
	(53, '6037962555169', 9, 38, 'placed'),
	(54, '603796256edbe', 19, 38, 'placed'),
	(55, '6037965e44944', 9, 38, 'placed'),
	(56, '6037965e57b82', 19, 38, 'placed'),
	(57, '6037967b1fb50', 9, 38, 'placed'),
	(58, '6037967b31dea', 19, 38, 'placed'),
	(59, '603796b308eca', 9, 38, 'placed'),
	(60, '603796b32be62', 19, 38, 'placed'),
	(61, '603797ef2f7a0', 9, 38, 'placed'),
	(62, '603797ef49a59', 19, 38, 'placed'),
	(63, '6037981b36ade', 9, 38, 'placed'),
	(64, '6037981b58a74', 9, 38, 'in queue'),
	(65, '60379854e5a01', 9, 38, 'accepted'),
	(66, '603798550c52c', 19, 38, 'placed'),
	(67, '603798d39e902', 9, 38, 'placed'),
	(68, '603798d3af5dc', 19, 38, 'placed');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- Dumping structure for table ecommerce.tags
CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` tinytext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table ecommerce.tags: ~3 rows (approximately)
DELETE FROM `tags`;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` (`id`, `name`) VALUES
	(1, 'Science Fiction'),
	(2, 'Food'),
	(3, 'Entertainment');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;

-- Dumping structure for table ecommerce.transactions
CREATE TABLE IF NOT EXISTS `transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `businessId` int(11) NOT NULL,
  `qrCodeImage` char(50) NOT NULL,
  `name` char(50) NOT NULL,
  `quantity` tinyint(4) NOT NULL,
  `itemPrice` int(11) NOT NULL,
  `description` varchar(50) NOT NULL,
  `orderId` varchar(50) NOT NULL,
  `status` enum('delivered','shipped','placed','accepted','processing','in queue') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=latin1;

-- Dumping data for table ecommerce.transactions: ~194 rows (approximately)
DELETE FROM `transactions`;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` (`id`, `userId`, `businessId`, `qrCodeImage`, `name`, `quantity`, `itemPrice`, `description`, `orderId`, `status`) VALUES
	(24, 38, 19, 'userAssets/QRCodes/60365f2fe0035.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '60365f2fe0035', 'placed'),
	(25, 38, 9, 'userAssets/QRCodes/60366ba8507f3.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '60366ba8507f3', 'accepted'),
	(26, 38, 9, 'userAssets/QRCodes/60366ba8507f3.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '60366ba8507f3', 'accepted'),
	(27, 38, 9, 'userAssets/QRCodes/60366ba8507f3.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '60366ba8507f3', 'accepted'),
	(28, 38, 9, 'userAssets/QRCodes/60366ba8507f3.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '60366ba8507f3', 'accepted'),
	(29, 38, 9, 'userAssets/QRCodes/60366ba8507f3.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '60366ba8507f3', 'accepted'),
	(30, 38, 9, 'userAssets/QRCodes/60366ba8507f3.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '60366ba8507f3', 'accepted'),
	(31, 38, 9, 'userAssets/QRCodes/60366ba8507f3.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '60366ba8507f3', 'accepted'),
	(32, 38, 19, 'userAssets/QRCodes/60366ba8d1556.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '60366ba8d1556', 'placed'),
	(33, 38, 9, 'userAssets/QRCodes/60378d4ce6d1e.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '60378d4ce6d1e', 'placed'),
	(34, 38, 9, 'userAssets/QRCodes/60378d4ce6d1e.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '60378d4ce6d1e', 'placed'),
	(35, 38, 9, 'userAssets/QRCodes/60378d4ce6d1e.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '60378d4ce6d1e', 'placed'),
	(36, 38, 9, 'userAssets/QRCodes/60378d4ce6d1e.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '60378d4ce6d1e', 'placed'),
	(37, 38, 9, 'userAssets/QRCodes/60378d4ce6d1e.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '60378d4ce6d1e', 'placed'),
	(38, 38, 9, 'userAssets/QRCodes/60378d4ce6d1e.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '60378d4ce6d1e', 'placed'),
	(39, 38, 9, 'userAssets/QRCodes/60378d4ce6d1e.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '60378d4ce6d1e', 'placed'),
	(40, 38, 19, 'userAssets/QRCodes/60378d4d8c879.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '60378d4d8c879', 'placed'),
	(41, 38, 9, 'userAssets/QRCodes/60378d865f12e.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '60378d865f12e', 'placed'),
	(42, 38, 9, 'userAssets/QRCodes/60378d865f12e.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '60378d865f12e', 'placed'),
	(43, 38, 9, 'userAssets/QRCodes/60378d865f12e.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '60378d865f12e', 'placed'),
	(44, 38, 9, 'userAssets/QRCodes/60378d865f12e.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '60378d865f12e', 'placed'),
	(45, 38, 9, 'userAssets/QRCodes/60378d865f12e.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '60378d865f12e', 'placed'),
	(46, 38, 9, 'userAssets/QRCodes/60378d865f12e.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '60378d865f12e', 'placed'),
	(47, 38, 9, 'userAssets/QRCodes/60378d865f12e.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '60378d865f12e', 'placed'),
	(48, 38, 19, 'userAssets/QRCodes/60378d86980fc.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '60378d86980fc', 'placed'),
	(49, 38, 9, 'userAssets/QRCodes/60378f8bc0589.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '60378f8bc0589', 'placed'),
	(50, 38, 9, 'userAssets/QRCodes/60378f8bc0589.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '60378f8bc0589', 'placed'),
	(51, 38, 9, 'userAssets/QRCodes/60378f8bc0589.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '60378f8bc0589', 'placed'),
	(52, 38, 9, 'userAssets/QRCodes/60378f8bc0589.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '60378f8bc0589', 'placed'),
	(53, 38, 9, 'userAssets/QRCodes/60378f8bc0589.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '60378f8bc0589', 'placed'),
	(54, 38, 9, 'userAssets/QRCodes/60378f8bc0589.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '60378f8bc0589', 'placed'),
	(55, 38, 9, 'userAssets/QRCodes/60378f8bc0589.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '60378f8bc0589', 'placed'),
	(56, 38, 19, 'userAssets/QRCodes/60378f8c0f18e.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '60378f8c0f18e', 'placed'),
	(57, 38, 9, 'userAssets/QRCodes/6037920d77530.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037920d77530', 'placed'),
	(58, 38, 9, 'userAssets/QRCodes/6037920d77530.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037920d77530', 'placed'),
	(59, 38, 9, 'userAssets/QRCodes/6037920d77530.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037920d77530', 'placed'),
	(60, 38, 9, 'userAssets/QRCodes/6037920d77530.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037920d77530', 'placed'),
	(61, 38, 9, 'userAssets/QRCodes/6037920d77530.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037920d77530', 'placed'),
	(62, 38, 9, 'userAssets/QRCodes/6037920d77530.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037920d77530', 'placed'),
	(63, 38, 9, 'userAssets/QRCodes/6037920d77530.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037920d77530', 'placed'),
	(64, 38, 19, 'userAssets/QRCodes/6037920da7ac6.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037920da7ac6', 'placed'),
	(65, 38, 9, 'userAssets/QRCodes/603792339d42b.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603792339d42b', 'placed'),
	(66, 38, 9, 'userAssets/QRCodes/603792339d42b.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603792339d42b', 'placed'),
	(67, 38, 9, 'userAssets/QRCodes/603792339d42b.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603792339d42b', 'placed'),
	(68, 38, 9, 'userAssets/QRCodes/603792339d42b.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603792339d42b', 'placed'),
	(69, 38, 9, 'userAssets/QRCodes/603792339d42b.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603792339d42b', 'placed'),
	(70, 38, 9, 'userAssets/QRCodes/603792339d42b.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603792339d42b', 'placed'),
	(71, 38, 9, 'userAssets/QRCodes/603792339d42b.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603792339d42b', 'placed'),
	(72, 38, 19, 'userAssets/QRCodes/603792344ace1.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603792344ace1', 'placed'),
	(80, 38, 19, 'userAssets/QRCodes/6037924da70ff.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037924da70ff', 'placed'),
	(81, 38, 9, 'userAssets/QRCodes/6037927504e7b.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037927504e7b', 'placed'),
	(82, 38, 9, 'userAssets/QRCodes/6037927504e7b.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037927504e7b', 'placed'),
	(83, 38, 9, 'userAssets/QRCodes/6037927504e7b.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037927504e7b', 'placed'),
	(84, 38, 9, 'userAssets/QRCodes/6037927504e7b.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037927504e7b', 'placed'),
	(85, 38, 9, 'userAssets/QRCodes/6037927504e7b.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037927504e7b', 'placed'),
	(86, 38, 9, 'userAssets/QRCodes/6037927504e7b.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037927504e7b', 'placed'),
	(87, 38, 9, 'userAssets/QRCodes/6037927504e7b.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037927504e7b', 'placed'),
	(88, 38, 19, 'userAssets/QRCodes/60379275236e2.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '60379275236e2', 'placed'),
	(89, 38, 9, 'userAssets/QRCodes/603792e90d504.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603792e90d504', 'placed'),
	(90, 38, 9, 'userAssets/QRCodes/603792e90d504.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603792e90d504', 'placed'),
	(91, 38, 9, 'userAssets/QRCodes/603792e90d504.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603792e90d504', 'placed'),
	(92, 38, 9, 'userAssets/QRCodes/603792e90d504.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603792e90d504', 'placed'),
	(93, 38, 9, 'userAssets/QRCodes/603792e90d504.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603792e90d504', 'placed'),
	(94, 38, 9, 'userAssets/QRCodes/603792e90d504.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603792e90d504', 'placed'),
	(95, 38, 9, 'userAssets/QRCodes/603792e90d504.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603792e90d504', 'placed'),
	(96, 38, 19, 'userAssets/QRCodes/603792e94f0fe.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603792e94f0fe', 'placed'),
	(97, 38, 9, 'userAssets/QRCodes/603793827ca96.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603793827ca96', 'in queue'),
	(98, 38, 9, 'userAssets/QRCodes/603793827ca96.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603793827ca96', 'in queue'),
	(99, 38, 9, 'userAssets/QRCodes/603793827ca96.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603793827ca96', 'in queue'),
	(100, 38, 9, 'userAssets/QRCodes/603793827ca96.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603793827ca96', 'in queue'),
	(101, 38, 9, 'userAssets/QRCodes/603793827ca96.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603793827ca96', 'in queue'),
	(102, 38, 9, 'userAssets/QRCodes/603793827ca96.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603793827ca96', 'in queue'),
	(103, 38, 9, 'userAssets/QRCodes/603793827ca96.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603793827ca96', 'in queue'),
	(104, 38, 19, 'userAssets/QRCodes/60379382b95e2.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '60379382b95e2', 'placed'),
	(105, 38, 9, 'userAssets/QRCodes/603793b157247.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603793b157247', 'placed'),
	(106, 38, 9, 'userAssets/QRCodes/603793b157247.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603793b157247', 'placed'),
	(107, 38, 9, 'userAssets/QRCodes/603793b157247.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603793b157247', 'placed'),
	(108, 38, 9, 'userAssets/QRCodes/603793b157247.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603793b157247', 'placed'),
	(109, 38, 9, 'userAssets/QRCodes/603793b157247.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603793b157247', 'placed'),
	(110, 38, 9, 'userAssets/QRCodes/603793b157247.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603793b157247', 'placed'),
	(111, 38, 9, 'userAssets/QRCodes/603793b157247.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603793b157247', 'placed'),
	(112, 38, 19, 'userAssets/QRCodes/603793b16f7bc.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603793b16f7bc', 'placed'),
	(113, 38, 9, 'userAssets/QRCodes/60379404d6731.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '60379404d6731', 'placed'),
	(114, 38, 9, 'userAssets/QRCodes/60379404d6731.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '60379404d6731', 'placed'),
	(115, 38, 9, 'userAssets/QRCodes/60379404d6731.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '60379404d6731', 'placed'),
	(116, 38, 9, 'userAssets/QRCodes/60379404d6731.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '60379404d6731', 'placed'),
	(117, 38, 9, 'userAssets/QRCodes/60379404d6731.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '60379404d6731', 'placed'),
	(118, 38, 9, 'userAssets/QRCodes/60379404d6731.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '60379404d6731', 'placed'),
	(119, 38, 9, 'userAssets/QRCodes/60379404d6731.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '60379404d6731', 'placed'),
	(120, 38, 19, 'userAssets/QRCodes/603794051364b.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603794051364b', 'placed'),
	(121, 38, 9, 'userAssets/QRCodes/6037945eb12d4.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037945eb12d4', 'placed'),
	(122, 38, 9, 'userAssets/QRCodes/6037945eb12d4.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037945eb12d4', 'placed'),
	(123, 38, 9, 'userAssets/QRCodes/6037945eb12d4.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037945eb12d4', 'placed'),
	(124, 38, 9, 'userAssets/QRCodes/6037945eb12d4.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037945eb12d4', 'placed'),
	(125, 38, 9, 'userAssets/QRCodes/6037945eb12d4.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037945eb12d4', 'placed'),
	(126, 38, 9, 'userAssets/QRCodes/6037945eb12d4.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037945eb12d4', 'placed'),
	(127, 38, 9, 'userAssets/QRCodes/6037945eb12d4.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037945eb12d4', 'placed'),
	(128, 38, 19, 'userAssets/QRCodes/6037945ec7e8b.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037945ec7e8b', 'placed'),
	(129, 38, 9, 'userAssets/QRCodes/6037955004ec7.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037955004ec7', 'placed'),
	(130, 38, 9, 'userAssets/QRCodes/6037955004ec7.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037955004ec7', 'placed'),
	(131, 38, 9, 'userAssets/QRCodes/6037955004ec7.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037955004ec7', 'placed'),
	(132, 38, 9, 'userAssets/QRCodes/6037955004ec7.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037955004ec7', 'placed'),
	(133, 38, 9, 'userAssets/QRCodes/6037955004ec7.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037955004ec7', 'placed'),
	(134, 38, 9, 'userAssets/QRCodes/6037955004ec7.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037955004ec7', 'placed'),
	(135, 38, 9, 'userAssets/QRCodes/6037955004ec7.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037955004ec7', 'placed'),
	(136, 38, 19, 'userAssets/QRCodes/603795505a496.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603795505a496', 'placed'),
	(137, 38, 9, 'userAssets/QRCodes/6037956fcb7a0.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037956fcb7a0', 'placed'),
	(138, 38, 9, 'userAssets/QRCodes/6037956fcb7a0.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037956fcb7a0', 'placed'),
	(139, 38, 9, 'userAssets/QRCodes/6037956fcb7a0.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037956fcb7a0', 'placed'),
	(140, 38, 9, 'userAssets/QRCodes/6037956fcb7a0.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037956fcb7a0', 'placed'),
	(141, 38, 9, 'userAssets/QRCodes/6037956fcb7a0.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037956fcb7a0', 'placed'),
	(142, 38, 9, 'userAssets/QRCodes/6037956fcb7a0.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037956fcb7a0', 'placed'),
	(143, 38, 9, 'userAssets/QRCodes/6037956fcb7a0.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037956fcb7a0', 'placed'),
	(144, 38, 19, 'userAssets/QRCodes/6037956fe1a4b.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037956fe1a4b', 'placed'),
	(145, 38, 9, 'userAssets/QRCodes/603795c0dae6d.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603795c0dae6d', 'placed'),
	(146, 38, 9, 'userAssets/QRCodes/603795c0dae6d.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603795c0dae6d', 'placed'),
	(147, 38, 9, 'userAssets/QRCodes/603795c0dae6d.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603795c0dae6d', 'placed'),
	(148, 38, 9, 'userAssets/QRCodes/603795c0dae6d.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603795c0dae6d', 'placed'),
	(149, 38, 9, 'userAssets/QRCodes/603795c0dae6d.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603795c0dae6d', 'placed'),
	(150, 38, 9, 'userAssets/QRCodes/603795c0dae6d.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603795c0dae6d', 'placed'),
	(151, 38, 9, 'userAssets/QRCodes/603795c0dae6d.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603795c0dae6d', 'placed'),
	(152, 38, 19, 'userAssets/QRCodes/603795c1086ef.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603795c1086ef', 'placed'),
	(153, 38, 9, 'userAssets/QRCodes/603795d5a0b29.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603795d5a0b29', 'placed'),
	(154, 38, 9, 'userAssets/QRCodes/603795d5a0b29.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603795d5a0b29', 'placed'),
	(155, 38, 9, 'userAssets/QRCodes/603795d5a0b29.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603795d5a0b29', 'placed'),
	(156, 38, 9, 'userAssets/QRCodes/603795d5a0b29.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603795d5a0b29', 'placed'),
	(157, 38, 9, 'userAssets/QRCodes/603795d5a0b29.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603795d5a0b29', 'placed'),
	(158, 38, 9, 'userAssets/QRCodes/603795d5a0b29.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603795d5a0b29', 'placed'),
	(159, 38, 9, 'userAssets/QRCodes/603795d5a0b29.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603795d5a0b29', 'placed'),
	(160, 38, 19, 'userAssets/QRCodes/603795d5c6ec0.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603795d5c6ec0', 'placed'),
	(161, 38, 9, 'userAssets/QRCodes/6037962555169.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037962555169', 'placed'),
	(162, 38, 9, 'userAssets/QRCodes/6037962555169.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037962555169', 'placed'),
	(163, 38, 9, 'userAssets/QRCodes/6037962555169.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037962555169', 'placed'),
	(164, 38, 9, 'userAssets/QRCodes/6037962555169.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037962555169', 'placed'),
	(165, 38, 9, 'userAssets/QRCodes/6037962555169.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037962555169', 'placed'),
	(166, 38, 9, 'userAssets/QRCodes/6037962555169.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037962555169', 'placed'),
	(167, 38, 9, 'userAssets/QRCodes/6037962555169.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037962555169', 'placed'),
	(168, 38, 19, 'userAssets/QRCodes/603796256edbe.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603796256edbe', 'placed'),
	(169, 38, 9, 'userAssets/QRCodes/6037965e44944.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037965e44944', 'placed'),
	(170, 38, 9, 'userAssets/QRCodes/6037965e44944.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037965e44944', 'placed'),
	(171, 38, 9, 'userAssets/QRCodes/6037965e44944.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037965e44944', 'placed'),
	(172, 38, 9, 'userAssets/QRCodes/6037965e44944.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037965e44944', 'placed'),
	(173, 38, 9, 'userAssets/QRCodes/6037965e44944.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037965e44944', 'placed'),
	(174, 38, 9, 'userAssets/QRCodes/6037965e44944.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037965e44944', 'placed'),
	(175, 38, 9, 'userAssets/QRCodes/6037965e44944.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037965e44944', 'placed'),
	(176, 38, 19, 'userAssets/QRCodes/6037965e57b82.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037965e57b82', 'placed'),
	(177, 38, 9, 'userAssets/QRCodes/6037967b1fb50.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037967b1fb50', 'placed'),
	(178, 38, 9, 'userAssets/QRCodes/6037967b1fb50.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037967b1fb50', 'placed'),
	(179, 38, 9, 'userAssets/QRCodes/6037967b1fb50.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037967b1fb50', 'placed'),
	(180, 38, 9, 'userAssets/QRCodes/6037967b1fb50.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037967b1fb50', 'placed'),
	(181, 38, 9, 'userAssets/QRCodes/6037967b1fb50.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037967b1fb50', 'placed'),
	(182, 38, 9, 'userAssets/QRCodes/6037967b1fb50.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037967b1fb50', 'placed'),
	(183, 38, 9, 'userAssets/QRCodes/6037967b1fb50.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037967b1fb50', 'placed'),
	(184, 38, 19, 'userAssets/QRCodes/6037967b31dea.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037967b31dea', 'placed'),
	(185, 38, 9, 'userAssets/QRCodes/603796b308eca.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603796b308eca', 'placed'),
	(186, 38, 9, 'userAssets/QRCodes/603796b308eca.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603796b308eca', 'placed'),
	(187, 38, 9, 'userAssets/QRCodes/603796b308eca.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603796b308eca', 'placed'),
	(188, 38, 9, 'userAssets/QRCodes/603796b308eca.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603796b308eca', 'placed'),
	(189, 38, 9, 'userAssets/QRCodes/603796b308eca.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603796b308eca', 'placed'),
	(190, 38, 9, 'userAssets/QRCodes/603796b308eca.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603796b308eca', 'placed'),
	(191, 38, 9, 'userAssets/QRCodes/603796b308eca.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603796b308eca', 'placed'),
	(192, 38, 19, 'userAssets/QRCodes/603796b32be62.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603796b32be62', 'placed'),
	(193, 38, 9, 'userAssets/QRCodes/603797ef2f7a0.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603797ef2f7a0', 'placed'),
	(194, 38, 9, 'userAssets/QRCodes/603797ef2f7a0.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603797ef2f7a0', 'placed'),
	(195, 38, 9, 'userAssets/QRCodes/603797ef2f7a0.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603797ef2f7a0', 'placed'),
	(196, 38, 9, 'userAssets/QRCodes/603797ef2f7a0.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603797ef2f7a0', 'placed'),
	(197, 38, 9, 'userAssets/QRCodes/603797ef2f7a0.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603797ef2f7a0', 'placed'),
	(198, 38, 9, 'userAssets/QRCodes/603797ef2f7a0.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603797ef2f7a0', 'placed'),
	(199, 38, 9, 'userAssets/QRCodes/603797ef2f7a0.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603797ef2f7a0', 'placed'),
	(200, 38, 19, 'userAssets/QRCodes/603797ef49a59.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603797ef49a59', 'placed'),
	(201, 38, 9, 'userAssets/QRCodes/6037981b36ade.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037981b36ade', 'placed'),
	(202, 38, 9, 'userAssets/QRCodes/6037981b36ade.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037981b36ade', 'placed'),
	(203, 38, 9, 'userAssets/QRCodes/6037981b36ade.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037981b36ade', 'placed'),
	(204, 38, 9, 'userAssets/QRCodes/6037981b36ade.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037981b36ade', 'placed'),
	(205, 38, 9, 'userAssets/QRCodes/6037981b36ade.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037981b36ade', 'placed'),
	(206, 38, 9, 'userAssets/QRCodes/6037981b36ade.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037981b36ade', 'placed'),
	(207, 38, 9, 'userAssets/QRCodes/6037981b36ade.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037981b36ade', 'placed'),
	(208, 38, 9, 'userAssets/QRCodes/6037981b58a74.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '6037981b58a74', 'in queue'),
	(209, 38, 9, 'userAssets/QRCodes/60379854e5a01.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '60379854e5a01', 'accepted'),
	(210, 38, 9, 'userAssets/QRCodes/60379854e5a01.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '60379854e5a01', 'accepted'),
	(211, 38, 9, 'userAssets/QRCodes/60379854e5a01.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '60379854e5a01', 'accepted'),
	(212, 38, 9, 'userAssets/QRCodes/60379854e5a01.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '60379854e5a01', 'accepted'),
	(213, 38, 9, 'userAssets/QRCodes/60379854e5a01.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '60379854e5a01', 'accepted'),
	(214, 38, 9, 'userAssets/QRCodes/60379854e5a01.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '60379854e5a01', 'accepted'),
	(215, 38, 9, 'userAssets/QRCodes/60379854e5a01.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '60379854e5a01', 'accepted'),
	(216, 38, 19, 'userAssets/QRCodes/603798550c52c.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603798550c52c', 'placed'),
	(217, 38, 9, 'userAssets/QRCodes/603798d39e902.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603798d39e902', 'placed'),
	(218, 38, 9, 'userAssets/QRCodes/603798d39e902.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603798d39e902', 'placed'),
	(219, 38, 9, 'userAssets/QRCodes/603798d39e902.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603798d39e902', 'placed'),
	(220, 38, 9, 'userAssets/QRCodes/603798d39e902.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603798d39e902', 'placed'),
	(221, 38, 9, 'userAssets/QRCodes/603798d39e902.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603798d39e902', 'placed'),
	(222, 38, 9, 'userAssets/QRCodes/603798d39e902.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603798d39e902', 'placed'),
	(223, 38, 9, 'userAssets/QRCodes/603798d39e902.png', 'bawa ji lor', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603798d39e902', 'placed'),
	(224, 38, 19, 'userAssets/QRCodes/603798d3af5dc.png', 'asdaw', 3, 3669, 'vieroqkjrbdd,nvbkwjrbfoubd,brwofb,jdbvkkwjrb fjwbf', '603798d3af5dc', 'placed');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;

-- Dumping structure for table ecommerce.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `userName` varchar(50) NOT NULL,
  `profileImage` text,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(50) NOT NULL,
  `verificationStatus` enum('true','false') NOT NULL DEFAULT 'false',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

-- Dumping data for table ecommerce.users: ~3 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `password`, `userName`, `profileImage`, `createdAt`, `updatedAt`, `email`, `verificationStatus`) VALUES
	(38, 'Bilal Malik', '123456', 'BADMalik', 'userAssets/profileImages/dummy.png', '2021-02-16 17:43:51', '2021-02-16 17:43:51', 'bilal@yourvteams.com', 'true'),
	(39, 'Zohaib Rehman', 'ahsdbahsbd', 'asda', 'userAssets/profileImages/dummy.png', '2021-02-16 17:47:05', '2021-02-16 17:47:05', 'asdmkas@asdhas', 'false'),
	(40, 'syedahmed ali', '123456', 'syedahmed', 'userAssets/profileImages/syedahmedali602bcf8c6535a.jpg', '2021-02-16 18:58:36', '2021-02-16 18:58:36', 'syedahmedali08@gmail.com', 'true'),
	(41, 'Bilal Malik', 'asdawdasdw', 'asdawdsadw', 'userAssets/profileImages/BilalMalik6040c5034378f.jpg', '2021-03-04 16:31:15', '2021-03-04 16:31:15', 'malikz4aman133@gmail.com', 'false');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table ecommerce.verificationcodes
CREATE TABLE IF NOT EXISTS `verificationcodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `verificationCode` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Dumping data for table ecommerce.verificationcodes: ~8 rows (approximately)
DELETE FROM `verificationcodes`;
/*!40000 ALTER TABLE `verificationcodes` DISABLE KEYS */;
INSERT INTO `verificationcodes` (`id`, `userId`, `verificationCode`) VALUES
	(3, 31, '602bba1d1ac5f602bba1d1ac6a'),
	(5, 33, '602bbaaa7e3d5602bbaaa7e3e0'),
	(6, 34, '602bbac3dd29a602bbac3dd2a1'),
	(7, 35, '602bbae55b8cf602bbae55b8d9'),
	(8, 36, '602bbb0122264602bbb012226f'),
	(9, 37, '602bbbc7b39de602bbbc7b39e6'),
	(10, 38, '602bbe07e85cf602bbe07e85d8'),
	(11, 39, '602bbec990393602bbec9903a0'),
	(12, 41, '6040c5037d84f6040c5037d858');
/*!40000 ALTER TABLE `verificationcodes` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
