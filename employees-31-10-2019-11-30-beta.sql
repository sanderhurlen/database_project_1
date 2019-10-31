-- MySQL dump 10.16  Distrib 10.2.27-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_24
-- ------------------------------------------------------
-- Server version	10.2.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `hourlycost` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Elissa Funk',2),(2,'Al Olson',6),(3,'Reina Kub',4),(4,'Lauretta Bogan',1),(5,'Godfrey Kunze DDS',2),(6,'Hosea Kilback',8),(7,'Maymie Kihn',1),(8,'Demarcus Kemmer',2),(9,'Emie Dickens',5),(10,'Mr. Allen Mosciski V',5),(11,'Flo Stroman Jr.',2),(12,'Dr. Jillian Langosh',3),(13,'Prof. Johanna Emard MD',2),(14,'Cleveland Ziemann',1),(15,'Filomena Farrell Sr.',7),(16,'Prof. Benton Toy',4),(17,'Ona Schamberger',3),(18,'Trisha Hoppe',4),(19,'Alvah Hoeger PhD',6),(20,'Mrs. Jacky Kuphal Sr.',2),(21,'Mr. Titus Kuvalis Jr.',4),(22,'Mrs. Estelle Beier',2),(23,'Mr. Jamie Blick V',9),(24,'Carmella Runolfsdottir',9),(25,'Isaac Kirlin',9),(26,'Mitchel Muller I',2),(27,'Eudora Terry',7),(28,'Jena Braun',2),(29,'Constance Lehner',3),(30,'Mrs. Clara Osinski I',3),(31,'Will Runte',5),(32,'Mandy Hudson',2),(33,'Iva Reilly',2),(34,'Dallas Donnelly',4),(35,'Miss Jackeline Thiel DDS',4),(36,'Major Schuppe',2),(37,'Ms. Maud Conroy',9),(38,'Lonzo Haley',6),(39,'Mr. Lewis Schmitt',2),(40,'Damien Stark',1),(41,'Garrison Wilderman',3),(42,'Mrs. Nelda Farrell Sr.',7),(43,'Bert Doyle',3),(44,'Lulu Daugherty',6),(45,'Pamela Krajcik DVM',6),(46,'Mr. Mortimer Erdman',2),(47,'Demarco Ratke',5),(48,'Zora Mante',1),(49,'Dr. Missouri McGlynn Sr.',5),(50,'Dr. Owen Volkman II',9);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-31 11:30:53
