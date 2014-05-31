-- MySQL dump 10.13  Distrib 5.5.34, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: ROM
-- ------------------------------------------------------
-- Server version	5.5.34-0ubuntu0.13.04.1

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
-- Current Database: `ROM`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ROM` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `ROM`;

--
-- Table structure for table `DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(63) NOT NULL,
  `AUTHOR` varchar(63) NOT NULL,
  `FILENAME` varchar(200) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`,`AUTHOR`,`FILENAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` tinyint(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES (1,0,NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cocina`
--

DROP TABLE IF EXISTS `cocina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cocina` (
  `id` bigint(20) NOT NULL,
  `restaurant_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKAF3A8F05CA164B98` (`restaurant_id`),
  CONSTRAINT `FKAF3A8F05CA164B98` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cocina`
--

LOCK TABLES `cocina` WRITE;
/*!40000 ALTER TABLE `cocina` DISABLE KEYS */;
INSERT INTO `cocina` VALUES (3,1),(4,1);
/*!40000 ALTER TABLE `cocina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consumible`
--

DROP TABLE IF EXISTS `consumible`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consumible` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `activo` bit(1) NOT NULL,
  `detalle` varchar(255) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `subrubro_id` bigint(20) NOT NULL,
  `class` varchar(255) NOT NULL,
  `a_cocina` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKF619015B947CCEB8` (`subrubro_id`),
  CONSTRAINT `FKF619015B947CCEB8` FOREIGN KEY (`subrubro_id`) REFERENCES `subrubro` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consumible`
--

LOCK TABLES `consumible` WRITE;
/*!40000 ALTER TABLE `consumible` DISABLE KEYS */;
INSERT INTO `consumible` VALUES (1,0,'','Plato de langostinos','Langostinos',1,'rom.Consumicion','\0'),(2,0,'','Plato de tomates rellenos','Tomates Rellenos',1,'rom.Consumicion','\0'),(3,0,'','Ensalada','Mayonesa de ave o atún',1,'rom.Consumicion','\0'),(4,0,'','Empanadas fritas','Empanadas',2,'rom.Consumicion','\0'),(5,0,'','Porcion de rabas','Rabas',2,'rom.Consumicion','\0'),(6,0,'','Provoletas','Provoleta',2,'rom.Consumicion','\0'),(7,0,'','Tira de asado a la parrilla','Tira de asado',3,'rom.Consumicion','\0'),(8,0,'','Bife de costilla a la parrilla','Bife de costilla',3,'rom.Consumicion','\0'),(9,0,'','Chorizo a la parrilla','Chorizo',3,'rom.Consumicion','\0'),(10,0,'','Morcilla a la parrilla','Mocilla',3,'rom.Consumicion','\0'),(11,0,'','Pollo a la parrilla','Pollo',3,'rom.Consumicion','\0'),(12,0,'','Fideos caseros','Tallarines',4,'rom.Consumicion','\0'),(13,0,'','Ravioles de ricota y verdura','Ravioles',4,'rom.Consumicion','\0'),(14,0,'','Sorrentinos de jamón y queso','Sorrentinos',4,'rom.Consumicion','\0'),(15,0,'','Salsa de tomate y carne','Salsa Bolognesa',4,'rom.Agregado',NULL),(16,0,'','Salsa con 4 quesos','Salsa cuatro quesos',4,'rom.Agregado',NULL),(17,0,'','Salsa con crema','Gran Carusso',4,'rom.Agregado',NULL),(18,0,'','Línea Coca','Gaseosa',5,'rom.Consumicion','\0'),(19,0,'','Villa del Sur','Agua Mineral',5,'rom.Consumicion','\0'),(20,0,'','Botella','Don Valentín Lacrado',6,'rom.Consumicion','\0'),(21,0,'','Botella','Valmont',6,'rom.Consumicion','\0'),(22,0,'','Botella','Latitud 33',6,'rom.Consumicion','\0'),(23,0,'','Torta de limón y merengue','Lemon pie',7,'rom.Consumicion','\0'),(24,0,'','Torta de chocolate','Selva Negra',7,'rom.Consumicion','\0'),(25,0,'','Helado a gusto','Bochas',8,'rom.Consumicion','\0'),(26,0,'','Helado de americana cubierto por almendras','Almendrado',8,'rom.Consumicion','\0');
/*!40000 ALTER TABLE `consumible` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `duenio`
--

DROP TABLE IF EXISTS `duenio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `duenio` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `duenio`
--

LOCK TABLES `duenio` WRITE;
/*!40000 ALTER TABLE `duenio` DISABLE KEYS */;
INSERT INTO `duenio` VALUES (2,'test@test.com');
/*!40000 ALTER TABLE `duenio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mesa`
--

DROP TABLE IF EXISTS `mesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mesa` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `abierta` bit(1) NOT NULL,
  `activo` bit(1) NOT NULL,
  `capacidad` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `restaurant_id` bigint(20) NOT NULL,
  `class` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3315E6CA164B98` (`restaurant_id`),
  CONSTRAINT `FK3315E6CA164B98` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesa`
--

LOCK TABLES `mesa` WRITE;
/*!40000 ALTER TABLE `mesa` DISABLE KEYS */;
INSERT INTO `mesa` VALUES (1,388,'\0','',4,1,1,'rom.MesaUnitaria'),(2,0,'\0','',4,2,1,'rom.MesaUnitaria'),(3,0,'\0','',4,3,1,'rom.MesaUnitaria'),(4,0,'\0','',4,4,1,'rom.MesaUnitaria'),(5,0,'\0','',4,5,1,'rom.MesaUnitaria'),(6,2,'\0','\0',4,1,1,'rom.MesaComposite'),(7,2,'\0','\0',4,1,1,'rom.MesaComposite'),(8,2,'\0','\0',4,1,1,'rom.MesaComposite'),(9,2,'\0','\0',4,1,1,'rom.MesaComposite'),(10,2,'\0','\0',4,1,1,'rom.MesaComposite'),(11,2,'\0','\0',4,1,1,'rom.MesaComposite'),(12,2,'\0','\0',4,1,1,'rom.MesaComposite'),(13,2,'\0','\0',4,1,1,'rom.MesaComposite'),(14,2,'\0','\0',4,1,1,'rom.MesaComposite'),(15,2,'\0','\0',4,1,1,'rom.MesaComposite'),(16,2,'\0','\0',4,1,1,'rom.MesaComposite'),(17,2,'\0','\0',4,1,1,'rom.MesaComposite'),(18,2,'\0','\0',4,1,1,'rom.MesaComposite'),(19,2,'\0','\0',4,1,1,'rom.MesaComposite'),(20,2,'\0','\0',4,1,1,'rom.MesaComposite'),(21,2,'\0','\0',4,1,1,'rom.MesaComposite'),(22,2,'\0','\0',4,1,1,'rom.MesaComposite'),(23,2,'\0','\0',4,1,1,'rom.MesaComposite'),(24,2,'\0','\0',4,1,1,'rom.MesaComposite'),(25,2,'\0','\0',4,1,1,'rom.MesaComposite'),(26,2,'\0','\0',4,1,1,'rom.MesaComposite'),(27,2,'\0','\0',4,1,1,'rom.MesaComposite'),(28,2,'\0','\0',4,1,1,'rom.MesaComposite'),(29,2,'\0','\0',4,1,1,'rom.MesaComposite'),(30,2,'\0','\0',4,1,1,'rom.MesaComposite'),(31,2,'\0','\0',4,1,1,'rom.MesaComposite'),(32,2,'\0','\0',4,1,1,'rom.MesaComposite'),(33,2,'\0','\0',4,1,1,'rom.MesaComposite'),(34,2,'\0','\0',4,1,1,'rom.MesaComposite'),(35,2,'\0','\0',4,1,1,'rom.MesaComposite'),(36,2,'\0','\0',4,1,1,'rom.MesaComposite'),(37,2,'\0','\0',4,1,1,'rom.MesaComposite'),(38,2,'\0','\0',4,1,1,'rom.MesaComposite'),(39,2,'\0','\0',4,1,1,'rom.MesaComposite'),(40,2,'\0','\0',4,1,1,'rom.MesaComposite'),(41,2,'\0','\0',4,1,1,'rom.MesaComposite'),(42,2,'\0','\0',4,1,1,'rom.MesaComposite'),(43,2,'\0','\0',4,1,1,'rom.MesaComposite'),(44,2,'\0','\0',4,1,1,'rom.MesaComposite'),(45,2,'\0','\0',4,1,1,'rom.MesaComposite'),(46,2,'\0','\0',4,1,1,'rom.MesaComposite'),(47,2,'\0','\0',4,1,1,'rom.MesaComposite'),(48,2,'\0','\0',4,1,1,'rom.MesaComposite'),(49,2,'\0','\0',4,1,1,'rom.MesaComposite'),(50,2,'\0','\0',4,1,1,'rom.MesaComposite'),(51,2,'\0','\0',4,1,1,'rom.MesaComposite'),(52,2,'\0','\0',4,1,1,'rom.MesaComposite'),(53,2,'\0','\0',4,1,1,'rom.MesaComposite'),(54,2,'\0','\0',4,1,1,'rom.MesaComposite'),(55,2,'\0','\0',4,1,1,'rom.MesaComposite'),(56,2,'\0','\0',4,1,1,'rom.MesaComposite'),(57,2,'\0','\0',4,1,1,'rom.MesaComposite'),(58,2,'\0','\0',4,1,1,'rom.MesaComposite'),(59,2,'\0','\0',4,1,1,'rom.MesaComposite'),(60,2,'\0','\0',4,1,1,'rom.MesaComposite'),(61,2,'\0','\0',4,1,1,'rom.MesaComposite'),(62,2,'\0','\0',4,1,1,'rom.MesaComposite'),(63,2,'\0','\0',4,1,1,'rom.MesaComposite'),(64,2,'\0','\0',4,1,1,'rom.MesaComposite'),(65,2,'\0','\0',4,1,1,'rom.MesaComposite'),(66,2,'\0','\0',4,1,1,'rom.MesaComposite'),(67,2,'\0','\0',4,1,1,'rom.MesaComposite'),(68,2,'\0','\0',4,1,1,'rom.MesaComposite'),(69,2,'\0','\0',4,1,1,'rom.MesaComposite'),(70,2,'\0','\0',4,1,1,'rom.MesaComposite'),(71,2,'\0','\0',4,1,1,'rom.MesaComposite'),(72,2,'\0','\0',4,1,1,'rom.MesaComposite'),(73,2,'\0','\0',4,1,1,'rom.MesaComposite'),(74,2,'\0','\0',4,1,1,'rom.MesaComposite'),(75,2,'\0','\0',4,1,1,'rom.MesaComposite'),(76,2,'\0','\0',4,1,1,'rom.MesaComposite'),(77,2,'\0','\0',4,1,1,'rom.MesaComposite'),(78,2,'\0','\0',4,1,1,'rom.MesaComposite'),(79,2,'\0','\0',4,1,1,'rom.MesaComposite'),(80,2,'\0','\0',4,1,1,'rom.MesaComposite'),(81,2,'\0','\0',4,1,1,'rom.MesaComposite'),(82,2,'\0','\0',4,1,1,'rom.MesaComposite'),(83,2,'\0','\0',4,1,1,'rom.MesaComposite'),(84,2,'\0','\0',4,1,1,'rom.MesaComposite'),(85,2,'\0','\0',4,1,1,'rom.MesaComposite'),(86,2,'\0','\0',4,1,1,'rom.MesaComposite'),(87,2,'\0','\0',4,1,1,'rom.MesaComposite'),(88,2,'\0','\0',4,1,1,'rom.MesaComposite'),(89,2,'\0','\0',4,1,1,'rom.MesaComposite'),(90,2,'\0','\0',4,1,1,'rom.MesaComposite'),(91,2,'\0','\0',4,1,1,'rom.MesaComposite'),(92,2,'\0','\0',4,1,1,'rom.MesaComposite'),(93,2,'\0','\0',4,1,1,'rom.MesaComposite'),(94,2,'\0','\0',4,1,1,'rom.MesaComposite'),(95,2,'\0','\0',4,1,1,'rom.MesaComposite'),(96,2,'\0','\0',4,1,1,'rom.MesaComposite'),(97,2,'\0','\0',4,1,1,'rom.MesaComposite'),(98,2,'\0','\0',4,1,1,'rom.MesaComposite'),(99,2,'\0','\0',4,1,1,'rom.MesaComposite'),(100,2,'\0','\0',4,1,1,'rom.MesaComposite'),(101,2,'\0','\0',4,1,1,'rom.MesaComposite'),(102,2,'\0','\0',4,1,1,'rom.MesaComposite'),(103,2,'\0','\0',4,1,1,'rom.MesaComposite'),(104,2,'\0','\0',4,1,1,'rom.MesaComposite'),(105,2,'\0','\0',4,1,1,'rom.MesaComposite'),(106,2,'\0','\0',4,1,1,'rom.MesaComposite'),(107,2,'\0','\0',4,1,1,'rom.MesaComposite'),(108,2,'\0','\0',4,1,1,'rom.MesaComposite'),(109,2,'\0','\0',4,1,1,'rom.MesaComposite'),(110,2,'\0','\0',4,1,1,'rom.MesaComposite'),(111,2,'\0','\0',4,1,1,'rom.MesaComposite'),(112,2,'\0','\0',4,1,1,'rom.MesaComposite'),(113,2,'\0','\0',4,1,1,'rom.MesaComposite'),(114,2,'\0','\0',4,1,1,'rom.MesaComposite'),(115,2,'\0','\0',4,1,1,'rom.MesaComposite'),(116,2,'\0','\0',4,1,1,'rom.MesaComposite'),(117,2,'\0','\0',4,1,1,'rom.MesaComposite'),(118,2,'\0','\0',4,1,1,'rom.MesaComposite'),(119,2,'\0','\0',4,1,1,'rom.MesaComposite'),(120,2,'\0','\0',4,1,1,'rom.MesaComposite'),(121,2,'\0','\0',4,1,1,'rom.MesaComposite'),(122,2,'\0','\0',4,1,1,'rom.MesaComposite'),(123,2,'\0','\0',4,1,1,'rom.MesaComposite'),(124,2,'\0','\0',4,1,1,'rom.MesaComposite'),(125,2,'\0','\0',4,1,1,'rom.MesaComposite'),(126,2,'\0','\0',4,1,1,'rom.MesaComposite'),(127,2,'\0','\0',4,1,1,'rom.MesaComposite'),(128,2,'\0','\0',4,1,1,'rom.MesaComposite'),(129,2,'\0','\0',4,1,1,'rom.MesaComposite'),(130,2,'\0','\0',4,1,1,'rom.MesaComposite'),(131,2,'\0','\0',4,1,1,'rom.MesaComposite'),(132,2,'\0','\0',4,1,1,'rom.MesaComposite'),(133,2,'\0','\0',4,1,1,'rom.MesaComposite'),(134,2,'\0','\0',4,1,1,'rom.MesaComposite'),(135,2,'\0','\0',4,1,1,'rom.MesaComposite'),(136,2,'\0','\0',4,1,1,'rom.MesaComposite'),(137,2,'\0','\0',4,1,1,'rom.MesaComposite'),(138,2,'\0','\0',4,1,1,'rom.MesaComposite'),(139,2,'\0','\0',4,1,1,'rom.MesaComposite'),(140,2,'\0','\0',4,1,1,'rom.MesaComposite'),(141,2,'\0','\0',4,1,1,'rom.MesaComposite'),(142,2,'\0','\0',4,1,1,'rom.MesaComposite'),(143,2,'\0','\0',4,1,1,'rom.MesaComposite'),(144,2,'\0','\0',4,1,1,'rom.MesaComposite'),(145,2,'\0','\0',4,1,1,'rom.MesaComposite'),(146,2,'\0','\0',4,1,1,'rom.MesaComposite'),(147,2,'\0','\0',4,1,1,'rom.MesaComposite'),(148,2,'\0','\0',4,1,1,'rom.MesaComposite'),(149,2,'\0','\0',4,1,1,'rom.MesaComposite'),(150,2,'\0','\0',4,1,1,'rom.MesaComposite'),(151,2,'\0','\0',4,1,1,'rom.MesaComposite'),(152,2,'\0','\0',4,1,1,'rom.MesaComposite'),(153,2,'\0','\0',4,1,1,'rom.MesaComposite'),(154,2,'\0','\0',4,1,1,'rom.MesaComposite'),(155,2,'\0','\0',4,1,1,'rom.MesaComposite'),(156,2,'\0','\0',4,1,1,'rom.MesaComposite'),(157,2,'\0','\0',4,1,1,'rom.MesaComposite'),(158,2,'\0','\0',4,1,1,'rom.MesaComposite'),(159,2,'\0','\0',4,1,1,'rom.MesaComposite'),(160,2,'\0','\0',4,1,1,'rom.MesaComposite'),(161,2,'\0','\0',4,1,1,'rom.MesaComposite'),(162,2,'\0','\0',4,1,1,'rom.MesaComposite'),(163,2,'\0','\0',4,1,1,'rom.MesaComposite'),(164,2,'\0','\0',4,1,1,'rom.MesaComposite'),(165,2,'\0','\0',4,1,1,'rom.MesaComposite'),(166,2,'\0','\0',4,1,1,'rom.MesaComposite'),(167,2,'\0','\0',4,1,1,'rom.MesaComposite'),(168,2,'\0','\0',4,1,1,'rom.MesaComposite'),(169,2,'\0','\0',4,1,1,'rom.MesaComposite'),(170,2,'\0','\0',4,1,1,'rom.MesaComposite'),(171,2,'\0','\0',4,1,1,'rom.MesaComposite'),(172,2,'\0','\0',4,1,1,'rom.MesaComposite'),(173,2,'\0','\0',4,1,1,'rom.MesaComposite'),(174,2,'\0','\0',4,1,1,'rom.MesaComposite'),(175,2,'\0','\0',4,1,1,'rom.MesaComposite'),(176,2,'\0','\0',4,1,1,'rom.MesaComposite'),(177,2,'\0','\0',4,1,1,'rom.MesaComposite'),(178,2,'\0','\0',4,1,1,'rom.MesaComposite'),(179,2,'\0','\0',4,1,1,'rom.MesaComposite'),(180,2,'\0','\0',4,1,1,'rom.MesaComposite'),(181,2,'\0','\0',4,1,1,'rom.MesaComposite'),(182,2,'\0','\0',4,1,1,'rom.MesaComposite'),(183,2,'\0','\0',4,1,1,'rom.MesaComposite'),(184,2,'\0','\0',4,1,1,'rom.MesaComposite'),(185,2,'\0','\0',4,1,1,'rom.MesaComposite'),(186,2,'\0','\0',4,1,1,'rom.MesaComposite'),(187,2,'\0','\0',4,1,1,'rom.MesaComposite'),(188,2,'\0','\0',4,1,1,'rom.MesaComposite'),(189,2,'\0','\0',4,1,1,'rom.MesaComposite'),(190,2,'\0','\0',4,1,1,'rom.MesaComposite'),(191,2,'\0','\0',4,1,1,'rom.MesaComposite'),(192,2,'\0','\0',4,1,1,'rom.MesaComposite'),(193,2,'\0','\0',4,1,1,'rom.MesaComposite'),(194,2,'\0','\0',4,1,1,'rom.MesaComposite'),(195,2,'\0','\0',4,1,1,'rom.MesaComposite'),(196,2,'\0','\0',4,1,1,'rom.MesaComposite'),(197,2,'\0','\0',4,1,1,'rom.MesaComposite'),(198,2,'\0','\0',4,1,1,'rom.MesaComposite'),(199,2,'\0','\0',4,1,1,'rom.MesaComposite');
/*!40000 ALTER TABLE `mesa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mesa_composite_mesa`
--

DROP TABLE IF EXISTS `mesa_composite_mesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mesa_composite_mesa` (
  `mesa_composite_mesas_id` bigint(20) DEFAULT NULL,
  `mesa_id` bigint(20) DEFAULT NULL,
  KEY `FK266BE81727A97578` (`mesa_id`),
  KEY `FK266BE817AEEF3481` (`mesa_composite_mesas_id`),
  CONSTRAINT `FK266BE817AEEF3481` FOREIGN KEY (`mesa_composite_mesas_id`) REFERENCES `mesa` (`id`),
  CONSTRAINT `FK266BE81727A97578` FOREIGN KEY (`mesa_id`) REFERENCES `mesa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesa_composite_mesa`
--

LOCK TABLES `mesa_composite_mesa` WRITE;
/*!40000 ALTER TABLE `mesa_composite_mesa` DISABLE KEYS */;
INSERT INTO `mesa_composite_mesa` VALUES (6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1),(60,1),(61,1),(62,1),(63,1),(64,1),(65,1),(66,1),(67,1),(68,1),(69,1),(70,1),(71,1),(72,1),(73,1),(74,1),(75,1),(76,1),(77,1),(78,1),(79,1),(80,1),(81,1),(82,1),(83,1),(84,1),(85,1),(86,1),(87,1),(88,1),(89,1),(90,1),(91,1),(92,1),(93,1),(94,1),(95,1),(96,1),(97,1),(98,1),(99,1),(100,1),(101,1),(102,1),(103,1),(104,1),(105,1),(106,1),(107,1),(108,1),(109,1),(110,1),(111,1),(112,1),(113,1),(114,1),(115,1),(116,1),(117,1),(118,1),(119,1),(120,1),(121,1),(122,1),(123,1),(124,1),(125,1),(126,1),(127,1),(128,1),(129,1),(130,1),(131,1),(132,1),(133,1),(134,1),(135,1),(136,1),(137,1),(138,1),(139,1),(140,1),(141,1),(142,1),(143,1),(144,1),(145,1),(146,1),(147,1),(148,1),(149,1),(150,1),(151,1),(152,1),(153,1),(154,1),(155,1),(156,1),(157,1),(158,1),(159,1),(160,1),(161,1),(162,1),(163,1),(164,1),(165,1),(166,1),(167,1),(168,1),(169,1),(170,1),(171,1),(172,1),(173,1),(174,1),(175,1),(176,1),(177,1),(178,1),(179,1),(180,1),(181,1),(182,1),(183,1),(184,1),(185,1),(186,1),(187,1),(188,1),(189,1),(190,1),(191,1),(192,1),(193,1),(194,1),(195,1),(196,1),(197,1),(198,1),(199,1);
/*!40000 ALTER TABLE `mesa_composite_mesa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mozo`
--

DROP TABLE IF EXISTS `mozo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mozo` (
  `id` bigint(20) NOT NULL,
  `activo` bit(1) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `numero_legajo` bigint(20) DEFAULT NULL,
  `restaurant_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `restaurant_id` (`restaurant_id`,`numero_legajo`),
  KEY `FK333C57CA164B98` (`restaurant_id`),
  CONSTRAINT `FK333C57CA164B98` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mozo`
--

LOCK TABLES `mozo` WRITE;
/*!40000 ALTER TABLE `mozo` DISABLE KEYS */;
INSERT INTO `mozo` VALUES (5,'','Perez','Juan',4567,1),(6,'','Martinez','Pedro',1234,1);
/*!40000 ALTER TABLE `mozo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificacion`
--

DROP TABLE IF EXISTS `notificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notificacion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `fue_enviada` bit(1) NOT NULL,
  `id_destino` bigint(20) NOT NULL,
  `id_origen` bigint(20) NOT NULL,
  `mensaje` varchar(255) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificacion`
--

LOCK TABLES `notificacion` WRITE;
/*!40000 ALTER TABLE `notificacion` DISABLE KEYS */;
INSERT INTO `notificacion` VALUES (1,0,'\0',5,5,'Retirar: Mocilla','Mesa 1'),(2,0,'\0',5,5,'Retirar: Bife de costilla','Mesa 1'),(3,0,'\0',5,5,'Retirar: Chorizo','Mesa 1'),(4,0,'\0',5,5,'Retirar: Provoleta','Mesa 1'),(5,0,'\0',5,5,'Retirar: Sorrentinos','Mesa 1'),(6,0,'\0',5,5,'Retirar: Sorrentinos','Mesa 1'),(7,0,'\0',5,5,'Retirar: Tomates Rellenos','Mesa 1'),(8,0,'\0',5,5,'Retirar: Tallarines','Mesa 1'),(9,0,'\0',5,5,'Retirar: Mayonesa de ave o atún','Mesa 1'),(10,0,'\0',5,5,'Retirar: Provoleta','Mesa 1'),(11,0,'\0',5,5,'Retirar: Tira de asado','Mesa 1'),(12,0,'\0',5,5,'Retirar: Langostinos','Mesa 1'),(13,0,'\0',5,5,'Retirar: Langostinos','Mesa 1'),(14,0,'\0',5,5,'Retirar: Sorrentinos','Mesa 1'),(15,0,'\0',5,5,'Retirar: Bife de costilla','Mesa 1'),(16,0,'\0',5,5,'Retirar: Tallarines','Mesa 1'),(17,0,'\0',5,5,'Retirar: Bife de costilla','Mesa 1'),(18,0,'\0',5,5,'Retirar: Provoleta','Mesa 1'),(19,0,'\0',5,5,'Retirar: Tira de asado','Mesa 1'),(20,0,'\0',5,5,'Retirar: Provoleta','Mesa 1'),(21,0,'\0',5,5,'Retirar: Mocilla','Mesa 1'),(22,0,'\0',5,5,'Retirar: Mocilla','Mesa 1'),(23,0,'\0',5,5,'Retirar: Sorrentinos','Mesa 1'),(24,0,'\0',5,5,'Retirar: Tira de asado','Mesa 1'),(25,0,'\0',5,5,'Retirar: Tallarines','Mesa 1'),(26,0,'\0',5,5,'Retirar: Tallarines','Mesa 1'),(27,0,'\0',5,5,'Retirar: Langostinos','Mesa 1'),(28,0,'\0',5,5,'Retirar: Mayonesa de ave o atún','Mesa 1'),(29,0,'\0',5,5,'Retirar: Tira de asado','Mesa 1'),(30,0,'\0',5,5,'Retirar: Mocilla','Mesa 1'),(31,0,'\0',5,5,'Retirar: Provoleta','Mesa 1'),(32,0,'\0',5,5,'Retirar: Chorizo','Mesa 1'),(33,0,'\0',5,5,'Retirar: Chorizo','Mesa 1'),(34,0,'\0',5,5,'Retirar: Bife de costilla','Mesa 1'),(35,0,'\0',5,5,'Retirar: Mayonesa de ave o atún','Mesa 1'),(36,0,'\0',5,5,'Retirar: Rabas','Mesa 1'),(37,0,'\0',5,5,'Retirar: Ravioles','Mesa 1'),(38,0,'\0',5,5,'Retirar: Bife de costilla','Mesa 1'),(39,0,'\0',5,5,'Retirar: Tallarines','Mesa 1'),(40,0,'\0',5,5,'Retirar: Mayonesa de ave o atún','Mesa 1'),(41,0,'\0',5,5,'Retirar: Tomates Rellenos','Mesa 1'),(42,0,'\0',5,5,'Retirar: Mocilla','Mesa 1'),(43,0,'\0',5,5,'Retirar: Ravioles','Mesa 1'),(44,0,'\0',5,5,'Retirar: Sorrentinos','Mesa 1'),(45,0,'\0',5,5,'Retirar: Provoleta','Mesa 1'),(46,0,'\0',5,5,'Retirar: Mayonesa de ave o atún','Mesa 1'),(47,0,'\0',5,5,'Retirar: Mocilla','Mesa 1'),(48,0,'\0',5,5,'Retirar: Rabas','Mesa 1'),(49,0,'\0',5,5,'Retirar: Chorizo','Mesa 1'),(50,0,'\0',5,5,'Retirar: Tira de asado','Mesa 1'),(51,0,'\0',5,5,'Retirar: Bife de costilla','Mesa 1'),(52,0,'\0',5,5,'Retirar: Mayonesa de ave o atún','Mesa 1'),(53,0,'\0',5,5,'Retirar: Ravioles','Mesa 1'),(54,0,'\0',5,5,'Retirar: Mocilla','Mesa 1'),(55,0,'\0',5,5,'Retirar: Tallarines','Mesa 1'),(56,0,'\0',5,5,'Retirar: Chorizo','Mesa 1'),(57,0,'\0',5,5,'Retirar: Langostinos','Mesa 1'),(58,0,'\0',5,5,'Retirar: Sorrentinos','Mesa 1'),(59,0,'\0',5,5,'Retirar: Sorrentinos','Mesa 1'),(60,0,'\0',5,5,'Retirar: Bife de costilla','Mesa 1'),(61,0,'\0',5,5,'Retirar: Bife de costilla','Mesa 1'),(62,0,'\0',5,5,'Retirar: Ravioles','Mesa 1'),(63,0,'\0',5,5,'Retirar: Rabas','Mesa 1'),(64,0,'\0',5,5,'Retirar: Langostinos','Mesa 1'),(65,0,'\0',5,5,'Retirar: Tira de asado','Mesa 1'),(66,0,'\0',5,5,'Retirar: Ravioles','Mesa 1'),(67,0,'\0',5,5,'Retirar: Tomates Rellenos','Mesa 1'),(68,0,'\0',5,5,'Retirar: Provoleta','Mesa 1'),(69,0,'\0',5,5,'Retirar: Bife de costilla','Mesa 1'),(70,0,'\0',5,5,'Retirar: Sorrentinos','Mesa 1'),(71,0,'\0',5,5,'Retirar: Chorizo','Mesa 1'),(72,0,'\0',5,5,'Retirar: Mayonesa de ave o atún','Mesa 1'),(73,0,'\0',5,5,'Retirar: Ravioles','Mesa 1'),(74,0,'\0',5,5,'Retirar: Tomates Rellenos','Mesa 1'),(75,0,'\0',5,5,'Retirar: Mayonesa de ave o atún','Mesa 1'),(76,0,'\0',5,5,'Retirar: Bife de costilla','Mesa 1'),(77,0,'\0',5,5,'Retirar: Tomates Rellenos','Mesa 1'),(78,0,'\0',5,5,'Retirar: Chorizo','Mesa 1'),(79,0,'\0',5,5,'Retirar: Tira de asado','Mesa 1'),(80,0,'\0',5,5,'Retirar: Provoleta','Mesa 1'),(81,0,'\0',5,5,'Retirar: Chorizo','Mesa 1'),(82,0,'\0',5,5,'Retirar: Langostinos','Mesa 1'),(83,0,'\0',5,5,'Retirar: Rabas','Mesa 1'),(84,0,'\0',5,5,'Retirar: Bife de costilla','Mesa 1'),(85,0,'\0',5,5,'Retirar: Mocilla','Mesa 1'),(86,0,'\0',5,5,'Retirar: Tallarines','Mesa 1'),(87,0,'\0',5,5,'Retirar: Mocilla','Mesa 1'),(88,0,'\0',5,5,'Retirar: Chorizo','Mesa 1'),(89,0,'\0',5,5,'Retirar: Rabas','Mesa 1'),(90,0,'\0',5,5,'Retirar: Sorrentinos','Mesa 1'),(91,0,'\0',5,5,'Retirar: Tira de asado','Mesa 1'),(92,0,'\0',5,5,'Retirar: Chorizo','Mesa 1'),(93,0,'\0',5,5,'Retirar: Sorrentinos','Mesa 1'),(94,0,'\0',5,5,'Retirar: Tomates Rellenos','Mesa 1'),(95,0,'\0',5,5,'Retirar: Rabas','Mesa 1'),(96,0,'\0',5,5,'Retirar: Sorrentinos','Mesa 1'),(97,0,'\0',5,5,'Retirar: Chorizo','Mesa 1'),(98,0,'\0',5,5,'Retirar: Chorizo','Mesa 1'),(99,0,'\0',5,5,'Retirar: Bife de costilla','Mesa 1'),(100,0,'\0',5,5,'Retirar: Ravioles','Mesa 1'),(101,0,'\0',5,5,'Retirar: Ravioles','Mesa 1'),(102,0,'\0',5,5,'Retirar: Tira de asado','Mesa 1'),(103,0,'\0',5,5,'Retirar: Sorrentinos','Mesa 1'),(104,0,'\0',5,5,'Retirar: Mayonesa de ave o atún','Mesa 1'),(105,0,'\0',5,5,'Retirar: Mocilla','Mesa 1'),(106,0,'\0',5,5,'Retirar: Sorrentinos','Mesa 1'),(107,0,'\0',5,5,'Retirar: Mocilla','Mesa 1'),(108,0,'\0',5,5,'Retirar: Langostinos','Mesa 1'),(109,0,'\0',5,5,'Retirar: Provoleta','Mesa 1'),(110,0,'\0',5,5,'Retirar: Ravioles','Mesa 1'),(111,0,'\0',5,5,'Retirar: Provoleta','Mesa 1'),(112,0,'\0',5,5,'Retirar: Mocilla','Mesa 1'),(113,0,'\0',5,5,'Retirar: Langostinos','Mesa 1'),(114,0,'\0',5,5,'Retirar: Rabas','Mesa 1'),(115,0,'\0',5,5,'Retirar: Chorizo','Mesa 1'),(116,0,'\0',5,5,'Retirar: Mayonesa de ave o atún','Mesa 1'),(117,0,'\0',5,5,'Retirar: Mocilla','Mesa 1'),(118,0,'\0',5,5,'Retirar: Langostinos','Mesa 1'),(119,0,'\0',5,5,'Retirar: Bife de costilla','Mesa 1'),(120,0,'\0',5,5,'Retirar: Langostinos','Mesa 1'),(121,0,'\0',5,5,'Retirar: Tomates Rellenos','Mesa 1'),(122,0,'\0',5,5,'Retirar: Tallarines','Mesa 1'),(123,0,'\0',5,5,'Retirar: Bife de costilla','Mesa 1'),(124,0,'\0',5,5,'Retirar: Chorizo','Mesa 1'),(125,0,'\0',5,5,'Retirar: Langostinos','Mesa 1'),(126,0,'\0',5,5,'Retirar: Mayonesa de ave o atún','Mesa 1'),(127,0,'\0',5,5,'Retirar: Chorizo','Mesa 1'),(128,0,'\0',5,5,'Retirar: Ravioles','Mesa 1'),(129,0,'\0',5,5,'Retirar: Provoleta','Mesa 1'),(130,0,'\0',5,5,'Retirar: Tomates Rellenos','Mesa 1'),(131,0,'\0',5,5,'Retirar: Provoleta','Mesa 1'),(132,0,'\0',5,5,'Retirar: Tomates Rellenos','Mesa 1'),(133,0,'\0',5,5,'Retirar: Tira de asado','Mesa 1'),(134,0,'\0',5,5,'Retirar: Langostinos','Mesa 1'),(135,0,'\0',5,5,'Retirar: Chorizo','Mesa 1'),(136,0,'\0',5,5,'Retirar: Tira de asado','Mesa 1'),(137,0,'\0',5,5,'Retirar: Langostinos','Mesa 1'),(138,0,'\0',5,5,'Retirar: Ravioles','Mesa 1'),(139,0,'\0',5,5,'Retirar: Provoleta','Mesa 1'),(140,0,'\0',5,5,'Retirar: Tomates Rellenos','Mesa 1'),(141,0,'\0',5,5,'Retirar: Ravioles','Mesa 1'),(142,0,'\0',5,5,'Retirar: Sorrentinos','Mesa 1'),(143,0,'\0',5,5,'Retirar: Sorrentinos','Mesa 1'),(144,0,'\0',5,5,'Retirar: Mayonesa de ave o atún','Mesa 1'),(145,0,'\0',5,5,'Retirar: Langostinos','Mesa 1'),(146,0,'\0',5,5,'Retirar: Tallarines','Mesa 1'),(147,0,'\0',5,5,'Retirar: Tomates Rellenos','Mesa 1'),(148,0,'\0',5,5,'Retirar: Mocilla','Mesa 1'),(149,0,'\0',5,5,'Retirar: Mayonesa de ave o atún','Mesa 1'),(150,0,'\0',5,5,'Retirar: Chorizo','Mesa 1'),(151,0,'\0',5,5,'Retirar: Mocilla','Mesa 1'),(152,0,'\0',5,5,'Retirar: Mocilla','Mesa 1'),(153,0,'\0',5,5,'Retirar: Tira de asado','Mesa 1'),(154,0,'\0',5,5,'Retirar: Rabas','Mesa 1'),(155,0,'\0',5,5,'Retirar: Langostinos','Mesa 1'),(156,0,'\0',5,5,'Retirar: Langostinos','Mesa 1'),(157,0,'\0',5,5,'Retirar: Tallarines','Mesa 1'),(158,0,'\0',5,5,'Retirar: Mayonesa de ave o atún','Mesa 1'),(159,0,'\0',5,5,'Retirar: Sorrentinos','Mesa 1'),(160,0,'\0',5,5,'Retirar: Mayonesa de ave o atún','Mesa 1'),(161,0,'\0',5,5,'Retirar: Sorrentinos','Mesa 1'),(162,0,'\0',5,5,'Retirar: Langostinos','Mesa 1'),(163,0,'\0',5,5,'Retirar: Provoleta','Mesa 1'),(164,0,'\0',5,5,'Retirar: Mayonesa de ave o atún','Mesa 1'),(165,0,'\0',5,5,'Retirar: Sorrentinos','Mesa 1'),(166,0,'\0',5,5,'Retirar: Provoleta','Mesa 1'),(167,0,'\0',5,5,'Retirar: Tallarines','Mesa 1'),(168,0,'\0',5,5,'Retirar: Mayonesa de ave o atún','Mesa 1'),(169,0,'\0',5,5,'Retirar: Tira de asado','Mesa 1'),(170,0,'\0',5,5,'Retirar: Bife de costilla','Mesa 1'),(171,0,'\0',5,5,'Retirar: Ravioles','Mesa 1'),(172,0,'\0',5,5,'Retirar: Bife de costilla','Mesa 1'),(173,0,'\0',5,5,'Retirar: Ravioles','Mesa 1'),(174,0,'\0',5,5,'Retirar: Ravioles','Mesa 1'),(175,0,'\0',5,5,'Retirar: Chorizo','Mesa 1'),(176,0,'\0',5,5,'Retirar: Sorrentinos','Mesa 1'),(177,0,'\0',5,5,'Retirar: Rabas','Mesa 1'),(178,0,'\0',5,5,'Retirar: Langostinos','Mesa 1'),(179,0,'\0',5,5,'Retirar: Tallarines','Mesa 1'),(180,0,'\0',5,5,'Retirar: Bife de costilla','Mesa 1'),(181,0,'\0',5,5,'Retirar: Tomates Rellenos','Mesa 1'),(182,0,'\0',5,5,'Retirar: Provoleta','Mesa 1'),(183,0,'\0',5,5,'Retirar: Mayonesa de ave o atún','Mesa 1'),(184,0,'\0',5,5,'Retirar: Sorrentinos','Mesa 1'),(185,0,'\0',5,5,'Retirar: Tallarines','Mesa 1'),(186,0,'\0',5,5,'Retirar: Tira de asado','Mesa 1'),(187,0,'\0',5,5,'Retirar: Mocilla','Mesa 1'),(188,0,'\0',5,5,'Retirar: Chorizo','Mesa 1'),(189,0,'\0',5,5,'Retirar: Rabas','Mesa 1'),(190,0,'\0',5,5,'Retirar: Mocilla','Mesa 1'),(191,0,'\0',5,5,'Retirar: Mayonesa de ave o atún','Mesa 1'),(192,0,'\0',5,5,'Retirar: Rabas','Mesa 1'),(193,0,'\0',5,5,'Retirar: Rabas','Mesa 1'),(194,0,'\0',5,5,'Retirar: Mocilla','Mesa 1');
/*!40000 ALTER TABLE `notificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden`
--

DROP TABLE IF EXISTS `orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orden` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `agregado_id` bigint(20) DEFAULT NULL,
  `consumible_id` bigint(20) NOT NULL,
  `estado_id` varchar(255) NOT NULL,
  `fue_rechazada` bit(1) NOT NULL,
  `motivo_anulacion` varchar(255) DEFAULT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  `pedido_id` bigint(20) NOT NULL,
  `precio_id` bigint(20) NOT NULL,
  `timer_id` bigint(20) NOT NULL,
  `uuid` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK651874ABF4DE778` (`agregado_id`),
  KEY `FK651874AB9011F8` (`precio_id`),
  KEY `FK651874A99799D98` (`pedido_id`),
  KEY `FK651874A1C202ED8` (`consumible_id`),
  KEY `FK651874AF42BEC87` (`timer_id`),
  CONSTRAINT `FK651874AF42BEC87` FOREIGN KEY (`timer_id`) REFERENCES `state_timer` (`id`),
  CONSTRAINT `FK651874A1C202ED8` FOREIGN KEY (`consumible_id`) REFERENCES `consumible` (`id`),
  CONSTRAINT `FK651874A99799D98` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`id`),
  CONSTRAINT `FK651874AB9011F8` FOREIGN KEY (`precio_id`) REFERENCES `precio` (`id`),
  CONSTRAINT `FK651874ABF4DE778` FOREIGN KEY (`agregado_id`) REFERENCES `consumible` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden`
--

LOCK TABLES `orden` WRITE;
/*!40000 ALTER TABLE `orden` DISABLE KEYS */;
INSERT INTO `orden` VALUES (1,21,NULL,10,'Entregado','\0',NULL,'alta de consumicion-',1,12,2,'6'),(2,21,NULL,8,'Entregado','\0',NULL,'alta de consumicion-',2,10,4,'7'),(3,21,NULL,9,'Entregado','\0',NULL,'alta de consumicion-',3,11,6,'8'),(4,21,NULL,6,'Entregado','\0',NULL,'alta de consumicion-',4,8,8,'9'),(5,18,NULL,14,'Entregado','\0',NULL,'alta de consumicion-',5,17,10,'10'),(6,17,NULL,14,'Entregado','\0',NULL,'alta de consumicion-',6,17,12,'11'),(7,16,NULL,2,'Entregado','\0',NULL,'alta de consumicion-',7,2,14,'12'),(8,16,NULL,12,'Entregado','\0',NULL,'alta de consumicion-',8,15,16,'13'),(9,16,NULL,3,'Entregado','\0',NULL,'alta de consumicion-',9,3,18,'14'),(10,16,NULL,6,'Entregado','\0',NULL,'alta de consumicion-',10,8,20,'15'),(11,16,NULL,7,'Entregado','\0',NULL,'alta de consumicion-',11,9,22,'16'),(12,16,NULL,1,'Entregado','\0',NULL,'alta de consumicion-',12,1,24,'17'),(13,16,NULL,1,'Entregado','\0',NULL,'alta de consumicion-',13,1,26,'18'),(14,16,NULL,14,'Entregado','\0',NULL,'alta de consumicion-',14,17,28,'19'),(15,16,NULL,8,'Entregado','\0',NULL,'alta de consumicion-',15,10,30,'20'),(16,16,NULL,12,'Entregado','\0',NULL,'alta de consumicion-',16,15,32,'21'),(17,16,NULL,8,'Entregado','\0',NULL,'alta de consumicion-',17,10,34,'22'),(18,16,NULL,6,'Entregado','\0',NULL,'alta de consumicion-',18,8,36,'23'),(19,16,NULL,7,'Entregado','\0',NULL,'alta de consumicion-',19,9,38,'24'),(20,16,NULL,6,'Entregado','\0',NULL,'alta de consumicion-',20,8,40,'25'),(21,16,NULL,10,'Entregado','\0',NULL,'alta de consumicion-',21,12,42,'26'),(22,16,NULL,10,'Entregado','\0',NULL,'alta de consumicion-',22,12,44,'27'),(23,16,NULL,14,'Entregado','\0',NULL,'alta de consumicion-',23,17,46,'28'),(24,16,NULL,7,'Entregado','\0',NULL,'alta de consumicion-',24,9,48,'29'),(25,16,NULL,12,'Entregado','\0',NULL,'alta de consumicion-',25,15,50,'30'),(26,16,NULL,12,'Entregado','\0',NULL,'alta de consumicion-',26,15,52,'31'),(27,16,NULL,1,'Entregado','\0',NULL,'alta de consumicion-',27,1,54,'32'),(28,16,NULL,3,'Entregado','\0',NULL,'alta de consumicion-',28,3,56,'33'),(29,16,NULL,7,'Entregado','\0',NULL,'alta de consumicion-',29,9,58,'34'),(30,16,NULL,10,'Entregado','\0',NULL,'alta de consumicion-',30,12,60,'35'),(31,16,NULL,6,'Entregado','\0',NULL,'alta de consumicion-',31,8,62,'36'),(32,16,NULL,9,'Entregado','\0',NULL,'alta de consumicion-',32,11,64,'37'),(33,16,NULL,9,'Entregado','\0',NULL,'alta de consumicion-',33,11,66,'38'),(34,16,NULL,8,'Entregado','\0',NULL,'alta de consumicion-',34,10,68,'39'),(35,16,NULL,3,'Entregado','\0',NULL,'alta de consumicion-',35,3,70,'40'),(36,16,NULL,5,'Entregado','\0',NULL,'alta de consumicion-',36,7,72,'41'),(37,16,NULL,13,'Entregado','\0',NULL,'alta de consumicion-',37,16,74,'42'),(38,16,NULL,8,'Entregado','\0',NULL,'alta de consumicion-',38,10,76,'43'),(39,16,NULL,12,'Entregado','\0',NULL,'alta de consumicion-',39,15,78,'44'),(40,16,NULL,3,'Entregado','\0',NULL,'alta de consumicion-',40,3,80,'45'),(41,16,NULL,2,'Entregado','\0',NULL,'alta de consumicion-',41,2,82,'46'),(42,16,NULL,10,'Entregado','\0',NULL,'alta de consumicion-',42,12,84,'47'),(43,16,NULL,13,'Entregado','\0',NULL,'alta de consumicion-',43,16,86,'48'),(44,16,NULL,14,'Entregado','\0',NULL,'alta de consumicion-',44,17,88,'49'),(45,16,NULL,6,'Entregado','\0',NULL,'alta de consumicion-',45,8,90,'50'),(46,16,NULL,3,'Entregado','\0',NULL,'alta de consumicion-',46,3,92,'51'),(47,16,NULL,10,'Entregado','\0',NULL,'alta de consumicion-',47,12,94,'52'),(48,16,NULL,5,'Entregado','\0',NULL,'alta de consumicion-',48,7,96,'53'),(49,16,NULL,9,'Entregado','\0',NULL,'alta de consumicion-',49,11,98,'54'),(50,16,NULL,7,'Entregado','\0',NULL,'alta de consumicion-',50,9,100,'55'),(51,16,NULL,8,'Entregado','\0',NULL,'alta de consumicion-',51,10,102,'56'),(52,16,NULL,3,'Entregado','\0',NULL,'alta de consumicion-',52,3,104,'57'),(53,16,NULL,13,'Entregado','\0',NULL,'alta de consumicion-',53,16,106,'58'),(54,16,NULL,10,'Entregado','\0',NULL,'alta de consumicion-',54,12,108,'59'),(55,16,NULL,12,'Entregado','\0',NULL,'alta de consumicion-',55,15,110,'60'),(56,16,NULL,9,'Entregado','\0',NULL,'alta de consumicion-',56,11,112,'61'),(57,16,NULL,1,'Entregado','\0',NULL,'alta de consumicion-',57,1,114,'62'),(58,16,NULL,14,'Entregado','\0',NULL,'alta de consumicion-',58,17,116,'63'),(59,16,NULL,14,'Entregado','\0',NULL,'alta de consumicion-',59,17,118,'64'),(60,16,NULL,8,'Entregado','\0',NULL,'alta de consumicion-',60,10,120,'65'),(61,16,NULL,8,'Entregado','\0',NULL,'alta de consumicion-',61,10,122,'66'),(62,16,NULL,13,'Entregado','\0',NULL,'alta de consumicion-',62,16,124,'67'),(63,16,NULL,5,'Entregado','\0',NULL,'alta de consumicion-',63,7,126,'68'),(64,16,NULL,1,'Entregado','\0',NULL,'alta de consumicion-',64,1,128,'69'),(65,16,NULL,7,'Entregado','\0',NULL,'alta de consumicion-',65,9,130,'70'),(66,16,NULL,13,'Entregado','\0',NULL,'alta de consumicion-',66,16,132,'71'),(67,16,NULL,2,'Entregado','\0',NULL,'alta de consumicion-',67,2,134,'72'),(68,16,NULL,6,'Entregado','\0',NULL,'alta de consumicion-',68,8,136,'73'),(69,16,NULL,8,'Entregado','\0',NULL,'alta de consumicion-',69,10,138,'74'),(70,16,NULL,14,'Entregado','\0',NULL,'alta de consumicion-',70,17,140,'75'),(71,16,NULL,9,'Entregado','\0',NULL,'alta de consumicion-',71,11,142,'76'),(72,16,NULL,3,'Entregado','\0',NULL,'alta de consumicion-',72,3,144,'77'),(73,16,NULL,13,'Entregado','\0',NULL,'alta de consumicion-',73,16,146,'78'),(74,16,NULL,2,'Entregado','\0',NULL,'alta de consumicion-',74,2,148,'79'),(75,16,NULL,3,'Entregado','\0',NULL,'alta de consumicion-',75,3,150,'80'),(76,16,NULL,8,'Entregado','\0',NULL,'alta de consumicion-',76,10,152,'81'),(77,16,NULL,2,'Entregado','\0',NULL,'alta de consumicion-',77,2,154,'82'),(78,16,NULL,9,'Entregado','\0',NULL,'alta de consumicion-',78,11,156,'83'),(79,16,NULL,7,'Entregado','\0',NULL,'alta de consumicion-',79,9,158,'84'),(80,16,NULL,6,'Entregado','\0',NULL,'alta de consumicion-',80,8,160,'85'),(81,16,NULL,9,'Entregado','\0',NULL,'alta de consumicion-',81,11,162,'86'),(82,16,NULL,1,'Entregado','\0',NULL,'alta de consumicion-',82,1,164,'87'),(83,16,NULL,5,'Entregado','\0',NULL,'alta de consumicion-',83,7,166,'88'),(84,16,NULL,8,'Entregado','\0',NULL,'alta de consumicion-',84,10,168,'89'),(85,16,NULL,10,'Entregado','\0',NULL,'alta de consumicion-',85,12,170,'90'),(86,16,NULL,12,'Entregado','\0',NULL,'alta de consumicion-',86,15,172,'91'),(87,16,NULL,10,'Entregado','\0',NULL,'alta de consumicion-',87,12,174,'92'),(88,16,NULL,9,'Entregado','\0',NULL,'alta de consumicion-',88,11,176,'93'),(89,16,NULL,5,'Entregado','\0',NULL,'alta de consumicion-',89,7,178,'94'),(90,16,NULL,14,'Entregado','\0',NULL,'alta de consumicion-',90,17,180,'95'),(91,16,NULL,7,'Entregado','\0',NULL,'alta de consumicion-',91,9,182,'96'),(92,16,NULL,9,'Entregado','\0',NULL,'alta de consumicion-',92,11,184,'97'),(93,16,NULL,14,'Entregado','\0',NULL,'alta de consumicion-',93,17,186,'98'),(94,16,NULL,2,'Entregado','\0',NULL,'alta de consumicion-',94,2,188,'99'),(95,16,NULL,5,'Entregado','\0',NULL,'alta de consumicion-',95,7,190,'100'),(96,16,NULL,14,'Entregado','\0',NULL,'alta de consumicion-',96,17,192,'101'),(97,16,NULL,9,'Entregado','\0',NULL,'alta de consumicion-',97,11,194,'102'),(98,16,NULL,9,'Entregado','\0',NULL,'alta de consumicion-',98,11,196,'103'),(99,16,NULL,8,'Entregado','\0',NULL,'alta de consumicion-',99,10,198,'104'),(100,16,NULL,13,'Entregado','\0',NULL,'alta de consumicion-',100,16,200,'105'),(101,16,NULL,13,'Entregado','\0',NULL,'alta de consumicion-',101,16,202,'106'),(102,16,NULL,7,'Entregado','\0',NULL,'alta de consumicion-',102,9,204,'107'),(103,16,NULL,14,'Entregado','\0',NULL,'alta de consumicion-',103,17,206,'108'),(104,16,NULL,3,'Entregado','\0',NULL,'alta de consumicion-',104,3,208,'109'),(105,16,NULL,10,'Entregado','\0',NULL,'alta de consumicion-',105,12,210,'110'),(106,16,NULL,14,'Entregado','\0',NULL,'alta de consumicion-',106,17,212,'111'),(107,16,NULL,10,'Entregado','\0',NULL,'alta de consumicion-',107,12,214,'112'),(108,16,NULL,1,'Entregado','\0',NULL,'alta de consumicion-',108,1,216,'113'),(109,16,NULL,6,'Entregado','\0',NULL,'alta de consumicion-',109,8,218,'114'),(110,16,NULL,13,'Entregado','\0',NULL,'alta de consumicion-',110,16,220,'115'),(111,16,NULL,6,'Entregado','\0',NULL,'alta de consumicion-',111,8,222,'116'),(112,16,NULL,10,'Entregado','\0',NULL,'alta de consumicion-',112,12,224,'117'),(113,16,NULL,1,'Entregado','\0',NULL,'alta de consumicion-',113,1,226,'118'),(114,16,NULL,5,'Entregado','\0',NULL,'alta de consumicion-',114,7,228,'119'),(115,16,NULL,9,'Entregado','\0',NULL,'alta de consumicion-',115,11,230,'120'),(116,16,NULL,3,'Entregado','\0',NULL,'alta de consumicion-',116,3,232,'121'),(117,16,NULL,10,'Entregado','\0',NULL,'alta de consumicion-',117,12,234,'122'),(118,16,NULL,1,'Entregado','\0',NULL,'alta de consumicion-',118,1,236,'123'),(119,16,NULL,8,'Entregado','\0',NULL,'alta de consumicion-',119,10,238,'124'),(120,16,NULL,1,'Entregado','\0',NULL,'alta de consumicion-',120,1,240,'125'),(121,16,NULL,2,'Entregado','\0',NULL,'alta de consumicion-',121,2,242,'126'),(122,16,NULL,12,'Entregado','\0',NULL,'alta de consumicion-',122,15,244,'127'),(123,16,NULL,8,'Entregado','\0',NULL,'alta de consumicion-',123,10,246,'128'),(124,16,NULL,9,'Entregado','\0',NULL,'alta de consumicion-',124,11,248,'129'),(125,16,NULL,1,'Entregado','\0',NULL,'alta de consumicion-',125,1,250,'130'),(126,16,NULL,3,'Entregado','\0',NULL,'alta de consumicion-',126,3,252,'131'),(127,16,NULL,9,'Entregado','\0',NULL,'alta de consumicion-',127,11,254,'132'),(128,16,NULL,13,'Entregado','\0',NULL,'alta de consumicion-',128,16,256,'133'),(129,16,NULL,6,'Entregado','\0',NULL,'alta de consumicion-',129,8,258,'134'),(130,16,NULL,2,'Entregado','\0',NULL,'alta de consumicion-',130,2,260,'135'),(131,16,NULL,6,'Entregado','\0',NULL,'alta de consumicion-',131,8,262,'136'),(132,16,NULL,2,'Entregado','\0',NULL,'alta de consumicion-',132,2,264,'137'),(133,16,NULL,7,'Entregado','\0',NULL,'alta de consumicion-',133,9,266,'138'),(134,16,NULL,1,'Entregado','\0',NULL,'alta de consumicion-',134,1,268,'139'),(135,16,NULL,9,'Entregado','\0',NULL,'alta de consumicion-',135,11,270,'140'),(136,16,NULL,7,'Entregado','\0',NULL,'alta de consumicion-',136,9,272,'141'),(137,16,NULL,1,'Entregado','\0',NULL,'alta de consumicion-',137,1,274,'142'),(138,16,NULL,13,'Entregado','\0',NULL,'alta de consumicion-',138,16,276,'143'),(139,16,NULL,6,'Entregado','\0',NULL,'alta de consumicion-',139,8,278,'144'),(140,16,NULL,2,'Entregado','\0',NULL,'alta de consumicion-',140,2,280,'145'),(141,16,NULL,13,'Entregado','\0',NULL,'alta de consumicion-',141,16,282,'146'),(142,16,NULL,14,'Entregado','\0',NULL,'alta de consumicion-',142,17,284,'147'),(143,16,NULL,14,'Entregado','\0',NULL,'alta de consumicion-',143,17,286,'148'),(144,16,NULL,3,'Entregado','\0',NULL,'alta de consumicion-',144,3,288,'149'),(145,16,NULL,1,'Entregado','\0',NULL,'alta de consumicion-',145,1,290,'150'),(146,16,NULL,12,'Entregado','\0',NULL,'alta de consumicion-',146,15,292,'151'),(147,16,NULL,2,'Entregado','\0',NULL,'alta de consumicion-',147,2,294,'152'),(148,16,NULL,10,'Entregado','\0',NULL,'alta de consumicion-',148,12,296,'153'),(149,16,NULL,3,'Entregado','\0',NULL,'alta de consumicion-',149,3,298,'154'),(150,16,NULL,9,'Entregado','\0',NULL,'alta de consumicion-',150,11,300,'155'),(151,16,NULL,10,'Entregado','\0',NULL,'alta de consumicion-',151,12,302,'156'),(152,16,NULL,10,'Entregado','\0',NULL,'alta de consumicion-',152,12,304,'157'),(153,16,NULL,7,'Entregado','\0',NULL,'alta de consumicion-',153,9,306,'158'),(154,16,NULL,5,'Entregado','\0',NULL,'alta de consumicion-',154,7,308,'159'),(155,16,NULL,1,'Entregado','\0',NULL,'alta de consumicion-',155,1,310,'160'),(156,16,NULL,1,'Entregado','\0',NULL,'alta de consumicion-',156,1,312,'161'),(157,16,NULL,12,'Entregado','\0',NULL,'alta de consumicion-',157,15,314,'162'),(158,16,NULL,3,'Entregado','\0',NULL,'alta de consumicion-',158,3,316,'163'),(159,16,NULL,14,'Entregado','\0',NULL,'alta de consumicion-',159,17,318,'164'),(160,16,NULL,3,'Entregado','\0',NULL,'alta de consumicion-',160,3,320,'165'),(161,16,NULL,14,'Entregado','\0',NULL,'alta de consumicion-',161,17,322,'166'),(162,16,NULL,1,'Entregado','\0',NULL,'alta de consumicion-',162,1,324,'167'),(163,16,NULL,6,'Entregado','\0',NULL,'alta de consumicion-',163,8,326,'168'),(164,16,NULL,3,'Entregado','\0',NULL,'alta de consumicion-',164,3,328,'169'),(165,16,NULL,14,'Entregado','\0',NULL,'alta de consumicion-',165,17,330,'170'),(166,16,NULL,6,'Entregado','\0',NULL,'alta de consumicion-',166,8,332,'171'),(167,16,NULL,12,'Entregado','\0',NULL,'alta de consumicion-',167,15,334,'172'),(168,16,NULL,3,'Entregado','\0',NULL,'alta de consumicion-',168,3,336,'173'),(169,16,NULL,7,'Entregado','\0',NULL,'alta de consumicion-',169,9,338,'174'),(170,16,NULL,8,'Entregado','\0',NULL,'alta de consumicion-',170,10,340,'175'),(171,16,NULL,13,'Entregado','\0',NULL,'alta de consumicion-',171,16,342,'176'),(172,16,NULL,8,'Entregado','\0',NULL,'alta de consumicion-',172,10,344,'177'),(173,16,NULL,13,'Entregado','\0',NULL,'alta de consumicion-',173,16,346,'178'),(174,16,NULL,13,'Entregado','\0',NULL,'alta de consumicion-',174,16,348,'179'),(175,16,NULL,9,'Entregado','\0',NULL,'alta de consumicion-',175,11,350,'180'),(176,16,NULL,14,'Entregado','\0',NULL,'alta de consumicion-',176,17,352,'181'),(177,16,NULL,5,'Entregado','\0',NULL,'alta de consumicion-',177,7,354,'182'),(178,16,NULL,1,'Entregado','\0',NULL,'alta de consumicion-',178,1,356,'183'),(179,16,NULL,12,'Entregado','\0',NULL,'alta de consumicion-',179,15,358,'184'),(180,16,NULL,8,'Entregado','\0',NULL,'alta de consumicion-',180,10,360,'185'),(181,16,NULL,2,'Entregado','\0',NULL,'alta de consumicion-',181,2,362,'186'),(182,16,NULL,6,'Entregado','\0',NULL,'alta de consumicion-',182,8,364,'187'),(183,16,NULL,3,'Entregado','\0',NULL,'alta de consumicion-',183,3,366,'188'),(184,16,NULL,14,'Entregado','\0',NULL,'alta de consumicion-',184,17,368,'189'),(185,16,NULL,12,'Entregado','\0',NULL,'alta de consumicion-',185,15,370,'190'),(186,16,NULL,7,'Entregado','\0',NULL,'alta de consumicion-',186,9,372,'191'),(187,16,NULL,10,'Entregado','\0',NULL,'alta de consumicion-',187,12,374,'192'),(188,16,NULL,9,'Entregado','\0',NULL,'alta de consumicion-',188,11,376,'193'),(189,16,NULL,5,'Entregado','\0',NULL,'alta de consumicion-',189,7,378,'194'),(190,16,NULL,10,'Entregado','\0',NULL,'alta de consumicion-',190,12,380,'195'),(191,16,NULL,3,'Entregado','\0',NULL,'alta de consumicion-',191,3,382,'196'),(192,16,NULL,5,'Entregado','\0',NULL,'alta de consumicion-',192,7,384,'197'),(193,16,NULL,5,'Entregado','\0',NULL,'alta de consumicion-',193,7,386,'198'),(194,16,NULL,10,'Entregado','\0',NULL,'alta de consumicion-',194,12,388,'199');
/*!40000 ALTER TABLE `orden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_state`
--

DROP TABLE IF EXISTS `orden_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orden_state` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_state`
--

LOCK TABLES `orden_state` WRITE;
/*!40000 ALTER TABLE `orden_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `orden_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_state_user_type`
--

DROP TABLE IF EXISTS `orden_state_user_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orden_state_user_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_state_user_type`
--

LOCK TABLES `orden_state_user_type` WRITE;
/*!40000 ALTER TABLE `orden_state_user_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `orden_state_user_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedido` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `comensales` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `estado_id` varchar(255) NOT NULL,
  `fecha_pago` datetime DEFAULT NULL,
  `mesa_id` bigint(20) NOT NULL,
  `motivo_anulacion` varchar(255) DEFAULT NULL,
  `mozo_id` bigint(20) NOT NULL,
  `promocion_id` bigint(20) DEFAULT NULL,
  `timer_id` bigint(20) NOT NULL,
  `tipo_pago` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC4DD1745392313D8` (`mozo_id`),
  KEY `FKC4DD174527A97578` (`mesa_id`),
  KEY `FKC4DD1745106C8A7C` (`promocion_id`),
  KEY `FKC4DD1745F42BEC87` (`timer_id`),
  CONSTRAINT `FKC4DD1745F42BEC87` FOREIGN KEY (`timer_id`) REFERENCES `state_timer` (`id`),
  CONSTRAINT `FKC4DD1745106C8A7C` FOREIGN KEY (`promocion_id`) REFERENCES `promocion` (`id`),
  CONSTRAINT `FKC4DD174527A97578` FOREIGN KEY (`mesa_id`) REFERENCES `mesa` (`id`),
  CONSTRAINT `FKC4DD1745392313D8` FOREIGN KEY (`mozo_id`) REFERENCES `mozo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,16,3,'2014-05-31 18:46:05','Pagado','2014-05-31 18:46:07',6,NULL,5,NULL,1,2),(2,16,3,'2014-05-31 18:46:07','Pagado','2014-05-31 18:46:08',7,NULL,5,NULL,3,2),(3,16,3,'2014-05-31 18:46:08','Pagado','2014-05-31 18:46:09',8,NULL,5,NULL,5,2),(4,16,3,'2014-05-31 18:46:09','Pagado','2014-05-31 18:46:10',9,NULL,5,NULL,7,2),(5,13,3,'2014-05-31 18:50:04','Pagado','2014-05-31 18:50:05',10,NULL,5,NULL,9,2),(6,13,3,'2014-05-31 18:51:13','Pagado','2014-05-31 18:51:14',11,NULL,5,NULL,11,2),(7,13,3,'2014-05-31 18:52:43','Pagado','2014-05-31 18:52:44',12,NULL,5,NULL,13,2),(8,13,3,'2014-05-31 18:52:44','Pagado','2014-05-31 18:52:45',13,NULL,5,NULL,15,2),(9,13,3,'2014-05-31 18:52:46','Pagado','2014-05-31 18:52:47',14,NULL,5,NULL,17,2),(10,13,3,'2014-05-31 18:52:47','Pagado','2014-05-31 18:52:48',15,NULL,5,NULL,19,2),(11,13,3,'2014-05-31 18:52:48','Pagado','2014-05-31 18:52:49',16,NULL,5,NULL,21,2),(12,13,3,'2014-05-31 18:52:49','Pagado','2014-05-31 18:52:50',17,NULL,5,NULL,23,2),(13,13,3,'2014-05-31 18:52:50','Pagado','2014-05-31 18:52:51',18,NULL,5,NULL,25,2),(14,13,3,'2014-05-31 18:52:52','Pagado','2014-05-31 18:52:53',19,NULL,5,NULL,27,2),(15,13,3,'2014-05-31 18:52:53','Pagado','2014-05-31 18:52:54',20,NULL,5,NULL,29,2),(16,13,3,'2014-05-31 18:52:54','Pagado','2014-05-31 18:52:55',21,NULL,5,NULL,31,2),(17,13,3,'2014-05-31 18:52:56','Pagado','2014-05-31 18:52:57',22,NULL,5,NULL,33,2),(18,13,3,'2014-05-31 18:52:57','Pagado','2014-05-31 18:52:58',23,NULL,5,NULL,35,2),(19,13,3,'2014-05-31 18:52:58','Pagado','2014-05-31 18:52:59',24,NULL,5,NULL,37,2),(20,13,3,'2014-05-31 18:52:59','Pagado','2014-05-31 18:53:00',25,NULL,5,NULL,39,2),(21,13,3,'2014-05-31 18:53:00','Pagado','2014-05-31 18:53:01',26,NULL,5,NULL,41,2),(22,13,3,'2014-05-31 18:53:02','Pagado','2014-05-31 18:53:03',27,NULL,5,NULL,43,2),(23,13,3,'2014-05-31 18:53:03','Pagado','2014-05-31 18:53:04',28,NULL,5,NULL,45,2),(24,13,3,'2014-05-31 18:53:04','Pagado','2014-05-31 18:53:06',29,NULL,5,NULL,47,2),(25,13,3,'2014-05-31 18:53:06','Pagado','2014-05-31 18:53:07',30,NULL,5,NULL,49,2),(26,13,3,'2014-05-31 18:53:07','Pagado','2014-05-31 18:53:08',31,NULL,5,NULL,51,2),(27,13,3,'2014-05-31 18:53:08','Pagado','2014-05-31 18:53:09',32,NULL,5,NULL,53,2),(28,13,3,'2014-05-31 18:53:09','Pagado','2014-05-31 18:53:11',33,NULL,5,NULL,55,2),(29,13,3,'2014-05-31 18:53:11','Pagado','2014-05-31 18:53:12',34,NULL,5,NULL,57,2),(30,13,3,'2014-05-31 18:53:12','Pagado','2014-05-31 18:53:13',35,NULL,5,NULL,59,2),(31,13,3,'2014-05-31 18:53:13','Pagado','2014-05-31 18:53:14',36,NULL,5,NULL,61,2),(32,13,3,'2014-05-31 18:53:15','Pagado','2014-05-31 18:53:16',37,NULL,5,NULL,63,2),(33,13,3,'2014-05-31 18:53:16','Pagado','2014-05-31 18:53:17',38,NULL,5,NULL,65,2),(34,13,3,'2014-05-31 18:53:18','Pagado','2014-05-31 18:53:19',39,NULL,5,NULL,67,2),(35,13,3,'2014-05-31 18:53:19','Pagado','2014-05-31 18:53:20',40,NULL,5,NULL,69,2),(36,13,3,'2014-05-31 18:53:20','Pagado','2014-05-31 18:53:21',41,NULL,5,NULL,71,2),(37,13,3,'2014-05-31 18:53:22','Pagado','2014-05-31 18:53:23',42,NULL,5,NULL,73,2),(38,13,3,'2014-05-31 18:53:23','Pagado','2014-05-31 18:53:24',43,NULL,5,NULL,75,2),(39,13,3,'2014-05-31 18:53:24','Pagado','2014-05-31 18:53:25',44,NULL,5,NULL,77,2),(40,13,3,'2014-05-31 18:53:25','Pagado','2014-05-31 18:53:27',45,NULL,5,NULL,79,2),(41,13,3,'2014-05-31 18:53:27','Pagado','2014-05-31 18:53:28',46,NULL,5,NULL,81,2),(42,13,3,'2014-05-31 18:53:28','Pagado','2014-05-31 18:53:29',47,NULL,5,NULL,83,2),(43,13,3,'2014-05-31 18:53:29','Pagado','2014-05-31 18:53:30',48,NULL,5,NULL,85,2),(44,13,3,'2014-05-31 18:53:31','Pagado','2014-05-31 18:53:32',49,NULL,5,NULL,87,2),(45,13,3,'2014-05-31 18:53:32','Pagado','2014-05-31 18:53:33',50,NULL,5,NULL,89,2),(46,13,3,'2014-05-31 18:53:33','Pagado','2014-05-31 18:53:34',51,NULL,5,NULL,91,2),(47,13,3,'2014-05-31 18:53:34','Pagado','2014-05-31 18:53:35',52,NULL,5,NULL,93,2),(48,13,3,'2014-05-31 18:53:35','Pagado','2014-05-31 18:53:36',53,NULL,5,NULL,95,2),(49,13,3,'2014-05-31 18:53:37','Pagado','2014-05-31 18:53:38',54,NULL,5,NULL,97,2),(50,13,3,'2014-05-31 18:53:38','Pagado','2014-05-31 18:53:39',55,NULL,5,NULL,99,2),(51,13,3,'2014-05-31 18:53:40','Pagado','2014-05-31 18:53:41',56,NULL,5,NULL,101,2),(52,13,3,'2014-05-31 18:53:41','Pagado','2014-05-31 18:53:42',57,NULL,5,NULL,103,2),(53,13,3,'2014-05-31 18:53:42','Pagado','2014-05-31 18:53:43',58,NULL,5,NULL,105,2),(54,13,3,'2014-05-31 18:53:43','Pagado','2014-05-31 18:53:45',59,NULL,5,NULL,107,2),(55,13,3,'2014-05-31 18:53:46','Pagado','2014-05-31 18:53:47',60,NULL,5,NULL,109,2),(56,13,3,'2014-05-31 18:53:48','Pagado','2014-05-31 18:53:49',61,NULL,5,NULL,111,2),(57,13,3,'2014-05-31 18:53:49','Pagado','2014-05-31 18:53:50',62,NULL,5,NULL,113,2),(58,13,3,'2014-05-31 18:53:51','Pagado','2014-05-31 18:53:53',63,NULL,5,NULL,115,2),(59,13,3,'2014-05-31 18:53:53','Pagado','2014-05-31 18:53:54',64,NULL,5,NULL,117,2),(60,13,3,'2014-05-31 18:53:55','Pagado','2014-05-31 18:53:56',65,NULL,5,NULL,119,2),(61,13,3,'2014-05-31 18:53:56','Pagado','2014-05-31 18:53:58',66,NULL,5,NULL,121,2),(62,13,3,'2014-05-31 18:53:58','Pagado','2014-05-31 18:54:01',67,NULL,5,NULL,123,2),(63,13,3,'2014-05-31 18:54:01','Pagado','2014-05-31 18:54:02',68,NULL,5,NULL,125,2),(64,13,3,'2014-05-31 18:54:02','Pagado','2014-05-31 18:54:03',69,NULL,5,NULL,127,2),(65,13,3,'2014-05-31 18:54:04','Pagado','2014-05-31 18:54:05',70,NULL,5,NULL,129,2),(66,13,3,'2014-05-31 18:54:05','Pagado','2014-05-31 18:54:06',71,NULL,5,NULL,131,2),(67,13,3,'2014-05-31 18:54:06','Pagado','2014-05-31 18:54:07',72,NULL,5,NULL,133,2),(68,13,3,'2014-05-31 18:54:07','Pagado','2014-05-31 18:54:09',73,NULL,5,NULL,135,2),(69,13,3,'2014-05-31 18:54:09','Pagado','2014-05-31 18:54:10',74,NULL,5,NULL,137,2),(70,13,3,'2014-05-31 18:54:10','Pagado','2014-05-31 18:54:12',75,NULL,5,NULL,139,2),(71,13,3,'2014-05-31 18:54:12','Pagado','2014-05-31 18:54:13',76,NULL,5,NULL,141,2),(72,13,3,'2014-05-31 18:54:13','Pagado','2014-05-31 18:54:14',77,NULL,5,NULL,143,2),(73,13,3,'2014-05-31 18:54:15','Pagado','2014-05-31 18:54:16',78,NULL,5,NULL,145,2),(74,13,3,'2014-05-31 18:54:16','Pagado','2014-05-31 18:54:17',79,NULL,5,NULL,147,2),(75,13,3,'2014-05-31 18:54:17','Pagado','2014-05-31 18:54:18',80,NULL,5,NULL,149,2),(76,13,3,'2014-05-31 18:54:18','Pagado','2014-05-31 18:54:19',81,NULL,5,NULL,151,2),(77,13,3,'2014-05-31 18:54:20','Pagado','2014-05-31 18:54:22',82,NULL,5,NULL,153,2),(78,13,3,'2014-05-31 18:54:22','Pagado','2014-05-31 18:54:23',83,NULL,5,NULL,155,2),(79,13,3,'2014-05-31 18:54:23','Pagado','2014-05-31 18:54:24',84,NULL,5,NULL,157,2),(80,13,3,'2014-05-31 18:54:24','Pagado','2014-05-31 18:54:25',85,NULL,5,NULL,159,2),(81,13,3,'2014-05-31 18:54:26','Pagado','2014-05-31 18:54:27',86,NULL,5,NULL,161,2),(82,13,3,'2014-05-31 18:54:27','Pagado','2014-05-31 18:54:28',87,NULL,5,NULL,163,2),(83,13,3,'2014-05-31 18:54:28','Pagado','2014-05-31 18:54:29',88,NULL,5,NULL,165,2),(84,13,3,'2014-05-31 18:54:29','Pagado','2014-05-31 18:54:31',89,NULL,5,NULL,167,2),(85,13,3,'2014-05-31 18:54:31','Pagado','2014-05-31 18:54:33',90,NULL,5,NULL,169,2),(86,13,3,'2014-05-31 18:54:33','Pagado','2014-05-31 18:54:34',91,NULL,5,NULL,171,2),(87,13,3,'2014-05-31 18:54:34','Pagado','2014-05-31 18:54:35',92,NULL,5,NULL,173,2),(88,13,3,'2014-05-31 18:54:35','Pagado','2014-05-31 18:54:36',93,NULL,5,NULL,175,2),(89,13,3,'2014-05-31 18:54:37','Pagado','2014-05-31 18:54:38',94,NULL,5,NULL,177,2),(90,13,3,'2014-05-31 18:54:38','Pagado','2014-05-31 18:54:40',95,NULL,5,NULL,179,2),(91,13,3,'2014-05-31 18:54:40','Pagado','2014-05-31 18:54:41',96,NULL,5,NULL,181,2),(92,13,3,'2014-05-31 18:54:42','Pagado','2014-05-31 18:54:43',97,NULL,5,NULL,183,2),(93,13,3,'2014-05-31 18:54:43','Pagado','2014-05-31 18:54:44',98,NULL,5,NULL,185,2),(94,13,3,'2014-05-31 18:54:45','Pagado','2014-05-31 18:54:46',99,NULL,5,NULL,187,2),(95,13,3,'2014-05-31 18:54:46','Pagado','2014-05-31 18:54:47',100,NULL,5,NULL,189,2),(96,13,3,'2014-05-31 18:54:47','Pagado','2014-05-31 18:54:48',101,NULL,5,NULL,191,2),(97,13,3,'2014-05-31 18:54:49','Pagado','2014-05-31 18:54:50',102,NULL,5,NULL,193,2),(98,13,3,'2014-05-31 18:54:50','Pagado','2014-05-31 18:54:51',103,NULL,5,NULL,195,2),(99,13,3,'2014-05-31 18:54:52','Pagado','2014-05-31 18:54:52',104,NULL,5,NULL,197,2),(100,13,3,'2014-05-31 18:54:53','Pagado','2014-05-31 18:54:54',105,NULL,5,NULL,199,2),(101,13,3,'2014-05-31 18:54:55','Pagado','2014-05-31 18:54:56',106,NULL,5,NULL,201,2),(102,13,3,'2014-05-31 18:54:56','Pagado','2014-05-31 18:54:57',107,NULL,5,NULL,203,2),(103,13,3,'2014-05-31 18:54:57','Pagado','2014-05-31 18:54:58',108,NULL,5,NULL,205,2),(104,13,3,'2014-05-31 18:54:59','Pagado','2014-05-31 18:55:00',109,NULL,5,NULL,207,2),(105,13,3,'2014-05-31 18:55:00','Pagado','2014-05-31 18:55:01',110,NULL,5,NULL,209,2),(106,13,3,'2014-05-31 18:55:01','Pagado','2014-05-31 18:55:03',111,NULL,5,NULL,211,2),(107,13,3,'2014-05-31 18:55:03','Pagado','2014-05-31 18:55:04',112,NULL,5,NULL,213,2),(108,13,3,'2014-05-31 18:55:04','Pagado','2014-05-31 18:55:06',113,NULL,5,NULL,215,2),(109,13,3,'2014-05-31 18:55:06','Pagado','2014-05-31 18:55:07',114,NULL,5,NULL,217,2),(110,13,3,'2014-05-31 18:55:07','Pagado','2014-05-31 18:55:08',115,NULL,5,NULL,219,2),(111,13,3,'2014-05-31 18:55:08','Pagado','2014-05-31 18:55:10',116,NULL,5,NULL,221,2),(112,13,3,'2014-05-31 18:55:10','Pagado','2014-05-31 18:55:11',117,NULL,5,NULL,223,2),(113,13,3,'2014-05-31 18:55:11','Pagado','2014-05-31 18:55:12',118,NULL,5,NULL,225,2),(114,13,3,'2014-05-31 18:55:13','Pagado','2014-05-31 18:55:14',119,NULL,5,NULL,227,2),(115,13,3,'2014-05-31 18:55:14','Pagado','2014-05-31 18:55:15',120,NULL,5,NULL,229,2),(116,13,3,'2014-05-31 18:55:16','Pagado','2014-05-31 18:55:17',121,NULL,5,NULL,231,2),(117,13,3,'2014-05-31 18:55:17','Pagado','2014-05-31 18:55:18',122,NULL,5,NULL,233,2),(118,13,3,'2014-05-31 18:55:18','Pagado','2014-05-31 18:55:19',123,NULL,5,NULL,235,2),(119,13,3,'2014-05-31 18:55:20','Pagado','2014-05-31 18:55:21',124,NULL,5,NULL,237,2),(120,13,3,'2014-05-31 18:55:21','Pagado','2014-05-31 18:55:22',125,NULL,5,NULL,239,2),(121,13,3,'2014-05-31 18:55:22','Pagado','2014-05-31 18:55:23',126,NULL,5,NULL,241,2),(122,13,3,'2014-05-31 18:55:23','Pagado','2014-05-31 18:55:25',127,NULL,5,NULL,243,2),(123,13,3,'2014-05-31 18:55:25','Pagado','2014-05-31 18:55:26',128,NULL,5,NULL,245,2),(124,13,3,'2014-05-31 18:55:26','Pagado','2014-05-31 18:55:27',129,NULL,5,NULL,247,2),(125,13,3,'2014-05-31 18:55:28','Pagado','2014-05-31 18:55:29',130,NULL,5,NULL,249,2),(126,13,3,'2014-05-31 18:55:29','Pagado','2014-05-31 18:55:30',131,NULL,5,NULL,251,2),(127,13,3,'2014-05-31 18:55:30','Pagado','2014-05-31 18:55:31',132,NULL,5,NULL,253,2),(128,13,3,'2014-05-31 18:55:31','Pagado','2014-05-31 18:55:32',133,NULL,5,NULL,255,2),(129,13,3,'2014-05-31 18:55:33','Pagado','2014-05-31 18:55:34',134,NULL,5,NULL,257,2),(130,13,3,'2014-05-31 18:55:34','Pagado','2014-05-31 18:55:35',135,NULL,5,NULL,259,2),(131,13,3,'2014-05-31 18:55:35','Pagado','2014-05-31 18:55:36',136,NULL,5,NULL,261,2),(132,13,3,'2014-05-31 18:55:37','Pagado','2014-05-31 18:55:38',137,NULL,5,NULL,263,2),(133,13,3,'2014-05-31 18:55:38','Pagado','2014-05-31 18:55:39',138,NULL,5,NULL,265,2),(134,13,3,'2014-05-31 18:55:40','Pagado','2014-05-31 18:55:41',139,NULL,5,NULL,267,2),(135,13,3,'2014-05-31 18:55:41','Pagado','2014-05-31 18:55:42',140,NULL,5,NULL,269,2),(136,13,3,'2014-05-31 18:55:43','Pagado','2014-05-31 18:55:44',141,NULL,5,NULL,271,2),(137,13,3,'2014-05-31 18:55:44','Pagado','2014-05-31 18:55:45',142,NULL,5,NULL,273,2),(138,13,3,'2014-05-31 18:55:45','Pagado','2014-05-31 18:55:46',143,NULL,5,NULL,275,2),(139,13,3,'2014-05-31 18:55:46','Pagado','2014-05-31 18:55:48',144,NULL,5,NULL,277,2),(140,13,3,'2014-05-31 18:55:48','Pagado','2014-05-31 18:55:49',145,NULL,5,NULL,279,2),(141,13,3,'2014-05-31 18:55:50','Pagado','2014-05-31 18:55:51',146,NULL,5,NULL,281,2),(142,13,3,'2014-05-31 18:55:51','Pagado','2014-05-31 18:55:52',147,NULL,5,NULL,283,2),(143,13,3,'2014-05-31 18:55:52','Pagado','2014-05-31 18:55:53',148,NULL,5,NULL,285,2),(144,13,3,'2014-05-31 18:55:54','Pagado','2014-05-31 18:55:55',149,NULL,5,NULL,287,2),(145,13,3,'2014-05-31 18:55:55','Pagado','2014-05-31 18:55:56',150,NULL,5,NULL,289,2),(146,13,3,'2014-05-31 18:55:56','Pagado','2014-05-31 18:55:57',151,NULL,5,NULL,291,2),(147,13,3,'2014-05-31 18:55:58','Pagado','2014-05-31 18:55:59',152,NULL,5,NULL,293,2),(148,13,3,'2014-05-31 18:55:59','Pagado','2014-05-31 18:56:01',153,NULL,5,NULL,295,2),(149,13,3,'2014-05-31 18:56:01','Pagado','2014-05-31 18:56:02',154,NULL,5,NULL,297,2),(150,13,3,'2014-05-31 18:56:02','Pagado','2014-05-31 18:56:03',155,NULL,5,NULL,299,2),(151,13,3,'2014-05-31 18:56:04','Pagado','2014-05-31 18:56:05',156,NULL,5,NULL,301,2),(152,13,3,'2014-05-31 18:56:05','Pagado','2014-05-31 18:56:06',157,NULL,5,NULL,303,2),(153,13,3,'2014-05-31 18:56:07','Pagado','2014-05-31 18:56:08',158,NULL,5,NULL,305,2),(154,13,3,'2014-05-31 18:56:08','Pagado','2014-05-31 18:56:09',159,NULL,5,NULL,307,2),(155,13,3,'2014-05-31 18:56:10','Pagado','2014-05-31 18:56:11',160,NULL,5,NULL,309,2),(156,13,3,'2014-05-31 18:56:11','Pagado','2014-05-31 18:56:12',161,NULL,5,NULL,311,2),(157,13,3,'2014-05-31 18:56:13','Pagado','2014-05-31 18:56:14',162,NULL,5,NULL,313,2),(158,13,3,'2014-05-31 18:56:14','Pagado','2014-05-31 18:56:15',163,NULL,5,NULL,315,2),(159,13,3,'2014-05-31 18:56:15','Pagado','2014-05-31 18:56:16',164,NULL,5,NULL,317,2),(160,13,3,'2014-05-31 18:56:17','Pagado','2014-05-31 18:56:18',165,NULL,5,NULL,319,2),(161,13,3,'2014-05-31 18:56:18','Pagado','2014-05-31 18:56:19',166,NULL,5,NULL,321,2),(162,13,3,'2014-05-31 18:56:20','Pagado','2014-05-31 18:56:21',167,NULL,5,NULL,323,2),(163,13,3,'2014-05-31 18:56:21','Pagado','2014-05-31 18:56:23',168,NULL,5,NULL,325,2),(164,13,3,'2014-05-31 18:56:23','Pagado','2014-05-31 18:56:24',169,NULL,5,NULL,327,2),(165,13,3,'2014-05-31 18:56:24','Pagado','2014-05-31 18:56:25',170,NULL,5,NULL,329,2),(166,13,3,'2014-05-31 18:56:26','Pagado','2014-05-31 18:56:27',171,NULL,5,NULL,331,2),(167,13,3,'2014-05-31 18:56:27','Pagado','2014-05-31 18:56:28',172,NULL,5,NULL,333,2),(168,13,3,'2014-05-31 18:56:28','Pagado','2014-05-31 18:56:29',173,NULL,5,NULL,335,2),(169,13,3,'2014-05-31 18:56:30','Pagado','2014-05-31 18:56:31',174,NULL,5,NULL,337,2),(170,13,3,'2014-05-31 18:56:32','Pagado','2014-05-31 18:56:33',175,NULL,5,NULL,339,2),(171,13,3,'2014-05-31 18:56:33','Pagado','2014-05-31 18:56:34',176,NULL,5,NULL,341,2),(172,13,3,'2014-05-31 18:56:34','Pagado','2014-05-31 18:56:36',177,NULL,5,NULL,343,2),(173,13,3,'2014-05-31 18:56:36','Pagado','2014-05-31 18:56:37',178,NULL,5,NULL,345,2),(174,13,3,'2014-05-31 18:56:37','Pagado','2014-05-31 18:56:39',179,NULL,5,NULL,347,2),(175,13,3,'2014-05-31 18:56:39','Pagado','2014-05-31 18:56:40',180,NULL,5,NULL,349,2),(176,13,3,'2014-05-31 18:56:40','Pagado','2014-05-31 18:56:41',181,NULL,5,NULL,351,2),(177,13,3,'2014-05-31 18:56:42','Pagado','2014-05-31 18:56:43',182,NULL,5,NULL,353,2),(178,13,3,'2014-05-31 18:56:43','Pagado','2014-05-31 18:56:45',183,NULL,5,NULL,355,2),(179,13,3,'2014-05-31 18:56:45','Pagado','2014-05-31 18:56:46',184,NULL,5,NULL,357,2),(180,13,3,'2014-05-31 18:56:46','Pagado','2014-05-31 18:56:47',185,NULL,5,NULL,359,2),(181,13,3,'2014-05-31 18:56:48','Pagado','2014-05-31 18:56:49',186,NULL,5,NULL,361,2),(182,13,3,'2014-05-31 18:56:49','Pagado','2014-05-31 18:56:50',187,NULL,5,NULL,363,2),(183,13,3,'2014-05-31 18:56:51','Pagado','2014-05-31 18:56:52',188,NULL,5,NULL,365,2),(184,13,3,'2014-05-31 18:56:52','Pagado','2014-05-31 18:56:54',189,NULL,5,NULL,367,2),(185,13,3,'2014-05-31 18:56:54','Pagado','2014-05-31 18:56:55',190,NULL,5,NULL,369,2),(186,13,3,'2014-05-31 18:56:55','Pagado','2014-05-31 18:56:57',191,NULL,5,NULL,371,2),(187,13,3,'2014-05-31 18:56:57','Pagado','2014-05-31 18:56:58',192,NULL,5,NULL,373,2),(188,13,3,'2014-05-31 18:56:58','Pagado','2014-05-31 18:57:00',193,NULL,5,NULL,375,2),(189,13,3,'2014-05-31 18:57:00','Pagado','2014-05-31 18:57:01',194,NULL,5,NULL,377,2),(190,13,3,'2014-05-31 18:57:01','Pagado','2014-05-31 18:57:02',195,NULL,5,NULL,379,2),(191,13,3,'2014-05-31 18:57:03','Pagado','2014-05-31 18:57:04',196,NULL,5,NULL,381,2),(192,13,3,'2014-05-31 18:57:05','Pagado','2014-05-31 18:57:06',197,NULL,5,NULL,383,2),(193,13,3,'2014-05-31 18:57:06','Pagado','2014-05-31 18:57:07',198,NULL,5,NULL,385,2),(194,13,3,'2014-05-31 18:57:08','Pagado','2014-05-31 18:57:09',199,NULL,5,NULL,387,2);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_state`
--

DROP TABLE IF EXISTS `pedido_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedido_state` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_state`
--

LOCK TABLES `pedido_state` WRITE;
/*!40000 ALTER TABLE `pedido_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `precio`
--

DROP TABLE IF EXISTS `precio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `precio` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `consumible_id` bigint(20) NOT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  `valor` float NOT NULL,
  `precios_idx` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC594A7461C202ED8` (`consumible_id`),
  CONSTRAINT `FKC594A7461C202ED8` FOREIGN KEY (`consumible_id`) REFERENCES `consumible` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `precio`
--

LOCK TABLES `precio` WRITE;
/*!40000 ALTER TABLE `precio` DISABLE KEYS */;
INSERT INTO `precio` VALUES (1,0,1,'-',30,0),(2,0,2,'-',22,0),(3,0,3,'-',20,0),(4,0,4,'Carne',10,0),(5,0,4,'Pollo',10,1),(6,0,4,'Jamón y Queso',10,2),(7,0,5,'-',22,0),(8,0,6,'-',20,0),(9,0,7,'-',55,0),(10,0,8,'-',45,0),(11,0,9,'-',17,0),(12,0,10,'-',17,0),(13,0,11,'1/4',40,0),(14,0,11,'1/2',70,1),(15,0,12,'-',29,0),(16,0,13,'-',32,0),(17,0,14,'-',40,0),(18,0,15,'-',15,0),(19,0,16,'-',15,0),(20,0,17,'-',15,0),(21,0,18,'Jarra (750 cc.)',15,0),(22,0,18,'Vaso (250 cc.)',10,1),(23,0,19,'Sin Gas',8,0),(24,0,19,'Con Gas',8,1),(25,0,20,'-',55,0),(26,0,21,'-',45,0),(27,0,22,'-',47,0),(28,0,23,'1 Porcion',15,0),(29,0,23,'Entera',45,1),(30,0,24,'Porcion',15,0),(31,0,24,'Entera',45,1),(32,0,25,'1',10,0),(33,0,25,'2',17,1),(34,0,25,'3',25,2),(35,0,26,'1 Porcion',15,0);
/*!40000 ALTER TABLE `precio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promocion`
--

DROP TABLE IF EXISTS `promocion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promocion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `fecha_fin` datetime NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `porcentaje_descuento` int(11) NOT NULL,
  `restaurant_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKD0554254CA164B98` (`restaurant_id`),
  CONSTRAINT `FKD0554254CA164B98` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promocion`
--

LOCK TABLES `promocion` WRITE;
/*!40000 ALTER TABLE `promocion` DISABLE KEYS */;
/*!40000 ALTER TABLE `promocion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurant` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `direccion` varchar(70) DEFAULT NULL,
  `duenio_id` bigint(20) NOT NULL,
  `nombre` varchar(70) DEFAULT NULL,
  `precio_cubierto` float NOT NULL,
  `telefono` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `duenio_id` (`duenio_id`),
  KEY `FK965A4B3D4E73FBB8` (`duenio_id`),
  CONSTRAINT `FK965A4B3D4E73FBB8` FOREIGN KEY (`duenio_id`) REFERENCES `duenio` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (1,0,'Paséo Colón 850',2,'FIUBA',0,'4444-5555');
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `authority` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `authority` (`authority`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,0,'DUENIO'),(2,0,'ADMIN'),(3,0,'COCINA'),(4,0,'MOZO');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rubro`
--

DROP TABLE IF EXISTS `rubro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rubro` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `a_cocina` bit(1) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `orden` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rubro`
--

LOCK TABLES `rubro` WRITE;
/*!40000 ALTER TABLE `rubro` DISABLE KEYS */;
INSERT INTO `rubro` VALUES (1,0,'\0','Entradas',1),(2,0,'\0','Principal',2),(3,0,'\0','Bebidas',3),(4,0,'\0','Postres',4);
/*!40000 ALTER TABLE `rubro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state_timer`
--

DROP TABLE IF EXISTS `state_timer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state_timer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `actual_state` varchar(255) NOT NULL,
  `acum_time` datetime NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=389 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state_timer`
--

LOCK TABLES `state_timer` WRITE;
/*!40000 ALTER TABLE `state_timer` DISABLE KEYS */;
INSERT INTO `state_timer` VALUES (1,2,'Cerrado','2014-05-31 18:46:06','2014-05-31 18:46:05'),(2,3,'Terminado','2014-05-31 18:46:06','2014-05-31 18:46:05'),(3,2,'Cerrado','2014-05-31 18:46:08','2014-05-31 18:46:07'),(4,3,'Terminado','2014-05-31 18:46:07','2014-05-31 18:46:07'),(5,2,'Cerrado','2014-05-31 18:46:09','2014-05-31 18:46:08'),(6,3,'Terminado','2014-05-31 18:46:08','2014-05-31 18:46:08'),(7,2,'Cerrado','2014-05-31 18:46:10','2014-05-31 18:46:09'),(8,3,'Terminado','2014-05-31 18:46:09','2014-05-31 18:46:09'),(9,2,'Cerrado','2014-05-31 18:50:05','2014-05-31 18:50:04'),(10,3,'Terminado','2014-05-31 18:50:04','2014-05-31 18:50:04'),(11,2,'Cerrado','2014-05-31 18:51:14','2014-05-31 18:51:13'),(12,3,'Terminado','2014-05-31 18:51:13','2014-05-31 18:51:13'),(13,2,'Cerrado','2014-05-31 18:52:44','2014-05-31 18:52:43'),(14,3,'Terminado','2014-05-31 18:52:44','2014-05-31 18:52:43'),(15,2,'Cerrado','2014-05-31 18:52:45','2014-05-31 18:52:44'),(16,3,'Terminado','2014-05-31 18:52:45','2014-05-31 18:52:44'),(17,2,'Cerrado','2014-05-31 18:52:46','2014-05-31 18:52:46'),(18,3,'Terminado','2014-05-31 18:52:46','2014-05-31 18:52:46'),(19,2,'Cerrado','2014-05-31 18:52:48','2014-05-31 18:52:47'),(20,3,'Terminado','2014-05-31 18:52:47','2014-05-31 18:52:47'),(21,2,'Cerrado','2014-05-31 18:52:49','2014-05-31 18:52:48'),(22,3,'Terminado','2014-05-31 18:52:48','2014-05-31 18:52:48'),(23,2,'Cerrado','2014-05-31 18:52:50','2014-05-31 18:52:49'),(24,3,'Terminado','2014-05-31 18:52:50','2014-05-31 18:52:49'),(25,2,'Cerrado','2014-05-31 18:52:51','2014-05-31 18:52:50'),(26,3,'Terminado','2014-05-31 18:52:51','2014-05-31 18:52:51'),(27,2,'Cerrado','2014-05-31 18:52:52','2014-05-31 18:52:52'),(28,3,'Terminado','2014-05-31 18:52:52','2014-05-31 18:52:52'),(29,2,'Cerrado','2014-05-31 18:52:54','2014-05-31 18:52:53'),(30,3,'Terminado','2014-05-31 18:52:53','2014-05-31 18:52:53'),(31,2,'Cerrado','2014-05-31 18:52:55','2014-05-31 18:52:54'),(32,3,'Terminado','2014-05-31 18:52:55','2014-05-31 18:52:55'),(33,2,'Cerrado','2014-05-31 18:52:56','2014-05-31 18:52:56'),(34,3,'Terminado','2014-05-31 18:52:56','2014-05-31 18:52:56'),(35,2,'Cerrado','2014-05-31 18:52:58','2014-05-31 18:52:57'),(36,3,'Terminado','2014-05-31 18:52:57','2014-05-31 18:52:57'),(37,2,'Cerrado','2014-05-31 18:52:59','2014-05-31 18:52:58'),(38,3,'Terminado','2014-05-31 18:52:59','2014-05-31 18:52:58'),(39,2,'Cerrado','2014-05-31 18:53:00','2014-05-31 18:52:59'),(40,3,'Terminado','2014-05-31 18:53:00','2014-05-31 18:52:59'),(41,2,'Cerrado','2014-05-31 18:53:01','2014-05-31 18:53:00'),(42,3,'Terminado','2014-05-31 18:53:01','2014-05-31 18:53:01'),(43,2,'Cerrado','2014-05-31 18:53:02','2014-05-31 18:53:02'),(44,3,'Terminado','2014-05-31 18:53:02','2014-05-31 18:53:02'),(45,2,'Cerrado','2014-05-31 18:53:04','2014-05-31 18:53:03'),(46,3,'Terminado','2014-05-31 18:53:03','2014-05-31 18:53:03'),(47,2,'Cerrado','2014-05-31 18:53:05','2014-05-31 18:53:04'),(48,3,'Terminado','2014-05-31 18:53:05','2014-05-31 18:53:04'),(49,2,'Cerrado','2014-05-31 18:53:06','2014-05-31 18:53:06'),(50,3,'Terminado','2014-05-31 18:53:06','2014-05-31 18:53:06'),(51,2,'Cerrado','2014-05-31 18:53:08','2014-05-31 18:53:07'),(52,3,'Terminado','2014-05-31 18:53:07','2014-05-31 18:53:07'),(53,2,'Cerrado','2014-05-31 18:53:09','2014-05-31 18:53:08'),(54,3,'Terminado','2014-05-31 18:53:09','2014-05-31 18:53:08'),(55,2,'Cerrado','2014-05-31 18:53:10','2014-05-31 18:53:09'),(56,3,'Terminado','2014-05-31 18:53:10','2014-05-31 18:53:09'),(57,2,'Cerrado','2014-05-31 18:53:12','2014-05-31 18:53:11'),(58,3,'Terminado','2014-05-31 18:53:11','2014-05-31 18:53:11'),(59,2,'Cerrado','2014-05-31 18:53:13','2014-05-31 18:53:12'),(60,3,'Terminado','2014-05-31 18:53:13','2014-05-31 18:53:12'),(61,2,'Cerrado','2014-05-31 18:53:14','2014-05-31 18:53:13'),(62,3,'Terminado','2014-05-31 18:53:14','2014-05-31 18:53:13'),(63,2,'Cerrado','2014-05-31 18:53:16','2014-05-31 18:53:15'),(64,3,'Terminado','2014-05-31 18:53:16','2014-05-31 18:53:15'),(65,2,'Cerrado','2014-05-31 18:53:17','2014-05-31 18:53:16'),(66,3,'Terminado','2014-05-31 18:53:17','2014-05-31 18:53:17'),(67,2,'Cerrado','2014-05-31 18:53:18','2014-05-31 18:53:18'),(68,3,'Terminado','2014-05-31 18:53:18','2014-05-31 18:53:18'),(69,2,'Cerrado','2014-05-31 18:53:20','2014-05-31 18:53:19'),(70,3,'Terminado','2014-05-31 18:53:19','2014-05-31 18:53:19'),(71,2,'Cerrado','2014-05-31 18:53:21','2014-05-31 18:53:20'),(72,3,'Terminado','2014-05-31 18:53:21','2014-05-31 18:53:20'),(73,2,'Cerrado','2014-05-31 18:53:22','2014-05-31 18:53:22'),(74,3,'Terminado','2014-05-31 18:53:22','2014-05-31 18:53:22'),(75,2,'Cerrado','2014-05-31 18:53:24','2014-05-31 18:53:23'),(76,3,'Terminado','2014-05-31 18:53:23','2014-05-31 18:53:23'),(77,2,'Cerrado','2014-05-31 18:53:25','2014-05-31 18:53:24'),(78,3,'Terminado','2014-05-31 18:53:24','2014-05-31 18:53:24'),(79,2,'Cerrado','2014-05-31 18:53:26','2014-05-31 18:53:25'),(80,3,'Terminado','2014-05-31 18:53:26','2014-05-31 18:53:25'),(81,2,'Cerrado','2014-05-31 18:53:28','2014-05-31 18:53:27'),(82,3,'Terminado','2014-05-31 18:53:27','2014-05-31 18:53:27'),(83,2,'Cerrado','2014-05-31 18:53:29','2014-05-31 18:53:28'),(84,3,'Terminado','2014-05-31 18:53:29','2014-05-31 18:53:28'),(85,2,'Cerrado','2014-05-31 18:53:30','2014-05-31 18:53:29'),(86,3,'Terminado','2014-05-31 18:53:30','2014-05-31 18:53:30'),(87,2,'Cerrado','2014-05-31 18:53:31','2014-05-31 18:53:31'),(88,3,'Terminado','2014-05-31 18:53:31','2014-05-31 18:53:31'),(89,2,'Cerrado','2014-05-31 18:53:33','2014-05-31 18:53:32'),(90,3,'Terminado','2014-05-31 18:53:32','2014-05-31 18:53:32'),(91,2,'Cerrado','2014-05-31 18:53:34','2014-05-31 18:53:33'),(92,3,'Terminado','2014-05-31 18:53:33','2014-05-31 18:53:33'),(93,2,'Cerrado','2014-05-31 18:53:35','2014-05-31 18:53:34'),(94,3,'Terminado','2014-05-31 18:53:35','2014-05-31 18:53:34'),(95,2,'Cerrado','2014-05-31 18:53:36','2014-05-31 18:53:35'),(96,3,'Terminado','2014-05-31 18:53:36','2014-05-31 18:53:36'),(97,2,'Cerrado','2014-05-31 18:53:38','2014-05-31 18:53:37'),(98,3,'Terminado','2014-05-31 18:53:38','2014-05-31 18:53:37'),(99,2,'Cerrado','2014-05-31 18:53:39','2014-05-31 18:53:38'),(100,3,'Terminado','2014-05-31 18:53:39','2014-05-31 18:53:39'),(101,2,'Cerrado','2014-05-31 18:53:40','2014-05-31 18:53:40'),(102,3,'Terminado','2014-05-31 18:53:40','2014-05-31 18:53:40'),(103,2,'Cerrado','2014-05-31 18:53:42','2014-05-31 18:53:41'),(104,3,'Terminado','2014-05-31 18:53:41','2014-05-31 18:53:41'),(105,2,'Cerrado','2014-05-31 18:53:43','2014-05-31 18:53:42'),(106,3,'Terminado','2014-05-31 18:53:43','2014-05-31 18:53:42'),(107,2,'Cerrado','2014-05-31 18:53:45','2014-05-31 18:53:43'),(108,3,'Terminado','2014-05-31 18:53:45','2014-05-31 18:53:44'),(109,2,'Cerrado','2014-05-31 18:53:47','2014-05-31 18:53:46'),(110,3,'Terminado','2014-05-31 18:53:47','2014-05-31 18:53:46'),(111,2,'Cerrado','2014-05-31 18:53:49','2014-05-31 18:53:48'),(112,3,'Terminado','2014-05-31 18:53:49','2014-05-31 18:53:48'),(113,2,'Cerrado','2014-05-31 18:53:50','2014-05-31 18:53:49'),(114,3,'Terminado','2014-05-31 18:53:50','2014-05-31 18:53:50'),(115,2,'Cerrado','2014-05-31 18:53:53','2014-05-31 18:53:51'),(116,3,'Terminado','2014-05-31 18:53:52','2014-05-31 18:53:51'),(117,2,'Cerrado','2014-05-31 18:53:54','2014-05-31 18:53:53'),(118,3,'Terminado','2014-05-31 18:53:54','2014-05-31 18:53:53'),(119,2,'Cerrado','2014-05-31 18:53:56','2014-05-31 18:53:55'),(120,3,'Terminado','2014-05-31 18:53:56','2014-05-31 18:53:55'),(121,2,'Cerrado','2014-05-31 18:53:57','2014-05-31 18:53:56'),(122,3,'Terminado','2014-05-31 18:53:57','2014-05-31 18:53:57'),(123,2,'Cerrado','2014-05-31 18:54:00','2014-05-31 18:53:58'),(124,3,'Terminado','2014-05-31 18:53:59','2014-05-31 18:53:58'),(125,2,'Cerrado','2014-05-31 18:54:02','2014-05-31 18:54:01'),(126,3,'Terminado','2014-05-31 18:54:02','2014-05-31 18:54:01'),(127,2,'Cerrado','2014-05-31 18:54:03','2014-05-31 18:54:02'),(128,3,'Terminado','2014-05-31 18:54:03','2014-05-31 18:54:03'),(129,2,'Cerrado','2014-05-31 18:54:05','2014-05-31 18:54:04'),(130,3,'Terminado','2014-05-31 18:54:04','2014-05-31 18:54:04'),(131,2,'Cerrado','2014-05-31 18:54:06','2014-05-31 18:54:05'),(132,3,'Terminado','2014-05-31 18:54:05','2014-05-31 18:54:05'),(133,2,'Cerrado','2014-05-31 18:54:07','2014-05-31 18:54:06'),(134,3,'Terminado','2014-05-31 18:54:07','2014-05-31 18:54:06'),(135,2,'Cerrado','2014-05-31 18:54:08','2014-05-31 18:54:07'),(136,3,'Terminado','2014-05-31 18:54:08','2014-05-31 18:54:08'),(137,2,'Cerrado','2014-05-31 18:54:10','2014-05-31 18:54:09'),(138,3,'Terminado','2014-05-31 18:54:09','2014-05-31 18:54:09'),(139,2,'Cerrado','2014-05-31 18:54:11','2014-05-31 18:54:10'),(140,3,'Terminado','2014-05-31 18:54:11','2014-05-31 18:54:11'),(141,2,'Cerrado','2014-05-31 18:54:13','2014-05-31 18:54:12'),(142,3,'Terminado','2014-05-31 18:54:12','2014-05-31 18:54:12'),(143,2,'Cerrado','2014-05-31 18:54:14','2014-05-31 18:54:13'),(144,3,'Terminado','2014-05-31 18:54:14','2014-05-31 18:54:13'),(145,2,'Cerrado','2014-05-31 18:54:15','2014-05-31 18:54:15'),(146,3,'Terminado','2014-05-31 18:54:15','2014-05-31 18:54:15'),(147,2,'Cerrado','2014-05-31 18:54:17','2014-05-31 18:54:16'),(148,3,'Terminado','2014-05-31 18:54:16','2014-05-31 18:54:16'),(149,2,'Cerrado','2014-05-31 18:54:18','2014-05-31 18:54:17'),(150,3,'Terminado','2014-05-31 18:54:18','2014-05-31 18:54:17'),(151,2,'Cerrado','2014-05-31 18:54:19','2014-05-31 18:54:18'),(152,3,'Terminado','2014-05-31 18:54:19','2014-05-31 18:54:19'),(153,2,'Cerrado','2014-05-31 18:54:21','2014-05-31 18:54:20'),(154,3,'Terminado','2014-05-31 18:54:21','2014-05-31 18:54:20'),(155,2,'Cerrado','2014-05-31 18:54:23','2014-05-31 18:54:22'),(156,3,'Terminado','2014-05-31 18:54:22','2014-05-31 18:54:22'),(157,2,'Cerrado','2014-05-31 18:54:24','2014-05-31 18:54:23'),(158,3,'Terminado','2014-05-31 18:54:24','2014-05-31 18:54:23'),(159,2,'Cerrado','2014-05-31 18:54:25','2014-05-31 18:54:24'),(160,3,'Terminado','2014-05-31 18:54:25','2014-05-31 18:54:25'),(161,2,'Cerrado','2014-05-31 18:54:26','2014-05-31 18:54:26'),(162,3,'Terminado','2014-05-31 18:54:26','2014-05-31 18:54:26'),(163,2,'Cerrado','2014-05-31 18:54:28','2014-05-31 18:54:27'),(164,3,'Terminado','2014-05-31 18:54:27','2014-05-31 18:54:27'),(165,2,'Cerrado','2014-05-31 18:54:29','2014-05-31 18:54:28'),(166,3,'Terminado','2014-05-31 18:54:29','2014-05-31 18:54:28'),(167,2,'Cerrado','2014-05-31 18:54:31','2014-05-31 18:54:29'),(168,3,'Terminado','2014-05-31 18:54:30','2014-05-31 18:54:30'),(169,2,'Cerrado','2014-05-31 18:54:32','2014-05-31 18:54:31'),(170,3,'Terminado','2014-05-31 18:54:32','2014-05-31 18:54:31'),(171,2,'Cerrado','2014-05-31 18:54:34','2014-05-31 18:54:33'),(172,3,'Terminado','2014-05-31 18:54:33','2014-05-31 18:54:33'),(173,2,'Cerrado','2014-05-31 18:54:35','2014-05-31 18:54:34'),(174,3,'Terminado','2014-05-31 18:54:35','2014-05-31 18:54:34'),(175,2,'Cerrado','2014-05-31 18:54:36','2014-05-31 18:54:35'),(176,3,'Terminado','2014-05-31 18:54:36','2014-05-31 18:54:36'),(177,2,'Cerrado','2014-05-31 18:54:38','2014-05-31 18:54:37'),(178,3,'Terminado','2014-05-31 18:54:38','2014-05-31 18:54:37'),(179,2,'Cerrado','2014-05-31 18:54:39','2014-05-31 18:54:38'),(180,3,'Terminado','2014-05-31 18:54:39','2014-05-31 18:54:39'),(181,2,'Cerrado','2014-05-31 18:54:41','2014-05-31 18:54:40'),(182,3,'Terminado','2014-05-31 18:54:41','2014-05-31 18:54:40'),(183,2,'Cerrado','2014-05-31 18:54:42','2014-05-31 18:54:42'),(184,3,'Terminado','2014-05-31 18:54:42','2014-05-31 18:54:42'),(185,2,'Cerrado','2014-05-31 18:54:44','2014-05-31 18:54:43'),(186,3,'Terminado','2014-05-31 18:54:44','2014-05-31 18:54:43'),(187,2,'Cerrado','2014-05-31 18:54:45','2014-05-31 18:54:45'),(188,3,'Terminado','2014-05-31 18:54:45','2014-05-31 18:54:45'),(189,2,'Cerrado','2014-05-31 18:54:47','2014-05-31 18:54:46'),(190,3,'Terminado','2014-05-31 18:54:47','2014-05-31 18:54:46'),(191,2,'Cerrado','2014-05-31 18:54:48','2014-05-31 18:54:47'),(192,3,'Terminado','2014-05-31 18:54:48','2014-05-31 18:54:48'),(193,2,'Cerrado','2014-05-31 18:54:50','2014-05-31 18:54:49'),(194,3,'Terminado','2014-05-31 18:54:50','2014-05-31 18:54:49'),(195,2,'Cerrado','2014-05-31 18:54:51','2014-05-31 18:54:50'),(196,3,'Terminado','2014-05-31 18:54:51','2014-05-31 18:54:51'),(197,2,'Cerrado','2014-05-31 18:54:52','2014-05-31 18:54:52'),(198,3,'Terminado','2014-05-31 18:54:52','2014-05-31 18:54:52'),(199,2,'Cerrado','2014-05-31 18:54:54','2014-05-31 18:54:53'),(200,3,'Terminado','2014-05-31 18:54:53','2014-05-31 18:54:53'),(201,2,'Cerrado','2014-05-31 18:54:56','2014-05-31 18:54:55'),(202,3,'Terminado','2014-05-31 18:54:55','2014-05-31 18:54:55'),(203,2,'Cerrado','2014-05-31 18:54:57','2014-05-31 18:54:56'),(204,3,'Terminado','2014-05-31 18:54:57','2014-05-31 18:54:56'),(205,2,'Cerrado','2014-05-31 18:54:58','2014-05-31 18:54:57'),(206,3,'Terminado','2014-05-31 18:54:58','2014-05-31 18:54:58'),(207,2,'Cerrado','2014-05-31 18:55:00','2014-05-31 18:54:59'),(208,3,'Terminado','2014-05-31 18:54:59','2014-05-31 18:54:59'),(209,2,'Cerrado','2014-05-31 18:55:01','2014-05-31 18:55:00'),(210,3,'Terminado','2014-05-31 18:55:01','2014-05-31 18:55:00'),(211,2,'Cerrado','2014-05-31 18:55:02','2014-05-31 18:55:01'),(212,3,'Terminado','2014-05-31 18:55:02','2014-05-31 18:55:02'),(213,2,'Cerrado','2014-05-31 18:55:04','2014-05-31 18:55:03'),(214,3,'Terminado','2014-05-31 18:55:03','2014-05-31 18:55:03'),(215,2,'Cerrado','2014-05-31 18:55:06','2014-05-31 18:55:04'),(216,3,'Terminado','2014-05-31 18:55:05','2014-05-31 18:55:04'),(217,2,'Cerrado','2014-05-31 18:55:07','2014-05-31 18:55:06'),(218,3,'Terminado','2014-05-31 18:55:06','2014-05-31 18:55:06'),(219,2,'Cerrado','2014-05-31 18:55:08','2014-05-31 18:55:07'),(220,3,'Terminado','2014-05-31 18:55:08','2014-05-31 18:55:07'),(221,2,'Cerrado','2014-05-31 18:55:09','2014-05-31 18:55:08'),(222,3,'Terminado','2014-05-31 18:55:09','2014-05-31 18:55:09'),(223,2,'Cerrado','2014-05-31 18:55:11','2014-05-31 18:55:10'),(224,3,'Terminado','2014-05-31 18:55:11','2014-05-31 18:55:10'),(225,2,'Cerrado','2014-05-31 18:55:12','2014-05-31 18:55:11'),(226,3,'Terminado','2014-05-31 18:55:12','2014-05-31 18:55:12'),(227,2,'Cerrado','2014-05-31 18:55:13','2014-05-31 18:55:13'),(228,3,'Terminado','2014-05-31 18:55:13','2014-05-31 18:55:13'),(229,2,'Cerrado','2014-05-31 18:55:15','2014-05-31 18:55:14'),(230,3,'Terminado','2014-05-31 18:55:15','2014-05-31 18:55:14'),(231,2,'Cerrado','2014-05-31 18:55:17','2014-05-31 18:55:16'),(232,3,'Terminado','2014-05-31 18:55:16','2014-05-31 18:55:16'),(233,2,'Cerrado','2014-05-31 18:55:18','2014-05-31 18:55:17'),(234,3,'Terminado','2014-05-31 18:55:18','2014-05-31 18:55:17'),(235,2,'Cerrado','2014-05-31 18:55:19','2014-05-31 18:55:18'),(236,3,'Terminado','2014-05-31 18:55:19','2014-05-31 18:55:19'),(237,2,'Cerrado','2014-05-31 18:55:21','2014-05-31 18:55:20'),(238,3,'Terminado','2014-05-31 18:55:20','2014-05-31 18:55:20'),(239,2,'Cerrado','2014-05-31 18:55:22','2014-05-31 18:55:21'),(240,3,'Terminado','2014-05-31 18:55:21','2014-05-31 18:55:21'),(241,2,'Cerrado','2014-05-31 18:55:23','2014-05-31 18:55:22'),(242,3,'Terminado','2014-05-31 18:55:23','2014-05-31 18:55:22'),(243,2,'Cerrado','2014-05-31 18:55:24','2014-05-31 18:55:23'),(244,3,'Terminado','2014-05-31 18:55:24','2014-05-31 18:55:24'),(245,2,'Cerrado','2014-05-31 18:55:26','2014-05-31 18:55:25'),(246,3,'Terminado','2014-05-31 18:55:25','2014-05-31 18:55:25'),(247,2,'Cerrado','2014-05-31 18:55:27','2014-05-31 18:55:26'),(248,3,'Terminado','2014-05-31 18:55:27','2014-05-31 18:55:27'),(249,2,'Cerrado','2014-05-31 18:55:29','2014-05-31 18:55:28'),(250,3,'Terminado','2014-05-31 18:55:28','2014-05-31 18:55:28'),(251,2,'Cerrado','2014-05-31 18:55:30','2014-05-31 18:55:29'),(252,3,'Terminado','2014-05-31 18:55:29','2014-05-31 18:55:29'),(253,2,'Cerrado','2014-05-31 18:55:31','2014-05-31 18:55:30'),(254,3,'Terminado','2014-05-31 18:55:31','2014-05-31 18:55:30'),(255,2,'Cerrado','2014-05-31 18:55:32','2014-05-31 18:55:31'),(256,3,'Terminado','2014-05-31 18:55:32','2014-05-31 18:55:32'),(257,2,'Cerrado','2014-05-31 18:55:34','2014-05-31 18:55:33'),(258,3,'Terminado','2014-05-31 18:55:33','2014-05-31 18:55:33'),(259,2,'Cerrado','2014-05-31 18:55:35','2014-05-31 18:55:34'),(260,3,'Terminado','2014-05-31 18:55:35','2014-05-31 18:55:34'),(261,2,'Cerrado','2014-05-31 18:55:36','2014-05-31 18:55:35'),(262,3,'Terminado','2014-05-31 18:55:36','2014-05-31 18:55:36'),(263,2,'Cerrado','2014-05-31 18:55:38','2014-05-31 18:55:37'),(264,3,'Terminado','2014-05-31 18:55:38','2014-05-31 18:55:37'),(265,2,'Cerrado','2014-05-31 18:55:39','2014-05-31 18:55:38'),(266,3,'Terminado','2014-05-31 18:55:39','2014-05-31 18:55:39'),(267,2,'Cerrado','2014-05-31 18:55:41','2014-05-31 18:55:40'),(268,3,'Terminado','2014-05-31 18:55:40','2014-05-31 18:55:40'),(269,2,'Cerrado','2014-05-31 18:55:42','2014-05-31 18:55:41'),(270,3,'Terminado','2014-05-31 18:55:42','2014-05-31 18:55:41'),(271,2,'Cerrado','2014-05-31 18:55:43','2014-05-31 18:55:43'),(272,3,'Terminado','2014-05-31 18:55:43','2014-05-31 18:55:43'),(273,2,'Cerrado','2014-05-31 18:55:45','2014-05-31 18:55:44'),(274,3,'Terminado','2014-05-31 18:55:44','2014-05-31 18:55:44'),(275,2,'Cerrado','2014-05-31 18:55:46','2014-05-31 18:55:45'),(276,3,'Terminado','2014-05-31 18:55:46','2014-05-31 18:55:46'),(277,2,'Cerrado','2014-05-31 18:55:47','2014-05-31 18:55:46'),(278,3,'Terminado','2014-05-31 18:55:47','2014-05-31 18:55:47'),(279,2,'Cerrado','2014-05-31 18:55:49','2014-05-31 18:55:48'),(280,3,'Terminado','2014-05-31 18:55:49','2014-05-31 18:55:49'),(281,2,'Cerrado','2014-05-31 18:55:51','2014-05-31 18:55:50'),(282,3,'Terminado','2014-05-31 18:55:50','2014-05-31 18:55:50'),(283,2,'Cerrado','2014-05-31 18:55:52','2014-05-31 18:55:51'),(284,3,'Terminado','2014-05-31 18:55:52','2014-05-31 18:55:51'),(285,2,'Cerrado','2014-05-31 18:55:53','2014-05-31 18:55:52'),(286,3,'Terminado','2014-05-31 18:55:53','2014-05-31 18:55:53'),(287,2,'Cerrado','2014-05-31 18:55:55','2014-05-31 18:55:54'),(288,3,'Terminado','2014-05-31 18:55:54','2014-05-31 18:55:54'),(289,2,'Cerrado','2014-05-31 18:55:56','2014-05-31 18:55:55'),(290,3,'Terminado','2014-05-31 18:55:56','2014-05-31 18:55:55'),(291,2,'Cerrado','2014-05-31 18:55:57','2014-05-31 18:55:56'),(292,3,'Terminado','2014-05-31 18:55:57','2014-05-31 18:55:57'),(293,2,'Cerrado','2014-05-31 18:55:59','2014-05-31 18:55:58'),(294,3,'Terminado','2014-05-31 18:55:58','2014-05-31 18:55:58'),(295,2,'Cerrado','2014-05-31 18:56:00','2014-05-31 18:55:59'),(296,3,'Terminado','2014-05-31 18:56:00','2014-05-31 18:56:00'),(297,2,'Cerrado','2014-05-31 18:56:02','2014-05-31 18:56:01'),(298,3,'Terminado','2014-05-31 18:56:01','2014-05-31 18:56:01'),(299,2,'Cerrado','2014-05-31 18:56:03','2014-05-31 18:56:02'),(300,3,'Terminado','2014-05-31 18:56:03','2014-05-31 18:56:03'),(301,2,'Cerrado','2014-05-31 18:56:04','2014-05-31 18:56:04'),(302,3,'Terminado','2014-05-31 18:56:04','2014-05-31 18:56:04'),(303,2,'Cerrado','2014-05-31 18:56:06','2014-05-31 18:56:05'),(304,3,'Terminado','2014-05-31 18:56:06','2014-05-31 18:56:06'),(305,2,'Cerrado','2014-05-31 18:56:08','2014-05-31 18:56:07'),(306,3,'Terminado','2014-05-31 18:56:07','2014-05-31 18:56:07'),(307,2,'Cerrado','2014-05-31 18:56:09','2014-05-31 18:56:08'),(308,3,'Terminado','2014-05-31 18:56:09','2014-05-31 18:56:08'),(309,2,'Cerrado','2014-05-31 18:56:11','2014-05-31 18:56:10'),(310,3,'Terminado','2014-05-31 18:56:10','2014-05-31 18:56:10'),(311,2,'Cerrado','2014-05-31 18:56:12','2014-05-31 18:56:11'),(312,3,'Terminado','2014-05-31 18:56:12','2014-05-31 18:56:11'),(313,2,'Cerrado','2014-05-31 18:56:14','2014-05-31 18:56:13'),(314,3,'Terminado','2014-05-31 18:56:13','2014-05-31 18:56:13'),(315,2,'Cerrado','2014-05-31 18:56:15','2014-05-31 18:56:14'),(316,3,'Terminado','2014-05-31 18:56:15','2014-05-31 18:56:14'),(317,2,'Cerrado','2014-05-31 18:56:16','2014-05-31 18:56:15'),(318,3,'Terminado','2014-05-31 18:56:16','2014-05-31 18:56:16'),(319,2,'Cerrado','2014-05-31 18:56:18','2014-05-31 18:56:17'),(320,3,'Terminado','2014-05-31 18:56:17','2014-05-31 18:56:17'),(321,2,'Cerrado','2014-05-31 18:56:19','2014-05-31 18:56:18'),(322,3,'Terminado','2014-05-31 18:56:19','2014-05-31 18:56:19'),(323,2,'Cerrado','2014-05-31 18:56:21','2014-05-31 18:56:20'),(324,3,'Terminado','2014-05-31 18:56:21','2014-05-31 18:56:20'),(325,2,'Cerrado','2014-05-31 18:56:22','2014-05-31 18:56:21'),(326,3,'Terminado','2014-05-31 18:56:22','2014-05-31 18:56:22'),(327,2,'Cerrado','2014-05-31 18:56:24','2014-05-31 18:56:23'),(328,3,'Terminado','2014-05-31 18:56:24','2014-05-31 18:56:23'),(329,2,'Cerrado','2014-05-31 18:56:25','2014-05-31 18:56:24'),(330,3,'Terminado','2014-05-31 18:56:25','2014-05-31 18:56:25'),(331,2,'Cerrado','2014-05-31 18:56:27','2014-05-31 18:56:26'),(332,3,'Terminado','2014-05-31 18:56:26','2014-05-31 18:56:26'),(333,2,'Cerrado','2014-05-31 18:56:28','2014-05-31 18:56:27'),(334,3,'Terminado','2014-05-31 18:56:28','2014-05-31 18:56:27'),(335,2,'Cerrado','2014-05-31 18:56:29','2014-05-31 18:56:28'),(336,3,'Terminado','2014-05-31 18:56:29','2014-05-31 18:56:29'),(337,2,'Cerrado','2014-05-31 18:56:31','2014-05-31 18:56:30'),(338,3,'Terminado','2014-05-31 18:56:30','2014-05-31 18:56:30'),(339,2,'Cerrado','2014-05-31 18:56:33','2014-05-31 18:56:32'),(340,3,'Terminado','2014-05-31 18:56:32','2014-05-31 18:56:32'),(341,2,'Cerrado','2014-05-31 18:56:34','2014-05-31 18:56:33'),(342,3,'Terminado','2014-05-31 18:56:34','2014-05-31 18:56:33'),(343,2,'Cerrado','2014-05-31 18:56:35','2014-05-31 18:56:34'),(344,3,'Terminado','2014-05-31 18:56:35','2014-05-31 18:56:35'),(345,2,'Cerrado','2014-05-31 18:56:37','2014-05-31 18:56:36'),(346,3,'Terminado','2014-05-31 18:56:37','2014-05-31 18:56:36'),(347,2,'Cerrado','2014-05-31 18:56:38','2014-05-31 18:56:37'),(348,3,'Terminado','2014-05-31 18:56:38','2014-05-31 18:56:38'),(349,2,'Cerrado','2014-05-31 18:56:40','2014-05-31 18:56:39'),(350,3,'Terminado','2014-05-31 18:56:39','2014-05-31 18:56:39'),(351,2,'Cerrado','2014-05-31 18:56:41','2014-05-31 18:56:40'),(352,3,'Terminado','2014-05-31 18:56:41','2014-05-31 18:56:41'),(353,2,'Cerrado','2014-05-31 18:56:43','2014-05-31 18:56:42'),(354,3,'Terminado','2014-05-31 18:56:43','2014-05-31 18:56:42'),(355,2,'Cerrado','2014-05-31 18:56:44','2014-05-31 18:56:43'),(356,3,'Terminado','2014-05-31 18:56:44','2014-05-31 18:56:44'),(357,2,'Cerrado','2014-05-31 18:56:46','2014-05-31 18:56:45'),(358,3,'Terminado','2014-05-31 18:56:46','2014-05-31 18:56:45'),(359,2,'Cerrado','2014-05-31 18:56:47','2014-05-31 18:56:46'),(360,3,'Terminado','2014-05-31 18:56:47','2014-05-31 18:56:47'),(361,2,'Cerrado','2014-05-31 18:56:49','2014-05-31 18:56:48'),(362,3,'Terminado','2014-05-31 18:56:48','2014-05-31 18:56:48'),(363,2,'Cerrado','2014-05-31 18:56:50','2014-05-31 18:56:49'),(364,3,'Terminado','2014-05-31 18:56:50','2014-05-31 18:56:50'),(365,2,'Cerrado','2014-05-31 18:56:52','2014-05-31 18:56:51'),(366,3,'Terminado','2014-05-31 18:56:51','2014-05-31 18:56:51'),(367,2,'Cerrado','2014-05-31 18:56:54','2014-05-31 18:56:52'),(368,3,'Terminado','2014-05-31 18:56:53','2014-05-31 18:56:52'),(369,2,'Cerrado','2014-05-31 18:56:55','2014-05-31 18:56:54'),(370,3,'Terminado','2014-05-31 18:56:55','2014-05-31 18:56:54'),(371,2,'Cerrado','2014-05-31 18:56:56','2014-05-31 18:56:55'),(372,3,'Terminado','2014-05-31 18:56:56','2014-05-31 18:56:56'),(373,2,'Cerrado','2014-05-31 18:56:58','2014-05-31 18:56:57'),(374,3,'Terminado','2014-05-31 18:56:58','2014-05-31 18:56:57'),(375,2,'Cerrado','2014-05-31 18:56:59','2014-05-31 18:56:58'),(376,3,'Terminado','2014-05-31 18:56:59','2014-05-31 18:56:59'),(377,2,'Cerrado','2014-05-31 18:57:01','2014-05-31 18:57:00'),(378,3,'Terminado','2014-05-31 18:57:00','2014-05-31 18:57:00'),(379,2,'Cerrado','2014-05-31 18:57:02','2014-05-31 18:57:01'),(380,3,'Terminado','2014-05-31 18:57:02','2014-05-31 18:57:02'),(381,2,'Cerrado','2014-05-31 18:57:04','2014-05-31 18:57:03'),(382,3,'Terminado','2014-05-31 18:57:03','2014-05-31 18:57:03'),(383,2,'Cerrado','2014-05-31 18:57:06','2014-05-31 18:57:05'),(384,3,'Terminado','2014-05-31 18:57:05','2014-05-31 18:57:05'),(385,2,'Cerrado','2014-05-31 18:57:07','2014-05-31 18:57:06'),(386,3,'Terminado','2014-05-31 18:57:07','2014-05-31 18:57:07'),(387,2,'Cerrado','2014-05-31 18:57:09','2014-05-31 18:57:08'),(388,3,'Terminado','2014-05-31 18:57:08','2014-05-31 18:57:08');
/*!40000 ALTER TABLE `state_timer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state_timer_total`
--

DROP TABLE IF EXISTS `state_timer_total`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state_timer_total` (
  `state_timer_id` bigint(20) DEFAULT NULL,
  `total_long` bigint(20) DEFAULT NULL,
  `total_idx` varchar(255) DEFAULT NULL,
  `total_elt` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state_timer_total`
--

LOCK TABLES `state_timer_total` WRITE;
/*!40000 ALTER TABLE `state_timer_total` DISABLE KEYS */;
INSERT INTO `state_timer_total` VALUES (1,NULL,'Abierto',1866),(2,NULL,'Pendiente',1228),(2,NULL,'En Preparacion',414),(2,NULL,'Terminado',701),(1,NULL,'Cerrado',1085),(3,NULL,'Abierto',1076),(4,NULL,'Pendiente',586),(4,NULL,'En Preparacion',724),(4,NULL,'Terminado',933),(3,NULL,'Cerrado',262),(5,NULL,'Abierto',1113),(6,NULL,'Pendiente',706),(6,NULL,'En Preparacion',808),(6,NULL,'Terminado',998),(5,NULL,'Cerrado',277),(7,NULL,'Abierto',1221),(8,NULL,'Pendiente',756),(8,NULL,'En Preparacion',881),(8,NULL,'Terminado',1087),(7,NULL,'Cerrado',407),(9,NULL,'Abierto',1167),(10,NULL,'Pendiente',661),(10,NULL,'En Preparacion',805),(10,NULL,'Terminado',1022),(9,NULL,'Cerrado',350),(11,NULL,'Abierto',1111),(12,NULL,'Pendiente',653),(12,NULL,'En Preparacion',764),(12,NULL,'Terminado',958),(11,NULL,'Cerrado',317),(13,NULL,'Abierto',1395),(14,NULL,'Pendiente',931),(14,NULL,'En Preparacion',1075),(14,NULL,'Terminado',276),(13,NULL,'Cerrado',648),(15,NULL,'Abierto',1590),(16,NULL,'Pendiente',1095),(16,NULL,'En Preparacion',234),(16,NULL,'Terminado',449),(15,NULL,'Cerrado',993),(17,NULL,'Abierto',902),(18,NULL,'Pendiente',499),(18,NULL,'En Preparacion',600),(18,NULL,'Terminado',781),(17,NULL,'Cerrado',1058),(19,NULL,'Abierto',1061),(20,NULL,'Pendiente',584),(20,NULL,'En Preparacion',707),(20,NULL,'Terminado',920),(19,NULL,'Cerrado',254),(21,NULL,'Abierto',1281),(22,NULL,'Pendiente',893),(22,NULL,'En Preparacion',993),(22,NULL,'Terminado',1162),(21,NULL,'Cerrado',455),(23,NULL,'Abierto',1505),(24,NULL,'Pendiente',1015),(24,NULL,'En Preparacion',136),(24,NULL,'Terminado',353),(23,NULL,'Cerrado',678),(25,NULL,'Abierto',1566),(26,NULL,'Pendiente',153),(26,NULL,'En Preparacion',267),(26,NULL,'Terminado',448),(25,NULL,'Cerrado',863),(27,NULL,'Abierto',894),(28,NULL,'Pendiente',394),(28,NULL,'En Preparacion',518),(28,NULL,'Terminado',763),(27,NULL,'Cerrado',1045),(29,NULL,'Abierto',1447),(30,NULL,'Pendiente',534),(30,NULL,'En Preparacion',773),(30,NULL,'Terminado',1250),(29,NULL,'Cerrado',636),(31,NULL,'Abierto',1712),(32,NULL,'Pendiente',190),(32,NULL,'En Preparacion',313),(32,NULL,'Terminado',584),(31,NULL,'Cerrado',875),(33,NULL,'Abierto',885),(34,NULL,'Pendiente',376),(34,NULL,'En Preparacion',499),(34,NULL,'Terminado',752),(33,NULL,'Cerrado',1071),(35,NULL,'Abierto',1119),(36,NULL,'Pendiente',678),(36,NULL,'En Preparacion',819),(36,NULL,'Terminado',989),(35,NULL,'Cerrado',269),(37,NULL,'Abierto',1482),(38,NULL,'Pendiente',1018),(38,NULL,'En Preparacion',141),(38,NULL,'Terminado',341),(37,NULL,'Cerrado',645),(39,NULL,'Abierto',1530),(40,NULL,'Pendiente',1126),(40,NULL,'En Preparacion',226),(40,NULL,'Terminado',404),(39,NULL,'Cerrado',708),(41,NULL,'Abierto',1735),(42,NULL,'Pendiente',286),(42,NULL,'En Preparacion',410),(42,NULL,'Terminado',615),(41,NULL,'Cerrado',881),(43,NULL,'Abierto',891),(44,NULL,'Pendiente',482),(44,NULL,'En Preparacion',595),(44,NULL,'Terminado',778),(43,NULL,'Cerrado',1071),(45,NULL,'Abierto',1108),(46,NULL,'Pendiente',658),(46,NULL,'En Preparacion',781),(46,NULL,'Terminado',967),(45,NULL,'Cerrado',256),(47,NULL,'Abierto',1870),(48,NULL,'Pendiente',1297),(48,NULL,'En Preparacion',427),(48,NULL,'Terminado',726),(47,NULL,'Cerrado',1054),(49,NULL,'Abierto',997),(50,NULL,'Pendiente',609),(50,NULL,'En Preparacion',713),(50,NULL,'Terminado',878),(49,NULL,'Cerrado',1149),(51,NULL,'Abierto',1191),(52,NULL,'Pendiente',733),(52,NULL,'En Preparacion',852),(52,NULL,'Terminado',1051),(51,NULL,'Cerrado',368),(53,NULL,'Abierto',1381),(54,NULL,'Pendiente',994),(54,NULL,'En Preparacion',1093),(54,NULL,'Terminado',262),(53,NULL,'Cerrado',537),(55,NULL,'Abierto',1732),(56,NULL,'Pendiente',1121),(56,NULL,'En Preparacion',245),(56,NULL,'Terminado',501),(55,NULL,'Cerrado',1056),(57,NULL,'Abierto',1145),(58,NULL,'Pendiente',680),(58,NULL,'En Preparacion',801),(58,NULL,'Terminado',1009),(57,NULL,'Cerrado',419),(59,NULL,'Abierto',1450),(60,NULL,'Pendiente',1029),(60,NULL,'En Preparacion',141),(60,NULL,'Terminado',310),(59,NULL,'Cerrado',599),(61,NULL,'Abierto',1671),(62,NULL,'Pendiente',1178),(62,NULL,'En Preparacion',315),(62,NULL,'Terminado',531),(61,NULL,'Cerrado',844),(63,NULL,'Abierto',1527),(64,NULL,'Pendiente',1027),(64,NULL,'En Preparacion',195),(64,NULL,'Terminado',390),(63,NULL,'Cerrado',712),(65,NULL,'Abierto',1774),(66,NULL,'Pendiente',325),(66,NULL,'En Preparacion',452),(66,NULL,'Terminado',648),(65,NULL,'Cerrado',920),(67,NULL,'Abierto',916),(68,NULL,'Pendiente',477),(68,NULL,'En Preparacion',580),(68,NULL,'Terminado',779),(67,NULL,'Cerrado',1094),(69,NULL,'Abierto',1247),(70,NULL,'Pendiente',851),(70,NULL,'En Preparacion',975),(70,NULL,'Terminado',1130),(69,NULL,'Cerrado',392),(71,NULL,'Abierto',1638),(72,NULL,'Pendiente',1160),(72,NULL,'En Preparacion',295),(72,NULL,'Terminado',495),(71,NULL,'Cerrado',821),(73,NULL,'Abierto',941),(74,NULL,'Pendiente',548),(74,NULL,'En Preparacion',653),(74,NULL,'Terminado',825),(73,NULL,'Cerrado',1094),(75,NULL,'Abierto',1146),(76,NULL,'Pendiente',688),(76,NULL,'En Preparacion',811),(76,NULL,'Terminado',1004),(75,NULL,'Cerrado',336),(77,NULL,'Abierto',1279),(78,NULL,'Pendiente',898),(78,NULL,'En Preparacion',995),(78,NULL,'Terminado',1169),(77,NULL,'Cerrado',436),(79,NULL,'Abierto',1992),(80,NULL,'Pendiente',1093),(80,NULL,'En Preparacion',220),(80,NULL,'Terminado',774),(79,NULL,'Cerrado',1173),(81,NULL,'Abierto',1187),(82,NULL,'Pendiente',746),(82,NULL,'En Preparacion',880),(82,NULL,'Terminado',1037),(81,NULL,'Cerrado',361),(83,NULL,'Abierto',1504),(84,NULL,'Pendiente',1063),(84,NULL,'En Preparacion',198),(84,NULL,'Terminado',379),(83,NULL,'Cerrado',670),(85,NULL,'Abierto',1634),(86,NULL,'Pendiente',233),(86,NULL,'En Preparacion',329),(86,NULL,'Terminado',497),(85,NULL,'Cerrado',817),(87,NULL,'Abierto',861),(88,NULL,'Pendiente',485),(88,NULL,'En Preparacion',583),(88,NULL,'Terminado',739),(87,NULL,'Cerrado',1025),(89,NULL,'Abierto',1051),(90,NULL,'Pendiente',589),(90,NULL,'En Preparacion',714),(90,NULL,'Terminado',901),(89,NULL,'Cerrado',232),(91,NULL,'Abierto',1256),(92,NULL,'Pendiente',868),(92,NULL,'En Preparacion',966),(92,NULL,'Terminado',1133),(91,NULL,'Cerrado',407),(93,NULL,'Abierto',1522),(94,NULL,'Pendiente',1030),(94,NULL,'En Preparacion',196),(94,NULL,'Terminado',386),(93,NULL,'Cerrado',717),(95,NULL,'Abierto',1722),(96,NULL,'Pendiente',336),(96,NULL,'En Preparacion',438),(96,NULL,'Terminado',605),(95,NULL,'Cerrado',891),(97,NULL,'Abierto',1489),(98,NULL,'Pendiente',1035),(98,NULL,'En Preparacion',159),(98,NULL,'Terminado',360),(97,NULL,'Cerrado',644),(99,NULL,'Abierto',1699),(100,NULL,'Pendiente',245),(100,NULL,'En Preparacion',356),(100,NULL,'Terminado',555),(99,NULL,'Cerrado',918),(101,NULL,'Abierto',950),(102,NULL,'Pendiente',541),(102,NULL,'En Preparacion',643),(102,NULL,'Terminado',841),(101,NULL,'Cerrado',1093),(103,NULL,'Abierto',1256),(104,NULL,'Pendiente',787),(104,NULL,'En Preparacion',917),(104,NULL,'Terminado',1108),(103,NULL,'Cerrado',444),(105,NULL,'Abierto',1421),(106,NULL,'Pendiente',1053),(106,NULL,'En Preparacion',149),(106,NULL,'Terminado',306),(105,NULL,'Cerrado',587),(107,NULL,'Abierto',2585),(108,NULL,'Pendiente',835),(108,NULL,'En Preparacion',1035),(108,NULL,'Terminado',372),(107,NULL,'Cerrado',966),(109,NULL,'Abierto',1729),(110,NULL,'Pendiente',921),(110,NULL,'En Preparacion',1102),(110,NULL,'Terminado',587),(109,NULL,'Cerrado',905),(111,NULL,'Abierto',1393),(112,NULL,'Pendiente',1000),(112,NULL,'En Preparacion',102),(112,NULL,'Terminado',258),(111,NULL,'Cerrado',583),(113,NULL,'Abierto',1697),(114,NULL,'Pendiente',301),(114,NULL,'En Preparacion',402),(114,NULL,'Terminado',570),(113,NULL,'Cerrado',845),(115,NULL,'Abierto',2121),(116,NULL,'Pendiente',805),(116,NULL,'En Preparacion',1072),(116,NULL,'Terminado',804),(115,NULL,'Cerrado',270),(117,NULL,'Abierto',1688),(118,NULL,'Pendiente',1088),(118,NULL,'En Preparacion',283),(118,NULL,'Terminado',544),(117,NULL,'Cerrado',955),(119,NULL,'Abierto',1411),(120,NULL,'Pendiente',955),(120,NULL,'En Preparacion',1105),(120,NULL,'Terminado',276),(119,NULL,'Cerrado',564),(121,NULL,'Abierto',1948),(122,NULL,'Pendiente',408),(122,NULL,'En Preparacion',527),(122,NULL,'Terminado',831),(121,NULL,'Cerrado',1092),(123,NULL,'Abierto',2769),(124,NULL,'Pendiente',988),(124,NULL,'En Preparacion',1551),(124,NULL,'Terminado',1406),(123,NULL,'Cerrado',1036),(125,NULL,'Abierto',1455),(126,NULL,'Pendiente',824),(126,NULL,'En Preparacion',1093),(126,NULL,'Terminado',339),(125,NULL,'Cerrado',648),(127,NULL,'Abierto',1783),(128,NULL,'Pendiente',370),(128,NULL,'En Preparacion',490),(128,NULL,'Terminado',672),(127,NULL,'Cerrado',961),(129,NULL,'Abierto',1036),(130,NULL,'Pendiente',586),(130,NULL,'En Preparacion',698),(130,NULL,'Terminado',904),(129,NULL,'Cerrado',214),(131,NULL,'Abierto',1259),(132,NULL,'Pendiente',875),(132,NULL,'En Preparacion',974),(132,NULL,'Terminado',1142),(131,NULL,'Cerrado',424),(133,NULL,'Abierto',1520),(134,NULL,'Pendiente',1068),(134,NULL,'En Preparacion',193),(134,NULL,'Terminado',384),(133,NULL,'Cerrado',696),(135,NULL,'Abierto',1888),(136,NULL,'Pendiente',433),(136,NULL,'En Preparacion',537),(136,NULL,'Terminado',739),(135,NULL,'Cerrado',1064),(137,NULL,'Abierto',1216),(138,NULL,'Pendiente',755),(138,NULL,'En Preparacion',888),(138,NULL,'Terminado',1078),(137,NULL,'Cerrado',394),(139,NULL,'Abierto',1883),(140,NULL,'Pendiente',433),(140,NULL,'En Preparacion',545),(140,NULL,'Terminado',736),(139,NULL,'Cerrado',1059),(141,NULL,'Abierto',1126),(142,NULL,'Pendiente',720),(142,NULL,'En Preparacion',821),(142,NULL,'Terminado',994),(141,NULL,'Cerrado',414),(143,NULL,'Abierto',1683),(144,NULL,'Pendiente',1146),(144,NULL,'En Preparacion',274),(144,NULL,'Terminado',519),(143,NULL,'Cerrado',842),(145,NULL,'Abierto',976),(146,NULL,'Pendiente',539),(146,NULL,'En Preparacion',650),(146,NULL,'Terminado',841),(145,NULL,'Cerrado',1153),(147,NULL,'Abierto',1265),(148,NULL,'Pendiente',834),(148,NULL,'En Preparacion',960),(148,NULL,'Terminado',1149),(147,NULL,'Cerrado',430),(149,NULL,'Abierto',1571),(150,NULL,'Pendiente',1125),(150,NULL,'En Preparacion',245),(150,NULL,'Terminado',436),(149,NULL,'Cerrado',748),(151,NULL,'Abierto',1745),(152,NULL,'Pendiente',380),(152,NULL,'En Preparacion',475),(152,NULL,'Terminado',631),(151,NULL,'Cerrado',903),(153,NULL,'Abierto',1525),(154,NULL,'Pendiente',644),(154,NULL,'En Preparacion',1084),(154,NULL,'Terminado',279),(153,NULL,'Cerrado',1023),(155,NULL,'Abierto',1136),(156,NULL,'Pendiente',694),(156,NULL,'En Preparacion',805),(156,NULL,'Terminado',1007),(155,NULL,'Cerrado',312),(157,NULL,'Abierto',1385),(158,NULL,'Pendiente',1002),(158,NULL,'En Preparacion',110),(158,NULL,'Terminado',273),(157,NULL,'Cerrado',556),(159,NULL,'Abierto',1682),(160,NULL,'Pendiente',220),(160,NULL,'En Preparacion',354),(160,NULL,'Terminado',551),(159,NULL,'Cerrado',904),(161,NULL,'Abierto',970),(162,NULL,'Pendiente',598),(162,NULL,'En Preparacion',697),(162,NULL,'Terminado',854),(161,NULL,'Cerrado',1139),(163,NULL,'Abierto',1278),(164,NULL,'Pendiente',829),(164,NULL,'En Preparacion',967),(164,NULL,'Terminado',1156),(163,NULL,'Cerrado',424),(165,NULL,'Abierto',1453),(166,NULL,'Pendiente',1046),(166,NULL,'En Preparacion',148),(166,NULL,'Terminado',329),(165,NULL,'Cerrado',627),(167,NULL,'Abierto',2144),(168,NULL,'Pendiente',389),(168,NULL,'En Preparacion',501),(168,NULL,'Terminado',664),(167,NULL,'Cerrado',302),(169,NULL,'Abierto',1874),(170,NULL,'Pendiente',964),(170,NULL,'En Preparacion',1077),(170,NULL,'Terminado',501),(169,NULL,'Cerrado',1115),(171,NULL,'Abierto',1157),(172,NULL,'Pendiente',753),(172,NULL,'En Preparacion',877),(172,NULL,'Terminado',1044),(171,NULL,'Cerrado',312),(173,NULL,'Abierto',1446),(174,NULL,'Pendiente',1006),(174,NULL,'En Preparacion',129),(174,NULL,'Terminado',318),(173,NULL,'Cerrado',624),(175,NULL,'Abierto',1793),(176,NULL,'Pendiente',337),(176,NULL,'En Preparacion',451),(176,NULL,'Terminado',657),(175,NULL,'Cerrado',983),(177,NULL,'Abierto',1395),(178,NULL,'Pendiente',994),(178,NULL,'En Preparacion',1113),(178,NULL,'Terminado',288),(177,NULL,'Cerrado',539),(179,NULL,'Abierto',1843),(180,NULL,'Pendiente',244),(180,NULL,'En Preparacion',368),(180,NULL,'Terminado',604),(179,NULL,'Cerrado',1085),(181,NULL,'Abierto',1628),(182,NULL,'Pendiente',1136),(182,NULL,'En Preparacion',291),(182,NULL,'Terminado',482),(181,NULL,'Cerrado',818),(183,NULL,'Abierto',930),(184,NULL,'Pendiente',543),(184,NULL,'En Preparacion',654),(184,NULL,'Terminado',813),(183,NULL,'Cerrado',1069),(185,NULL,'Abierto',1613),(186,NULL,'Pendiente',1166),(186,NULL,'En Preparacion',291),(186,NULL,'Terminado',480),(185,NULL,'Cerrado',789),(187,NULL,'Abierto',888),(188,NULL,'Pendiente',513),(188,NULL,'En Preparacion',605),(188,NULL,'Terminado',762),(187,NULL,'Cerrado',1053),(189,NULL,'Abierto',1432),(190,NULL,'Pendiente',1005),(190,NULL,'En Preparacion',127),(190,NULL,'Terminado',316),(189,NULL,'Cerrado',573),(191,NULL,'Abierto',1751),(192,NULL,'Pendiente',304),(192,NULL,'En Preparacion',429),(192,NULL,'Terminado',616),(191,NULL,'Cerrado',928),(193,NULL,'Abierto',1305),(194,NULL,'Pendiente',911),(194,NULL,'En Preparacion',1012),(194,NULL,'Terminado',191),(193,NULL,'Cerrado',449),(195,NULL,'Abierto',1617),(196,NULL,'Pendiente',187),(196,NULL,'En Preparacion',301),(196,NULL,'Terminado',488),(195,NULL,'Cerrado',779),(197,NULL,'Abierto',821),(198,NULL,'Pendiente',428),(198,NULL,'En Preparacion',540),(198,NULL,'Terminado',710),(197,NULL,'Cerrado',997),(199,NULL,'Abierto',1773),(200,NULL,'Pendiente',739),(200,NULL,'En Preparacion',860),(200,NULL,'Terminado',1496),(199,NULL,'Cerrado',914),(201,NULL,'Abierto',1062),(202,NULL,'Pendiente',557),(202,NULL,'En Preparacion',665),(202,NULL,'Terminado',929),(201,NULL,'Cerrado',243),(203,NULL,'Abierto',1416),(204,NULL,'Pendiente',1002),(204,NULL,'En Preparacion',117),(204,NULL,'Terminado',292),(203,NULL,'Cerrado',563),(205,NULL,'Abierto',1702),(206,NULL,'Pendiente',253),(206,NULL,'En Preparacion',364),(206,NULL,'Terminado',557),(205,NULL,'Cerrado',878),(207,NULL,'Abierto',1028),(208,NULL,'Pendiente',645),(208,NULL,'En Preparacion',747),(208,NULL,'Terminado',910),(207,NULL,'Cerrado',174),(209,NULL,'Abierto',1512),(210,NULL,'Pendiente',937),(210,NULL,'En Preparacion',1053),(210,NULL,'Terminado',310),(209,NULL,'Cerrado',701),(211,NULL,'Abierto',1852),(212,NULL,'Pendiente',416),(212,NULL,'En Preparacion',542),(212,NULL,'Terminado',729),(211,NULL,'Cerrado',1031),(213,NULL,'Abierto',1185),(214,NULL,'Pendiente',791),(214,NULL,'En Preparacion',903),(214,NULL,'Terminado',1071),(213,NULL,'Cerrado',327),(215,NULL,'Abierto',2031),(216,NULL,'Pendiente',1290),(216,NULL,'En Preparacion',435),(216,NULL,'Terminado',659),(215,NULL,'Cerrado',190),(217,NULL,'Abierto',1257),(218,NULL,'Pendiente',876),(218,NULL,'En Preparacion',977),(218,NULL,'Terminado',1133),(217,NULL,'Cerrado',434),(219,NULL,'Abierto',1599),(220,NULL,'Pendiente',1160),(220,NULL,'En Preparacion',287),(220,NULL,'Terminado',474),(219,NULL,'Cerrado',743),(221,NULL,'Abierto',1849),(222,NULL,'Pendiente',415),(222,NULL,'En Preparacion',516),(222,NULL,'Terminado',695),(221,NULL,'Cerrado',1020),(223,NULL,'Abierto',1381),(224,NULL,'Pendiente',974),(224,NULL,'En Preparacion',1095),(224,NULL,'Terminado',261),(223,NULL,'Cerrado',533),(225,NULL,'Abierto',1728),(226,NULL,'Pendiente',278),(226,NULL,'En Preparacion',390),(226,NULL,'Terminado',581),(225,NULL,'Cerrado',916),(227,NULL,'Abierto',980),(228,NULL,'Pendiente',587),(228,NULL,'En Preparacion',693),(228,NULL,'Terminado',848),(227,NULL,'Cerrado',1157),(229,NULL,'Abierto',1365),(230,NULL,'Pendiente',919),(230,NULL,'En Preparacion',1040),(230,NULL,'Terminado',230),(229,NULL,'Cerrado',532),(231,NULL,'Abierto',1109),(232,NULL,'Pendiente',683),(232,NULL,'En Preparacion',799),(232,NULL,'Terminado',985),(231,NULL,'Cerrado',286),(233,NULL,'Abierto',1487),(234,NULL,'Pendiente',1050),(234,NULL,'En Preparacion',171),(234,NULL,'Terminado',337),(233,NULL,'Cerrado',627),(235,NULL,'Abierto',1759),(236,NULL,'Pendiente',322),(236,NULL,'En Preparacion',433),(236,NULL,'Terminado',624),(235,NULL,'Cerrado',938),(237,NULL,'Abierto',1023),(238,NULL,'Pendiente',652),(238,NULL,'En Preparacion',757),(238,NULL,'Terminado',911),(237,NULL,'Cerrado',166),(239,NULL,'Abierto',1286),(240,NULL,'Pendiente',860),(240,NULL,'En Preparacion',974),(240,NULL,'Terminado',1163),(239,NULL,'Cerrado',451),(241,NULL,'Abierto',1516),(242,NULL,'Pendiente',1146),(242,NULL,'En Preparacion',236),(242,NULL,'Terminado',403),(241,NULL,'Cerrado',663),(243,NULL,'Abierto',1868),(244,NULL,'Pendiente',412),(244,NULL,'En Preparacion',534),(244,NULL,'Terminado',735),(243,NULL,'Cerrado',1012),(245,NULL,'Abierto',1043),(246,NULL,'Pendiente',673),(246,NULL,'En Preparacion',784),(246,NULL,'Terminado',941),(245,NULL,'Cerrado',220),(247,NULL,'Abierto',1701),(248,NULL,'Pendiente',306),(248,NULL,'En Preparacion',407),(248,NULL,'Terminado',597),(247,NULL,'Cerrado',842),(249,NULL,'Abierto',1018),(250,NULL,'Pendiente',586),(250,NULL,'En Preparacion',703),(250,NULL,'Terminado',893),(249,NULL,'Cerrado',198),(251,NULL,'Abierto',1249),(252,NULL,'Pendiente',885),(252,NULL,'En Preparacion',991),(252,NULL,'Terminado',1146),(251,NULL,'Cerrado',403),(253,NULL,'Abierto',1586),(254,NULL,'Pendiente',1142),(254,NULL,'En Preparacion',266),(254,NULL,'Terminado',454),(253,NULL,'Cerrado',733),(255,NULL,'Abierto',1777),(256,NULL,'Pendiente',411),(256,NULL,'En Preparacion',509),(256,NULL,'Terminado',664),(255,NULL,'Cerrado',923),(257,NULL,'Abierto',1083),(258,NULL,'Pendiente',648),(258,NULL,'En Preparacion',769),(258,NULL,'Terminado',958),(257,NULL,'Cerrado',262),(259,NULL,'Abierto',1315),(260,NULL,'Pendiente',945),(260,NULL,'En Preparacion',1046),(260,NULL,'Terminado',204),(259,NULL,'Cerrado',463),(261,NULL,'Abierto',1732),(262,NULL,'Pendiente',261),(262,NULL,'En Preparacion',420),(262,NULL,'Terminado',609),(261,NULL,'Cerrado',891),(263,NULL,'Abierto',1446),(264,NULL,'Pendiente',1025),(264,NULL,'En Preparacion',135),(264,NULL,'Terminado',319),(263,NULL,'Cerrado',620),(265,NULL,'Abierto',1856),(266,NULL,'Pendiente',404),(266,NULL,'En Preparacion',527),(266,NULL,'Terminado',729),(265,NULL,'Cerrado',998),(267,NULL,'Abierto',1216),(268,NULL,'Pendiente',857),(268,NULL,'En Preparacion',958),(268,NULL,'Terminado',1114),(267,NULL,'Cerrado',380),(269,NULL,'Abierto',1637),(270,NULL,'Pendiente',1187),(270,NULL,'En Preparacion',323),(270,NULL,'Terminado',512),(269,NULL,'Cerrado',814),(271,NULL,'Abierto',872),(272,NULL,'Pendiente',497),(272,NULL,'En Preparacion',599),(272,NULL,'Terminado',755),(271,NULL,'Cerrado',1014),(273,NULL,'Abierto',1253),(274,NULL,'Pendiente',804),(274,NULL,'En Preparacion',929),(274,NULL,'Terminado',1121),(273,NULL,'Cerrado',429),(275,NULL,'Abierto',1578),(276,NULL,'Pendiente',205),(276,NULL,'En Preparacion',303),(276,NULL,'Terminado',460),(275,NULL,'Cerrado',715),(277,NULL,'Abierto',1947),(278,NULL,'Pendiente',491),(278,NULL,'En Preparacion',614),(278,NULL,'Terminado',803),(277,NULL,'Cerrado',1126),(279,NULL,'Abierto',1655),(280,NULL,'Pendiente',218),(280,NULL,'En Preparacion',322),(280,NULL,'Terminado',520),(279,NULL,'Cerrado',826),(281,NULL,'Abierto',1015),(282,NULL,'Pendiente',619),(282,NULL,'En Preparacion',721),(282,NULL,'Terminado',900),(281,NULL,'Cerrado',157),(283,NULL,'Abierto',1396),(284,NULL,'Pendiente',916),(284,NULL,'En Preparacion',1060),(284,NULL,'Terminado',263),(283,NULL,'Cerrado',574),(285,NULL,'Abierto',1684),(286,NULL,'Pendiente',317),(286,NULL,'En Preparacion',416),(286,NULL,'Terminado',571),(285,NULL,'Cerrado',827),(287,NULL,'Abierto',1013),(288,NULL,'Pendiente',587),(288,NULL,'En Preparacion',704),(288,NULL,'Terminado',889),(287,NULL,'Cerrado',191),(289,NULL,'Abierto',1300),(290,NULL,'Pendiente',913),(290,NULL,'En Preparacion',1014),(290,NULL,'Terminado',180),(289,NULL,'Cerrado',443),(291,NULL,'Abierto',1679),(292,NULL,'Pendiente',237),(292,NULL,'En Preparacion',360),(292,NULL,'Terminado',550),(291,NULL,'Cerrado',859),(293,NULL,'Abierto',1387),(294,NULL,'Pendiente',602),(294,NULL,'En Preparacion',715),(294,NULL,'Terminado',874),(293,NULL,'Cerrado',656),(295,NULL,'Abierto',1958),(296,NULL,'Pendiente',521),(296,NULL,'En Preparacion',645),(296,NULL,'Terminado',834),(295,NULL,'Cerrado',1106),(297,NULL,'Abierto',1246),(298,NULL,'Pendiente',830),(298,NULL,'En Preparacion',941),(298,NULL,'Terminado',1121),(297,NULL,'Cerrado',422),(299,NULL,'Abierto',1664),(300,NULL,'Pendiente',239),(300,NULL,'En Preparacion',361),(300,NULL,'Terminado',551),(299,NULL,'Cerrado',809),(301,NULL,'Abierto',980),(302,NULL,'Pendiente',547),(302,NULL,'En Preparacion',659),(302,NULL,'Terminado',849),(301,NULL,'Cerrado',1154),(303,NULL,'Abierto',1596),(304,NULL,'Pendiente',194),(304,NULL,'En Preparacion',306),(304,NULL,'Terminado',473),(303,NULL,'Cerrado',773),(305,NULL,'Abierto',1026),(306,NULL,'Pendiente',592),(306,NULL,'En Preparacion',725),(306,NULL,'Terminado',914),(305,NULL,'Cerrado',157),(307,NULL,'Abierto',1357),(308,NULL,'Pendiente',906),(308,NULL,'En Preparacion',1010),(308,NULL,'Terminado',223),(307,NULL,'Cerrado',535),(309,NULL,'Abierto',1179),(310,NULL,'Pendiente',676),(310,NULL,'En Preparacion',887),(310,NULL,'Terminado',1069),(309,NULL,'Cerrado',321),(311,NULL,'Abierto',1599),(312,NULL,'Pendiente',1173),(312,NULL,'En Preparacion',285),(312,NULL,'Terminado',475),(311,NULL,'Cerrado',786),(313,NULL,'Abierto',1028),(314,NULL,'Pendiente',605),(314,NULL,'En Preparacion',737),(314,NULL,'Terminado',926),(313,NULL,'Cerrado',182),(315,NULL,'Abierto',1370),(316,NULL,'Pendiente',945),(316,NULL,'En Preparacion',1047),(316,NULL,'Terminado',239),(315,NULL,'Cerrado',537),(317,NULL,'Abierto',1769),(318,NULL,'Pendiente',364),(318,NULL,'En Preparacion',499),(318,NULL,'Terminado',665),(317,NULL,'Cerrado',912),(319,NULL,'Abierto',1225),(320,NULL,'Pendiente',774),(320,NULL,'En Preparacion',887),(320,NULL,'Terminado',1089),(319,NULL,'Cerrado',388),(321,NULL,'Abierto',1576),(322,NULL,'Pendiente',178),(322,NULL,'En Preparacion',278),(322,NULL,'Terminado',448),(321,NULL,'Cerrado',771),(323,NULL,'Abierto',1564),(324,NULL,'Pendiente',1082),(324,NULL,'En Preparacion',295),(324,NULL,'Terminado',453),(323,NULL,'Cerrado',710),(325,NULL,'Abierto',1928),(326,NULL,'Pendiente',481),(326,NULL,'En Preparacion',604),(326,NULL,'Terminado',794),(325,NULL,'Cerrado',1100),(327,NULL,'Abierto',1314),(328,NULL,'Pendiente',921),(328,NULL,'En Preparacion',1034),(328,NULL,'Terminado',203),(327,NULL,'Cerrado',456),(329,NULL,'Abierto',1677),(330,NULL,'Pendiente',225),(330,NULL,'En Preparacion',351),(330,NULL,'Terminado',548),(329,NULL,'Cerrado',843),(331,NULL,'Abierto',1002),(332,NULL,'Pendiente',649),(332,NULL,'En Preparacion',738),(332,NULL,'Terminado',896),(331,NULL,'Cerrado',171),(333,NULL,'Abierto',1419),(334,NULL,'Pendiente',967),(334,NULL,'En Preparacion',1080),(334,NULL,'Terminado',280),(333,NULL,'Cerrado',595),(335,NULL,'Abierto',1746),(336,NULL,'Pendiente',387),(336,NULL,'En Preparacion',480),(336,NULL,'Terminado',638),(335,NULL,'Cerrado',901),(337,NULL,'Abierto',1225),(338,NULL,'Pendiente',774),(338,NULL,'En Preparacion',898),(338,NULL,'Terminado',1087),(337,NULL,'Cerrado',569),(339,NULL,'Abierto',1010),(340,NULL,'Pendiente',619),(340,NULL,'En Preparacion',719),(340,NULL,'Terminado',877),(339,NULL,'Cerrado',188),(341,NULL,'Abierto',1553),(342,NULL,'Pendiente',1115),(342,NULL,'En Preparacion',268),(342,NULL,'Terminado',451),(341,NULL,'Cerrado',696),(343,NULL,'Abierto',1939),(344,NULL,'Pendiente',502),(344,NULL,'En Preparacion',604),(344,NULL,'Terminado',814),(343,NULL,'Cerrado',1115),(345,NULL,'Abierto',1439),(346,NULL,'Pendiente',1044),(346,NULL,'En Preparacion',145),(346,NULL,'Terminado',302),(345,NULL,'Cerrado',599),(347,NULL,'Abierto',1858),(348,NULL,'Pendiente',395),(348,NULL,'En Preparacion',515),(348,NULL,'Terminado',721),(347,NULL,'Cerrado',1039),(349,NULL,'Abierto',1242),(350,NULL,'Pendiente',883),(350,NULL,'En Preparacion',973),(350,NULL,'Terminado',1130),(349,NULL,'Cerrado',384),(351,NULL,'Abierto',1649),(352,NULL,'Pendiente',213),(352,NULL,'En Preparacion',325),(352,NULL,'Terminado',517),(351,NULL,'Cerrado',839),(353,NULL,'Abierto',1461),(354,NULL,'Pendiente',1050),(354,NULL,'En Preparacion',148),(354,NULL,'Terminado',330),(353,NULL,'Cerrado',637),(355,NULL,'Abierto',1855),(356,NULL,'Pendiente',480),(356,NULL,'En Preparacion',581),(356,NULL,'Terminado',740),(355,NULL,'Cerrado',1006),(357,NULL,'Abierto',1358),(358,NULL,'Pendiente',899),(358,NULL,'En Preparacion',1025),(358,NULL,'Terminado',224),(357,NULL,'Cerrado',538),(359,NULL,'Abierto',1722),(360,NULL,'Pendiente',353),(360,NULL,'En Preparacion',455),(360,NULL,'Terminado',621),(359,NULL,'Cerrado',876),(361,NULL,'Abierto',1185),(362,NULL,'Pendiente',752),(362,NULL,'En Preparacion',873),(362,NULL,'Terminado',1061),(361,NULL,'Cerrado',361),(363,NULL,'Abierto',1638),(364,NULL,'Pendiente',268),(364,NULL,'En Preparacion',370),(364,NULL,'Terminado',526),(363,NULL,'Cerrado',862),(365,NULL,'Abierto',1157),(366,NULL,'Pendiente',732),(366,NULL,'En Preparacion',844),(366,NULL,'Terminado',1034),(365,NULL,'Cerrado',312),(367,NULL,'Abierto',2082),(368,NULL,'Pendiente',1423),(368,NULL,'En Preparacion',644),(368,NULL,'Terminado',950),(367,NULL,'Cerrado',258),(369,NULL,'Abierto',1500),(370,NULL,'Pendiente',1152),(370,NULL,'En Preparacion',245),(370,NULL,'Terminado',399),(369,NULL,'Cerrado',652),(371,NULL,'Abierto',1964),(372,NULL,'Pendiente',517),(372,NULL,'En Preparacion',630),(372,NULL,'Terminado',841),(371,NULL,'Cerrado',1147),(373,NULL,'Abierto',1406),(374,NULL,'Pendiente',1015),(374,NULL,'En Preparacion',122),(374,NULL,'Terminado',295),(373,NULL,'Cerrado',549),(375,NULL,'Abierto',1858),(376,NULL,'Pendiente',423),(376,NULL,'En Preparacion',546),(376,NULL,'Terminado',736),(375,NULL,'Cerrado',1023),(377,NULL,'Abierto',1266),(378,NULL,'Pendiente',874),(378,NULL,'En Preparacion',964),(378,NULL,'Terminado',1121),(377,NULL,'Cerrado',413),(379,NULL,'Abierto',1753),(380,NULL,'Pendiente',318),(380,NULL,'En Preparacion',440),(380,NULL,'Terminado',630),(379,NULL,'Cerrado',924),(381,NULL,'Abierto',1496),(382,NULL,'Pendiente',746),(382,NULL,'En Preparacion',836),(382,NULL,'Terminado',1073),(381,NULL,'Cerrado',829),(383,NULL,'Abierto',1167),(384,NULL,'Pendiente',737),(384,NULL,'En Preparacion',858),(384,NULL,'Terminado',1049),(383,NULL,'Cerrado',305),(385,NULL,'Abierto',1573),(386,NULL,'Pendiente',162),(386,NULL,'En Preparacion',256),(386,NULL,'Terminado',441),(385,NULL,'Cerrado',756),(387,NULL,'Abierto',1057),(388,NULL,'Pendiente',672),(388,NULL,'En Preparacion',789),(388,NULL,'Terminado',955),(387,NULL,'Cerrado',200);
/*!40000 ALTER TABLE `state_timer_total` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subrubro`
--

DROP TABLE IF EXISTS `subrubro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subrubro` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `a_cocina` bit(1) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `orden` int(11) NOT NULL,
  `rubro_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK85184EBC7909A7C` (`rubro_id`),
  CONSTRAINT `FK85184EBC7909A7C` FOREIGN KEY (`rubro_id`) REFERENCES `rubro` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subrubro`
--

LOCK TABLES `subrubro` WRITE;
/*!40000 ALTER TABLE `subrubro` DISABLE KEYS */;
INSERT INTO `subrubro` VALUES (1,0,'\0','Frias',1,1),(2,0,'\0','Calientes',2,1),(3,0,'\0','Parrilla',1,2),(4,0,'\0','Pastas',2,2),(5,0,'\0','Sin Alcohol',1,3),(6,0,'\0','Vinos',2,3),(7,0,'\0','Tortas',1,4),(8,0,'\0','Helados',2,4);
/*!40000 ALTER TABLE `subrubro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `account_expired` bit(1) NOT NULL,
  `account_locked` bit(1) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `password` varchar(255) NOT NULL,
  `password_expired` bit(1) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,0,'\0','\0','','$2a$10$cUwzaBS84w3LdAcYDpJYke30KmqJRoFHrEHQCHgUwBrsw1R8yD1Ky','\0','admin'),(2,0,'\0','\0','','$2a$10$6.P37O0dfCLGez2YhscrAuMv7Rq3kZDZjnlrwjWbTBFClkZQRxjQK','\0','duenio'),(3,0,'\0','\0','','$2a$10$nlz08yEGcivnLo31qvZwteGHQYCnt2EEvq3Cem9hwa8SYX3S1AMya','\0','cocina'),(4,0,'\0','\0','','$2a$10$wQUMSKEnWUg.cKMx4BQL3uIyDARm.iDT/1m.wthqy6SmZ5cNUaosm','\0','barra'),(5,0,'\0','\0','','$2a$10$jP7rM2ap6yuva0jgXF.43O0MTp4MshFMIOTlYL2U1roVDGUE5SkQG','\0','asd'),(6,0,'\0','\0','','$2a$10$M3q9zHAx1qxAYiSD4ggCX.h.fOpxSX9QloO1VVmqqjkHCBhahR2n6','\0','pmar');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_rol`
--

DROP TABLE IF EXISTS `usuario_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_rol` (
  `rol_id` bigint(20) NOT NULL,
  `usuario_id` bigint(20) NOT NULL,
  PRIMARY KEY (`rol_id`,`usuario_id`),
  KEY `FK3118953ED69EBDE` (`rol_id`),
  KEY `FK3118953E2162997E` (`usuario_id`),
  CONSTRAINT `FK3118953E2162997E` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`),
  CONSTRAINT `FK3118953ED69EBDE` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_rol`
--

LOCK TABLES `usuario_rol` WRITE;
/*!40000 ALTER TABLE `usuario_rol` DISABLE KEYS */;
INSERT INTO `usuario_rol` VALUES (1,2),(2,1),(3,3),(3,4),(4,5),(4,6);
/*!40000 ALTER TABLE `usuario_rol` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-05-31 19:10:01
