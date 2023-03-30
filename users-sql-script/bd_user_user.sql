-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: bd_user
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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(40) NOT NULL,
  `session_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'matheus.vieira','1234','matheus@gmail.com','A7D7BF6ECCC224753E61CE45C6480E1B'),(2,'aslorach2r','DMCGrkIBz','kcrookshank2r@themeforest.net',NULL),(3,'rrotherforth1','nvvA1vSHFFM','lsaladino1@chronoengine.com',NULL),(4,'wdeamaya2','3pAkiCL4ZJ','redgcumbe2@dion.ne.jp',NULL),(5,'tbissell3','irYAlD7bd','avedikhov3@theguardian.com',NULL),(6,'mhick4','KhhipO','awimpeney4@comsenz.com',NULL),(7,'gseekings5','vxwUdquH19','kelfes5@sciencedaily.com',NULL),(8,'ejollands6','4YvHlxDS','mdobrowolny6@cdbaby.com',NULL),(9,'achristofol7','oHfvsr','jglyn7@forbes.com',NULL),(10,'jtuley8','cV2uvNzWOOmo','stoland8@opensource.org',NULL),(11,'rconws9','uiOEUf3qM','epeck9@wufoo.com',NULL),(12,'kdrinana','RszhVmCSm','beasona@miitbeian.gov.cn',NULL),(13,'vsapseedb','kRuyxZTE7fh','ralderwickb@noaa.gov',NULL),(14,'eosmarc','04HC5MSy','cbettlesc@ebay.com',NULL),(15,'twynchd','nIy0xZh','nsleithd@cam.ac.uk',NULL),(16,'adegoye','AUemYlwoqzS','lmcilriache@scientificamerican.com',NULL),(17,'abrahamf','btVnwKZkRhqq','enicolf@paypal.com',NULL),(18,'lmullerg','ZZ0buRn','dspanswickg@slashdot.org',NULL),(19,'gmadiganh','zC1tMC6KyS','mboundeh@icio.us',NULL),(20,'tmacavddyi','SiCIUQFHkJv','rgommi@123-reg.co.uk',NULL),(21,'kchatanj','G37a0cB9zKR','jraitj@amazon.co.jp',NULL),(22,'nfaragank','tFfH7wU','wbernaertk@cnet.com',NULL),(23,'rcornforthl','na3cDjOg','pfransesl@yale.edu',NULL),(24,'esilvertonm','eLxQbr','gcornm@discuz.net',NULL),(25,'lrycroftn','1cN9KcNSQ3f','rblythingn@github.io',NULL),(26,'mstaintono','ND9m519a','lloudo@example.com',NULL),(27,'dtronip','ZZEwZMeUxvg','ebeehop@rambler.ru',NULL),(28,'treihmq','oWyZwQ8xN','sfassonq@wisc.edu',NULL),(29,'nmellonbyr','8gyyQgZ','ajester@addthis.com',NULL),(30,'mfugeres','0ZN2KJY','ncoughlans@theguardian.com',NULL),(31,'mestabrookt','PBtoygA','nlightwoodt@latimes.com',NULL),(32,'cyakobu','3zz2Hpqn','cstanfieldu@cnet.com',NULL),(33,'sambrosettiv','IJIOkO5','dworsnipv@japanpost.jp',NULL),(34,'ebreinlw','Sh1G7z8oIo','edarellw@bbb.org',NULL),(35,'tsyddonx','5KNnWmsHK','dswadlenx@sun.com',NULL),(36,'wlucyy','NezOCREmUD','jmeelandy@army.mil',NULL),(37,'gpeealessz','CZIAaa','gcohalanz@ucoz.ru',NULL),(38,'myann10','OabLx3YuKE6C','tpessler10@cbsnews.com',NULL),(39,'wboutflour11','EDu685CI9','abanbrick11@hp.com',NULL),(40,'dballance12','P1aAjKKoXvFs','lnewman12@networksolutions.com',NULL),(41,'tallsupp13','rZnBwkWGl','hdightham13@quantcast.com',NULL),(42,'abeagley14','WWQbyhvMAjv','hkench14@joomla.org',NULL),(43,'ksleite15','03sN9Dt5U9oG','hcovolini15@miibeian.gov.cn',NULL),(44,'smullin16','jxUtrYZ','amckerley16@buzzfeed.com',NULL),(45,'aloiseau17','Q2le50','usignoret17@google.cn',NULL),(46,'vraxworthy18','VJn92fILZc','lsimeon18@umich.edu',NULL),(47,'hbickers19','5LDC42e2EF','ashalcras19@is.gd',NULL),(48,'dflinders1a','CsPef2Jb','ajerome1a@oakley.com',NULL),(49,'sogilby1b','N9Du6L','dholligan1b@spiegel.de',NULL),(50,'jparadine1c','btznf0wmLwA','ibrignell1c@umn.edu',NULL),(51,'mpenton1d','jC5Hp2nqmpp','rtrunby1d@webmd.com',NULL),(52,'trubbert1e','Wk7Y4LO8o9G','tfarnin1e@microsoft.com',NULL),(53,'jconklin1f','m4ptCdbWj6','ahatliff1f@yahoo.com',NULL),(54,'dmccoy1g','pPviiM8C','emacalester1g@amazon.com',NULL),(55,'poldham1h','RYksUC','mmcgrae1h@histats.com',NULL),(56,'lprew1i','8zuXM0ORY','dbruggen1i@illinois.edu',NULL),(57,'kbolles1j','5p0oM9M0PWO','mpowell1j@360.cn',NULL),(58,'pmeredith1k','IOapUH7p4y3','nbartels1k@posterous.com',NULL),(59,'fluddy1l','kJe1px1u0FI','lpyle1l@prweb.com',NULL),(60,'gingolotti1m','QIzkYnUyMR1','mweatherill1m@examiner.com',NULL),(61,'ppordal1n','6R7kmKUa7','ntesche1n@twitpic.com',NULL),(62,'rwhiles1o','rGhT1p0u','zaskem1o@latimes.com',NULL),(63,'tdavis1p','pNeTIatvcB','lkonertz1p@simplemachines.org',NULL),(64,'dpreuvost1q','CROyYNIQ','gfrearson1q@google.fr',NULL),(65,'amcneilley1r','WWr5Yv7lR','bboustred1r@biblegateway.com',NULL),(66,'plouder1s','r8Ge9FS2b','blamping1s@upenn.edu',NULL),(67,'cdaid1t','Mv3wPQLY','llaroux1t@bing.com',NULL),(68,'brhydderch1u','RaHVwAqV8W','dwanklin1u@godaddy.com',NULL),(69,'cgilardoni1v','XG9lgw','gmazey1v@berkeley.edu',NULL),(70,'bvanderwalt1w','02vRlLBrBTC','mcorneliussen1w@vistaprint.com',NULL),(71,'clockner1x','2iVd3QcDC','aphalp1x@trellian.com',NULL),(72,'sboulter1y','bczzUZjV','atyre1y@webmd.com',NULL),(73,'aspratling1z','9aRQfDGb7','clindermann1z@zimbio.com',NULL),(74,'mpocknoll20','2Euh9KY0E','abennellick20@devhub.com',NULL),(75,'amcnutt21','S9bACO','gbaudry21@w3.org',NULL),(76,'lshearstone22','x9gTpIe','bworsam22@chron.com',NULL),(77,'bmcreidy23','gwipFh8','myellowlee23@stumbleupon.com',NULL),(78,'bizkoveski24','NubuEvy67','bhagan24@dot.gov',NULL),(79,'lpinel25','rJJe7PjRw','amoncrefe25@senate.gov',NULL),(80,'gwestberg26','7DT6ufaIp','jorgan26@360.cn',NULL),(81,'emikalski27','grHDiUb','sskerme27@mapy.cz',NULL),(82,'tcroft28','k8CKln0j6sl','jbuckles28@gov.uk',NULL),(83,'tlittlecote29','QkN6i2X','ekivits29@bloomberg.com',NULL),(84,'rrilton2a','CWs0MdWkbv','mrubinchik2a@bloglines.com',NULL),(85,'eweatherall2b','HIXnPaVVaN','afullegar2b@marketwatch.com',NULL),(86,'cvernham2c','wd6tqj','fhaddacks2c@princeton.edu',NULL),(87,'mdebrett2d','luDBk59ttgk','sdarlington2d@photobucket.com',NULL),(88,'nendrizzi2e','AJudkr','tposchel2e@businessweek.com',NULL),(89,'jbenyan2f','wIc0jvJEJPuD','mflieger2f@sogou.com',NULL),(90,'skluger2g','myweTiP2r','jknell2g@reddit.com',NULL),(91,'lalvin2h','2NJxH93TP','mfrangello2h@ezinearticles.com',NULL),(92,'sjeacock2i','DNB1YTo52BF','ewabey2i@nps.gov',NULL),(93,'ppile2j','OeZxrD','acourtonne2j@thetimes.co.uk',NULL),(94,'lpondjones2k','3RbszaeJ','dmcowis2k@sakura.ne.jp',NULL),(95,'mkinneir2l','DxpRRZz6hTZ','dglacken2l@youtu.be',NULL),(96,'ccumo2m','2RChCKbU8LAi','edachey2m@loc.gov',NULL),(97,'rduplain2n','rpt45IAA','vbenham2n@fda.gov',NULL),(98,'fdeeble2o','6whsKv9z0','ngashion2o@yelp.com',NULL),(99,'csoughton2p','Xftar1FB3by','marchibald2p@nhs.uk',NULL),(100,'bragate2q','ImyOSNU','lheadan2q@eepurl.com',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-30 16:53:08
