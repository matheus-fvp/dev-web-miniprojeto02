-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: lanchonete
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `lanche_adicional`
--

DROP TABLE IF EXISTS `lanche_adicional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lanche_adicional` (
  `lanche_id_fk` bigint NOT NULL,
  `adicional_id_fk` bigint NOT NULL,
  KEY `FK1jovxm5vdaxn7udrg8gtipkor` (`adicional_id_fk`),
  KEY `FKrhkkeder42blwh0qixhd26a9b` (`lanche_id_fk`),
  CONSTRAINT `FK1jovxm5vdaxn7udrg8gtipkor` FOREIGN KEY (`adicional_id_fk`) REFERENCES `adicional` (`id`),
  CONSTRAINT `FKrhkkeder42blwh0qixhd26a9b` FOREIGN KEY (`lanche_id_fk`) REFERENCES `lanche` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lanche_adicional`
--

LOCK TABLES `lanche_adicional` WRITE;
/*!40000 ALTER TABLE `lanche_adicional` DISABLE KEYS */;
INSERT INTO `lanche_adicional` VALUES (1,2),(1,3),(3,1),(9,2),(10,8),(7,4),(1,8),(11,4),(5,1),(4,8),(1,1),(9,3),(1,10),(7,1),(4,12),(6,10),(4,13),(1,9),(1,8),(11,4),(9,8),(11,9),(2,4),(6,8),(4,11),(10,2),(9,10),(7,13),(5,4),(1,8),(10,1),(8,11),(1,3),(10,4),(8,10),(3,7),(10,8),(6,9),(9,6),(5,5),(11,6),(5,9),(11,13),(6,6),(11,12),(11,3),(3,5),(9,6),(1,13),(7,10),(1,6),(3,9),(8,1),(6,1),(3,7),(8,8),(10,9),(6,12),(3,3),(2,4),(6,10),(1,1),(10,2),(5,10),(1,13),(7,13),(5,9),(4,1),(9,3),(10,12),(11,12),(11,12),(7,10),(5,6),(2,8),(2,6),(3,2),(11,12),(11,9),(8,13),(4,7),(10,13),(9,4),(8,13),(8,4),(7,10),(8,1),(10,10),(1,4),(8,6),(1,8),(9,6),(4,3),(11,5),(4,1),(8,5),(5,5),(11,5),(6,13),(11,8),(10,13),(3,11);
/*!40000 ALTER TABLE `lanche_adicional` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-27 23:18:36
