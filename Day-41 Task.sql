CREATE DATABASE  IF NOT EXISTS `class_app` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `class_app`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: class_app
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `batch`
--

DROP TABLE IF EXISTS `batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `batch` (
  `batch_id` int NOT NULL,
  `stud_profile_id` int NOT NULL,
  `stud_name` varchar(100) NOT NULL,
  `stud_batch_num` varchar(7) NOT NULL,
  `assigned_mentor` varchar(100) NOT NULL,
  PRIMARY KEY (`batch_id`),
  KEY `stud_profile_id` (`stud_profile_id`),
  CONSTRAINT `batch_ibfk_1` FOREIGN KEY (`stud_profile_id`) REFERENCES `students` (`stud_profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch`
--

LOCK TABLES `batch` WRITE;
/*!40000 ALTER TABLE `batch` DISABLE KEYS */;
INSERT INTO `batch` VALUES (1,111,'Tanu','b201','anish'),(2,112,'Manu','b205','david'),(3,113,'Banu','b201','anish'),(4,114,'Tom','b202','krish'),(5,115,'Jerry','b202','ramya');
/*!40000 ALTER TABLE `batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mentor`
--

DROP TABLE IF EXISTS `mentor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mentor` (
  `mentor_id` int NOT NULL,
  `mentor_profile_id` int NOT NULL,
  `mentor_name` varchar(100) NOT NULL,
  `mentor_email` varchar(250) NOT NULL,
  `mentor_mobile_num` varchar(15) NOT NULL,
  `stud_profile_id` int NOT NULL,
  `assigned_stud` varchar(100) NOT NULL,
  PRIMARY KEY (`mentor_id`),
  KEY `stud_profile_id` (`stud_profile_id`),
  CONSTRAINT `mentor_ibfk_1` FOREIGN KEY (`stud_profile_id`) REFERENCES `students` (`stud_profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mentor`
--

LOCK TABLES `mentor` WRITE;
/*!40000 ALTER TABLE `mentor` DISABLE KEYS */;
INSERT INTO `mentor` VALUES (1,301,'anish','anish@gmail.com','9348658354',111,'Tanu'),(2,302,'david','david@gmail.com','9948678357',112,'Manu'),(3,301,'anish','anish@gmail.com','7388688356',113,'Banu'),(4,303,'krish','krish@gmail.com','71486783501',114,'Tom'),(5,304,'ramya','ramya@gmail.com','6348678350',115,'Jerry');
/*!40000 ALTER TABLE `mentor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `stud_profile_id` int NOT NULL,
  `stud_name` varchar(100) NOT NULL,
  `stud_email` varchar(250) NOT NULL,
  `stud_mob_num` varchar(15) NOT NULL,
  `stud_join_date` datetime NOT NULL,
  `stud_dob` date DEFAULT NULL,
  PRIMARY KEY (`stud_profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (111,'Tanu','tanu@gmail.com','7348678350','2019-10-18 05:25:10','1994-10-13'),(112,'Manu','manu@gmail.com','7345678950','2019-10-01 07:30:20','1993-02-23'),(113,'Banu','banu@gmail.com','9345678950','2019-10-10 09:25:28','1996-05-14'),(114,'Tom','tom@gmail.com','8845678950','2019-10-25 08:31:40','1997-11-07'),(115,'Jerry','jerry@gmail.com','7745678950','2019-10-27 05:25:20','1995-08-22');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task` (
  `task_id` int NOT NULL,
  `stud_profile_id` int NOT NULL,
  `completed_task` int NOT NULL,
  `pending_task` int NOT NULL,
  PRIMARY KEY (`task_id`),
  KEY `stud_profile_id` (`stud_profile_id`),
  CONSTRAINT `task_ibfk_1` FOREIGN KEY (`stud_profile_id`) REFERENCES `students` (`stud_profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,111,6,4),(2,112,5,5),(3,113,9,1),(4,114,4,6),(5,115,8,2);
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'class_app'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-09 11:47:04
