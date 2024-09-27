-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: horsecompany
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment` (
  `id` bigint unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `amount` bigint NOT NULL,
  `costper` bigint NOT NULL,
  `stablecode` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `equipment_stablecode_foreign` (`stablecode`),
  CONSTRAINT `equipment_stablecode_foreign` FOREIGN KEY (`stablecode`) REFERENCES `stable` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
INSERT INTO `equipment` VALUES (11111,'Sadul',14,64,'5'),(21111,'Sadul',14,64,'2'),(22222,'Vihmatekk',4,34,'5A'),(24444,'Kaitsmed',16,54,'5'),(33333,'Kabja',38,14,'7'),(36663,'Kabja',38,14,'7'),(44444,'Kaitsmed',16,54,'7A'),(55555,'Vihmatekk',4,34,'5A');
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `health`
--

DROP TABLE IF EXISTS `health`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `health` (
  `id` bigint NOT NULL,
  `horseid` bigint unsigned DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `horseid` (`horseid`),
  CONSTRAINT `health_ibfk_1` FOREIGN KEY (`horseid`) REFERENCES `horse` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `health`
--

LOCK TABLES `health` WRITE;
/*!40000 ALTER TABLE `health` DISABLE KEYS */;
INSERT INTO `health` VALUES (587878,24,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi eget placerat eros. Curabitur auctor efficitur bibendum.'),(687878,25,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi eget placerat eros. Curabitur auctor efficitur bibendum.'),(786668,32,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi eget placerat eros. Curabitur auctor efficitur bibendum.'),(787855,23,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi eget placerat eros. Curabitur auctor efficitur bibendum.'),(787866,23,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi eget placerat eros. Curabitur auctor efficitur bibendum.'),(787878,23,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi eget placerat eros. Curabitur auctor efficitur bibendum.');
/*!40000 ALTER TABLE `health` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horse`
--

DROP TABLE IF EXISTS `horse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horse` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `birthyear` bigint NOT NULL,
  `ownerid` bigint unsigned NOT NULL,
  `stablecode` varchar(255) NOT NULL,
  `trainingcode` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `horse_ownerid_foreign` (`ownerid`),
  KEY `horse_stablecode_foreign` (`stablecode`),
  KEY `horse_trainingcode_foreign` (`trainingcode`),
  CONSTRAINT `horse_ownerid_foreign` FOREIGN KEY (`ownerid`) REFERENCES `owner` (`id`),
  CONSTRAINT `horse_stablecode_foreign` FOREIGN KEY (`stablecode`) REFERENCES `stable` (`code`),
  CONSTRAINT `horse_trainingcode_foreign` FOREIGN KEY (`trainingcode`) REFERENCES `training` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horse`
--

LOCK TABLES `horse` WRITE;
/*!40000 ALTER TABLE `horse` DISABLE KEYS */;
INSERT INTO `horse` VALUES (22,'Kaine',2010,178,'7','RACE'),(23,'Kahli',2010,178,'7','RACE'),(24,'Kalina',2011,278,'5','JUMP'),(25,'Kalondra',2012,378,'5','JUMP'),(26,'Kar Kalim',2013,178,'2','JUMP'),(27,'Karisha',2014,478,'2','RACE'),(29,'Katareena',2015,678,'2','RACE'),(30,'Katifa',2016,878,'7A','JUMP'),(31,'Kayleigh',2011,978,'7A','JUMP'),(32,'Keener Than Keen',2012,278,'7A','RACE'),(33,'Kei',2013,378,'7A','JUMP'),(34,'Kellendria',2017,478,'7B','JUMP'),(35,'Kelly Green',2012,576,'7B','PRANCE'),(36,'Kelvin',2009,576,'7B','PRANCE'),(37,'Keno',2011,576,'5A','PRANCE'),(38,'Kentucky Roses',2010,878,'5A','RACE'),(39,'Kermit',2014,978,'5A','RACE'),(40,'Kevah',2012,598,'5','RACE'),(41,'Kiawa',2017,598,'5','PRANCE'),(42,'King',2008,598,'2','PRANCE'),(43,'King Quackers crystal',2007,598,'2','PRANCE'),(44,'Kings ransom',2014,598,'2','PRANCE'),(45,'Kipawa',2017,586,'7B','PRANCE'),(46,'Kirby',2011,586,'5A','PRANCE'),(47,'Kiss',2010,586,'5','PRANCE'),(48,'Kiss Me Clown',2016,586,'5','GALLOP'),(49,'Kissin the Sky',2015,586,'5','GALLOP'),(50,'Kit Kat\'s Chat',2014,586,'2','GALLOP'),(51,'Kitty Hawk',2011,586,'2','GALLOP'),(52,'Kizi',2017,178,'2','GALLOP'),(53,'Knight',2011,178,'7A','GALLOP'),(54,'Kochiese',2019,178,'7','GALLOP'),(55,'Kodiak',2018,178,'7','GALLOP');
/*!40000 ALTER TABLE `horse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owner`
--

DROP TABLE IF EXISTS `owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owner` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` bigint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=979 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owner`
--

LOCK TABLES `owner` WRITE;
/*!40000 ALTER TABLE `owner` DISABLE KEYS */;
INSERT INTO `owner` VALUES (178,'Paavo Neihaus','Lee tee 16',96897609),(278,'Reet Romanjuk','Pee 12',86897609),(378,'Oskar Vallik','Tee 12',26897609),(478,'Mihkel Soo','Punane tee 12',66897609),(576,'Aadu Laid','Punane tee 12',76897609),(586,'Ester Teeveer','Punane tee 12',46897609),(598,'Raul Väli','Piire tee 52',16897609),(678,'Carina Romano Ciaro','Kiir tee 12',76897609),(878,'Karin Hallas','Punane tee 12',76897609),(978,'Aadu Laid','Puhangu 12',76897609);
/*!40000 ALTER TABLE `owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stable`
--

DROP TABLE IF EXISTS `stable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stable` (
  `code` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `upkeep` bigint unsigned NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stable`
--

LOCK TABLES `stable` WRITE;
/*!40000 ALTER TABLE `stable` DISABLE KEYS */;
INSERT INTO `stable` VALUES ('2','Vormsi',809),('5','Tallinn',609),('5A','Tallinn',509),('7','Haapsalu',1209),('7A','Haapsalu',1209),('7B','Haapsalu',1809);
/*!40000 ALTER TABLE `stable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainer`
--

DROP TABLE IF EXISTS `trainer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainer` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `phone` bigint NOT NULL,
  `address` varchar(255) NOT NULL,
  `pay` bigint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainer`
--

LOCK TABLES `trainer` WRITE;
/*!40000 ALTER TABLE `trainer` DISABLE KEYS */;
INSERT INTO `trainer` VALUES (1111,'Sirru Mirru',52078789,'Puhangu 12',1103),(7227,'Mirru Sirru',61078789,'Punane Tee 12',1103),(7777,'Mirru Sirru',12078789,'Punane Tee 12',1103),(8888,'Kirru Sirru',32078789,'Punane 12',1103),(9999,'Kirru Mirru',42078789,'Tee 12',1103);
/*!40000 ALTER TABLE `trainer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training`
--

DROP TABLE IF EXISTS `training`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `training` (
  `code` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `trainerid` bigint unsigned NOT NULL,
  PRIMARY KEY (`code`),
  KEY `training_trainerid_foreign` (`trainerid`),
  CONSTRAINT `training_trainerid_foreign` FOREIGN KEY (`trainerid`) REFERENCES `trainer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training`
--

LOCK TABLES `training` WRITE;
/*!40000 ALTER TABLE `training` DISABLE KEYS */;
INSERT INTO `training` VALUES ('GALLOP','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque elementum mauris ut nisl laoreet, ac scelerisque odio tempor. Aliquam ut nulla nec tellus auctor aliquet.',9999),('JUMP','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque elementum mauris ut nisl laoreet, ac scelerisque odio tempor. Aliquam ut nulla nec tellus auctor aliquet.',8888),('PRANCE','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque elementum mauris ut nisl laoreet, ac scelerisque odio tempor. Aliquam ut nulla nec tellus auctor aliquet.',1111),('RACE','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque elementum mauris ut nisl laoreet, ac scelerisque odio tempor. Aliquam ut nulla nec tellus auctor aliquet.',7777);
/*!40000 ALTER TABLE `training` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-27 10:28:40
