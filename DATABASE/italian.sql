-- MySQL dump 10.13  Distrib 5.7.21, for Win64 (x86_64)
--
-- Host: localhost    Database: italian
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `cantidad_surte`
--

DROP TABLE IF EXISTS `cantidad_surte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cantidad_surte` (
  `Folio_surte` smallint(3) unsigned zerofill NOT NULL,
  `clave_insumo` varchar(7) COLLATE latin1_spanish_ci NOT NULL,
  `cant` int(10) unsigned NOT NULL,
  `precio_compra` float(9,2) DEFAULT NULL,
  PRIMARY KEY (`Folio_surte`,`clave_insumo`),
  KEY `insumo_fk2_idx` (`clave_insumo`),
  CONSTRAINT `folio_fk2` FOREIGN KEY (`Folio_surte`) REFERENCES `surte` (`folio_surte`) ON UPDATE CASCADE,
  CONSTRAINT `insumo_fk2` FOREIGN KEY (`clave_insumo`) REFERENCES `surte_frecuencia` (`clave_insumo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cantidad_surte`
--

LOCK TABLES `cantidad_surte` WRITE;
/*!40000 ALTER TABLE `cantidad_surte` DISABLE KEYS */;
INSERT INTO `cantidad_surte` VALUES (100,'RY15QG',60,60.00),(100,'TP30JR',16,25.00),(100,'WL02LP',30,18.00),(110,'RY15QG',2,50.00),(110,'RY21JM',13,50.00),(120,'RY15QG',3,60.00),(120,'WL02LP',15,18.00),(130,'ITC28VT',6,25.00),(130,'PL014R',10,228.00),(140,'PA06J',18,0.50),(150,'WL02LP',8,18.00),(160,'TP30JR',4,65.00),(170,'BIS06',9,20.00),(170,'GA08',8,16.00),(180,'PA06J',17,6.00),(190,'RY21JM',13,50.00),(200,'RY15QG',4,60.00),(200,'TP30JR',3,65.00),(210,'PL014R',3,228.00),(220,'RY21JM',2,50.00),(222,'ALF160',5,16.00);
/*!40000 ALTER TABLE `cantidad_surte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `num_cliente` smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_cliente` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `ap_pat` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `ap_mat` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `calleynum` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `colonia` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `ciudad` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `estado` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `cp` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `telefono_cliente` varchar(15) COLLATE latin1_spanish_ci DEFAULT NULL,
  `rfc_cliente` varchar(25) COLLATE latin1_spanish_ci DEFAULT NULL,
  `email_cliente` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`num_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Javier','Rodriguez','Avendano','Heroes de Puebla 136 ','Centro','Veracruz','Veracruz','91700','229 632 4023','ROAJ620812LO1','javier.ra@Hotmail.com'),(2,'Claudia ','Romero','Lopez','19 poniente 1915','Barrio Santiago','Puebla','Puebla','72400','222 586 9900','ART2451369FG054','claudia.romero@gmail.com'),(3,'Constanza','Barradas ','Alvarez','Blvrd. 5 de Mayo 7201 ','Los Rosales ','Atlixco','Puebla','4023','222 963 1036','BAAC630520PL35','cons.alva.barr@gmail.com'),(4,'Rodolfo ','Lopez','Pizarro','43 sur 2934','La Paz','Puebla','Puebla','78203','225 887 1032','NULL','rodolopizarro@ultramax.com.mx'),(5,'Ivonne ','Gutierrez','Palomo','31 poniente 3112','Las Animas','Puebla','Puebla','72489','222 223 4434','NULL','NULL'),(6,'Damaris','Lagunes','Hernandez','2 ote. 7854 ','Las Brisas ','San Martin Texmelucan','Puebla','6352','222 698 3514','LADH 450924 P65','Damaris_lagunes@yahoo.com'),(7,'Laura Camila','Joya','Aroca','Privada del tigre 1841','Las Hadas','Puebla','Puebla','70701','222 235 6464','65283GHF537','laura@gmail.com'),(8,'Salvador','Chavez','Orozco','15 pte','Las Animas','San Martin','Puebla','70714','2224587961','OCS45102047K','chavez007@gmail.com');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `desglose_factura`
--

DROP TABLE IF EXISTS `desglose_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `desglose_factura` (
  `folio_pedido` smallint(3) unsigned NOT NULL,
  `clave_producto` varchar(8) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`folio_pedido`,`clave_producto`),
  KEY `prod_fk3_idx` (`clave_producto`),
  CONSTRAINT `pedido_fk2` FOREIGN KEY (`folio_pedido`) REFERENCES `desglose_pedido` (`folio_pedido`) ON UPDATE CASCADE,
  CONSTRAINT `prod_fk3` FOREIGN KEY (`clave_producto`) REFERENCES `desglose_pedido` (`clave_producto`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `desglose_factura`
--

LOCK TABLES `desglose_factura` WRITE;
/*!40000 ALTER TABLE `desglose_factura` DISABLE KEYS */;
INSERT INTO `desglose_factura` VALUES (19,'ALF140'),(20,'ALF140'),(22,'ALF140'),(13,'C502'),(22,'C502'),(21,'CA018'),(22,'CA018'),(13,'CA152'),(14,'CA152'),(16,'CA152'),(19,'CA152'),(20,'CA152'),(21,'CA152'),(11,'CCJ43CH'),(19,'CCJ43CH'),(14,'GA174'),(11,'GA180'),(16,'GA180'),(15,'PI043'),(21,'PI043');
/*!40000 ALTER TABLE `desglose_factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `desglose_pedido`
--

DROP TABLE IF EXISTS `desglose_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `desglose_pedido` (
  `folio_pedido` smallint(2) unsigned NOT NULL,
  `cantidad` int(10) unsigned NOT NULL,
  `clave_producto` varchar(8) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`folio_pedido`,`clave_producto`),
  KEY `producto_fk3_idx` (`clave_producto`),
  CONSTRAINT `pedido_fk3` FOREIGN KEY (`folio_pedido`) REFERENCES `pedido_cliente` (`folio_pedido`) ON UPDATE CASCADE,
  CONSTRAINT `producto_fk3` FOREIGN KEY (`clave_producto`) REFERENCES `producto` (`clave_producto`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `desglose_pedido`
--

LOCK TABLES `desglose_pedido` WRITE;
/*!40000 ALTER TABLE `desglose_pedido` DISABLE KEYS */;
INSERT INTO `desglose_pedido` VALUES (10,1,'CCJ43CH'),(11,2,'CCJ43CH'),(12,1,'MFR43G'),(13,1,'C502'),(13,1,'CA152'),(14,3,'CA152'),(14,2,'CCJ43CH'),(14,2,'GA174'),(15,2,'PI043'),(16,3,'CA152'),(16,5,'GA180'),(17,2,'GA180'),(17,1,'PI043'),(18,1,'CCJ43CH'),(18,3,'HHH234'),(18,1,'MFR43G'),(19,3,'ALF140'),(19,1,'CA152'),(19,2,'CCJ43CH'),(20,3,'ALF140'),(20,5,'CA152'),(21,1,'CA018'),(21,1,'CA152'),(21,1,'PI043'),(22,4,'ALF140'),(22,1,'C502'),(22,2,'CA018');
/*!40000 ALTER TABLE `desglose_pedido` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger act_total_pedido before insert on desglose_pedido
for each row
begin
    set @precio=(select precio_venta from producto where clave_producto=new.clave_producto);
    set @monto= @precio*new.cantidad;
  update pedido_cliente set total_pedido=total_pedido+@monto where folio_pedido=new.folio_pedido;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger act_existencia_producto after insert on desglose_pedido
for each row
begin
  update producto set cantidad_producto=(cantidad_producto-new.cantidad) where clave_producto=new.clave_producto;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleado` (
  `id_empleado` smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_empleado` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `pat` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `mat` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `calleynum` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `colonia` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `ciudad` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `estado` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `cp` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `telefono_empleado` varchar(15) COLLATE latin1_spanish_ci DEFAULT NULL,
  `email_empleado` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `turno` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `puesto` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `puesto2_idx` (`puesto`),
  CONSTRAINT `puesto2` FOREIGN KEY (`puesto`) REFERENCES `puesto_sueldo` (`puesto`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (200,'Alfonso','Herrera','Jimenez','15 norte 789','Anzures','Puebla','Puebla','79854','2225001002','ponchoherrera@gmail.com','Matutino','Mesero'),(201,'Carolina','Perez','Cano','21 sur 3985','Bario de Santiago','Puebla','Puebla','36254','2223659632','caro.pere@yahoo.com','Vespertino','Mesero'),(202,'Daniel','Arenas','Romero','5 Norte 320 interior 5','Camino Real a Cholula','San Andres Cholula','Puebla','40236','2227506398','dani.arenas@yahoo.com','Matutino','Gerente'),(203,'Carmen','Zamora','Tome','3 pte. 740','La Paz','Puebla','Puebla','49852','2223029632','carmen.Zamora@gmail.com','Matutino','Cocinero'),(204,'Alejandra','Campos','Estrada','21 poniente 2309','Robles','Puebla','Puebla','72354','2223099104','ale.estrada04@gmail.com','Vespertino','Gerente'),(205,'Roberto','Perez','Jacome','18 oriente 900','La Noria','Puebla','Puebla','71400','2225767777','robert.jacom@hotmail.com','Vespertino','Cocinero'),(206,'Javier','Salazar','Avila','21 sur 2343','Santiago','Puebla','Puebla','70605','2228581234','javier23@gmail.com','Matutino','Cocinero'),(207,'Lorena','Arquimides','de la Rosa','27 ote 10 int. 15','San Martin','Guadalajara','Jalisco','14752','3362805471','lore_arq@gmail.com','Vespertino','Mesero');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturar`
--

DROP TABLE IF EXISTS `facturar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facturar` (
  `folio_factura` smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  `fecha_emision` date NOT NULL,
  `folio_pedido` smallint(2) unsigned NOT NULL,
  `id_empleado` smallint(3) unsigned NOT NULL,
  PRIMARY KEY (`folio_factura`),
  KEY `empleado_fk_idx` (`id_empleado`),
  KEY `pedido_fk5_idx` (`folio_pedido`),
  CONSTRAINT `empleado_fk` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`) ON UPDATE CASCADE,
  CONSTRAINT `facturar_ibfk_1` FOREIGN KEY (`folio_pedido`) REFERENCES `desglose_factura` (`folio_pedido`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturar`
--

LOCK TABLES `facturar` WRITE;
/*!40000 ALTER TABLE `facturar` DISABLE KEYS */;
INSERT INTO `facturar` VALUES (100,'2017-04-04',13,204),(110,'2017-04-06',14,202),(130,'2017-04-13',11,201),(140,'2017-04-15',15,202),(150,'2017-04-11',16,204),(151,'2018-04-23',11,202),(154,'2018-05-09',19,201),(155,'2018-05-16',20,207),(156,'2018-05-21',21,202),(157,'2018-05-22',22,202);
/*!40000 ALTER TABLE `facturar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insumo`
--

DROP TABLE IF EXISTS `insumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insumo` (
  `clave_insumo` varchar(7) COLLATE latin1_spanish_ci NOT NULL,
  `nombre_insumo` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `marca` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `stock` int(10) unsigned DEFAULT '0',
  `stock_min` int(11) NOT NULL DEFAULT '1',
  `medida` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`clave_insumo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insumo`
--

LOCK TABLES `insumo` WRITE;
/*!40000 ALTER TABLE `insumo` DISABLE KEYS */;
INSERT INTO `insumo` VALUES ('ALF160','Alfajores','Confetti',3,4,'paquetes'),('BIS06','Biscotti','Italian coffee',3,10,'piezas'),('GA08','Galletas de nata','El corral',5,4,'paquetes'),('ITC28VT','azucar','Italian coffee',0,3,'kilos'),('PA06J','Pan','Walmart',2,20,'pieza/s'),('PL014R','Cafe','Italian Coffee',10,5,'kilos'),('RY15QG','Queso gouda','RYC',20,3,'paquetes'),('RY21JM','Jamon pavo','RYC',30,3,'paquetes'),('TP30JR','Toallas de papel','Kleenex',25,6,'paquetes'),('WL02LP','Leche','Parmalat',50,24,'litros');
/*!40000 ALTER TABLE `insumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_cliente`
--

DROP TABLE IF EXISTS `pedido_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedido_cliente` (
  `folio_pedido` smallint(2) unsigned NOT NULL AUTO_INCREMENT,
  `num_cliente` smallint(3) unsigned NOT NULL,
  `fecha_pedido` date NOT NULL,
  `total_pedido` float(9,2) DEFAULT '0.00',
  PRIMARY KEY (`folio_pedido`),
  KEY `cliente_fk` (`num_cliente`),
  CONSTRAINT `cliente_fk` FOREIGN KEY (`num_cliente`) REFERENCES `cliente` (`num_cliente`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_cliente`
--

LOCK TABLES `pedido_cliente` WRITE;
/*!40000 ALTER TABLE `pedido_cliente` DISABLE KEYS */;
INSERT INTO `pedido_cliente` VALUES (10,5,'2017-03-15',28.00),(11,6,'2017-04-11',56.00),(12,4,'2017-02-01',50.00),(13,1,'2017-02-02',89.00),(14,2,'2017-04-04',272.00),(15,6,'2017-04-11',112.00),(16,3,'2017-04-09',232.00),(17,1,'2018-04-02',108.00),(18,1,'2018-05-04',192.00),(19,8,'2018-05-09',150.00),(20,7,'2018-05-15',230.00),(21,8,'2018-05-20',115.00),(22,3,'2018-05-21',185.00);
/*!40000 ALTER TABLE `pedido_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `clave_producto` varchar(8) COLLATE latin1_spanish_ci NOT NULL,
  `nombre_producto` varchar(18) COLLATE latin1_spanish_ci NOT NULL,
  `cantidad_producto` int(10) unsigned DEFAULT NULL,
  `medida` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `precio_venta` decimal(4,2) unsigned zerofill NOT NULL,
  PRIMARY KEY (`clave_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES ('ALF140','Alfajores',3,'paquetes',20.00),('C502','Croissant',0,'pieza/s',55.00),('CA018','Cafe Americano',0,'litros',25.00),('CA152','Capuccino',0,'pieza/s',34.00),('CCJ43CH','Capuccino c/cajeta',0,'pieza/s',28.00),('GA174','Biscotis',10,'paquete/s',57.00),('GA180','Galletas de nata',25,'paquete/s',26.00),('HHH234','Gourmet Tea',3,'litros',38.00),('MFR43G','Moka Frappe',0,'litros',50.00),('PI043','Panino Italiano',0,'pieza/s',56.00);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedor` (
  `RFC` varchar(14) COLLATE latin1_spanish_ci NOT NULL,
  `nombre_proveedor` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `calleynum` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `colonia` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `ciudad` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `estado` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `cp` int(10) unsigned NOT NULL,
  `telefono` varchar(15) COLLATE latin1_spanish_ci DEFAULT NULL,
  `email` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`RFC`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES ('HEO450HR7HHE','Caffe Trombetta','San Martin 453','Jardines de Santiago','Puebla','Puebla',70794,'2227461934','caffe@trombetta.com'),('ITC001DF2003','Italian Coffee','Palmas Plaza L 12','Concepcion La Cruz','Puebla','Puebla',72191,'012222252724','franuicias@italiancoffee.com'),('JPA990206SI1','JR Paper S.A de C.V','San Martin 16','Jardines de Santiago','Puebla','Puebla',72580,'2222330222','pedidos@paper.com'),('PLNHA42583S2','Confetti','Presidente Masaryk 412','Polanco','Ciudad de Mexico','CDMX',14278,'5552813845','productos@confetti.com'),('RYC024PP2014','Carniceria RYC','Cto. Juan Pablo II 31 sur','Las Animas','Puebla','Puebla',72400,'012227740000','ventas@RYC.com'),('TCH850701RM1','Tiendas Chedrahui S.A. de C.V.','Av 9 Pte 1901','Barrio de Santiago','Puebla','Puebla',72000,'018009251111','ventas@chedrahui.com'),('WLM245PP2000','Walmart','Blvd. Atlixco 3304','Nueva Antequera','Puebla','Puebla',72180,'2318694','ventas@walmartmexico.com');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puesto_sueldo`
--

DROP TABLE IF EXISTS `puesto_sueldo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `puesto_sueldo` (
  `puesto` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `sueldo` decimal(8,2) unsigned NOT NULL,
  PRIMARY KEY (`puesto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puesto_sueldo`
--

LOCK TABLES `puesto_sueldo` WRITE;
/*!40000 ALTER TABLE `puesto_sueldo` DISABLE KEYS */;
INSERT INTO `puesto_sueldo` VALUES ('Administrador',5000.00),('Cocinero',500.00),('Gerente',900.00),('Mesero',450.00);
/*!40000 ALTER TABLE `puesto_sueldo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surte`
--

DROP TABLE IF EXISTS `surte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surte` (
  `folio_surte` smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  `fecha_surte` date NOT NULL,
  `RFC` varchar(14) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`folio_surte`,`RFC`),
  KEY `proveedor_fk_idx` (`RFC`),
  CONSTRAINT `proveedor_fk` FOREIGN KEY (`RFC`) REFERENCES `proveedor` (`RFC`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surte`
--

LOCK TABLES `surte` WRITE;
/*!40000 ALTER TABLE `surte` DISABLE KEYS */;
INSERT INTO `surte` VALUES (100,'2017-01-10','WLM245PP2000'),(110,'2017-01-10','RYC024PP2014'),(120,'2017-01-16','WLM245PP2000'),(130,'2017-02-18','ITC001DF2003'),(140,'2017-03-23','TCH850701RM1'),(150,'2017-03-20','TCH850701RM1'),(160,'2017-03-23','JPA990206SI1'),(170,'2017-03-23','ITC001DF2003'),(180,'2017-03-25','WLM245PP2000'),(190,'2017-04-04','RYC024PP2014'),(200,'2017-04-15','TCH850701RM1'),(210,'2017-04-19','ITC001DF2003'),(220,'2017-04-20','RYC024PP2014'),(221,'2018-04-13','WLM245PP2000'),(222,'2018-04-15','PLNHA42583S2');
/*!40000 ALTER TABLE `surte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surte_frecuencia`
--

DROP TABLE IF EXISTS `surte_frecuencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surte_frecuencia` (
  `clave_insumo` varchar(7) COLLATE latin1_spanish_ci NOT NULL,
  `Frecuencia` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`clave_insumo`),
  CONSTRAINT `in_fk` FOREIGN KEY (`clave_insumo`) REFERENCES `insumo` (`clave_insumo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surte_frecuencia`
--

LOCK TABLES `surte_frecuencia` WRITE;
/*!40000 ALTER TABLE `surte_frecuencia` DISABLE KEYS */;
INSERT INTO `surte_frecuencia` VALUES ('ALF160','semanal'),('BIS06','semanal'),('GA08','semanal'),('ITC28VT','mensual'),('PA06J','diario'),('PL014R','mensual'),('RY15QG','semanal'),('RY21JM','diario'),('TP30JR','semanal'),('WL02LP','semanal');
/*!40000 ALTER TABLE `surte_frecuencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utiliza`
--

DROP TABLE IF EXISTS `utiliza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utiliza` (
  `clave_producto` varchar(8) COLLATE latin1_spanish_ci NOT NULL,
  `clave_insumo` varchar(7) COLLATE latin1_spanish_ci NOT NULL,
  `folio_surte` smallint(3) unsigned NOT NULL,
  `cantidad` int(10) unsigned NOT NULL,
  PRIMARY KEY (`clave_producto`,`clave_insumo`),
  KEY `surte_fk_idx` (`folio_surte`),
  KEY `pedido_fk4_idx` (`clave_insumo`),
  CONSTRAINT `pedido_fk4` FOREIGN KEY (`clave_insumo`) REFERENCES `surte_frecuencia` (`clave_insumo`) ON UPDATE CASCADE,
  CONSTRAINT `producto_fk4` FOREIGN KEY (`clave_producto`) REFERENCES `producto` (`clave_producto`) ON UPDATE CASCADE,
  CONSTRAINT `surte_fk` FOREIGN KEY (`folio_surte`) REFERENCES `surte` (`folio_surte`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utiliza`
--

LOCK TABLES `utiliza` WRITE;
/*!40000 ALTER TABLE `utiliza` DISABLE KEYS */;
INSERT INTO `utiliza` VALUES ('ALF140','ALF160',222,0),('C502','RY15QG',130,3),('C502','RY21JM',110,3),('CA018','PL014R',130,2),('CA152','PL014R',210,2),('CA152','RY21JM',150,3),('CA152','WL02LP',150,2),('CCJ43CH','PL014R',130,1),('CCJ43CH','WL02LP',120,2),('GA174','BIS06',170,0),('GA180','GA08',170,0),('MFR43G','PL014R',130,1),('MFR43G','WL02LP',150,3),('PI043','RY15QG',120,6),('PI043','RY21JM',110,2);
/*!40000 ALTER TABLE `utiliza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'italian'
--
/*!50003 DROP PROCEDURE IF EXISTS `consultar_factura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultar_factura`(in folioFactura smallint)
begin
   set @idEmpleado= (select id_empleado from facturar where folio_factura=folioFactura);
   set @folio = (select folio_factura from facturar where folio_factura=folioFactura);
   if(@folio=folioFactura) THEN
  select folio_factura as "FACTURA",fecha_emision as "EMISION",folio_pedido as "PEDIDO",facturar.id_empleado as "EMPLEADO",concat_ws(" ",nombre_empleado,pat,mat) as "NOMBRE", turno as TURNO, puesto as PUESTO
  from facturar,empleado where folio_factura=folioFactura and empleado.id_empleado=@idEmpleado;
  else
  select "Folio de factura no existente" as "ALERTA";
  end if;
  end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_cantidad_surte` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_cantidad_surte`(IN folio smallint(3),IN clave varchar(7),IN cantidad int(10),IN precio_compra float(9,2))
begin
  set @x =(select folio_surte from surte where folio_surte=folio COLLATE 'latin1_spanish_ci');
  set @y =(select clave_insumo from insumo where clave_insumo=clave COLLATE 'latin1_spanish_ci');

  if(@x is null or @y is null or cantidad like "" or clave like "" or cantidad<=0 or precio_compra<=0) then
    if(@x is null) then select "El folio dado no existe" as Error; end if;
    if(@y is null) then select "La clave del insumo dado no existe" as Error; end if;
    if(cantidad like "") then select "Tiene que digitar la cantidad" as Error; end if;
    if(cantidad<=0) then select "La cantidad debe ser mayor a cero" as Error; end if;
    if(precio_compra<=0) then select "El precio debe ser mayor a cero" as Error; end if;
    if(clave like "") then select "Tiene que digitar la clave del insumo" as Error; end if;
  else
    insert into cantidad_surte values(folio,clave,cantidad,precio_compra);
    select "Registro ingresado correctamente"  as Resultado;
  end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_cliente`(IN nombre varchar(45),IN ap varchar(45),IN am varchar(45),IN calleynum varchar(25),IN colonia varchar(25),IN ciudad varchar(25),IN estado varchar(25),IN cp varchar(25),IN telefono varchar(15),IN rfc varchar(25),IN email varchar(45))
begin
  if(nombre like "" or ap like "" or am like "" or calleynum like "" or colonia like "" or ciudad like "" or estado like "" or cp like "") then
    if(nombre like "") then select "Tiene que digitar el nombre" as Error; end if;
    if(ap like "") then select "Tiene que digitar el apellido paterno" as Error; end if;
    if(am like "") then select "Tiene que digitar el apellido materno" as Error; end if;
    if(calleynum like "") then select "Tiene que digitar la calle con el número" as Error; end if;
    if(colonia like "") then select "Tiene que digitar la colonia" as Error; end if;
    if(ciudad like "") then select "Tiene que digitar la ciudad" as Error; end if;
    if(estado like "") then select "Tiene que digitar el estado" as Error; end if;
    if(cp like "") then select "Tiene que digitar el código postal" as Error; end if;
  else
    insert into cliente values(default,nombre,ap,am,calleynum,colonia,ciudad,estado,cp,telefono,rfc,email);
    select "Cliente registrado correctamente"  as Resultado;
  end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_desglose_factura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_desglose_factura`(IN pedido smallint(3),IN claveProducto varchar(8))
begin
  set @x =(select folio_pedido from pedido_cliente where folio_pedido=pedido COLLATE 'latin1_spanish_ci');
  set @y =(select clave_producto from producto where clave_producto=claveProducto COLLATE 'latin1_spanish_ci');

  if(@x is null or @y is null or  claveProducto like "") then
    if(@x is null) then select "El pedido dado no existe" as Error; end if;
    if(@y is null) then select "La clave del producto dado dado no existe" as Error; end if;
    if(claveProducto like "") then select "Tiene que digitar la clave del producto" as Error; end if;
  else
    insert into desglose_factura values(pedido,claveProducto);
    select "Registro ingresado correctamente"  as Resultado;
  end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_desglose_pedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_desglose_pedido`(IN folioPedido smallint(2),IN cantidad int(10),IN claveProducto varchar(8))
begin
  set @cantidadExistente = (select cantidad_producto from producto where clave_producto=claveProducto COLLATE 'latin1_spanish_ci'); 
  set @x =(select folio_pedido from pedido_cliente where folio_pedido=folioPedido COLLATE 'latin1_spanish_ci');
  set @y =(select clave_producto from producto where clave_producto=claveProducto COLLATE 'latin1_spanish_ci');

  if(@x is null or @y is null or cantidad like "" or cantidad<=0 or @cantidadExistente<cantidad or claveProducto like "") then
    if(@x is null) then select "El folio del pedido dado no existe" as Error; end if;
    if(cantidad like "") then select "Tiene que digitar la cantidad" as Error; end if;
    if(claveProducto like "") then select "Tiene que digitar la clave del producto" as Error; end if;
    if(@y is null) then select "La clave del producto dado no existe" as Error; end if;
    if(cantidad<=0) then select "La cantidad debe ser mayor a cero" as Error; end if;
    if(@cantidadExistente<cantidad) then select "La cantidad digitada es mayor a la cantidad del producto en el stock" as Error; end if;
  else
    insert into desglose_pedido values(folioPedido,cantidad,claveProducto);
    select "Registro ingresado correctamente"  as Resultado;
  end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_empleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_empleado`(IN nombre varchar(45),IN ap varchar(45),IN am varchar(45),IN calleynum varchar(25),IN colonia varchar(25),IN ciudad varchar(25),IN estado varchar(25),IN cp varchar(25),IN telefono varchar(15),IN email varchar(45),IN turno varchar(25),IN puesto_emp varchar(15))
begin
  set @x =(select puesto from puesto_sueldo where puesto=puesto_emp COLLATE 'latin1_spanish_ci');

  if(nombre like "" or ap like "" or am like "" or calleynum like "" or colonia like "" or ciudad like "" or estado like "" or cp like "" or turno like "" or @x is null) then
    if(nombre like "") then select "Tiene que digitar el nombre" as Error; end if;
    if(ap like "") then select "Tiene que digitar el apellido paterno" as Error; end if;
    if(am like "") then select "Tiene que digitar el apellido materno" as Error; end if;
    if(calleynum like "") then select "Tiene que digitar la calle con el número" as Error; end if;
    if(colonia like "") then select "Tiene que digitar la colonia" as Error; end if;
    if(ciudad like "") then select "Tiene que digitar la ciudad" as Error; end if;
    if(estado like "") then select "Tiene que digitar el estado" as Error; end if;
    if(cp like "") then select "Tiene que digitar el código postal" as Error; end if;
    if(turno like "") then select "Tiene que digitar el turno" as Error; end if;
    if(@x is null) then select "El puesto dado no existe" as Error; end if;

  else
    insert into empleado values(default,nombre,ap,am,calleynum,colonia,ciudad,estado,cp,telefono,email,turno,puesto_emp);
    select "Empleado registrado correctamente"  as Resultado;
  end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_facturar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_facturar`(IN folioPedido smallint(2),IN idEmpleado smallint(3))
begin
  set @x =(select folio_pedido from pedido_cliente where folio_pedido=folioPedido COLLATE 'latin1_spanish_ci');
  set @y =(select id_empleado from empleado where id_empleado=idEmpleado COLLATE 'latin1_spanish_ci');

  if(@x is null or @y is null) then
    if(@x is null) then select "EL folio dado no existe" as Error; end if;
    if(@y is null) then select "El id del empleado dado no existe" as Error; end if;
  else
    insert into facturar values(default,curdate(),folioPedido,idEmpleado);
    select "Factura registrada correctamente"  as Resultado;
  end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_insumo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_insumo`(IN clave varchar(7),IN nombre varchar(45),IN marca varchar(45),IN stock int(10),IN minimo int,IN medida varchar(25))
begin
  if(clave like "" or nombre like "" or marca like "" or medida like "" or stock<=0 or minimo<=0 ) then
    if(clave like "") then select "Tiene que digitar la clave del insumo" as Error; end if;
    if(nombre like "") then select "Tiene que digitar el nombre del insumo" as Error; end if;
    if(marca like "") then select "Tiene que digitar la medida" as Error; end if;
    if(medida like "") then select "Tiene que digitar la medida" as Error; end if;
    if(minimo<1) then select "El stock minimo debe ser mayor a uno" as Error; end if;
    if(stock<=0) then select "El stock debe ser mayor a cero" as Error; end if;
  else
    insert into insumo values(clave,nombre,marca,stock,minimo,medida);
    select "Insumo registrado correctamente"  as Resultado;
  end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_pedido_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_pedido_cliente`(IN id_cliente smallint(3))
begin
  set @x =(select num_cliente from cliente where num_cliente=id_cliente COLLATE 'latin1_spanish_ci');

  if(@x is null ) then
    if(@x is null) then select "El id del cliente dado no existe" as Error; end if;
  else
    insert into pedido_cliente values(default,id_cliente,curdate(),default);
    select "Pedido registrado correctamente"  as Resultado;
  end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_producto`(IN clave varchar(8),IN nombre varchar(18),IN cantidad int(10),IN medida varchar(25),IN precio_venta decimal(4,2))
begin
  if(clave like "" or nombre like "" or medida like "" or precio_venta like "" or precio_venta<=0 ) then
    if(clave like "") then select "Tiene que digitar la clave del producto" as Error; end if;
    if(nombre like "") then select "Tiene que digitar el nombre del producto" as Error; end if;
    if(medida like "") then select "Tiene que digitar la medida" as Error; end if;
    if(precio_venta like "") then select "Tiene que digitar el precio de venta" as Error; end if;
    if(cantidad<0) then select "La cantidad debe ser mayor a cero" as Error; end if;
    if(precio_venta<=0) then select "El precio de venta debe ser mayor a cero" as Error; end if;
  else
    insert into producto values(clave,nombre,cantidad,medida,precio_venta);
    select "Producto registrado correctamente"  as Resultado;
  end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_proveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_proveedor`(IN rfc varchar(14),IN nombre varchar(45),IN calleynum varchar(25),IN colonia varchar(25),IN ciudad varchar(25),IN estado varchar(25),IN cp int(10),IN telefono varchar(15),IN email varchar(45))
begin
  if(rfc like "" or nombre like "" or calleynum like "" or colonia like "" or ciudad like "" or estado like "" or cp like "") then
    if(rfc like "") then select "Tiene que digitar el RFC" as Error; end if;
    if(nombre like "") then select "Tiene que digitar el nombre" as Error; end if;
    if(calleynum like "") then select "Tiene que digitar la calle con el número" as Error; end if;
    if(colonia like "") then select "Tiene que digitar la colonia" as Error; end if;
    if(ciudad like "") then select "Tiene que digitar la ciudad" as Error; end if;
    if(estado like "") then select "Tiene que digitar el estado" as Error; end if;
    if(cp like "") then select "Tiene que digitar el código postal" as Error; end if;
  else
    insert into proveedor values(rfc,nombre,calleynum,colonia,ciudad,estado,cp,telefono,email);
    select "Proveedor registrado correctamente"  as Resultado;
  end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_puesto_sueldo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_puesto_sueldo`(IN puesto_ varchar(15),IN sueldo decimal(8,2))
begin
  set @x=(select puesto from puesto_sueldo where puesto=puesto_ COLLATE 'latin1_spanish_ci');

  if(@x is not null or puesto_ like "" or sueldo like "" or sueldo<=0) then
    if(@x is not null) then select "El nombre del puesto ya existe" as Error; end if;
    if(puesto_ like "") then select "Tiene que digitar el puesto" as Error; end if;
    if(sueldo like "") then select "Tiene que digitar el sueldo" as Error; end if;
    if(sueldo<=0) then select "El sueldo debe ser mayor a cero" as Error; end if;
  else
    insert into puesto_sueldo values(puesto_,sueldo);
    select "Registro ingresado correctamente"  as Resultado;
  end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_surte` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_surte`(IN rfc_proveedor varchar(14))
begin
  set @x =(select rfc from proveedor where rfc=rfc_proveedor COLLATE 'latin1_spanish_ci');

  if(@x is null or  rfc_proveedor like "") then
    if(@x is null) then select "El RFC de proveedor dado no existe" as Error; end if;
    if(rfc_proveedor like "") then select "Tiene que digitar el RFC" as Error; end if;
  else
    insert into surte values(default,curdate(),rfc_proveedor);
    select "Registro ingresado correctamente"  as Resultado;
  end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_surte_frecuencia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_surte_frecuencia`(IN clave varchar(7),IN frecuencia varchar(45))
begin
  set @x =(select clave_insumo from insumo where clave_insumo=clave COLLATE 'latin1_spanish_ci');

  if(@x is null or frecuencia like "" or clave like "") then
    if(@x is null) then select "La clave del insumo dado no existe" as Error; end if;
    if(frecuencia like "") then select "Tiene que digitar la frecuencia" as Error; end if;
    if(clave like "") then select "Tiene que digitar la clave" as Error; end if;
  else
    insert into surte_frecuencia values(clave,frecuencia);
    select "Registro ingresado correctamente"  as Resultado;
  end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_utiliza` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_utiliza`(IN claveProducto varchar(8),IN claveInsumo varchar(7),IN folioSurte smallint(3),IN cantidad int(10))
begin
  set @x =(select clave_producto from producto where clave_producto=claveProducto COLLATE 'latin1_spanish_ci');
  set @y =(select clave_insumo from insumo where clave_insumo=claveInsumo COLLATE 'latin1_spanish_ci');
  set @z =(select folio_surte from surte where folio_surte=folioSurte COLLATE 'latin1_spanish_ci');

  if(@x is null or @y is null or @z is null or claveProducto like "" or claveInsumo like "" or cantidad like "" or cantidad<0) then
    if(@x is null) then select "La clave del producto dado no existe" as Error; end if;
    if(@y is null) then select "La clave del insumo dado no existe" as Error; end if;
    if(@z is null) then select "El folio dado no existe" as Error; end if;
    if(cantidad like "") then select "Tiene que digitar la cantidad" as Error; end if;
    if(claveProducto like "") then select "Tiene que digitar la clave del producto" as Error; end if;
    if(claveInsumo like "") then select "Tiene que digitar la clave del insumo" as Error; end if;
    if(cantidad<0) then select "La cantidad debe ser mayor o igual a cero" as Error; end if;
  else
    insert into utiliza values(claveProducto,claveInsumo,folioSurte,cantidad);
    select "Registro ingresado correctamente"  as Resultado;
  end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mas_vendidos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mas_vendidos`()
BEGIN
  declare temp,mes,anio integer;
  set anio=(select year(current_date()));
  set mes = (select month(current_date()));
  set temp = (select count(*) from pedido_cliente
              where month(fecha_pedido) = mes
              and year(fecha_pedido) = anio);
  if(temp!=0) THEN
  select monthname(current_date()) as "MES ACTUAL";
  select "Desglose de los pedidos en el mes" as "REPORTE";
  select pedido_cliente.folio_pedido as "PEDIDO",fecha_pedido as "FECHA DE PEDIDO",desglose_pedido.cantidad as "CANTIDAD VENDIDA", nombre_producto as "PRODUCTO"
  from producto, desglose_pedido,pedido_cliente
  where producto.clave_producto = desglose_pedido.clave_producto
  AND desglose_pedido.folio_pedido = pedido_cliente.folio_pedido
  AND month(fecha_pedido) = mes
  AND year(fecha_pedido) = anio
  order by desglose_pedido.cantidad desc;
  select "Reporte de cantidades totales vendidas por producto en el mes" as "REPORTE";
  select nombre_producto as PRODUCTO, sum(desglose_pedido.cantidad) VENTAS
  from producto, desglose_pedido,pedido_cliente
  where producto.clave_producto = desglose_pedido.clave_producto
  AND desglose_pedido.folio_pedido = pedido_cliente.folio_pedido
  AND month(fecha_pedido) = mes
  AND year(fecha_pedido) = anio
  group by nombre_producto
  order by sum(desglose_pedido.cantidad) desc;
  ELSE
  select monthname(current_date()) as "MES ACTUAL";
  select "Hasta el momento no se tienen ventas registradas" as MENSAJE;
  end if;

  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reporte_actual_facturas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `reporte_actual_facturas`()
BEGIN
        declare anio,mes,temp,cont,cli integer;
          set anio=(select year(current_date()));
          set mes = (select month(current_date()));
          set temp = (select count(*) from facturar
                      where month(fecha_emision) = mes AND
                      year(fecha_emision) = anio
                      );
          if(temp != 0) then
          select monthname(current_date()) as "MES ACTUAL";
              select folio_factura as "FOLIO FACTURA",fecha_emision as "FECHA DE EMISION",pedido_cliente.folio_pedido as "FOLIO PEDIDO", pedido_cliente.num_cliente as "NUMERO CLIENTE", rfc_cliente as RFC,
              concat_ws(" ",nombre_cliente,ap_pat,ap_mat) as "NOMBRE",
              concat_ws(" ",calleynum,colonia,cp,ciudad,estado) as "DIRECCION", email_cliente as "EMAIL"
              from pedido_cliente,facturar,cliente
              where facturar.folio_pedido = pedido_cliente.folio_pedido AND mes = month(fecha_emision) AND anio = year(fecha_emision) AND cliente.num_cliente = pedido_cliente.num_cliente
              and facturar.folio_pedido = pedido_cliente.folio_pedido and facturar.folio_pedido = pedido_cliente.folio_pedido
              order by fecha_emision;
          else
          select monthname(current_date()) as "MES ACTUAL";
          select "Hasta el momento no se han emitido facturas" as MENSAJE;
          end if;
      END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `stock_insumo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `stock_insumo`(in claveInsumo varchar(45))
BEGIN
    set @min = (select stock_min from insumo where clave_insumo = claveInsumo);
    set @stock = (select stock from insumo where clave_insumo = claveInsumo);

    if(@stock > @min) then select "Hay suficiente del insumo" as "MENSAJE";
    select clave_insumo as "CLAVE INSUMO", nombre_insumo as "NOMBRE", stock as "STOCK",stock_min as "EXISTENCIA MINIMA", medida as "MEDIDA"
    from insumo
    where clave_insumo = claveInsumo;
    end if;
    if(@stock < @min) then select "Es necesario surtir el insumo" as "ALERTA";
    select clave_insumo as "CLAVE INSUMO", nombre_insumo as "NOMBRE", stock as "STOCK",stock_min as "EXISTENCIA MINIMA", medida as "MEDIDA"
    from insumo
    where clave_insumo = claveInsumo;
    end if;

    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-22 20:07:49
