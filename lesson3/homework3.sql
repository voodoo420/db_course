-- MySQL dump 10.13  Distrib 8.0.16, for Linux (x86_64)
--
-- Host: 192.168.43.40    Database: lesson3
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `depart`
--

DROP TABLE IF EXISTS `depart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `depart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `count` int(11) DEFAULT '0',
  `head_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `depart`
--

LOCK TABLES `depart` WRITE;
/*!40000 ALTER TABLE `depart` DISABLE KEYS */;
INSERT INTO `depart` VALUES (1,'Айти',0,NULL),(2,'Бухгалтерия',0,NULL),(3,'Маркетинг',0,NULL),(4,'Столовая',0,NULL),(5,'Охрана',0,NULL),(6,'Реклама',0,NULL),(7,'Контроль кач-ва',0,NULL),(8,'HR',0,NULL);
/*!40000 ALTER TABLE `depart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shtat`
--

DROP TABLE IF EXISTS `shtat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `shtat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dep_id` int(11) NOT NULL,
  `salary` int(11) NOT NULL,
  `position` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`lastname`),
  KEY `dept_fk` (`dep_id`),
  CONSTRAINT `dept_fk` FOREIGN KEY (`dep_id`) REFERENCES `depart` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=604 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shtat`
--

LOCK TABLES `shtat` WRITE;
/*!40000 ALTER TABLE `shtat` DISABLE KEYS */;
INSERT INTO `shtat` VALUES (1,'Тарас','Голомозый',1,25000,NULL),(2,'Евгений','Вотановский',2,35000,NULL),(3,'Алена','Звягинцева',2,45000,NULL),(4,'Владимир','Питерский',114,55000,NULL),(600,'Ирина','Кенина',2,30000,'Бухгалтер'),(601,'Анатолий','Башлыков',1,40000,'Программист'),(602,'Ольга','Вершинина',2,50000,'Главбух'),(603,'Валерий','Юрченко',1,45000,NULL);
/*!40000 ALTER TABLE `shtat` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-31 15:10:06
-- MySQL dump 10.13  Distrib 8.0.16, for Linux (x86_64)
--
-- Host: 192.168.43.40    Database: cities
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `_cities`
--

DROP TABLE IF EXISTS `_cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `_cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `important` tinyint(1) NOT NULL DEFAULT '0',
  `region_id` int(11) NOT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`title`),
  KEY `region_fk` (`region_id`),
  KEY `countries_fk_cities` (`country_id`),
  CONSTRAINT `countries_fk_cities` FOREIGN KEY (`country_id`) REFERENCES `_countries` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `region_fk` FOREIGN KEY (`region_id`) REFERENCES `_regions` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_cities`
--

LOCK TABLES `_cities` WRITE;
/*!40000 ALTER TABLE `_cities` DISABLE KEYS */;
INSERT INTO `_cities` VALUES (1,1,0,1,'Kazan'),(2,1,0,2,'Moscow'),(3,1,0,3,'Saint-Petersburg'),(4,2,0,4,'New York'),(5,2,0,5,'San Francisco'),(6,2,0,5,'Los Angeles'),(7,3,0,6,'Barcelona'),(8,3,0,7,'Madrid'),(9,3,0,8,'Ibiza'),(10,1,0,2,'Khimki'),(11,1,0,2,'Reutov'),(12,1,0,2,'Podolsk');
/*!40000 ALTER TABLE `_cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_countries`
--

DROP TABLE IF EXISTS `_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `_countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_countries`
--

LOCK TABLES `_countries` WRITE;
/*!40000 ALTER TABLE `_countries` DISABLE KEYS */;
INSERT INTO `_countries` VALUES (1,'Russia'),(3,'Spain'),(2,'Usa');
/*!40000 ALTER TABLE `_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_regions`
--

DROP TABLE IF EXISTS `_regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `_regions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`title`),
  KEY `countries_fk` (`country_id`),
  CONSTRAINT `countries_fk` FOREIGN KEY (`country_id`) REFERENCES `_countries` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_regions`
--

LOCK TABLES `_regions` WRITE;
/*!40000 ALTER TABLE `_regions` DISABLE KEYS */;
INSERT INTO `_regions` VALUES (1,1,'Tatarstan'),(2,1,'Moscow region'),(3,1,'Leningrad region'),(4,2,'New York'),(5,2,'California'),(6,3,'Catalonia'),(7,3,'Madrid'),(8,3,'Balearic Islands');
/*!40000 ALTER TABLE `_regions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-31 15:10:06
