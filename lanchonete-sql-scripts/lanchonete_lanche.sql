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
-- Table structure for table `lanche`
--

DROP TABLE IF EXISTS `lanche`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lanche` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `nome` varchar(30) NOT NULL,
  `valor` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_pj9d2h393kny6ymrs4nkmti76` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lanche`
--

LOCK TABLES `lanche` WRITE;
/*!40000 ALTER TABLE `lanche` DISABLE KEYS */;
INSERT INTO `lanche` VALUES (1,'descricao x-burguer','X-burguer',12),(2,'descricao hot-dog simples','HotDog simples',7),(3,'X-egg descricao','X-Egg',9),(4,'150 g calabresa defumada fatiada e 3 fatias de queijo. Pão francês','X-calabresa',21),(5,'90 g de hambúrguer bovino, 3 fatias de queijo e catupiry. Pão de Hambúrguer.','X-catupiry',24),(6,'180 g de contra filé e 3 fatias de queijo. Pão francês','X-churrasco',23),(7,'180 g hambúrguer,2 queijo e salada. Pão de hambúrguer','X-duplo',23),(8,'90 g hambúrguer,presunto,queijo,ovo e salada. Pão de hambúrguer','X-tudo',26.5),(9,'90 g hambúrguer,queijo e salada. Pão de hambúrguer','X-salada',20),(10,'150 g de filé de frango com queijo prato. Pão francês','X-filet de frango',18),(11,'140 g filet de picanha,queijo e salada. Pão francês','X-picanha',32);
/*!40000 ALTER TABLE `lanche` ENABLE KEYS */;
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
