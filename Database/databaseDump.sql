CREATE DATABASE  IF NOT EXISTS `trainacroquetadb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `trainacroquetadb`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 192.168.1.22    Database: trainacroquetadb
-- ------------------------------------------------------
-- Server version	5.5.5-10.11.4-MariaDB-1~deb12u1

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
-- Table structure for table `exercisecroquetas`
--

DROP TABLE IF EXISTS `exercisecroquetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exercisecroquetas` (
  `idGame` int(11) NOT NULL,
  `idExercise` int(11) NOT NULL AUTO_INCREMENT,
  `qttyCroquetas` int(11) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `dateTime` date DEFAULT NULL,
  PRIMARY KEY (`idExercise`),
  KEY `pkidgame_idx` (`idGame`),
  CONSTRAINT `pkidgame` FOREIGN KEY (`idGame`) REFERENCES `gamedata` (`idGame`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercisecroquetas`
--

LOCK TABLES `exercisecroquetas` WRITE;
/*!40000 ALTER TABLE `exercisecroquetas` DISABLE KEYS */;
INSERT INTO `exercisecroquetas` VALUES (1,1,8,8,NULL),(2,2,300,80,'2020-03-09');
/*!40000 ALTER TABLE `exercisecroquetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gamedata`
--

DROP TABLE IF EXISTS `gamedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gamedata` (
  `idGame` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` int(11) NOT NULL,
  `nCroquetas` int(11) DEFAULT 0,
  `lastDay` date DEFAULT NULL,
  PRIMARY KEY (`idGame`),
  KEY `pkidUser_idx` (`idUser`),
  CONSTRAINT `pkidUser` FOREIGN KEY (`idUser`) REFERENCES `users` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gamedata`
--

LOCK TABLES `gamedata` WRITE;
/*!40000 ALTER TABLE `gamedata` DISABLE KEYS */;
INSERT INTO `gamedata` VALUES (1,2,3000,'2023-12-13'),(2,3,0,NULL);
/*!40000 ALTER TABLE `gamedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gameproducer`
--

DROP TABLE IF EXISTS `gameproducer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gameproducer` (
  `idGame` int(11) NOT NULL,
  `idProd` int(11) NOT NULL,
  `quantity` int(11) DEFAULT 0,
  KEY `pkidgame2_idx` (`idGame`),
  KEY `pkidprod2_idx` (`idProd`),
  CONSTRAINT `pkidgame2` FOREIGN KEY (`idGame`) REFERENCES `gamedata` (`idGame`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pkidprod2` FOREIGN KEY (`idProd`) REFERENCES `producer` (`idProd`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gameproducer`
--

LOCK TABLES `gameproducer` WRITE;
/*!40000 ALTER TABLE `gameproducer` DISABLE KEYS */;
/*!40000 ALTER TABLE `gameproducer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gameranking`
--

DROP TABLE IF EXISTS `gameranking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gameranking` (
  `idGame` int(11) NOT NULL,
  `idRanking` int(11) NOT NULL,
  `position` int(11) DEFAULT 0,
  `nCroquetas` int(11) DEFAULT 0,
  KEY `pkidgame4_idx` (`idGame`),
  KEY `pkidranking_idx` (`idRanking`),
  CONSTRAINT `pkidgame4` FOREIGN KEY (`idGame`) REFERENCES `gamedata` (`idGame`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pkidranking` FOREIGN KEY (`idRanking`) REFERENCES `ranking` (`idRanking`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gameranking`
--

LOCK TABLES `gameranking` WRITE;
/*!40000 ALTER TABLE `gameranking` DISABLE KEYS */;
/*!40000 ALTER TABLE `gameranking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gamerewards`
--

DROP TABLE IF EXISTS `gamerewards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gamerewards` (
  `idGame` int(11) NOT NULL,
  `idRewards` int(11) NOT NULL,
  KEY `pkidgame3_idx` (`idGame`),
  KEY `pkidreward_idx` (`idRewards`),
  CONSTRAINT `pkidgame3` FOREIGN KEY (`idGame`) REFERENCES `gamedata` (`idGame`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pkidreward` FOREIGN KEY (`idRewards`) REFERENCES `rewards` (`idRewards`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gamerewards`
--

LOCK TABLES `gamerewards` WRITE;
/*!40000 ALTER TABLE `gamerewards` DISABLE KEYS */;
/*!40000 ALTER TABLE `gamerewards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producer`
--

DROP TABLE IF EXISTS `producer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producer` (
  `idProd` int(11) NOT NULL AUTO_INCREMENT,
  `prodName` varchar(45) DEFAULT NULL,
  `prodQuantity` int(11) DEFAULT NULL,
  `img` blob DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`idProd`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producer`
--

LOCK TABLES `producer` WRITE;
/*!40000 ALTER TABLE `producer` DISABLE KEYS */;
INSERT INTO `producer` VALUES (1,'Cursor',1,NULL,'Cursor que hace click automaticamente.',1),(2,'Abuela',5,NULL,'Abuelas apasionadas de las croquetas caseras.',10),(3,'Suegra',25,NULL,'Como las abuelas, pero con herramientas más modernas.',100);
/*!40000 ALTER TABLE `producer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ranking`
--

DROP TABLE IF EXISTS `ranking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ranking` (
  `idRanking` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`idRanking`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ranking`
--

LOCK TABLES `ranking` WRITE;
/*!40000 ALTER TABLE `ranking` DISABLE KEYS */;
/*!40000 ALTER TABLE `ranking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rewards`
--

DROP TABLE IF EXISTS `rewards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rewards` (
  `idRewards` int(11) NOT NULL,
  `nameRewards` varchar(45) DEFAULT NULL,
  `descriptionRewards` longtext DEFAULT NULL,
  `img` blob DEFAULT NULL,
  PRIMARY KEY (`idRewards`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rewards`
--

LOCK TABLES `rewards` WRITE;
/*!40000 ALTER TABLE `rewards` DISABLE KEYS */;
/*!40000 ALTER TABLE `rewards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `idUser` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `fullName` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `profileImg` blob DEFAULT NULL,
  PRIMARY KEY (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'jaimefdez','jaimefdez','Jaime Fernandez-Bravo Carranza','jaimefdez@gmail.com',NULL),(3,'silviarc','silviarc','Silvia Ruiz Carrasco','silviaruizcarrasco2609@gmail.com',NULL),(4,'testing','testing','User testing','isthetestinguser@gmail.com',NULL),(5,'testing2','testing2','User testing 2','isthetestinguser@gmail.com',NULL),(6,'testing1','testing2','User testing 2','isthetestinguser@gmail.com',NULL),(7,'testing12','testing2','User testing 2','isthetestinguser@gmail.com',NULL),(8,'testing122','testing2','User testing 2','isthetestinguser@gmail.com',NULL),(9,'testing122w','testing2','User testing 2','isthetestinguser@gmail.com',NULL),(10,'testing122sw','testing2','User testing 2','isthetestinguser@gmail.com',NULL),(11,'testing122saaaw','testing2','User testing 2','isthetestinguser@gmail.com',NULL),(12,'testing122saaaaaaaw','testing2','User testing 2','isthetestinguser@gmail.com',NULL),(13,'testing122saaaaaaaaaaw','testing2','User testing 2','isthetestinguser@gmail.com',NULL),(14,'testing122saaaaaaaaaaaaaaw','testing2','User testing 2','isthetestinguser@gmail.com',NULL),(15,'testing122saaaaaaaaaaaaaaaaaw','testing2','User testing 2','isthetestinguser@gmail.com',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-04  0:28:35
