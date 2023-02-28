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
-- Table structure for table `adicional`
--

DROP TABLE IF EXISTS `adicional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adicional` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `valor` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_m8ira8wn2x7q84esm8flmjl4b` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adicional`
--

LOCK TABLES `adicional` WRITE;
/*!40000 ALTER TABLE `adicional` DISABLE KEYS */;
INSERT INTO `adicional` VALUES (1,'Bacon',3),(2,'Pure de batata',5),(3,'cheddar',8),(4,'Alface',1.5),(5,'Catupiry',2),(6,'Fatia de peito de peru',1.5),(7,'Fatia de preseunto',1),(8,'Fatia de queijo',2),(9,'Fatia de queijo minas',3),(10,'Hamburguer',3),(11,'Ovo Frito',1.5),(12,'Porção de vinagrete',2.5),(13,'Tomate',2.5);
/*!40000 ALTER TABLE `adicional` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES (1,'Miraflores','proximo ao ponto','21','airton sena'),(2,'Santo Amaro',NULL,'234','Rua Loreto'),(3,'Vila Barão','casa branca','362','Rua Fernandes Vieira'),(4,'Jardim Santa Rosália','bar da rose','256','Avenida Dom Aguirre'),(5,'Vila Barão',NULL,'123','Rua Fernandes Vieira'),(6,'Jardim Europa','perto do bosque','12','Rua Bélgica'),(7,'Vila Hortência',NULL,'162','Rua Francisco Festa'),(8,'Brigadeiro Tobias',NULL,'436','Estrada do Bataglin'),(9,'Brigadeiro Tobias',NULL,'889','Rua João Sanches Anaya'),(10,'Brigadeiro Tobias',NULL,'123','Rua João Sanches Anaya'),(11,'Jardim Sol Nascente','proximo ao supermercado extra','886','Rua Nove'),(12,'Jardim Simus',NULL,'720','Alameda das Verbenas'),(13,'Jardim Simus',NULL,'345','Alameda das Verbenas'),(14,'Jardim Celeste',NULL,'962','Rua Luigi Brunetti'),(15,'Jardim Santa Rosália','restaurante feixe de luz','246','Avenida Dom Aguirre'),(16,'Inhayba','vitae','741','Ap #973-2048 Nisl. Road'),(17,'Habiteto','Nulla interdum. Curabitur dictum.','357','P.O. Box 240, 6501 Risus Ave'),(18,'Inhayba','lacus. Quisque purus sapien, gravida','599','Ap #439-8696 Eget Avenue'),(19,'Itangua','massa. Integer vitae','215','114 Gravida Street'),(20,'Aparecidinha','Curae Phasellus ornare. Fusce','495','Ap #804-724 Felis Avenue'),(21,'Campininha','nunc. In at','593','804-7556 Molestie Av.'),(22,'Éden','Nulla tempor','44','7368 Cum Av.'),(23,'Caguacu','Donec est. Nunc ullamcorper,','514','5992 Arcu Ave'),(24,'Caputera','Suspendisse sed','131','Ap #710-6182 Orci, Road'),(25,'Centro','dis parturient montes, nascetur','374','P.O. Box 984, 8282 Ullamcorper, Road'),(26,'Centro','cubilia Curae','683','P.O. Box 639, 8103 Aliquam St.'),(27,'Caguacu','diam. Proin','159','341-5071 Volutpat. Rd.'),(28,'Inhayba','risus. Donec egestas. Aliquam nec','408','P.O. Box 207, 6080 Ligula Av.'),(29,'Itangua','tristique ac, eleifend vitae, erat.','92','P.O. Box 966, 5692 Arcu. St.'),(30,'Aparecida','Aliquam auctor, velit','567','Ap #658-8030 Neque St.'),(31,'Morros','lobortis, nisi nibh lacinia orci,','699','212-6271 Nec, Rd.'),(32,'Éden','aliquam eros turpis','334','397-2665 Mauris Rd.'),(33,'Éden','turpis.','73','6358 Quisque Rd.'),(34,'Aparecidinha','neque. Sed','505','8501 Euismod St.'),(35,'Campininha','porttitor','268','Ap #104-4911 Ornare Av.'),(36,'Itangua','sagittis placerat. Cras dictum','527','Ap #119-2261 Ridiculus Ave'),(37,'Caputera','leo,','489','Ap #281-7995 Sem Street'),(38,'Éden','fermentum metus.','397','Ap #944-6526 Ligula Rd.'),(39,'Campos','enim diam vel arcu.','565','844-6007 Dictum. Ave'),(40,'Aparecida','purus. Nullam','765','197 Non, St.'),(41,'Cerrado','venenatis vel, faucibus id, libero.','397','Ap #918-2316 Vel Avenue'),(42,'Campininha','et, rutrum non,','708','P.O. Box 751, 2080 Nisi St.'),(43,'Genebra','natoque penatibus','531','709-9452 Egestas Rd.'),(44,'Itangua','nibh','736','Ap #499-2055 Non, Rd.'),(45,'Caguacu','eu, ultrices sit amet,','483','923-2924 Adipiscing Road'),(46,'Aparecida','Donec sollicitudin','715','239-1446 Tincidunt, Av.'),(47,'Aparecidinha','ligula eu enim. Etiam imperdiet','235','Ap #659-7968 Nunc St.'),(48,'Cerrado','eu dolor egestas','558','195-8776 Arcu. Rd.'),(49,'Morros','amet luctus','537','546-9885 Etiam Rd.'),(50,'Inhayba','metus. Vivamus euismod urna.','706','877-2134 At Rd.'),(51,'Jardim das Azaléias',NULL,'112','Rua Rosalina Pereira de Camargo'),(52,'Jardim Topázio',NULL,'448','Rua Maria Tereza de Melo'),(53,'Jardim Nova Esperança','Bar da Carolina','665','Rua Humberto Sampaio de Souza');
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_pedido`
--

LOCK TABLES `item_pedido` WRITE;
/*!40000 ALTER TABLE `item_pedido` DISABLE KEYS */;
INSERT INTO `item_pedido` VALUES (1,5,2),(2,1,2),(3,3,4),(4,12,9),(5,13,9),(6,12,1),(7,11,11),(8,2,11),(9,18,10),(10,2,2),(11,17,11),(12,19,11),(13,3,11),(14,1,7),(15,17,11),(16,6,7),(17,3,11),(18,12,5),(19,9,9),(20,7,5),(21,10,8),(22,16,2),(23,16,8),(24,6,3),(25,13,9),(26,5,10),(27,9,7),(28,4,11),(29,3,10),(30,13,1),(31,20,6),(32,10,5),(33,17,8),(34,5,3),(35,3,7),(36,18,2),(37,7,8),(38,12,4),(39,6,1),(40,16,5),(41,8,1),(42,20,10),(43,9,7),(44,11,6),(45,8,9),(46,20,6),(47,3,4),(48,14,4),(49,11,9),(50,7,6),(51,8,3),(52,3,7),(53,15,2),(54,1,6),(55,14,10),(56,13,11),(57,12,2),(58,13,1),(59,19,10),(60,6,6),(61,6,10),(62,1,1),(63,12,2),(64,6,10),(65,7,6),(66,11,6),(67,14,10),(68,10,10),(69,16,8),(70,9,8),(71,19,10),(72,20,3),(73,2,6),(74,9,1),(75,8,9),(76,8,1),(77,1,10),(78,14,9),(79,8,3),(80,9,8),(81,5,5),(82,14,3),(83,17,7),(84,2,10),(85,8,6),(86,11,6),(87,10,3),(88,2,11),(89,20,4),(90,12,6),(91,14,6),(92,6,6),(93,18,10),(94,10,4),(95,16,1),(96,1,2),(97,11,5),(98,9,4),(99,12,2),(100,14,10),(101,15,11),(102,20,6),(103,13,11),(104,17,3),(105,2,7),(106,2,2),(107,20,4),(108,7,5),(109,20,10),(110,20,2),(111,6,7),(112,15,9),(113,17,3),(114,3,11),(115,10,6),(116,9,7),(117,20,9),(118,6,7),(119,6,11),(120,18,1),(121,4,1),(122,11,10),(123,1,5),(124,6,5),(125,20,3),(126,2,6),(127,3,5),(128,1,9),(129,3,11),(130,13,2),(131,17,10),(132,13,2),(133,18,1),(134,9,4),(135,18,5),(136,10,4),(137,15,8),(138,12,3),(139,7,10),(140,16,9),(141,5,3),(142,16,2),(143,12,11),(144,6,11),(145,13,10),(146,8,4),(147,4,2),(148,9,5),(149,6,9),(150,14,7),(151,1,11),(152,10,2),(153,13,8),(154,1,2),(155,1,2),(156,1,2),(157,1,2),(158,1,2),(159,3,5);
/*!40000 ALTER TABLE `item_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_pedido_adicional`
--

DROP TABLE IF EXISTS `item_pedido_adicional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_pedido_adicional` (
  `item_pedido_id_fk` bigint NOT NULL,
  `adicional_id_fk` bigint NOT NULL,
  PRIMARY KEY (`item_pedido_id_fk`,`adicional_id_fk`),
  KEY `fk_adicional` (`adicional_id_fk`),
  CONSTRAINT `fk_adicional` FOREIGN KEY (`adicional_id_fk`) REFERENCES `adicional` (`id`),
  CONSTRAINT `fk_item_pedido` FOREIGN KEY (`item_pedido_id_fk`) REFERENCES `item_pedido` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_pedido_adicional`
--

LOCK TABLES `item_pedido_adicional` WRITE;
/*!40000 ALTER TABLE `item_pedido_adicional` DISABLE KEYS */;
INSERT INTO `item_pedido_adicional` VALUES (21,1),(24,1),(29,1),(36,1),(39,1),(77,1),(113,1),(132,1),(135,1),(154,1),(155,1),(156,1),(157,1),(158,1),(12,2),(27,2),(30,2),(36,2),(41,2),(55,2),(61,2),(67,2),(74,2),(83,2),(97,2),(101,2),(103,2),(106,2),(108,2),(125,2),(129,2),(130,2),(135,2),(138,2),(148,2),(151,2),(7,3),(19,3),(33,3),(43,3),(46,3),(47,3),(54,3),(62,3),(71,3),(86,3),(87,3),(106,3),(110,3),(118,3),(128,3),(140,3),(142,3),(144,3),(149,3),(154,3),(155,3),(156,3),(157,3),(158,3),(8,4),(15,4),(17,4),(31,4),(33,4),(36,4),(38,4),(42,4),(44,4),(51,4),(52,4),(65,4),(71,4),(72,4),(80,4),(81,4),(84,4),(85,4),(86,4),(91,4),(107,4),(141,4),(147,4),(151,4),(152,4),(28,5),(30,5),(40,5),(61,5),(65,5),(73,5),(77,5),(90,5),(103,5),(106,5),(119,5),(145,5),(151,5),(2,6),(16,6),(20,6),(23,6),(27,6),(30,6),(31,6),(45,6),(57,6),(75,6),(83,6),(87,6),(102,6),(114,6),(123,6),(124,6),(126,6),(135,6),(137,6),(140,6),(144,6),(146,6),(5,7),(6,7),(12,7),(24,7),(30,7),(40,7),(50,7),(58,7),(65,7),(68,7),(73,7),(74,7),(78,7),(89,7),(99,7),(103,7),(106,7),(114,7),(122,7),(124,7),(125,7),(135,7),(138,7),(139,7),(150,7),(3,8),(4,8),(5,8),(15,8),(19,8),(22,8),(24,8),(27,8),(29,8),(30,8),(49,8),(55,8),(56,8),(62,8),(78,8),(79,8),(81,8),(93,8),(99,8),(100,8),(122,8),(134,8),(135,8),(140,8),(149,8),(1,9),(4,9),(7,9),(21,9),(25,9),(32,9),(37,9),(48,9),(61,9),(71,9),(76,9),(93,9),(102,9),(106,9),(121,9),(135,9),(3,10),(23,10),(34,10),(35,10),(37,10),(49,10),(52,10),(54,10),(79,10),(82,10),(84,10),(86,10),(87,10),(93,10),(104,10),(105,10),(115,10),(135,10),(139,10),(142,10),(15,11),(17,11),(18,11),(21,11),(22,11),(23,11),(29,11),(41,11),(43,11),(48,11),(52,11),(60,11),(62,11),(69,11),(84,11),(89,11),(104,11),(106,11),(136,11),(140,11),(145,11),(9,12),(12,12),(33,12),(38,12),(58,12),(71,12),(81,12),(83,12),(87,12),(91,12),(93,12),(95,12),(100,12),(101,12),(103,12),(129,12),(139,12),(144,12),(147,12),(150,12),(82,13),(85,13),(90,13),(121,13),(140,13);
/*!40000 ALTER TABLE `item_pedido_adicional` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cliente_email` varchar(80) NOT NULL,
  `cliente_nome` varchar(80) NOT NULL,
  `cliente_telefone` varchar(15) NOT NULL,
  `data_pedido` datetime(6) DEFAULT NULL,
  `endereco_id_fk` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbmljk8v3ak8a803wsrtqt1t91` (`endereco_id_fk`),
  CONSTRAINT `FKbmljk8v3ak8a803wsrtqt1t91` FOREIGN KEY (`endereco_id_fk`) REFERENCES `endereco` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,'lillithhowell@protonmail.net','Lillith Howell','(82)51705-7780','2022-07-19 22:45:12.000000',51),(2,'jinmckenzie@yahoo.net','Jin Mckenzie','(03)21832-5595','2023-05-02 02:57:51.000000',52),(3,'porterpuckett180@protonmail.couk','Porter Puckett','(84)72705-7443','2022-12-07 03:42:10.000000',1),(4,'oceannixon@aol.com','Ocean Nixon','(13)86765-2908','2022-04-01 20:15:17.000000',2),(5,'biancaforbes438@outlook.org','Bianca Forbes','(47)86687-8447','2022-07-04 16:59:07.000000',3),(6,'chesterdillard@icloud.org','Chester Dillard','(79)02663-4661','2023-09-12 19:53:08.000000',4),(7,'craignewman@aol.couk','Craig Newman','(73)43772-5845','2023-12-08 10:55:54.000000',5),(8,'carlyosborne@outlook.couk','Carly Osborne','(54)22556-5382','2023-05-18 08:53:39.000000',6),(9,'calistabrewer@hotmail.com','Calista Brewer','(56)65533-6216','2024-01-08 12:39:10.000000',7),(10,'danesalinas229@protonmail.ca','Dane Salinas','(84)82556-7226','2023-08-05 07:41:04.000000',8),(11,'berkcooley@google.com','Berk Cooley','(48)08182-3101','2022-07-20 22:43:46.000000',9),(12,'destinyortiz@hotmail.net','Destiny Ortiz','(15)88392-7587','2024-01-06 01:56:28.000000',10),(13,'lesterkoch3075@protonmail.edu','Lester Koch','(58)74531-5136','2023-10-08 18:40:41.000000',11),(14,'arianaacosta4852@google.com','Ariana Acosta','(14)11035-5564','2022-06-17 23:14:18.000000',12),(15,'mageesykes4991@yahoo.ca','Magee Sykes','(42)66694-4696','2022-09-28 09:51:36.000000',13),(16,'hoytpeterson3513@protonmail.org','Hoyt Peterson','(72)36081-8560','2022-12-02 12:54:00.000000',14),(17,'rhonalangley@yahoo.edu','Rhona Langley','(44)64034-4524','2022-10-10 00:45:28.000000',15),(18,'christophercobb@google.com','Christopher Cobb','(61)36305-1031','2022-05-15 03:35:23.000000',16),(19,'isabelleaguilar@hotmail.couk','Isabelle Aguilar','(54)68502-4985','2023-03-21 13:22:51.000000',17),(20,'miapetty@google.ca','Mia Petty','(74)78674-8782','2022-04-08 13:29:55.000000',18),(21,'benedictlynch@hotmail.net','Benedict Lynch','(15)77260-3576','2022-06-25 06:06:11.000000',19),(22,'xenosknight4991@yahoo.net','Xenos Knight','(58)46653-4814','2023-06-11 16:48:12.000000',20),(23,'loisvalenzuela@hotmail.org','Lois Valenzuela','(55)52662-0178','2023-05-04 22:03:51.000000',21),(24,'elvismontoya@protonmail.edu','Elvis Montoya','(32)06837-6528','2022-11-17 11:27:03.000000',22),(25,'charleswong8244@aol.com','Charles Wong','(35)33568-1901','2023-11-03 17:23:49.000000',23),(26,'bellwilliams6202@icloud.ca','Bell Williams','(91)44920-7564','2022-05-30 12:43:59.000000',24),(27,'daijohns@protonmail.org','Dai Johns','(62)93431-7723','2022-07-22 09:04:50.000000',25),(28,'beverlyduran@aol.couk','Beverly Duran','(14)48276-7541','2022-11-11 13:17:52.000000',26),(29,'marajacobs@icloud.ca','Mara Jacobs','(57)83834-6196','2022-09-22 10:51:30.000000',27),(30,'abelnguyen@aol.net','Abel Nguyen','(78)51685-0518','2022-04-28 00:15:30.000000',28),(31,'clementinecollier3393@hotmail.net','Clementine Collier','(01)27709-3844','2022-04-17 01:10:53.000000',29),(32,'devindavidson565@yahoo.net','Devin Davidson','(98)71578-4542','2022-10-09 17:09:34.000000',30),(33,'tatyanarojas7642@outlook.net','Tatyana Rojas','(66)64707-4548','2023-12-27 18:46:43.000000',31),(34,'isaaclancaster@protonmail.edu','Isaac Lancaster','(88)42256-5690','2022-08-10 05:39:43.000000',32),(35,'brendanlindsay@protonmail.ca','Brendan Lindsay','(93)03343-0899','2022-06-15 12:30:45.000000',33),(36,'brunoserrano1789@protonmail.org','Bruno Serrano','(15)86216-8521','2022-11-11 18:20:14.000000',34),(37,'barclayfischer@hotmail.org','Barclay Fischer','(78)40154-6813','2022-06-15 01:04:05.000000',35),(38,'reaganwatkins5278@outlook.org','Reagan Watkins','(75)44077-3143','2023-07-29 02:40:25.000000',36),(39,'clarehorne@protonmail.edu','Clare Horne','(77)84937-1876','2023-11-25 16:59:52.000000',37),(40,'cassadymcgowan7814@icloud.org','Cassady Mcgowan','(64)53015-1681','2023-07-11 06:33:55.000000',38),(41,'glorialarsen4145@protonmail.com','Gloria Larsen','(03)13166-1792','2023-05-01 05:10:16.000000',39),(42,'ingacontreras@google.edu','Inga Contreras','(46)77855-4371','2022-08-05 01:53:59.000000',40),(43,'dantehurley7747@outlook.com','Dante Hurley','(65)81372-9337','2022-03-29 00:19:08.000000',41),(44,'oscarmiller@outlook.edu','Oscar Miller','(63)28492-2737','2023-10-29 03:24:51.000000',42),(45,'audraknapp1284@icloud.net','Audra Knapp','(39)88828-5136','2022-03-18 13:07:40.000000',43),(46,'basiakaufman@outlook.edu','Basia Kaufman','(64)46751-8670','2023-05-16 00:02:20.000000',44),(47,'prescottaguirre3412@icloud.net','Prescott Aguirre','(77)40374-1532','2022-10-25 02:24:04.000000',45),(48,'dariaperkins8589@aol.couk','Daria Perkins','(15)21608-9868','2022-05-25 14:35:41.000000',46),(49,'mackenziecannon@outlook.ca','MacKenzie Cannon','(54)16580-1276','2023-12-30 03:46:52.000000',47),(50,'irmahowell8376@hotmail.net','Irma Howell','(11)38275-5705','2022-10-11 08:36:40.000000',48),(51,'stacyware@google.org','Stacy Ware','(62)56663-2816','2022-04-17 01:09:49.000000',49),(52,'normanblack8186@icloud.com','Norman Black','(11)23364-8216','2022-09-22 15:14:09.000000',50),(53,'matheusvieira@gmail.com','Matheus Vieira','(15)66677-9090','2023-02-28 16:10:23.098268',53),(54,'matheusvieira@gmail.com','Matheus Vieira','(15)66677-9090','2023-02-28 16:14:37.640920',53),(55,'matheusvieira@gmail.com','Matheus Vieira','(15)66677-9090','2023-02-28 16:16:48.098247',53);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `pedido_item_pedido` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20),(21,21),(22,22),(23,23),(24,24),(25,25),(26,26),(27,27),(28,28),(29,29),(30,30),(31,31),(32,32),(33,33),(34,34),(35,35),(36,36),(37,37),(38,38),(39,39),(40,40),(41,41),(42,42),(43,43),(44,44),(45,45),(46,46),(47,47),(48,48),(49,49),(50,50),(51,51),(52,52),(37,53),(36,54),(31,55),(44,56),(10,57),(39,58),(51,59),(37,60),(19,61),(39,62),(36,63),(43,64),(32,65),(40,66),(6,67),(17,68),(52,69),(21,70),(8,71),(24,72),(34,73),(33,74),(25,75),(48,76),(18,77),(30,78),(24,79),(12,80),(21,81),(6,82),(29,83),(13,84),(22,85),(11,86),(44,87),(25,88),(2,89),(5,90),(41,91),(19,92),(36,93),(14,94),(34,95),(48,96),(35,97),(4,98),(29,99),(39,100),(5,101),(23,102),(29,103),(15,104),(40,105),(15,106),(9,107),(28,108),(48,109),(29,110),(42,111),(37,112),(2,113),(52,114),(23,115),(10,116),(49,117),(13,118),(28,119),(22,120),(44,121),(26,122),(36,123),(51,124),(41,125),(3,126),(15,127),(12,128),(38,129),(1,130),(47,131),(30,132),(40,133),(49,134),(3,135),(22,136),(12,137),(20,138),(5,139),(44,140),(48,141),(41,142),(37,143),(46,144),(8,145),(52,146),(46,147),(49,148),(12,149),(51,150),(46,151),(50,152),(18,153),(53,156),(54,157),(55,158),(55,159);
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

-- Dump completed on 2023-02-28 16:25:27
