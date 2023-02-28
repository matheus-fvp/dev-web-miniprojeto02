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
-- Table structure for table `pedido_item_pedido`
--

DROP TABLE IF EXISTS `pedido_item_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_item_pedido` (
  `pedido_id_fk` bigint DEFAULT NULL,
  `titem_pedido_id_fk` bigint DEFAULT NULL,
  KEY `pedido_fk` (`pedido_id_fk`),
  KEY `item_pedido_fk` (`titem_pedido_id_fk`),
  CONSTRAINT `item_pedido_fk` FOREIGN KEY (`titem_pedido_id_fk`) REFERENCES `item_pedido` (`id`),
  CONSTRAINT `pedido_fk` FOREIGN KEY (`pedido_id_fk`) REFERENCES `pedido` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_item_pedido`
--

LOCK TABLES `pedido_item_pedido` WRITE;
/*!40000 ALTER TABLE `pedido_item_pedido` DISABLE KEYS */;
INSERT INTO `pedido_item_pedido` VALUES (3,4),(4,5),(5,6),(6,7),(7,8),(8,9),(9,10),(10,11),(11,12),(12,13),(13,14),(14,15),(15,16),(16,17),(17,18),(18,19),(19,20),(20,21),(21,22),(22,23),(23,24),(24,25),(25,26),(26,27),(27,28),(28,29),(29,30),(30,31),(31,32),(32,33),(33,34),(34,35),(35,36),(36,37),(37,38),(38,39),(39,40),(40,41),(41,42),(42,43),(43,44),(44,45),(45,46),(46,47),(47,48),(48,49),(49,50),(50,51),(51,52),(52,53),(35,54),(47,55),(19,56),(12,57),(42,58),(30,59),(30,60),(49,61),(33,62),(41,63),(41,64),(11,65),(38,66),(18,67),(41,68),(21,69),(34,70),(14,71),(9,72),(41,73),(15,74),(16,75),(15,76),(43,77),(45,78),(33,79),(34,80),(14,81),(47,82),(23,83),(21,84),(28,85),(48,86),(20,87),(22,88),(25,89),(42,90),(9,91),(9,92),(5,93),(27,94),(7,95),(46,96),(8,97),(50,98),(33,99),(46,100),(32,101),(43,102),(19,103),(17,104),(21,105),(20,106),(36,107),(4,108),(36,109),(31,110),(44,111),(45,112),(14,113),(17,114),(18,115),(37,116),(9,117),(7,118),(21,119),(7,120),(13,121),(37,122),(18,123),(48,124),(4,125),(13,126),(14,127),(20,128),(43,129),(4,130),(36,131),(11,132),(13,133),(13,134),(3,135),(4,136),(4,137),(46,138),(26,139),(24,140),(11,141),(6,142),(8,143),(12,144),(24,145),(11,146),(29,147),(43,148),(26,149),(40,150),(18,151),(46,152),(46,153);
/*!40000 ALTER TABLE `pedido_item_pedido` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-27 23:18:37
