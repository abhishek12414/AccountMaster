-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.19


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema account_master
--

CREATE DATABASE IF NOT EXISTS account_master;
USE account_master;

--
-- Definition of table `category_purchase`
--

DROP TABLE IF EXISTS `category_purchase`;
CREATE TABLE `category_purchase` (
  `slNo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(50) NOT NULL,
  PRIMARY KEY (`slNo`),
  UNIQUE KEY `unique` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Definition of table `category_sales`
--

DROP TABLE IF EXISTS `category_sales`;
CREATE TABLE `category_sales` (
  `slNo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(50) NOT NULL,
  PRIMARY KEY (`slNo`),
  UNIQUE KEY `Index_2` (`category`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Definition of table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
CREATE TABLE `purchase` (
  `sl_no` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `purchase_date` date NOT NULL,
  `category` varchar(50) NOT NULL,
  `amount` double NOT NULL,
  `purchase_desc` varchar(500) NOT NULL,
  PRIMARY KEY (`sl_no`) USING BTREE,
  UNIQUE KEY `Index_3` (`purchase_date`,`category`),
  KEY `FK_purchase_1` (`category`),
  CONSTRAINT `FK_purchase_1` FOREIGN KEY (`category`) REFERENCES `category_purchase` (`category`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Definition of table `s_user`
--

DROP TABLE IF EXISTS `s_user`;
CREATE TABLE `s_user` (
  `sl_no` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `id` varchar(45) NOT NULL,
  `u_password` varchar(45) NOT NULL,
  `u_group` varchar(45) NOT NULL,
  PRIMARY KEY (`sl_no`) USING BTREE,
  UNIQUE KEY `Index_2` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `s_user`
--

/*!40000 ALTER TABLE `s_user` DISABLE KEYS */;
INSERT INTO `s_user` (`sl_no`,`name`,`id`,`u_password`,`u_group`) VALUES 
 (1,'ARYA','arya','PvSHKVbbG75mp3h5qYEaLQ==','Admin'),
 (2,'SHADRACK','shad','NBfj65Q08yFBNRcel2bexA==','Admin');
/*!40000 ALTER TABLE `s_user` ENABLE KEYS */;


--
-- Definition of table `sales`
--

DROP TABLE IF EXISTS `sales`;
CREATE TABLE `sales` (
  `sl_no` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sales_date` date NOT NULL,
  `category` varchar(50) NOT NULL,
  `amount` double NOT NULL,
  `sales_desc` varchar(500) NOT NULL,
  PRIMARY KEY (`sl_no`) USING BTREE,
  UNIQUE KEY `Index_3` (`sales_date`,`category`),
  KEY `FK_sales_1` (`category`),
  CONSTRAINT `FK_sales_1` FOREIGN KEY (`category`) REFERENCES `category_sales` (`category`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
