CREATE DATABASE  IF NOT EXISTS `vws` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `vws`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: vws
-- ------------------------------------------------------
-- Server version	5.5.62

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `volunteerrequests`
--


# The student will request to volunteer by filling out a form and then send this request to the admin to approve it


DROP TABLE IF EXISTS `volunteerrequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volunteerrequests` (
  `id` int(11) NOT NULL AUTO_INCREMENT, # an auto request id generated
  `studentId` int(11) DEFAULT NULL, # the student id
  `studentName` varchar(30) DEFAULT NULL, # the student name
  `institutionId` int(11) DEFAULT NULL, # the institution id (get from the form, the student chooses the institution to volunteer in it)
  `institutionName` varchar(50) DEFAULT NULL, # the institution name 
  `district` varchar(30) DEFAULT NULL, # the district (get from the form, the student chooses the district where they want to volunteer) 
  `address` varchar(50) DEFAULT NULL, # the address where the volunteer will teak pleac (the institution address)
  PRIMARY KEY (`id`),
  KEY `studentId` (`studentId`),
  CONSTRAINT `volunteerrequests_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `students` (`id`) # FOREIGN KEY needs the students id from the students table + we can add a new FOREIGN KEY for the institutionId if needed
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-15 22:39:03
