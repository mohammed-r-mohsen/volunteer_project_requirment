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
-- Table structure for table `dovmailbox`
--


# The admin can see all the new volunteer requests and the finished report in his mail and approve or deny the request


DROP TABLE IF EXISTS `dovmailbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dovmailbox` (
  `id` int(11) NOT NULL AUTO_INCREMENT, # an auto mail id generated
  `senderId` int(11) DEFAULT NULL, # the sender id (the student)
  `senderName` varchar(30) DEFAULT NULL, # the sender name
  `title` varchar(50) DEFAULT NULL, # the title of the mail like a new student volunteer request 
  `body` text, # a body of the mail is the student volunteer request (student information and the institution information)
  `date` datetime DEFAULT NULL,  # the creation date of the mail (request)
  `approveOrDeny` tinyint(1) DEFAULT '1', # the admin will approve or deny the request, 1 means approve
  `typeOfMail` varchar(25) NOT NULL, # volunteer or finish volunteer request
  `sendfor` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
-- DELIMITER ;;
-- /*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `vws`.`dovmailbox_AFTER_UPDATE` AFTER UPDATE ON `dovmailbox` FOR EACH ROW

-- BEGIN
-- DECLARE newId int;
-- DECLARE newName VARCHAR(30);
-- DECLARE newAddress VARCHAR(30);
-- DECLARE newEmail VARCHAR(30);
-- DECLARE newPhone int;
-- DECLARE newInstitutionId int;
-- DECLARE newNumberOfVolunteers int;
-- DECLARE newDescription text;
-- DECLARE newDistrict VARCHAR(30);
-- DECLARE institutionName VARCHAR(50);

-- if(new.approveOrDeny = true) then
-- 	case old.typeOfMail
--     when "vlounteer" then
--     select volunteer.studentId, volunteer.studentName, volunteer.address, volunteer.institutionId, student.email, student.phone 
--     into newId, newName, newAddress, newInstitutionId, newEmail, newPhone
--     from vws.volunteerrequests as volunteer, vws.students as student
--     where student.id=volunteer.studentId and volunteer.studentId=old.sendfor and student.id = old.sendfor;
--     INSERT INTO vws.volunteers (studentId, name, address, email, phone, institutionId) VALUES (newId, newName, newAddress, newEmail, newPhone, newInstitutionId);
--     INSERT INTO vws.viewnewvolunteers (studentId, name, address, email, phone, institutionId) VALUES (newId, newName, newAddress, newEmail, newPhone, newInstitutionId);
--     DELETE from vws.volunteerrequests where studentId=old.sendfor;
--     UPDATE vws.statisticsdov set volunteersNumbers = volunteersNumbers+1 , activeVolunteers=activeVolunteers+1 where id = 1;
--     UPDATE vws.statisticsinstitution set numberOfAllStudents = numberOfAllStudents+1 , activeVolunteers=activeVolunteers+1 where institutionId = newInstitutionId;
--     
--     when "create initiative" then
--     select name, location, numberOfVolunteers, studentId, description, phone
--     into newName, newAddress, newNumberOfVolunteers, newId, newDescription, newPhone
--     from vws.initiativesreqests where studentId=old.sendfor;
--     INSERT INTO vws.initiatives (name, location, numberOfVolunteers, creatorId, description, phone) VALUES (newName, newAddress, newNumberOfVolunteers, newId, newDescription, newPhone);
--     DELETE from vws.initiativesreqests where studentId=old.sendfor;
--     UPDATE vws.statisticsdov set initiatives = initiatives+1 , activeInitiatives=activeInitiatives+1 where id = 1;
--     
--     when "suggest institution" then
--     select id, name, address, email, phone, district
--     into newId, newName, newAddress, newEmail, newPhone, newDistrict
--     from vws.proposedinstitutions where studentId=old.sendfor;
--     INSERT INTO vws.institutions (name, address, email, phone, district, password) VALUES (newName, newAddress, newEmail, newPhone, newDistrict, newId);
--     DELETE from vws.proposedinstitutions where studentId=old.sendfor;
-- 	UPDATE vws.statisticsdov set institutionNumbers = institutionNumbers+1 where id = 1;
--     
--     when "finish vlounteer" then
--     select report.studentId, report.studentName, student.phone
--     into newId, newName, newPhone
--     from vws.institutionreport as report, vws.students as student
--     where student.id=report.studentId and report.studentId = old.sendfor and student.id = old.sendfor;
--     INSERT INTO vws.studentsfinishedvolunteer (studentId, name, phone) VALUES (newId, newName, newPhone);
--     DELETE from vws.institutionreport where studentId = old.sendfor;
--     UPDATE vws.statisticsdov set finishedVolunteersNumbers = finishedVolunteersNumbers+1 where id = 1;
--     UPDATE vws.statisticsdov set activeVolunteers = activeVolunteers-1 where id = 1;
--     select institutionId into newInstitutionId from institutionreport where studentId = old.sendfor;
--     UPDATE vws.statisticsinstitution set studentsFinishedNumbers = studentsFinishedNumbers+1 , activeVolunteers=activeVolunteers-1 where institutionId = newInstitutionId;
--     
--     END CASE;
-- ELSE
-- case old.typeOfMail
--     when "vlounteer" then
--     DELETE from vws.volunteerrequests where studentId=old.sendfor;
--     
--     when "create initiative" then
--     DELETE from vws.initiativesreqests where studentId=old.sendfor;
--     
--     when "suggest institution" then
--     DELETE from vws.proposedinstitutions where studentId=old.sendfor;
--     
--     when "finish vlounteer" then
-- 	DELETE from vws.institutionreport where studentId = old.sendfor;
--     END CASE;
-- end if;
-- END */;;
-- DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-15 22:39:08
