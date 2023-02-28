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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (3,'porterpuckett180@protonmail.couk','Porter Puckett','(84)72705-7443','2022-12-07 03:42:10.000000',1),(4,'oceannixon@aol.com','Ocean Nixon','(13)86765-2908','2022-04-01 20:15:17.000000',2),(5,'biancaforbes438@outlook.org','Bianca Forbes','(47)86687-8447','2022-07-04 16:59:07.000000',3),(6,'chesterdillard@icloud.org','Chester Dillard','(79)02663-4661','2023-09-12 19:53:08.000000',4),(7,'craignewman@aol.couk','Craig Newman','(73)43772-5845','2023-12-08 10:55:54.000000',5),(8,'carlyosborne@outlook.couk','Carly Osborne','(54)22556-5382','2023-05-18 08:53:39.000000',6),(9,'calistabrewer@hotmail.com','Calista Brewer','(56)65533-6216','2024-01-08 12:39:10.000000',7),(10,'danesalinas229@protonmail.ca','Dane Salinas','(84)82556-7226','2023-08-05 07:41:04.000000',8),(11,'berkcooley@google.com','Berk Cooley','(48)08182-3101','2022-07-20 22:43:46.000000',9),(12,'destinyortiz@hotmail.net','Destiny Ortiz','(15)88392-7587','2024-01-06 01:56:28.000000',10),(13,'lesterkoch3075@protonmail.edu','Lester Koch','(58)74531-5136','2023-10-08 18:40:41.000000',11),(14,'arianaacosta4852@google.com','Ariana Acosta','(14)11035-5564','2022-06-17 23:14:18.000000',12),(15,'mageesykes4991@yahoo.ca','Magee Sykes','(42)66694-4696','2022-09-28 09:51:36.000000',13),(16,'hoytpeterson3513@protonmail.org','Hoyt Peterson','(72)36081-8560','2022-12-02 12:54:00.000000',14),(17,'rhonalangley@yahoo.edu','Rhona Langley','(44)64034-4524','2022-10-10 00:45:28.000000',15),(18,'christophercobb@google.com','Christopher Cobb','(61)36305-1031','2022-05-15 03:35:23.000000',16),(19,'isabelleaguilar@hotmail.couk','Isabelle Aguilar','(54)68502-4985','2023-03-21 13:22:51.000000',17),(20,'miapetty@google.ca','Mia Petty','(74)78674-8782','2022-04-08 13:29:55.000000',18),(21,'benedictlynch@hotmail.net','Benedict Lynch','(15)77260-3576','2022-06-25 06:06:11.000000',19),(22,'xenosknight4991@yahoo.net','Xenos Knight','(58)46653-4814','2023-06-11 16:48:12.000000',20),(23,'loisvalenzuela@hotmail.org','Lois Valenzuela','(55)52662-0178','2023-05-04 22:03:51.000000',21),(24,'elvismontoya@protonmail.edu','Elvis Montoya','(32)06837-6528','2022-11-17 11:27:03.000000',22),(25,'charleswong8244@aol.com','Charles Wong','(35)33568-1901','2023-11-03 17:23:49.000000',23),(26,'bellwilliams6202@icloud.ca','Bell Williams','(91)44920-7564','2022-05-30 12:43:59.000000',24),(27,'daijohns@protonmail.org','Dai Johns','(62)93431-7723','2022-07-22 09:04:50.000000',25),(28,'beverlyduran@aol.couk','Beverly Duran','(14)48276-7541','2022-11-11 13:17:52.000000',26),(29,'marajacobs@icloud.ca','Mara Jacobs','(57)83834-6196','2022-09-22 10:51:30.000000',27),(30,'abelnguyen@aol.net','Abel Nguyen','(78)51685-0518','2022-04-28 00:15:30.000000',28),(31,'clementinecollier3393@hotmail.net','Clementine Collier','(01)27709-3844','2022-04-17 01:10:53.000000',29),(32,'devindavidson565@yahoo.net','Devin Davidson','(98)71578-4542','2022-10-09 17:09:34.000000',30),(33,'tatyanarojas7642@outlook.net','Tatyana Rojas','(66)64707-4548','2023-12-27 18:46:43.000000',31),(34,'isaaclancaster@protonmail.edu','Isaac Lancaster','(88)42256-5690','2022-08-10 05:39:43.000000',32),(35,'brendanlindsay@protonmail.ca','Brendan Lindsay','(93)03343-0899','2022-06-15 12:30:45.000000',33),(36,'brunoserrano1789@protonmail.org','Bruno Serrano','(15)86216-8521','2022-11-11 18:20:14.000000',34),(37,'barclayfischer@hotmail.org','Barclay Fischer','(78)40154-6813','2022-06-15 01:04:05.000000',35),(38,'reaganwatkins5278@outlook.org','Reagan Watkins','(75)44077-3143','2023-07-29 02:40:25.000000',36),(39,'clarehorne@protonmail.edu','Clare Horne','(77)84937-1876','2023-11-25 16:59:52.000000',37),(40,'cassadymcgowan7814@icloud.org','Cassady Mcgowan','(64)53015-1681','2023-07-11 06:33:55.000000',38),(41,'glorialarsen4145@protonmail.com','Gloria Larsen','(03)13166-1792','2023-05-01 05:10:16.000000',39),(42,'ingacontreras@google.edu','Inga Contreras','(46)77855-4371','2022-08-05 01:53:59.000000',40),(43,'dantehurley7747@outlook.com','Dante Hurley','(65)81372-9337','2022-03-29 00:19:08.000000',41),(44,'oscarmiller@outlook.edu','Oscar Miller','(63)28492-2737','2023-10-29 03:24:51.000000',42),(45,'audraknapp1284@icloud.net','Audra Knapp','(39)88828-5136','2022-03-18 13:07:40.000000',43),(46,'basiakaufman@outlook.edu','Basia Kaufman','(64)46751-8670','2023-05-16 00:02:20.000000',44),(47,'prescottaguirre3412@icloud.net','Prescott Aguirre','(77)40374-1532','2022-10-25 02:24:04.000000',45),(48,'dariaperkins8589@aol.couk','Daria Perkins','(15)21608-9868','2022-05-25 14:35:41.000000',46),(49,'mackenziecannon@outlook.ca','MacKenzie Cannon','(54)16580-1276','2023-12-30 03:46:52.000000',47),(50,'irmahowell8376@hotmail.net','Irma Howell','(11)38275-5705','2022-10-11 08:36:40.000000',48),(51,'stacyware@google.org','Stacy Ware','(62)56663-2816','2022-04-17 01:09:49.000000',49),(52,'normanblack8186@icloud.com','Norman Black','(11)23364-8216','2022-09-22 15:14:09.000000',50);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
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
