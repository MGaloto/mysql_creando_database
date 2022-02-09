-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: centro_medicina_prepaga
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `afiliado`
--

DROP TABLE IF EXISTS `afiliado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `afiliado` (
  `id_afiliado` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `domicilio` varchar(50) DEFAULT NULL,
  `estado_civil` varchar(50) DEFAULT NULL,
  `dni` int DEFAULT NULL,
  `id_plan` int DEFAULT NULL,
  `id_ocupacion` int DEFAULT NULL,
  PRIMARY KEY (`id_afiliado`),
  KEY `id_plan` (`id_plan`),
  KEY `id_ocupacion` (`id_ocupacion`),
  CONSTRAINT `afiliado_ibfk_1` FOREIGN KEY (`id_plan`) REFERENCES `plan_afiliado` (`id_plan`),
  CONSTRAINT `afiliado_ibfk_2` FOREIGN KEY (`id_ocupacion`) REFERENCES `ocupacion_afiliado` (`id_ocupacion`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `afiliado`
--

LOCK TABLES `afiliado` WRITE;
/*!40000 ALTER TABLE `afiliado` DISABLE KEYS */;
INSERT INTO `afiliado` VALUES (1,'Juan','Gomez','juangomez@gmail.com.ar',1945456565,'1990-05-01','calle 1','soltero',37454232,1,1),(2,'Maxi','Lopez','maxilopez@gmail.com.ar',1945456464,'1989-05-01','calle 2','casado',31444222,1,1),(3,'Lucas','Gonzales','lucasgonzales@gmail.com.ar',1945455454,'1987-05-01','calle 3','casado',37444228,1,1),(4,'Julieta','Reta','julietareta@gmail.com.ar',1523235656,'1987-05-02','calle 4','soltero',37444229,1,1),(5,'Giuliana','Lopez','giulopez@gmail.com.ar',1425253635,'1987-05-03','calle 5','soltero',37444230,1,1),(6,'Graciela','Galo','gragalo@gmail.com.ar',1168808947,'1987-05-04','calle 6','soltero',37444231,2,1),(7,'Alejandro','Galo','alegalo@gmail.com.ar',1235356964,'1987-05-05','calle 7','casado',37444232,2,1),(8,'Luis','Casal','luicasa@gmail.com.ar',1527278946,'1987-05-06','calle 8','soltero',37444233,2,1),(9,'Nicolas','Schiavi','nicochi@gmail.com.ar',1564796497,'1987-05-07','calle 9','soltero',37444234,2,2),(10,'Matias','Guitierrez','matgut@gmail.com.ar',1523465678,'1987-05-08','calle 10','soltero',37444235,2,2),(11,'juan','centurion','juancen@gmail',1165654848,'1980-01-05','calle 1500','soltero',30374152,1,1);
/*!40000 ALTER TABLE `afiliado` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_logs_afiliado` BEFORE INSERT ON `afiliado` FOR EACH ROW INSERT INTO `logsafiliado` (id_movimiento, fecha_user, 
	usuario_id, id_afiliado, nombre, apellido, email, telefono, fecha_nacimiento,
    domicilio, estado_civil, dni, id_plan, id_ocupacion, tipo_operacion)
VALUES (NULL, NOW(), SESSION_USER(), NEW.id_afiliado, NEW.nombre, new.apellido,
     new.email, new.telefono, new.fecha_nacimiento, new.domicilio, new.estado_civil,  
     new.dni, new.id_plan, new.id_ocupacion, 'INSERT') */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_logs_afiliado` AFTER INSERT ON `afiliado` FOR EACH ROW INSERT INTO `logsafiliado` (id_movimiento, fecha_user, 
	usuario_id, id_afiliado, nombre, apellido, email, telefono, fecha_nacimiento,
    domicilio, estado_civil, dni, id_plan, id_ocupacion, tipo_operacion)
VALUES (NULL, NOW(), SESSION_USER(), NEW.id_afiliado, NEW.nombre, new.apellido,
     new.email, new.telefono, new.fecha_nacimiento, new.domicilio, new.estado_civil,  
     new.dni, new.id_plan, new.id_ocupacion, 'INSERT') */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `centro_medico`
--

DROP TABLE IF EXISTS `centro_medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `centro_medico` (
  `id_centro` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  `cod_postal` int DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `especialidad_principal` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_centro`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centro_medico`
--

LOCK TABLES `centro_medico` WRITE;
/*!40000 ALTER TABLE `centro_medico` DISABLE KEYS */;
INSERT INTO `centro_medico` VALUES (1,'Narcizo','calle 254',153113111,150,'narcizo@gmail.com','pediatria'),(2,'Aleman','calle 255',153113112,151,'aleman@gmail.com','odontologia'),(3,'Pueyrredon','calle 256',153113113,152,'pueyrredon@gmail.com','psiquiatria'),(4,'Lopez','calle 257',153113114,153,'lopez@gmail.com','dermatologia'),(5,'Español','calle 258',153113115,154,'español@gmail.com','traumatologia'),(6,'Italiano','calle 259',153113116,155,'italiano@gmail.com','pediatria'),(7,'Comunitario','calle 260',153113117,156,'comunitario@gmail.com','odontologia'),(8,'Del Valle','calle 261',153113118,157,'delvalle@gmail.com','psiquiatria'),(9,'Monte Grande','calle 262',153113119,158,'montegrande@gmail.com','dermatologia'),(10,'Britanico','calle 263',153113120,159,'britanico@gmail.com','traumatologia');
/*!40000 ALTER TABLE `centro_medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `centro_medico_insumos`
--

DROP TABLE IF EXISTS `centro_medico_insumos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `centro_medico_insumos` (
  `id_centro_medico_insumos` int NOT NULL AUTO_INCREMENT,
  `id_centro` int DEFAULT NULL,
  `id_insumo` int DEFAULT NULL,
  PRIMARY KEY (`id_centro_medico_insumos`),
  KEY `id_centro` (`id_centro`),
  KEY `id_insumo` (`id_insumo`),
  CONSTRAINT `centro_medico_insumos_ibfk_1` FOREIGN KEY (`id_centro`) REFERENCES `centro_medico` (`id_centro`),
  CONSTRAINT `centro_medico_insumos_ibfk_2` FOREIGN KEY (`id_insumo`) REFERENCES `insumos` (`id_insumo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centro_medico_insumos`
--

LOCK TABLES `centro_medico_insumos` WRITE;
/*!40000 ALTER TABLE `centro_medico_insumos` DISABLE KEYS */;
INSERT INTO `centro_medico_insumos` VALUES (1,1,1),(2,2,2),(3,3,2),(4,4,3),(5,5,3),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10);
/*!40000 ALTER TABLE `centro_medico_insumos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cobros`
--

DROP TABLE IF EXISTS `cobros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cobros` (
  `id_cobros` int NOT NULL AUTO_INCREMENT,
  `fecha_transaccion` date DEFAULT NULL,
  `importe` int DEFAULT NULL,
  `id_medio_operacion` int DEFAULT NULL,
  `id_afiliado` int DEFAULT NULL,
  PRIMARY KEY (`id_cobros`),
  KEY `id_medio_operacion` (`id_medio_operacion`),
  KEY `id_afiliado` (`id_afiliado`),
  CONSTRAINT `cobros_ibfk_1` FOREIGN KEY (`id_medio_operacion`) REFERENCES `medio_operacion` (`id_medio_operacion`),
  CONSTRAINT `cobros_ibfk_2` FOREIGN KEY (`id_afiliado`) REFERENCES `afiliado` (`id_afiliado`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cobros`
--

LOCK TABLES `cobros` WRITE;
/*!40000 ALTER TABLE `cobros` DISABLE KEYS */;
INSERT INTO `cobros` VALUES (1,'2022-02-01',8500,2,1),(2,'2022-02-02',8500,2,2),(3,'2022-02-03',8500,2,3),(4,'2022-02-04',8500,2,4),(5,'2022-02-05',8500,2,5),(6,'2022-02-06',10000,1,6),(7,'2022-02-07',10000,1,7),(8,'2022-02-08',10000,1,8),(9,'2022-02-09',10000,1,9),(10,'2022-02-10',10000,1,10);
/*!40000 ALTER TABLE `cobros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `cobros_afiliados`
--

DROP TABLE IF EXISTS `cobros_afiliados`;
/*!50001 DROP VIEW IF EXISTS `cobros_afiliados`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cobros_afiliados` AS SELECT 
 1 AS `Nombre_Afiliado`,
 1 AS `Apellido_Afiliado`,
 1 AS `Id_afiliado`,
 1 AS `Fecha_Cobro`,
 1 AS `Importe_Cobro`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `consulta`
--

DROP TABLE IF EXISTS `consulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consulta` (
  `id_consulta` int NOT NULL AUTO_INCREMENT,
  `consulta` varchar(50) DEFAULT NULL,
  `diagnostico` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_consulta`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consulta`
--

LOCK TABLES `consulta` WRITE;
/*!40000 ALTER TABLE `consulta` DISABLE KEYS */;
INSERT INTO `consulta` VALUES (1,'fiebre','covid'),(2,'fiebre','covid'),(3,'covid','covid'),(4,'resfrio','covid'),(5,'dolor de panza','gastritis'),(6,'dolor de cuerpo','estrés'),(7,'fiebre','covid'),(8,'covid','covid'),(9,'covid','covid'),(10,'covid','covid'),(11,'fiebre','covid');
/*!40000 ALTER TABLE `consulta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insumos`
--

DROP TABLE IF EXISTS `insumos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insumos` (
  `id_insumo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `id_tipo_insumo` int DEFAULT NULL,
  `id_proveedor` int DEFAULT NULL,
  PRIMARY KEY (`id_insumo`),
  KEY `id_tipo_insumo` (`id_tipo_insumo`),
  KEY `id_proveedor` (`id_proveedor`),
  CONSTRAINT `insumos_ibfk_1` FOREIGN KEY (`id_tipo_insumo`) REFERENCES `tipo_insumo` (`id_tipo_insumo`),
  CONSTRAINT `insumos_ibfk_2` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insumos`
--

LOCK TABLES `insumos` WRITE;
/*!40000 ALTER TABLE `insumos` DISABLE KEYS */;
INSERT INTO `insumos` VALUES (1,'jeringa',2,1),(2,'cama',3,2),(3,'barbijo',4,1),(4,'ambulancia',3,3),(5,'medicamento a',1,4),(6,'medicamento b',1,4),(7,'medicamento c',1,4),(8,'medicamento d',1,4),(9,'medicamento e',1,4),(10,'medicamento f',1,4);
/*!40000 ALTER TABLE `insumos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logsafiliado`
--

DROP TABLE IF EXISTS `logsafiliado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logsafiliado` (
  `id_movimiento` int NOT NULL AUTO_INCREMENT,
  `fecha_user` datetime NOT NULL,
  `usuario_id` varchar(45) DEFAULT NULL,
  `id_afiliado` int DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `domicilio` varchar(50) DEFAULT NULL,
  `estado_civil` varchar(50) DEFAULT NULL,
  `dni` int DEFAULT NULL,
  `id_plan` int DEFAULT NULL,
  `id_ocupacion` int DEFAULT NULL,
  `tipo_operacion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_movimiento`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logsafiliado`
--

LOCK TABLES `logsafiliado` WRITE;
/*!40000 ALTER TABLE `logsafiliado` DISABLE KEYS */;
INSERT INTO `logsafiliado` VALUES (1,'2022-02-06 20:44:11','root@localhost',0,'juan','centurion','juancen@gmail',1165654848,'1980-01-05','calle 1500','soltero',30374152,1,1,'INSERT'),(2,'2022-02-06 20:44:11','root@localhost',11,'juan','centurion','juancen@gmail',1165654848,'1980-01-05','calle 1500','soltero',30374152,1,1,'INSERT');
/*!40000 ALTER TABLE `logsafiliado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medico`
--

DROP TABLE IF EXISTS `medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medico` (
  `id_medico` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `domicilio` varchar(50) DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  PRIMARY KEY (`id_medico`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medico`
--

LOCK TABLES `medico` WRITE;
/*!40000 ALTER TABLE `medico` DISABLE KEYS */;
INSERT INTO `medico` VALUES (1,'Alan','Milei','1990-01-01','calle 45',1180808080),(2,'Franco','Reta','1990-02-01','calle 450',1165656565),(3,'Maxi','Ruti','1990-01-01','calle 100',1136363636),(4,'Juan','Fernandez','1990-01-01','calle 101',1136363637),(5,'Dante','Pichetto','1990-02-01','calle 102',1136363638),(6,'Miguel','Boggiano','1990-03-01','calle 103',1136363639),(7,'Julieta','Catalina','1990-04-01','calle 104',1136363640),(8,'Analia','Cassa','1990-05-01','calle 105',1136363641),(9,'Graciela','Binett','1990-06-01','calle 106',1136363642),(10,'Juliana','Porto','1990-07-01','calle 107',1136363643);
/*!40000 ALTER TABLE `medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medio_operacion`
--

DROP TABLE IF EXISTS `medio_operacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medio_operacion` (
  `id_medio_operacion` int NOT NULL AUTO_INCREMENT,
  `tipo_medio_operacion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_medio_operacion`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medio_operacion`
--

LOCK TABLES `medio_operacion` WRITE;
/*!40000 ALTER TABLE `medio_operacion` DISABLE KEYS */;
INSERT INTO `medio_operacion` VALUES (1,'tarjeta de debito'),(2,'tarjeta de credito'),(3,'efectivo'),(4,'transferencia');
/*!40000 ALTER TABLE `medio_operacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ocupacion_afiliado`
--

DROP TABLE IF EXISTS `ocupacion_afiliado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ocupacion_afiliado` (
  `id_ocupacion` int NOT NULL AUTO_INCREMENT,
  `ocupacion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_ocupacion`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ocupacion_afiliado`
--

LOCK TABLES `ocupacion_afiliado` WRITE;
/*!40000 ALTER TABLE `ocupacion_afiliado` DISABLE KEYS */;
INSERT INTO `ocupacion_afiliado` VALUES (1,'dependencia'),(2,'autonomo'),(3,'jubilado'),(4,'desempleado');
/*!40000 ALTER TABLE `ocupacion_afiliado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos` (
  `id_pagos` int NOT NULL AUTO_INCREMENT,
  `fecha_transaccion` date DEFAULT NULL,
  `importe` bigint DEFAULT NULL,
  `id_medio_operacion` int DEFAULT NULL,
  `id_proveedor` int DEFAULT NULL,
  PRIMARY KEY (`id_pagos`),
  KEY `id_medio_operacion` (`id_medio_operacion`),
  KEY `id_proveedor` (`id_proveedor`),
  CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`id_medio_operacion`) REFERENCES `medio_operacion` (`id_medio_operacion`),
  CONSTRAINT `pagos_ibfk_2` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
INSERT INTO `pagos` VALUES (1,'2022-01-01',500,3,1),(2,'2022-01-02',10000,3,2),(3,'2022-01-03',500,3,1),(4,'2022-01-04',500000,3,3),(5,'2022-01-05',500,3,4),(6,'2022-01-06',600,3,4),(7,'2022-01-07',700,3,4),(8,'2022-01-08',800,3,4),(9,'2022-01-09',900,3,4),(10,'2022-01-10',950,3,4);
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `pagos_proveedores`
--

DROP TABLE IF EXISTS `pagos_proveedores`;
/*!50001 DROP VIEW IF EXISTS `pagos_proveedores`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pagos_proveedores` AS SELECT 
 1 AS `Nombre_proveedor`,
 1 AS `Mail_proveedor`,
 1 AS `Fecha_pago`,
 1 AS `Importe`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `plan_afiliado`
--

DROP TABLE IF EXISTS `plan_afiliado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_afiliado` (
  `id_plan` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_plan`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_afiliado`
--

LOCK TABLES `plan_afiliado` WRITE;
/*!40000 ALTER TABLE `plan_afiliado` DISABLE KEYS */;
INSERT INTO `plan_afiliado` VALUES (1,'medium'),(2,'premium');
/*!40000 ALTER TABLE `plan_afiliado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  `cuit` int DEFAULT NULL,
  `mail` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'insumos s.a',1145654565,20374351,'insumos@gmail.com'),(2,'colchoneria s.a',1145654566,20374341,'colchoneria@gmail.com'),(3,'vehicle s.a',1145654567,20374354,'vehicle@gmail.com'),(4,'farmacorp',1145654568,20374348,'farmacorp@gmail.com'),(5,'farma s.a',1145654569,20374343,'farma@gmail.com');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_insumo`
--

DROP TABLE IF EXISTS `tipo_insumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_insumo` (
  `id_tipo_insumo` int NOT NULL AUTO_INCREMENT,
  `tipo_insumo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_insumo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_insumo`
--

LOCK TABLES `tipo_insumo` WRITE;
/*!40000 ALTER TABLE `tipo_insumo` DISABLE KEYS */;
INSERT INTO `tipo_insumo` VALUES (1,'farmaceutico'),(2,'instrumento'),(3,'hospitalario'),(4,'salud e higiene');
/*!40000 ALTER TABLE `tipo_insumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turnos`
--

DROP TABLE IF EXISTS `turnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turnos` (
  `id_turno` int NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `id_centro` int DEFAULT NULL,
  `id_medico` int DEFAULT NULL,
  `id_afiliado` int DEFAULT NULL,
  `id_consulta` int DEFAULT NULL,
  PRIMARY KEY (`id_turno`),
  KEY `id_centro` (`id_centro`),
  KEY `id_medico` (`id_medico`),
  KEY `id_afiliado` (`id_afiliado`),
  KEY `id_consulta` (`id_consulta`),
  CONSTRAINT `turnos_ibfk_1` FOREIGN KEY (`id_centro`) REFERENCES `centro_medico` (`id_centro`),
  CONSTRAINT `turnos_ibfk_2` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`),
  CONSTRAINT `turnos_ibfk_3` FOREIGN KEY (`id_afiliado`) REFERENCES `afiliado` (`id_afiliado`),
  CONSTRAINT `turnos_ibfk_4` FOREIGN KEY (`id_consulta`) REFERENCES `consulta` (`id_consulta`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turnos`
--

LOCK TABLES `turnos` WRITE;
/*!40000 ALTER TABLE `turnos` DISABLE KEYS */;
INSERT INTO `turnos` VALUES (1,'2022-01-01',1,1,1,1),(2,'2022-01-01',1,2,2,2),(3,'2022-01-01',1,3,3,3),(4,'2022-01-01',4,3,4,4),(5,'2022-01-02',5,3,5,5),(6,'2022-01-03',6,3,6,6),(7,'2022-01-04',7,4,7,7),(8,'2022-01-05',8,5,8,8),(9,'2022-01-06',8,8,9,9),(10,'2022-01-07',10,10,10,10),(11,'2022-02-06',1,3,9,11);
/*!40000 ALTER TABLE `turnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_centromedico_medico`
--

DROP TABLE IF EXISTS `vista_centromedico_medico`;
/*!50001 DROP VIEW IF EXISTS `vista_centromedico_medico`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_centromedico_medico` AS SELECT 
 1 AS `Nombre_Medico`,
 1 AS `Apellido_Medico`,
 1 AS `Telefono_Medico`,
 1 AS `Nombre_Centro`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_consulta_diagnostico`
--

DROP TABLE IF EXISTS `vista_consulta_diagnostico`;
/*!50001 DROP VIEW IF EXISTS `vista_consulta_diagnostico`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_consulta_diagnostico` AS SELECT 
 1 AS `Fecha_Turno`,
 1 AS `Nombre`,
 1 AS `Apellido`,
 1 AS `Diagnostico`,
 1 AS `Consulta`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_medico_paciente`
--

DROP TABLE IF EXISTS `vista_medico_paciente`;
/*!50001 DROP VIEW IF EXISTS `vista_medico_paciente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_medico_paciente` AS SELECT 
 1 AS `Fecha_Turno`,
 1 AS `Nombre_Paciente`,
 1 AS `Apellido_Paciente`,
 1 AS `Nombre_Medico`,
 1 AS `Apellido_Medico`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'centro_medicina_prepaga'
--

--
-- Dumping routines for database 'centro_medicina_prepaga'
--
/*!50003 DROP FUNCTION IF EXISTS `calcular_covid_diagnosticos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calcular_covid_diagnosticos`(diagnos varchar(100)) RETURNS decimal(8,2)
    NO SQL
BEGIN
        DECLARE total_diagnostico numeric(8,2);
        DECLARE total_diagnosticos numeric(8,2);
        SELECT count(diagnostico) INTO total_diagnostico FROM consulta WHERE diagnostico = diagnos;
        SELECT count(diagnostico) INTO total_diagnosticos FROM consulta;
        RETURN ROUND((total_diagnostico / total_diagnosticos)*100, 2);
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `calcular_resultado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calcular_resultado`() RETURNS decimal(8,2)
    NO SQL
BEGIN
        DECLARE pagos_totales numeric(8,2);
        DECLARE cobros_totales numeric(8,2);
        SELECT SUM(importe) INTO cobros_totales FROM cobros;
        SELECT SUM(importe) INTO pagos_totales FROM pagos;
        RETURN (cobros_totales - pagos_totales);
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_centromedico_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_centromedico_order`(IN campo VARCHAR(255) , IN tipo_ordenamiento ENUM('ASC','DESC'), IN tabla VARCHAR(255))
BEGIN
	IF campo <> '' THEN
		SET @ordenar = CONCAT(' ORDER BY ',campo);
	ELSE 
		SET @ordenar ='';
    END IF;
    IF tipo_ordenamiento <> '' THEN
		SET @tipo = CONCAT(' ',tipo_ordenamiento);
	else
		set @tipo ='';
    END IF;
    SET @clausula = CONCAT('SELECT * FROM ', tabla,@ordenar,@tipo );
    PREPARE ejecutarSQL FROM @clausula;
    EXECUTE ejecutarSQL;
    deallocate prepare ejecutarSQL; 
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_centromedico_turno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_centromedico_turno`(IN fecha DATE, 
IN id_centro INT, 
IN id_medico INT,
IN id_afiliado INT,
IN id_consulta INT)
BEGIN
INSERT INTO turnos(fecha,id_centro,id_medico,id_afiliado,id_consulta) 
VALUES(fecha,id_centro,id_medico,id_afiliado,id_consulta);
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `cobros_afiliados`
--

/*!50001 DROP VIEW IF EXISTS `cobros_afiliados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cobros_afiliados` AS select `afiliado`.`nombre` AS `Nombre_Afiliado`,`afiliado`.`apellido` AS `Apellido_Afiliado`,`afiliado`.`id_afiliado` AS `Id_afiliado`,`cobros`.`fecha_transaccion` AS `Fecha_Cobro`,`cobros`.`importe` AS `Importe_Cobro` from (`afiliado` join `cobros` on((`afiliado`.`id_afiliado` = `cobros`.`id_afiliado`))) order by `afiliado`.`nombre` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pagos_proveedores`
--

/*!50001 DROP VIEW IF EXISTS `pagos_proveedores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pagos_proveedores` AS select `proveedor`.`nombre` AS `Nombre_proveedor`,`proveedor`.`mail` AS `Mail_proveedor`,`pagos`.`fecha_transaccion` AS `Fecha_pago`,`pagos`.`importe` AS `Importe` from (`proveedor` join `pagos` on((`proveedor`.`id_proveedor` = `pagos`.`id_proveedor`))) order by `pagos`.`importe` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_centromedico_medico`
--

/*!50001 DROP VIEW IF EXISTS `vista_centromedico_medico`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_centromedico_medico` AS select `medico`.`nombre` AS `Nombre_Medico`,`medico`.`apellido` AS `Apellido_Medico`,`medico`.`telefono` AS `Telefono_Medico`,`centro_medico`.`nombre` AS `Nombre_Centro` from ((`turnos` join `centro_medico` on((`turnos`.`id_centro` = `centro_medico`.`id_centro`))) join `medico` on((`turnos`.`id_medico` = `medico`.`id_medico`))) order by `turnos`.`fecha` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_consulta_diagnostico`
--

/*!50001 DROP VIEW IF EXISTS `vista_consulta_diagnostico`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_consulta_diagnostico` AS select `turnos`.`fecha` AS `Fecha_Turno`,`afiliado`.`nombre` AS `Nombre`,`afiliado`.`apellido` AS `Apellido`,`consulta`.`diagnostico` AS `Diagnostico`,`consulta`.`consulta` AS `Consulta` from ((`turnos` join `afiliado` on((`turnos`.`id_afiliado` = `afiliado`.`id_afiliado`))) join `consulta` on((`turnos`.`id_consulta` = `consulta`.`id_consulta`))) order by `turnos`.`fecha` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_medico_paciente`
--

/*!50001 DROP VIEW IF EXISTS `vista_medico_paciente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_medico_paciente` AS select `turnos`.`fecha` AS `Fecha_Turno`,`afiliado`.`nombre` AS `Nombre_Paciente`,`afiliado`.`apellido` AS `Apellido_Paciente`,`medico`.`nombre` AS `Nombre_Medico`,`medico`.`apellido` AS `Apellido_Medico` from ((`turnos` join `afiliado` on((`turnos`.`id_afiliado` = `afiliado`.`id_afiliado`))) join `medico` on((`turnos`.`id_medico` = `medico`.`id_medico`))) order by `turnos`.`fecha` desc */;
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

-- Dump completed on 2022-02-08 18:41:05
