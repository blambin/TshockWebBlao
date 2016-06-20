/*
SQLyog Ultimate v8.32 
MySQL - 5.6.21 : Database - tshockwebblao
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tshockwebblao` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `tshockwebblao`;

/*Table structure for table `server` */

DROP TABLE IF EXISTS `server`;

CREATE TABLE `server` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `servername` varchar(50) DEFAULT NULL,
  `serverurl` varchar(50) DEFAULT NULL,
  `serverport` int(10) DEFAULT NULL,
  `serverrestapiport` int(10) DEFAULT NULL,
  `serverpassword` varchar(50) DEFAULT NULL,
  `serveradminusername` varchar(50) DEFAULT NULL,
  `serveradminpassword` varchar(50) DEFAULT NULL,
  `serverowner` int(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `serverowner` (`serverowner`),
  CONSTRAINT `server_ibfk_1` FOREIGN KEY (`serverowner`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `displayname` varchar(50) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `PASSWORD` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
