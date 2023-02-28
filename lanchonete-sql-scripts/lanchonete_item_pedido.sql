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
-- Table structure for table `item_pedido`
--

DROP TABLE IF EXISTS `item_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_pedido` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantidade` int NOT NULL,
  `lanche_id_fk` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKcb7f223svv34g4uv0w94i7p56` (`lanche_id_fk`),
  CONSTRAINT `FKcb7f223svv34g4uv0w94i7p56` FOREIGN KEY (`lanche_id_fk`) REFERENCES `lanche` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_pedido`
--

LOCK TABLES `item_pedido` WRITE;
/*!40000 ALTER TABLE `item_pedido` DISABLE KEYS */;
INSERT INTO `item_pedido` VALUES (4,12,9),(5,13,9),(6,12,1),(7,11,11),(8,2,11),(9,18,10),(10,2,2),(11,17,11),(12,19,11),(13,3,11),(14,1,7),(15,17,11),(16,6,7),(17,3,11),(18,12,5),(19,9,9),(20,7,5),(21,10,8),(22,16,2),(23,16,8),(24,6,3),(25,13,9),(26,5,10),(27,9,7),(28,4,11),(29,3,10),(30,13,1),(31,20,6),(32,10,5),(33,17,8),(34,5,3),(35,3,7),(36,18,2),(37,7,8),(38,12,4),(39,6,1),(40,16,5),(41,8,1),(42,20,10),(43,9,7),(44,11,6),(45,8,9),(46,20,6),(47,3,4),(48,14,4),(49,11,9),(50,7,6),(51,8,3),(52,3,7),(53,15,2),(54,1,6),(55,14,10),(56,13,11),(57,12,2),(58,13,1),(59,19,10),(60,6,6),(61,6,10),(62,1,1),(63,12,2),(64,6,10),(65,7,6),(66,11,6),(67,14,10),(68,10,10),(69,16,8),(70,9,8),(71,19,10),(72,20,3),(73,2,6),(74,9,1),(75,8,9),(76,8,1),(77,1,10),(78,14,9),(79,8,3),(80,9,8),(81,5,5),(82,14,3),(83,17,7),(84,2,10),(85,8,6),(86,11,6),(87,10,3),(88,2,11),(89,20,4),(90,12,6),(91,14,6),(92,6,6),(93,18,10),(94,10,4),(95,16,1),(96,1,2),(97,11,5),(98,9,4),(99,12,2),(100,14,10),(101,15,11),(102,20,6),(103,13,11),(104,17,3),(105,2,7),(106,2,2),(107,20,4),(108,7,5),(109,20,10),(110,20,2),(111,6,7),(112,15,9),(113,17,3),(114,3,11),(115,10,6),(116,9,7),(117,20,9),(118,6,7),(119,6,11),(120,18,1),(121,4,1),(122,11,10),(123,1,5),(124,6,5),(125,20,3),(126,2,6),(127,3,5),(128,1,9),(129,3,11),(130,13,2),(131,17,10),(132,13,2),(133,18,1),(134,9,4),(135,18,5),(136,10,4),(137,15,8),(138,12,3),(139,7,10),(140,16,9),(141,5,3),(142,16,2),(143,12,11),(144,6,11),(145,13,10),(146,8,4),(147,4,2),(148,9,5),(149,6,9),(150,14,7),(151,1,11),(152,10,2),(153,13,8);
/*!40000 ALTER TABLE `item_pedido` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-27 23:18:35
