-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: cinema
-- ------------------------------------------------------
-- Server version	8.0.29-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `cinema`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `cinema` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `cinema`;

--
-- Table structure for table `Movie`
--

DROP TABLE IF EXISTS `Movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Movie` (
  `movie_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(256) NOT NULL,
  `director` varchar(60) NOT NULL,
  `duration` int NOT NULL,
  PRIMARY KEY (`movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Movie`
--

LOCK TABLES `Movie` WRITE;
/*!40000 ALTER TABLE `Movie` DISABLE KEYS */;
INSERT INTO `Movie` VALUES (1,'Top Gun','Tom Cruise',120),(2,'Mobius','Someone',118);
/*!40000 ALTER TABLE `Movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reservation`
--

DROP TABLE IF EXISTS `Reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reservation` (
  `reservation_id` int NOT NULL AUTO_INCREMENT,
  `reserved` varchar(25) NOT NULL,
  `user_id` int DEFAULT NULL,
  `screening_id` int DEFAULT NULL,
  PRIMARY KEY (`reservation_id`),
  KEY `user_id` (`user_id`),
  KEY `screening_id` (`screening_id`),
  CONSTRAINT `Reservation_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE SET NULL,
  CONSTRAINT `Reservation_ibfk_2` FOREIGN KEY (`screening_id`) REFERENCES `Screening` (`screening_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reservation`
--

LOCK TABLES `Reservation` WRITE;
/*!40000 ALTER TABLE `Reservation` DISABLE KEYS */;
INSERT INTO `Reservation` VALUES (1,'Yes',1,2),(2,'Yes',2,1);
/*!40000 ALTER TABLE `Reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Screening`
--

DROP TABLE IF EXISTS `Screening`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Screening` (
  `screening_id` int NOT NULL AUTO_INCREMENT,
  `screening_date` date NOT NULL,
  `movie_id` int DEFAULT NULL,
  `theatre_id` int DEFAULT NULL,
  PRIMARY KEY (`screening_id`),
  KEY `movie_id` (`movie_id`),
  KEY `theatre_id` (`theatre_id`),
  CONSTRAINT `Screening_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `Movie` (`movie_id`) ON DELETE SET NULL,
  CONSTRAINT `Screening_ibfk_2` FOREIGN KEY (`theatre_id`) REFERENCES `theatre` (`theatre_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Screening`
--

LOCK TABLES `Screening` WRITE;
/*!40000 ALTER TABLE `Screening` DISABLE KEYS */;
INSERT INTO `Screening` VALUES (1,'2022-06-18',1,1),(2,'2022-06-20',1,1);
/*!40000 ALTER TABLE `Screening` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Seat`
--

DROP TABLE IF EXISTS `Seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Seat` (
  `seat_id` int NOT NULL AUTO_INCREMENT,
  `row_numb` char(1) NOT NULL,
  `seat_numb` int NOT NULL,
  `theatre_id` int DEFAULT NULL,
  PRIMARY KEY (`seat_id`),
  KEY `theatre_id` (`theatre_id`),
  CONSTRAINT `Seat_ibfk_1` FOREIGN KEY (`theatre_id`) REFERENCES `theatre` (`theatre_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Seat`
--

LOCK TABLES `Seat` WRITE;
/*!40000 ALTER TABLE `Seat` DISABLE KEYS */;
INSERT INTO `Seat` VALUES (1,'A',1,1),(2,'A',2,1),(3,'A',3,1),(4,'A',4,1),(5,'B',1,1),(6,'B',2,1),(7,'B',3,1),(8,'B',4,1),(9,'A',1,2),(10,'A',2,2),(11,'A',3,2),(12,'A',4,2),(13,'B',1,2),(14,'B',2,2),(15,'B',3,2),(16,'B',4,2);
/*!40000 ALTER TABLE `Seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `email` varchar(256) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'Tim','Fel','timfel@gmail.com','password'),(2,'Tom','Fel','tomfel@gmail.com','passwor');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat_reserved`
--

DROP TABLE IF EXISTS `seat_reserved`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat_reserved` (
  `seatRes_id` int NOT NULL AUTO_INCREMENT,
  `seat_id` int DEFAULT NULL,
  `screening_id` int DEFAULT NULL,
  `reservation_id` int DEFAULT NULL,
  PRIMARY KEY (`seatRes_id`),
  KEY `seat_id` (`seat_id`),
  KEY `screening_id` (`screening_id`),
  KEY `reservation_id` (`reservation_id`),
  CONSTRAINT `seat_reserved_ibfk_1` FOREIGN KEY (`seat_id`) REFERENCES `Seat` (`seat_id`) ON DELETE SET NULL,
  CONSTRAINT `seat_reserved_ibfk_2` FOREIGN KEY (`screening_id`) REFERENCES `Screening` (`screening_id`) ON DELETE SET NULL,
  CONSTRAINT `seat_reserved_ibfk_3` FOREIGN KEY (`reservation_id`) REFERENCES `Reservation` (`reservation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat_reserved`
--

LOCK TABLES `seat_reserved` WRITE;
/*!40000 ALTER TABLE `seat_reserved` DISABLE KEYS */;
INSERT INTO `seat_reserved` VALUES (1,1,2,1),(2,2,2,1),(3,5,2,1),(4,6,2,1),(5,3,1,2),(6,4,1,2),(7,1,1,2),(8,8,1,2);
/*!40000 ALTER TABLE `seat_reserved` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theatre`
--

DROP TABLE IF EXISTS `theatre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theatre` (
  `theatre_id` int NOT NULL AUTO_INCREMENT,
  `theatre_name` varchar(50) NOT NULL,
  `no_seats` int NOT NULL,
  PRIMARY KEY (`theatre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theatre`
--

LOCK TABLES `theatre` WRITE;
/*!40000 ALTER TABLE `theatre` DISABLE KEYS */;
INSERT INTO `theatre` VALUES (1,'Wallis 1',8),(2,'Wallis 2',8);
/*!40000 ALTER TABLE `theatre` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-16 17:21:37
