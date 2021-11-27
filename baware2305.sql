CREATE DATABASE  IF NOT EXISTS `baware` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_spanish_ci */;
USE `baware`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: baware
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `catpin`
--

DROP TABLE IF EXISTS `catpin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catpin` (
  `id_cat` tinyint(4) NOT NULL AUTO_INCREMENT,
  `nom_cat` varchar(17) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id_cat`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catpin`
--

LOCK TABLES `catpin` WRITE;
/*!40000 ALTER TABLE `catpin` DISABLE KEYS */;
INSERT INTO `catpin` VALUES (1,'Violacion'),(2,'Robo(carterismo)'),(3,'Asalto'),(4,'Robo'),(5,'Homicidio'),(6,'Reunion maliciosa'),(7,'Acoso');
/*!40000 ALTER TABLE `catpin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catrep`
--

DROP TABLE IF EXISTS `catrep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catrep` (
  `id_ctr` tinyint(4) NOT NULL AUTO_INCREMENT,
  `nom_ctr` varchar(25) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id_ctr`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catrep`
--

LOCK TABLES `catrep` WRITE;
/*!40000 ALTER TABLE `catrep` DISABLE KEYS */;
INSERT INTO `catrep` VALUES (1,'Broma'),(2,'Contenido inadecuado'),(3,'Lenguaje Vulgar'),(4,'Otros');
/*!40000 ALTER TABLE `catrep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pin`
--

DROP TABLE IF EXISTS `pin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pin` (
  `id_pin` bigint(20) NOT NULL AUTO_INCREMENT,
  `cox_pin` double NOT NULL,
  `coy_pin` double NOT NULL,
  `des_pin` varchar(500) CHARACTER SET latin1 NOT NULL,
  `fec_pin` date NOT NULL,
  `id_zon` int(11) NOT NULL,
  `id_usu` bigint(20) DEFAULT NULL,
  `id_cat` tinyint(4) NOT NULL,
  PRIMARY KEY (`id_pin`),
  KEY `id_zon` (`id_zon`),
  KEY `id_usu` (`id_usu`),
  KEY `id_cat` (`id_cat`),
  CONSTRAINT `pin_ibfk_1` FOREIGN KEY (`id_zon`) REFERENCES `zona` (`id_zon`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `pin_ibfk_2` FOREIGN KEY (`id_usu`) REFERENCES `usuario` (`id_usu`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `pin_ibfk_3` FOREIGN KEY (`id_cat`) REFERENCES `catpin` (`id_cat`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pin`
--

LOCK TABLES `pin` WRITE;
/*!40000 ALTER TABLE `pin` DISABLE KEYS */;
/*!40000 ALTER TABLE `pin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relazu`
--

DROP TABLE IF EXISTS `relazu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relazu` (
  `id_rzu` bigint(20) NOT NULL AUTO_INCREMENT,
  `act_rzu` tinyint(1) DEFAULT '1',
  `id_zon` int(11) NOT NULL,
  `id_usu` bigint(20) NOT NULL,
  PRIMARY KEY (`id_rzu`),
  KEY `id_zon` (`id_zon`),
  KEY `id_usu` (`id_usu`),
  CONSTRAINT `relazu_ibfk_1` FOREIGN KEY (`id_zon`) REFERENCES `zona` (`id_zon`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `relazu_ibfk_2` FOREIGN KEY (`id_usu`) REFERENCES `usuario` (`id_usu`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relazu`
--

LOCK TABLES `relazu` WRITE;
/*!40000 ALTER TABLE `relazu` DISABLE KEYS */;
INSERT INTO `relazu` VALUES (1,0,1,2),(2,1,6,2);
/*!40000 ALTER TABLE `relazu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporte`
--

DROP TABLE IF EXISTS `reporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporte` (
  `id_rep` bigint(20) NOT NULL AUTO_INCREMENT,
  `des_rep` varchar(500) CHARACTER SET latin1 NOT NULL,
  `id_pin` bigint(20) DEFAULT NULL,
  `id_ctr` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id_rep`),
  KEY `id_pin` (`id_pin`),
  KEY `id_ctr` (`id_ctr`),
  CONSTRAINT `reporte_ibfk_1` FOREIGN KEY (`id_pin`) REFERENCES `pin` (`id_pin`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `reporte_ibfk_2` FOREIGN KEY (`id_ctr`) REFERENCES `catrep` (`id_ctr`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporte`
--

LOCK TABLES `reporte` WRITE;
/*!40000 ALTER TABLE `reporte` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipusu`
--

DROP TABLE IF EXISTS `tipusu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipusu` (
  `id_tdu` tinyint(4) NOT NULL AUTO_INCREMENT,
  `nom_tdu` varchar(10) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id_tdu`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipusu`
--

LOCK TABLES `tipusu` WRITE;
/*!40000 ALTER TABLE `tipusu` DISABLE KEYS */;
INSERT INTO `tipusu` VALUES (1,'Admin'),(2,'Logeado');
/*!40000 ALTER TABLE `tipusu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id_usu` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom_usu` varchar(17) CHARACTER SET latin1 NOT NULL,
  `pas_usu` varchar(15) CHARACTER SET latin1 NOT NULL,
  `ema_usu` varchar(28) CHARACTER SET latin1 NOT NULL,
  `id_tdu` tinyint(4) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id_usu`),
  KEY `id_tdu` (`id_tdu`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_tdu`) REFERENCES `tipusu` (`id_tdu`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Minding','cuzwemind','minding.corp@gmail.com',1),(2,'MindBlast','ilovebread','gustavopdzz0@gmail.com',2),(3,'YoMeroCaguamero','caguama','teamedgaar01@gmail.com',2),(4,'OsoMaduro','ositoMaduro','angelalan9678@gmail.com',2),(5,'2muchSeb4U','Mi1Lo$Mo','se.ru.uv.12@gmail.com',2),(6,'Pancito','ilovebread','loco242442xd@gmail.com',2);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vlogeado`
--

DROP TABLE IF EXISTS `vlogeado`;
/*!50001 DROP VIEW IF EXISTS `vlogeado`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vlogeado` AS SELECT 
 1 AS `id_usu`,
 1 AS `nom_usu`,
 1 AS `ema_usu`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vpinrep`
--

DROP TABLE IF EXISTS `vpinrep`;
/*!50001 DROP VIEW IF EXISTS `vpinrep`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vpinrep` AS SELECT 
 1 AS `id_pin`,
 1 AS `id_usu`,
 1 AS `nom_usu`,
 1 AS `des_pin`,
 1 AS `nom_ctr`,
 1 AS `des_rep`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vpintot`
--

DROP TABLE IF EXISTS `vpintot`;
/*!50001 DROP VIEW IF EXISTS `vpintot`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vpintot` AS SELECT 
 1 AS `id_usu`,
 1 AS `nom_usu`,
 1 AS `id_pin`,
 1 AS `cox_pin`,
 1 AS `coy_pin`,
 1 AS `fec_pin`,
 1 AS `nom_cat`,
 1 AS `des_pin`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `zona`
--

DROP TABLE IF EXISTS `zona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zona` (
  `id_zon` int(11) NOT NULL AUTO_INCREMENT,
  `cx1_zon` double NOT NULL,
  `cy1_zon` double NOT NULL,
  `cx2_zon` double NOT NULL,
  `cy2_zon` double NOT NULL,
  PRIMARY KEY (`id_zon`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zona`
--

LOCK TABLES `zona` WRITE;
/*!40000 ALTER TABLE `zona` DISABLE KEYS */;
INSERT INTO `zona` VALUES (1,19.455862,-99.152793,19.467085,-99.165177),(2,19.455862,-99.140409,19.467085,-99.152794),(3,19.455862,-99.128025,19.467085,-99.140411),(4,19.455862,-99.121999,19.467085,-99.128024),(5,19.444639,-99.152793,19.455862,-99.165177),(6,19.444639,-99.140409,19.455862,-99.152794),(7,19.444639,-99.128025,19.455862,-99.140411),(8,19.444639,-99.121999,19.455862,-99.128024),(9,19.422194,-99.152793,19.444638,-99.165177),(10,19.422194,-99.140409,19.444638,-99.152794),(11,19.422194,-99.128025,19.444638,-99.140411),(12,19.422194,-99.121999,19.444638,-99.128024),(13,19.410971,-99.152793,19.422193,-99.165177),(14,19.410971,-99.140409,19.422193,-99.152794),(15,19.410971,-99.128025,19.422193,-99.140411),(16,19.410971,-99.121999,19.422193,-99.128024),(17,19.399748,-99.152793,19.410971,-99.165177),(18,19.399748,-99.140409,19.410971,-99.152794),(19,19.399748,-99.128025,19.410971,-99.140411),(20,19.399748,-99.121999,19.410971,-99.128024),(23,19.422194,-99.165177,19.444638,-99.178861),(24,19.399748,-99.165177,19.410971,-99.177561),(25,19.422194,-99.165177,19.410971,-99.177561),(26,19.419193,-99.165177,19.404971,-99.186861);
/*!40000 ALTER TABLE `zona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'baware'
--

--
-- Dumping routines for database 'baware'
--

--
-- Final view structure for view `vlogeado`
--

/*!50001 DROP VIEW IF EXISTS `vlogeado`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vlogeado` AS select `usuario`.`id_usu` AS `id_usu`,`usuario`.`nom_usu` AS `nom_usu`,`usuario`.`ema_usu` AS `ema_usu` from `usuario` where (`usuario`.`id_tdu` = 2) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vpinrep`
--

/*!50001 DROP VIEW IF EXISTS `vpinrep`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vpinrep` AS select `reporte`.`id_pin` AS `id_pin`,`pin`.`id_usu` AS `id_usu`,`usuario`.`nom_usu` AS `nom_usu`,`pin`.`des_pin` AS `des_pin`,`catrep`.`nom_ctr` AS `nom_ctr`,`reporte`.`des_rep` AS `des_rep` from (((`reporte` join `pin` on((`reporte`.`id_pin` = `pin`.`id_pin`))) join `usuario` on((`pin`.`id_usu` = `usuario`.`id_usu`))) join `catrep` on((`reporte`.`id_ctr` = `catrep`.`id_ctr`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vpintot`
--

/*!50001 DROP VIEW IF EXISTS `vpintot`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vpintot` AS select `pin`.`id_usu` AS `id_usu`,`usuario`.`nom_usu` AS `nom_usu`,`pin`.`id_pin` AS `id_pin`,`pin`.`cox_pin` AS `cox_pin`,`pin`.`coy_pin` AS `coy_pin`,`pin`.`fec_pin` AS `fec_pin`,`catpin`.`nom_cat` AS `nom_cat`,`pin`.`des_pin` AS `des_pin` from ((`pin` join `usuario` on((`pin`.`id_usu` = `usuario`.`id_usu`))) join `catpin` on((`pin`.`id_cat` = `catpin`.`id_cat`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-23 19:35:50
