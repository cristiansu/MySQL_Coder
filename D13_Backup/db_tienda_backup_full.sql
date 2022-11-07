-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: db_tienda
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bitacora_creacion_clientes`
--

DROP TABLE IF EXISTS `bitacora_creacion_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitacora_creacion_clientes` (
  `id_VC` int NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `usuario_id` varchar(45) DEFAULT NULL,
  `new_cliente_nombre` varchar(45) DEFAULT NULL,
  `new_cliente_apellido` varchar(45) DEFAULT NULL,
  `new_cliente_rut` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_VC`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora_creacion_clientes`
--

LOCK TABLES `bitacora_creacion_clientes` WRITE;
/*!40000 ALTER TABLE `bitacora_creacion_clientes` DISABLE KEYS */;
INSERT INTO `bitacora_creacion_clientes` VALUES (1,'2022-10-27 17:57:15','root@localhost','Marie','Curie','1123456-5');
/*!40000 ALTER TABLE `bitacora_creacion_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `idCategoria` int NOT NULL AUTO_INCREMENT,
  `nombreCategoria` varchar(45) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idCategoria`),
  CONSTRAINT `categoria_ibfk_1` FOREIGN KEY (`idCategoria`) REFERENCES `productos` (`id_Categoria`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Vestuario','Vestuario general M-F'),(2,'Electronica','Articulos electronicos'),(3,'Calzado','Calzado general M-F');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `rut` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Cristian','Saavedra','123456789-1'),(2,'Carlos','Urbina','723456789-1'),(3,'Paola','Urbina','723476789-1'),(4,'Hedy','Lamert','793456789-1'),(5,'Arnold','Shwgr','323456789-1'),(6,'Silvestre','Stallone','7123456-5'),(7,'Marie','Curie','1123456-5');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `respaldo_prod` AFTER INSERT ON `clientes` FOR EACH ROW insert into bitacora_creacion_clientes (fecha,usuario_id,new_cliente_nombre,new_cliente_apellido,new_cliente_rut) 
values (now(),session_user(),new.nombre,new.apellido,new.rut) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `detalle_factura`
--

DROP TABLE IF EXISTS `detalle_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_factura` (
  `idDetalleFactura` int NOT NULL AUTO_INCREMENT,
  `id_Factura` int NOT NULL,
  `Id_Producto` int NOT NULL,
  `cantidad` int DEFAULT NULL,
  `precio` int DEFAULT NULL,
  `totalApagar` int DEFAULT NULL,
  PRIMARY KEY (`idDetalleFactura`),
  KEY `id_Factura` (`id_Factura`),
  KEY `Id_Producto` (`Id_Producto`),
  CONSTRAINT `detalle_factura_ibfk_1` FOREIGN KEY (`id_Factura`) REFERENCES `facturas` (`idFactura`),
  CONSTRAINT `detalle_factura_ibfk_2` FOREIGN KEY (`Id_Producto`) REFERENCES `productos` (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_factura`
--

LOCK TABLES `detalle_factura` WRITE;
/*!40000 ALTER TABLE `detalle_factura` DISABLE KEYS */;
INSERT INTO `detalle_factura` VALUES (1,1,1,1,100,100),(2,2,3,1,40,40),(3,3,2,2,30,60),(4,4,5,1,130,130),(5,5,2,2,40,80),(6,6,1,1,40,40),(7,7,5,1,130,130);
/*!40000 ALTER TABLE `detalle_factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturas`
--

DROP TABLE IF EXISTS `facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturas` (
  `idFactura` int NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `id_Cliente` int NOT NULL,
  `id_Vendedor` int NOT NULL,
  PRIMARY KEY (`idFactura`),
  KEY `id_Cliente` (`id_Cliente`),
  KEY `id_Vendedor` (`id_Vendedor`),
  CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`id_Cliente`) REFERENCES `clientes` (`idCliente`),
  CONSTRAINT `facturas_ibfk_2` FOREIGN KEY (`id_Vendedor`) REFERENCES `vendedor` (`idVendedor`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
INSERT INTO `facturas` VALUES (1,'2022-10-13',1,1),(2,'2022-10-12',1,1),(3,'2022-10-10',3,2),(4,'2022-10-09',2,2),(5,'2022-11-13',5,3),(6,'2022-11-13',4,2),(7,'2022-10-13',1,2);
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `idProducto` int NOT NULL AUTO_INCREMENT,
  `id_Categoria` int NOT NULL,
  `nombreProducto` varchar(45) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idProducto`),
  KEY `id_Categoria` (`id_Categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,1,'Polera H','Polera H tallas s-xl'),(2,1,'Calza M','Calza M tallas s-xl'),(3,2,'Audifono','Audifono bluetooth'),(4,2,'Notebook Hp','Notebook 14p-ssd512gb-corei7'),(5,3,'Zapatilla H','Zapatilla running numeros 39-47'),(6,3,'Zapatilla M','Zapatilla M numeros 37-43'),(7,1,'Polera S-M-L-XL','Polera cuello pique'),(24,1,'Polera H','Polera H tallas m-xl'),(25,1,'Calza M','Calza M tallas m-xl'),(26,2,'Audifono','Audifono bluetooth Lg'),(27,2,'Notebook Hp','Notebook 14p-ssd5500gb-corei9'),(28,3,'Zapatilla H','Zapatilla running numeros 42-47'),(29,2,'Notebook Lenovo','Notebook 14p-ssd5500gb-corei9'),(30,3,'Zapatilla M','Zapatilla running numeros 35-42'),(31,3,'Zapatilla M','Zapatilla M numeros 39-43'),(32,1,'Polera H','Polera H tallas m-xl'),(33,1,'Calza M','Calza M tallas m-xl'),(34,2,'Audifono','Audifono bluetooth Lg'),(35,2,'Notebook Hp','Notebook 14p-ssd5500gb-corei9'),(36,3,'Zapatilla H','Zapatilla running numeros 42-47'),(37,2,'Notebook Lenovo','Notebook 14p-ssd5500gb-corei9'),(38,3,'Zapatilla M','Zapatilla running numeros 35-42'),(39,3,'Zapatilla M','Zapatilla M numeros 39-43');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respaldo_productos`
--

DROP TABLE IF EXISTS `respaldo_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `respaldo_productos` (
  `id_RP` int NOT NULL AUTO_INCREMENT,
  `nombreProducto` varchar(45) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_RP`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respaldo_productos`
--

LOCK TABLES `respaldo_productos` WRITE;
/*!40000 ALTER TABLE `respaldo_productos` DISABLE KEYS */;
INSERT INTO `respaldo_productos` VALUES (1,'Polera S-M-L-XL','Polera cuello pique');
/*!40000 ALTER TABLE `respaldo_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedor` (
  `idVendedor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `rut` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idVendedor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor`
--

LOCK TABLES `vendedor` WRITE;
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
INSERT INTO `vendedor` VALUES (1,'Guiselle','Pozo','103456789-1'),(2,'Jeanette','Cheukeman','721456789-1'),(3,'Paola','Saavedra','793450789-1');
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_compras_por_cliente`
--

DROP TABLE IF EXISTS `vista_compras_por_cliente`;
/*!50001 DROP VIEW IF EXISTS `vista_compras_por_cliente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_compras_por_cliente` AS SELECT 
 1 AS `idFactura`,
 1 AS `nombreProducto`,
 1 AS `nombre`,
 1 AS `totalApagar`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_facturas_vendedor_paola`
--

DROP TABLE IF EXISTS `vista_facturas_vendedor_paola`;
/*!50001 DROP VIEW IF EXISTS `vista_facturas_vendedor_paola`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_facturas_vendedor_paola` AS SELECT 
 1 AS `idFactura`,
 1 AS `id_Cliente`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_ingresos`
--

DROP TABLE IF EXISTS `vista_ingresos`;
/*!50001 DROP VIEW IF EXISTS `vista_ingresos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_ingresos` AS SELECT 
 1 AS `id_Factura`,
 1 AS `totalApagar`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_productos_vestuario`
--

DROP TABLE IF EXISTS `vista_productos_vestuario`;
/*!50001 DROP VIEW IF EXISTS `vista_productos_vestuario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_productos_vestuario` AS SELECT 
 1 AS `nombreProducto`,
 1 AS `descripcion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_ventas_audifono`
--

DROP TABLE IF EXISTS `vista_ventas_audifono`;
/*!50001 DROP VIEW IF EXISTS `vista_ventas_audifono`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_ventas_audifono` AS SELECT 
 1 AS `nombreProducto`,
 1 AS `id_Producto`,
 1 AS `totalApagar`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_ventasporproducto`
--

DROP TABLE IF EXISTS `vista_ventasporproducto`;
/*!50001 DROP VIEW IF EXISTS `vista_ventasporproducto`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_ventasporproducto` AS SELECT 
 1 AS `nombreProducto`,
 1 AS `id_Producto`,
 1 AS `totalApagar`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vista_compras_por_cliente`
--

/*!50001 DROP VIEW IF EXISTS `vista_compras_por_cliente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_compras_por_cliente` AS select `facturas`.`idFactura` AS `idFactura`,`productos`.`nombreProducto` AS `nombreProducto`,`clientes`.`nombre` AS `nombre`,`detalle_factura`.`totalApagar` AS `totalApagar` from (((`clientes` join `facturas`) join `productos`) join `detalle_factura`) where ((`productos`.`idProducto` = `detalle_factura`.`Id_Producto`) and (`clientes`.`idCliente` = `facturas`.`id_Cliente`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_facturas_vendedor_paola`
--

/*!50001 DROP VIEW IF EXISTS `vista_facturas_vendedor_paola`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_facturas_vendedor_paola` AS select `facturas`.`idFactura` AS `idFactura`,`facturas`.`id_Cliente` AS `id_Cliente` from `facturas` where (`facturas`.`id_Vendedor` = 3) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_ingresos`
--

/*!50001 DROP VIEW IF EXISTS `vista_ingresos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_ingresos` AS select `detalle_factura`.`id_Factura` AS `id_Factura`,`detalle_factura`.`totalApagar` AS `totalApagar` from `detalle_factura` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_productos_vestuario`
--

/*!50001 DROP VIEW IF EXISTS `vista_productos_vestuario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_productos_vestuario` AS select `productos`.`nombreProducto` AS `nombreProducto`,`productos`.`descripcion` AS `descripcion` from `productos` where (`productos`.`id_Categoria` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_ventas_audifono`
--

/*!50001 DROP VIEW IF EXISTS `vista_ventas_audifono`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_ventas_audifono` AS select `productos`.`nombreProducto` AS `nombreProducto`,`detalle_factura`.`Id_Producto` AS `id_Producto`,`detalle_factura`.`totalApagar` AS `totalApagar` from (`productos` join `detalle_factura`) where (`productos`.`idProducto` = `detalle_factura`.`Id_Producto`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_ventasporproducto`
--

/*!50001 DROP VIEW IF EXISTS `vista_ventasporproducto`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_ventasporproducto` AS select `productos`.`nombreProducto` AS `nombreProducto`,`detalle_factura`.`Id_Producto` AS `id_Producto`,`detalle_factura`.`totalApagar` AS `totalApagar` from (`productos` join `detalle_factura`) where (`productos`.`idProducto` = `detalle_factura`.`Id_Producto`) */;
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

-- Dump completed on 2022-11-07 13:16:41
