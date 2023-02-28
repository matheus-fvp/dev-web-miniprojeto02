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
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `bairro` varchar(50) NOT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `numero` varchar(10) NOT NULL,
  `rua` varchar(80) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES (1,'Miraflores','proximo ao ponto','21','airton sena'),(2,'Santo Amaro',NULL,'234','Rua Loreto'),(3,'Vila Barão','casa branca','362','Rua Fernandes Vieira'),(4,'Jardim Santa Rosália','bar da rose','256','Avenida Dom Aguirre'),(5,'Vila Barão',NULL,'123','Rua Fernandes Vieira'),(6,'Jardim Europa','perto do bosque','12','Rua Bélgica'),(7,'Vila Hortência',NULL,'162','Rua Francisco Festa'),(8,'Brigadeiro Tobias',NULL,'436','Estrada do Bataglin'),(9,'Brigadeiro Tobias',NULL,'889','Rua João Sanches Anaya'),(10,'Brigadeiro Tobias',NULL,'123','Rua João Sanches Anaya'),(11,'Jardim Sol Nascente','proximo ao supermercado extra','886','Rua Nove'),(12,'Jardim Simus',NULL,'720','Alameda das Verbenas'),(13,'Jardim Simus',NULL,'345','Alameda das Verbenas'),(14,'Jardim Celeste',NULL,'962','Rua Luigi Brunetti'),(15,'Jardim Santa Rosália','restaurante feixe de luz','246','Avenida Dom Aguirre'),(16,'Inhayba','vitae','741','Ap #973-2048 Nisl. Road'),(17,'Habiteto','Nulla interdum. Curabitur dictum.','357','P.O. Box 240, 6501 Risus Ave'),(18,'Inhayba','lacus. Quisque purus sapien, gravida','599','Ap #439-8696 Eget Avenue'),(19,'Itangua','massa. Integer vitae','215','114 Gravida Street'),(20,'Aparecidinha','Curae Phasellus ornare. Fusce','495','Ap #804-724 Felis Avenue'),(21,'Campininha','nunc. In at','593','804-7556 Molestie Av.'),(22,'Éden','Nulla tempor','44','7368 Cum Av.'),(23,'Caguacu','Donec est. Nunc ullamcorper,','514','5992 Arcu Ave'),(24,'Caputera','Suspendisse sed','131','Ap #710-6182 Orci, Road'),(25,'Centro','dis parturient montes, nascetur','374','P.O. Box 984, 8282 Ullamcorper, Road'),(26,'Centro','cubilia Curae','683','P.O. Box 639, 8103 Aliquam St.'),(27,'Caguacu','diam. Proin','159','341-5071 Volutpat. Rd.'),(28,'Inhayba','risus. Donec egestas. Aliquam nec','408','P.O. Box 207, 6080 Ligula Av.'),(29,'Itangua','tristique ac, eleifend vitae, erat.','92','P.O. Box 966, 5692 Arcu. St.'),(30,'Aparecida','Aliquam auctor, velit','567','Ap #658-8030 Neque St.'),(31,'Morros','lobortis, nisi nibh lacinia orci,','699','212-6271 Nec, Rd.'),(32,'Éden','aliquam eros turpis','334','397-2665 Mauris Rd.'),(33,'Éden','turpis.','73','6358 Quisque Rd.'),(34,'Aparecidinha','neque. Sed','505','8501 Euismod St.'),(35,'Campininha','porttitor','268','Ap #104-4911 Ornare Av.'),(36,'Itangua','sagittis placerat. Cras dictum','527','Ap #119-2261 Ridiculus Ave'),(37,'Caputera','leo,','489','Ap #281-7995 Sem Street'),(38,'Éden','fermentum metus.','397','Ap #944-6526 Ligula Rd.'),(39,'Campos','enim diam vel arcu.','565','844-6007 Dictum. Ave'),(40,'Aparecida','purus. Nullam','765','197 Non, St.'),(41,'Cerrado','venenatis vel, faucibus id, libero.','397','Ap #918-2316 Vel Avenue'),(42,'Campininha','et, rutrum non,','708','P.O. Box 751, 2080 Nisi St.'),(43,'Genebra','natoque penatibus','531','709-9452 Egestas Rd.'),(44,'Itangua','nibh','736','Ap #499-2055 Non, Rd.'),(45,'Caguacu','eu, ultrices sit amet,','483','923-2924 Adipiscing Road'),(46,'Aparecida','Donec sollicitudin','715','239-1446 Tincidunt, Av.'),(47,'Aparecidinha','ligula eu enim. Etiam imperdiet','235','Ap #659-7968 Nunc St.'),(48,'Cerrado','eu dolor egestas','558','195-8776 Arcu. Rd.'),(49,'Morros','amet luctus','537','546-9885 Etiam Rd.'),(50,'Inhayba','metus. Vivamus euismod urna.','706','877-2134 At Rd.');
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
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
