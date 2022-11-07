CREATE DATABASE  IF NOT EXISTS `db_tienda` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_tienda`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: db_tienda
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,1,'Polera H','Polera H tallas s-xl'),(2,1,'Calza M','Calza M tallas s-xl'),(3,2,'Audifono','Audifono bluetooth'),(4,2,'Notebook Hp','Notebook 14p-ssd512gb-corei7'),(5,3,'Zapatilla H','Zapatilla running numeros 39-47'),(6,3,'Zapatilla M','Zapatilla M numeros 37-43'),(7,1,'Polera S-M-L-XL','Polera cuello pique'),(24,1,'Polera H','Polera H tallas m-xl'),(25,1,'Calza M','Calza M tallas m-xl'),(26,2,'Audifono','Audifono bluetooth Lg'),(27,2,'Notebook Hp','Notebook 14p-ssd5500gb-corei9'),(28,3,'Zapatilla H','Zapatilla running numeros 42-47'),(29,2,'Notebook Lenovo','Notebook 14p-ssd5500gb-corei9'),(30,3,'Zapatilla M','Zapatilla running numeros 35-42'),(31,3,'Zapatilla M','Zapatilla M numeros 39-43'),(32,1,'Polera H','Polera H tallas m-xl'),(33,1,'Calza M','Calza M tallas m-xl'),(34,2,'Audifono','Audifono bluetooth Lg'),(35,2,'Notebook Hp','Notebook 14p-ssd5500gb-corei9'),(36,3,'Zapatilla H','Zapatilla running numeros 42-47'),(37,2,'Notebook Lenovo','Notebook 14p-ssd5500gb-corei9'),(38,3,'Zapatilla M','Zapatilla running numeros 35-42'),(39,3,'Zapatilla M','Zapatilla M numeros 39-43');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-07 12:57:21
