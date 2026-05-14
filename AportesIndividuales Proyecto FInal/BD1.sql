CREATE DATABASE  IF NOT EXISTS `sig` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sig`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sig
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `acreedores`
--

DROP TABLE IF EXISTS `acreedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acreedores` (
  `Acrecodigo` int NOT NULL AUTO_INCREMENT,
  `Acrenombre` varchar(100) NOT NULL,
  `Acrenit` varchar(20) NOT NULL,
  `Acrecuentabancaria` varchar(50) DEFAULT NULL,
  `Acreestado` char(1) NOT NULL,
  PRIMARY KEY (`Acrecodigo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acreedores`
--

LOCK TABLES `acreedores` WRITE;
/*!40000 ALTER TABLE `acreedores` DISABLE KEYS */;
INSERT INTO `acreedores` VALUES (1,'Arrendadora Central','9988776-5','9988-77665','A');
/*!40000 ALTER TABLE `acreedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aplicaciones`
--

DROP TABLE IF EXISTS `aplicaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aplicaciones` (
  `Aplcodigo` int NOT NULL,
  `Aplnombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Aplestado` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`Aplcodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aplicaciones`
--

LOCK TABLES `aplicaciones` WRITE;
/*!40000 ALTER TABLE `aplicaciones` DISABLE KEYS */;
INSERT INTO `aplicaciones` VALUES (1,'LOGIN','1'),(2,'Cambiar COntraseña','1'),(10,'Mantenimiento Usuarios','1'),(11,'Mantenimiento Aplicaciones','1'),(100,'Word','2'),(2000,'Mantenimiento Transportes','1'),(2001,'Mantenimiento Kardex','1'),(2002,'Mantenimiento Stock','1'),(2003,'Mantenimiento Pedidos','1'),(10005,'BITACORA','1'),(10007,'Mantenimiento Perfil','1'),(10010,'AsignacionPerfilUsuario','1'),(10011,'asignacionaplicacionperfil','1');
/*!40000 ALTER TABLE `aplicaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arribosmercancia`
--

DROP TABLE IF EXISTS `arribosmercancia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arribosmercancia` (
  `Arriboid` int NOT NULL AUTO_INCREMENT,
  `Procodigo` int DEFAULT NULL,
  `Arrfechaarribo` datetime DEFAULT NULL,
  `Arrestadoverificacion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Arriboid`),
  KEY `Procodigo` (`Procodigo`),
  CONSTRAINT `arribosmercancia_fk` FOREIGN KEY (`Procodigo`) REFERENCES `proveedores` (`Procodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arribosmercancia`
--

LOCK TABLES `arribosmercancia` WRITE;
/*!40000 ALTER TABLE `arribosmercancia` DISABLE KEYS */;
/*!40000 ALTER TABLE `arribosmercancia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asignacionaplicacionperfil`
--

DROP TABLE IF EXISTS `asignacionaplicacionperfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asignacionaplicacionperfil` (
  `Aplcodigo` int NOT NULL,
  `Percodigo` int NOT NULL,
  `APLPins` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `APLPsel` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `APLPupd` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `APLPdel` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `APLPrep` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`Aplcodigo`,`Percodigo`),
  KEY `Percodigo` (`Percodigo`),
  CONSTRAINT `asignacionaplicacionperfil_ibfk_1` FOREIGN KEY (`Aplcodigo`) REFERENCES `aplicaciones` (`Aplcodigo`),
  CONSTRAINT `asignacionaplicacionperfil_ibfk_2` FOREIGN KEY (`Percodigo`) REFERENCES `perfiles` (`Percodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignacionaplicacionperfil`
--

LOCK TABLES `asignacionaplicacionperfil` WRITE;
/*!40000 ALTER TABLE `asignacionaplicacionperfil` DISABLE KEYS */;
/*!40000 ALTER TABLE `asignacionaplicacionperfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asignacionaplicacionusuarios`
--

DROP TABLE IF EXISTS `asignacionaplicacionusuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asignacionaplicacionusuarios` (
  `Aplcodigo` int NOT NULL,
  `UsuId` int NOT NULL,
  `APLUins` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `APLUsel` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `APLUupd` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `APLUdel` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `APLUrep` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`Aplcodigo`,`UsuId`),
  KEY `UsuId` (`UsuId`),
  CONSTRAINT `asignacionaplicacionusuarios_ibfk_1` FOREIGN KEY (`Aplcodigo`) REFERENCES `aplicaciones` (`Aplcodigo`),
  CONSTRAINT `asignacionaplicacionusuarios_ibfk_2` FOREIGN KEY (`UsuId`) REFERENCES `usuario` (`usuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignacionaplicacionusuarios`
--

LOCK TABLES `asignacionaplicacionusuarios` WRITE;
/*!40000 ALTER TABLE `asignacionaplicacionusuarios` DISABLE KEYS */;
INSERT INTO `asignacionaplicacionusuarios` VALUES (1,1,'0','0','0','0','0'),(2,1,'0','0','0','0','0'),(10,1,'1','1','1','1','1'),(11,1,'1','1','1','1','1'),(11,2,'1','1','0','0','1'),(2000,1,'1','1','1','1','1'),(2001,1,'0','0','0','0','0'),(2002,1,'1','1','1','1','1'),(2003,1,'1','1','1','1','1'),(2003,2,'1','1','1','0','1'),(10005,1,'0','0','0','0','0'),(10007,1,'0','0','0','0','0'),(10010,1,'0','0','0','0','0'),(10011,1,'0','0','0','0','0');
/*!40000 ALTER TABLE `asignacionaplicacionusuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asignacionperfilusuario`
--

DROP TABLE IF EXISTS `asignacionperfilusuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asignacionperfilusuario` (
  `UsuId` int NOT NULL,
  `Percodigo` int NOT NULL,
  PRIMARY KEY (`UsuId`,`Percodigo`),
  KEY `Percodigo` (`Percodigo`),
  CONSTRAINT `asignacionperfilusuario_ibfk_1` FOREIGN KEY (`UsuId`) REFERENCES `usuario` (`usuid`),
  CONSTRAINT `asignacionperfilusuario_ibfk_2` FOREIGN KEY (`Percodigo`) REFERENCES `perfiles` (`Percodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignacionperfilusuario`
--

LOCK TABLES `asignacionperfilusuario` WRITE;
/*!40000 ALTER TABLE `asignacionperfilusuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `asignacionperfilusuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banco`
--

DROP TABLE IF EXISTS `banco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banco` (
  `Banid` int NOT NULL AUTO_INCREMENT,
  `Bannombre` varchar(100) NOT NULL,
  `Bandireccion` varchar(200) DEFAULT NULL,
  `Bantelefono` varchar(20) DEFAULT NULL,
  `Bancorreo` varchar(100) DEFAULT NULL,
  `Banfecharegistro` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Banid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banco`
--

LOCK TABLES `banco` WRITE;
/*!40000 ALTER TABLE `banco` DISABLE KEYS */;
/*!40000 ALTER TABLE `banco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bitacora`
--

DROP TABLE IF EXISTS `bitacora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitacora` (
  `Bitcodigo` int NOT NULL AUTO_INCREMENT,
  `UsuId` int DEFAULT NULL,
  `Aplcodigo` int DEFAULT NULL,
  `Bitfecha` datetime DEFAULT NULL,
  `Bitip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Bitequipo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Bitaccion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`Bitcodigo`),
  KEY `UsuId` (`UsuId`),
  KEY `Aplcodigo` (`Aplcodigo`),
  CONSTRAINT `bitacora_ibfk_1` FOREIGN KEY (`UsuId`) REFERENCES `usuario` (`usuid`),
  CONSTRAINT `bitacora_ibfk_2` FOREIGN KEY (`Aplcodigo`) REFERENCES `aplicaciones` (`Aplcodigo`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora`
--

LOCK TABLES `bitacora` WRITE;
/*!40000 ALTER TABLE `bitacora` DISABLE KEYS */;
INSERT INTO `bitacora` VALUES (1,1,1,'2026-04-29 11:21:43','10.88.203.221','DESKTOP-3Q9CGC2','Inicio Sesiòn'),(2,1,1,'2026-04-29 11:24:50','10.88.203.221','DESKTOP-3Q9CGC2','Asignación App'),(3,1,2,'2026-04-29 11:24:54','10.88.203.221','DESKTOP-3Q9CGC2','Asignación App'),(4,1,10,'2026-04-29 11:24:57','10.88.203.221','DESKTOP-3Q9CGC2','Asignación App'),(5,1,11,'2026-04-29 11:25:00','10.88.203.221','DESKTOP-3Q9CGC2','Asignación App'),(6,1,10005,'2026-04-29 11:25:02','10.88.203.221','DESKTOP-3Q9CGC2','Asignación App'),(7,1,10007,'2026-04-29 11:25:21','10.88.203.221','DESKTOP-3Q9CGC2','Asignación App'),(8,1,10010,'2026-04-29 11:25:23','10.88.203.221','DESKTOP-3Q9CGC2','Asignación App'),(9,1,10011,'2026-04-29 11:25:25','10.88.203.221','DESKTOP-3Q9CGC2','Asignación App'),(10,1,1,'2026-04-29 11:27:06','10.88.203.221','DESKTOP-3Q9CGC2','Inicio Sesiòn'),(11,1,1,'2026-04-29 11:42:44','10.88.203.221','DESKTOP-3Q9CGC2','Inicio Sesiòn'),(12,1,1,'2026-04-29 11:45:46','10.88.203.221','DESKTOP-3Q9CGC2','Inicio Sesiòn'),(13,1,1,'2026-04-29 11:47:53','10.88.203.221','DESKTOP-3Q9CGC2','Inicio Sesiòn'),(14,1,1,'2026-05-01 21:21:09','192.168.1.28','DESKTOP-3Q9CGC2','Inicio Sesiòn'),(15,1,1,'2026-05-01 22:47:37','192.168.1.227','MSI','Inicio Sesiòn'),(16,1,1,'2026-05-01 23:38:34','192.168.1.227','MSI','Inicio Sesiòn'),(17,1,1,'2026-05-02 20:57:09','192.168.1.227','MSI','Inicio Sesiòn'),(18,1,1,'2026-05-02 20:58:56','192.168.1.227','MSI','Inicio Sesiòn'),(19,1,1,'2026-05-02 20:59:51','192.168.1.227','MSI','Inicio Sesiòn'),(20,1,1,'2026-05-02 21:52:39','192.168.1.227','MSI','Inicio Sesiòn'),(21,1,1,'2026-05-02 21:54:14','192.168.1.227','MSI','Inicio Sesiòn'),(51,1,1,'2026-05-04 17:52:09','192.168.1.227','MSI','Inicio Sesiòn'),(52,1,10,'2026-05-04 17:52:40','192.168.1.227','MSI','INSERT usuario: ñoasjf'),(53,1,1,'2026-05-04 17:54:20','192.168.1.227','MSI','Inicio Sesiòn'),(55,1,1,'2026-05-04 17:56:59','192.168.1.227','MSI','Inicio Sesiòn'),(56,1,1,'2026-05-04 17:57:33','192.168.1.227','MSI','Inicio Sesiòn'),(59,1,1,'2026-05-04 18:01:07','192.168.1.227','MSI','Inicio Sesiòn'),(61,1,1,'2026-05-04 18:05:24','192.168.1.227','MSI','Inicio Sesiòn'),(62,5,10,'2026-05-04 18:05:34','192.168.1.227','MSI','UPDATE'),(63,1,1,'2026-05-04 18:07:10','192.168.1.227','MSI','Inicio Sesiòn'),(64,1,1,'2026-05-04 18:08:26','192.168.1.227','MSI','Inicio Sesiòn'),(65,1,11,'2026-05-04 18:08:45','192.168.1.227','MSI','UPDATE aplicación ID: 100 Nombre: Word'),(66,1,1,'2026-05-04 18:16:08','192.168.1.227','MSI','Inicio Sesiòn'),(67,2,1,'2026-05-04 18:16:49','192.168.1.227','MSI','Inicio Sesiòn'),(68,1,1,'2026-05-04 18:19:21','192.168.1.227','MSI','Inicio Sesiòn'),(69,1,10,'2026-05-04 18:20:59','192.168.1.227','MSI','INSERT usuario: Marco'),(70,1,10,'2026-05-04 18:22:09','192.168.1.227','MSI','DELETE'),(71,5,10,'2026-05-04 18:22:30','192.168.1.227','MSI','UPDATE'),(72,1,11,'2026-05-04 18:24:11','192.168.1.227','MSI','INSERT aplicación ID: 101 Nombre: PowerPoint'),(73,1,11,'2026-05-04 18:25:08','192.168.1.227','MSI','UPDATE aplicación ID: 101 Nombre: Excel'),(74,1,11,'2026-05-04 18:25:31','192.168.1.227','MSI','DELETE aplicación ID: 101'),(75,2,1,'2026-05-04 18:26:32','192.168.1.227','MSI','Inicio Sesiòn'),(76,1,1,'2026-05-04 19:42:48','192.168.1.227','MSI','Inicio Sesiòn'),(77,1,1,'2026-05-06 07:55:23','10.239.166.238','MSI','Inicio Sesiòn'),(78,1,1,'2026-05-06 07:56:51','10.239.166.238','MSI','Inicio Sesiòn'),(79,1,1,'2026-05-06 07:58:37','10.239.166.238','MSI','Inicio Sesiòn'),(80,1,1,'2026-05-06 07:59:27','10.239.166.238','MSI','Inicio Sesiòn'),(81,1,1,'2026-05-06 08:00:43','10.239.166.238','MSI','Inicio Sesiòn'),(82,1,1,'2026-05-06 08:04:59','10.239.166.238','MSI','Inicio Sesiòn'),(83,1,1,'2026-05-06 08:06:44','10.239.166.238','MSI','Inicio Sesiòn'),(84,1,1,'2026-05-06 08:08:05','10.239.166.238','MSI','Inicio Sesiòn'),(85,1,1,'2026-05-06 08:10:45','10.239.166.238','MSI','Inicio Sesiòn'),(86,1,1,'2026-05-06 08:12:27','10.239.166.238','MSI','Inicio Sesiòn'),(87,1,1,'2026-05-06 08:18:43','10.239.166.238','MSI','Inicio Sesiòn'),(88,1,1,'2026-05-06 08:19:00','10.239.166.238','MSI','Inicio Sesiòn'),(89,1,1,'2026-05-06 08:21:12','10.239.166.238','MSI','Inicio Sesiòn'),(90,1,1,'2026-05-06 08:25:12','10.239.166.238','MSI','Inicio Sesiòn'),(91,1,1,'2026-05-06 10:46:34','10.239.166.238','MSI','Inicio Sesiòn'),(92,1,1,'2026-05-06 11:17:57','10.239.166.238','MSI','Inicio Sesiòn'),(93,1,1,'2026-05-09 07:21:48','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(94,1,1,'2026-05-09 10:39:48','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(95,1,1,'2026-05-09 10:40:32','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(96,1,1,'2026-05-09 11:24:52','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(97,1,1,'2026-05-09 11:35:25','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(98,1,1,'2026-05-09 11:38:47','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(99,1,1,'2026-05-09 11:41:04','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(100,1,1,'2026-05-09 11:44:08','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(101,1,1,'2026-05-09 11:48:31','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(102,1,1,'2026-05-09 11:51:22','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(103,1,1,'2026-05-09 12:06:51','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(104,1,1,'2026-05-09 12:08:03','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(105,1,1,'2026-05-09 12:32:10','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(106,1,1,'2026-05-09 12:33:56','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(107,1,1,'2026-05-09 12:37:32','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(108,1,1,'2026-05-09 12:39:19','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(109,1,1,'2026-05-09 12:44:16','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(110,1,1,'2026-05-09 12:58:05','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(111,1,1,'2026-05-09 13:00:40','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(112,1,1,'2026-05-09 13:09:03','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(113,1,1,'2026-05-09 13:24:19','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(114,1,1,'2026-05-09 13:27:52','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(115,1,1,'2026-05-09 14:23:02','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(116,1,1,'2026-05-09 14:24:09','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(117,1,1,'2026-05-09 14:35:25','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(118,1,1,'2026-05-09 14:38:07','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(119,1,1,'2026-05-09 14:41:42','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(120,1,1,'2026-05-09 14:45:43','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(121,1,1,'2026-05-09 14:53:18','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(122,1,1,'2026-05-09 14:56:03','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(123,1,1,'2026-05-09 15:36:51','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(124,1,1,'2026-05-09 15:42:12','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(125,1,1,'2026-05-09 16:10:30','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(126,1,1,'2026-05-09 16:12:27','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(127,1,1,'2026-05-09 16:17:14','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(128,1,1,'2026-05-11 11:48:15','172.20.10.2','LAPTOP-4EIFH83L','Inicio Sesiòn'),(129,1,1,'2026-05-11 12:08:07','172.20.10.2','LAPTOP-4EIFH83L','Inicio Sesiòn'),(130,1,1,'2026-05-11 16:20:51','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(131,1,1,'2026-05-11 16:25:53','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(132,1,1,'2026-05-11 16:32:45','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(133,1,1,'2026-05-11 16:35:06','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(134,1,1,'2026-05-11 16:49:51','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(135,1,1,'2026-05-11 16:54:45','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(136,1,1,'2026-05-13 10:54:40','172.20.10.2','LAPTOP-4EIFH83L','Inicio Sesiòn'),(137,1,1,'2026-05-13 11:25:19','172.20.10.2','LAPTOP-4EIFH83L','Inicio Sesiòn'),(138,1,1,'2026-05-13 11:25:47','172.20.10.2','LAPTOP-4EIFH83L','Inicio Sesiòn'),(139,1,1,'2026-05-13 11:52:50','172.20.10.2','LAPTOP-4EIFH83L','Inicio Sesiòn'),(140,1,1,'2026-05-13 13:07:09','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(141,1,1,'2026-05-13 13:31:49','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(142,1,1,'2026-05-13 13:32:10','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(143,1,1,'2026-05-13 13:55:41','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(144,1,1,'2026-05-13 14:02:01','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(145,1,1,'2026-05-13 14:08:54','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(146,1,1,'2026-05-13 14:12:56','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(147,1,1,'2026-05-13 14:29:39','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(148,1,1,'2026-05-13 15:00:30','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(149,1,1,'2026-05-13 15:03:47','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(150,1,1,'2026-05-13 15:08:04','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(151,1,1,'2026-05-13 15:09:20','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(152,1,1,'2026-05-13 15:27:39','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(153,1,1,'2026-05-13 15:48:21','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(154,1,1,'2026-05-13 15:51:00','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(155,1,1,'2026-05-13 15:53:32','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(156,1,1,'2026-05-13 15:55:59','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(157,1,1,'2026-05-13 15:56:53','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(158,1,1,'2026-05-13 16:01:06','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(159,1,1,'2026-05-13 16:05:35','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(160,1,1,'2026-05-13 16:08:45','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(161,1,1,'2026-05-13 16:10:10','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(162,1,1,'2026-05-13 16:10:41','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(163,1,1,'2026-05-13 16:12:08','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(164,1,1,'2026-05-13 16:17:15','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(165,1,1,'2026-05-13 16:20:09','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(166,1,1,'2026-05-13 16:44:28','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(167,1,1,'2026-05-13 16:50:17','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(168,1,1,'2026-05-13 16:56:24','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(169,1,1,'2026-05-13 16:58:22','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(170,1,1,'2026-05-13 17:06:25','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(171,1,1,'2026-05-13 17:16:22','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(172,1,1,'2026-05-13 17:22:56','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(173,1,1,'2026-05-13 17:29:28','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(174,1,1,'2026-05-13 17:29:50','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(175,1,1,'2026-05-13 17:31:42','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(176,1,1,'2026-05-13 17:32:50','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn'),(177,1,1,'2026-05-13 18:17:00','192.168.5.213','LAPTOP-4EIFH83L','Inicio Sesiòn');
/*!40000 ALTER TABLE `bitacora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bitacorabancaria`
--

DROP TABLE IF EXISTS `bitacorabancaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitacorabancaria` (
  `BBid` int NOT NULL AUTO_INCREMENT,
  `BBusuarioaccion` int NOT NULL,
  `BBaccion` varchar(50) NOT NULL,
  `BBtabla` varchar(100) NOT NULL,
  `BBregistroid` int DEFAULT NULL,
  `BBvaloranterior` text,
  `BBvalornuevo` text,
  `BBfechaaccion` datetime DEFAULT CURRENT_TIMESTAMP,
  `BBdescripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`BBid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacorabancaria`
--

LOCK TABLES `bitacorabancaria` WRITE;
/*!40000 ALTER TABLE `bitacorabancaria` DISABLE KEYS */;
/*!40000 ALTER TABLE `bitacorabancaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bodegas`
--

DROP TABLE IF EXISTS `bodegas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bodegas` (
  `bodegaid` int NOT NULL AUTO_INCREMENT,
  `Bodnombre` varchar(100) DEFAULT NULL,
  `Bodubicacion` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`bodegaid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bodegas`
--

LOCK TABLES `bodegas` WRITE;
/*!40000 ALTER TABLE `bodegas` DISABLE KEYS */;
INSERT INTO `bodegas` VALUES (1,'BodegA','CENTRAL');
/*!40000 ALTER TABLE `bodegas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catestadoconciliacion`
--

DROP TABLE IF EXISTS `catestadoconciliacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catestadoconciliacion` (
  `Catesid` int NOT NULL AUTO_INCREMENT,
  `Catesnombreestado` varchar(50) NOT NULL,
  PRIMARY KEY (`Catesid`),
  UNIQUE KEY `Catesnombreestado` (`Catesnombreestado`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catestadoconciliacion`
--

LOCK TABLES `catestadoconciliacion` WRITE;
/*!40000 ALTER TABLE `catestadoconciliacion` DISABLE KEYS */;
INSERT INTO `catestadoconciliacion` VALUES (3,'Con Diferencia'),(1,'Conciliado'),(2,'Pendiente');
/*!40000 ALTER TABLE `catestadoconciliacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cattipocuenta`
--

DROP TABLE IF EXISTS `cattipocuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cattipocuenta` (
  `TCidcuenta` int NOT NULL AUTO_INCREMENT,
  `TCnombretipo` varchar(50) NOT NULL,
  `TCdescripcion` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`TCidcuenta`),
  UNIQUE KEY `TCnombretipo` (`TCnombretipo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cattipocuenta`
--

LOCK TABLES `cattipocuenta` WRITE;
/*!40000 ALTER TABLE `cattipocuenta` DISABLE KEYS */;
INSERT INTO `cattipocuenta` VALUES (1,'Monetaria','Cuenta de uso diario'),(2,'Ahorro','Cuenta de ahorro personal');
/*!40000 ALTER TABLE `cattipocuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cattipotransaccion`
--

DROP TABLE IF EXISTS `cattipotransaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cattipotransaccion` (
  `TTid` int NOT NULL AUTO_INCREMENT,
  `TTnombretipo` varchar(50) NOT NULL,
  `TTdescripcion` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`TTid`),
  UNIQUE KEY `TTnombretipo` (`TTnombretipo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cattipotransaccion`
--

LOCK TABLES `cattipotransaccion` WRITE;
/*!40000 ALTER TABLE `cattipotransaccion` DISABLE KEYS */;
INSERT INTO `cattipotransaccion` VALUES (1,'Deposito','Ingreso de dinero'),(2,'Retiro','Salida de dinero'),(3,'Transferencia','Movimiento entre cuentas'),(4,'Pago','Pago realizado'),(5,'Cobro','Cobro recibido'),(6,'PLANILLA','Egreso por pago de nomina'),(7,'COMISION','Pago de comision a vendedor'),(8,'PROV','Pago a proveedor o acreedor');
/*!40000 ALTER TABLE `cattipotransaccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `Cliid` int NOT NULL AUTO_INCREMENT,
  `Clinombre` varchar(100) NOT NULL,
  `Clinit` varchar(20) NOT NULL,
  `Cliestado` char(1) NOT NULL,
  `Clitelefono` varchar(20) DEFAULT NULL,
  `Clidireccion` varchar(200) NOT NULL,
  `Clicorreo` varchar(100) NOT NULL,
  PRIMARY KEY (`Cliid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Comercial El Sol','3344556-7','A','55512345','Zona 1, Ciudad de Guatemala','comercialelsol@gmail.com');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cobrosemision`
--

DROP TABLE IF EXISTS `cobrosemision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cobrosemision` (
  `Cobemid` int NOT NULL AUTO_INCREMENT,
  `Cpccodigo` int NOT NULL,
  `Movbid` int NOT NULL,
  `Cobfecha` datetime NOT NULL,
  `Cobmonto` decimal(12,2) NOT NULL,
  `Cobtipo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Cobemid`),
  KEY `Cpccodigo` (`Cpccodigo`),
  KEY `Movbid` (`Movbid`),
  CONSTRAINT `cobrosemision_ibfk_1` FOREIGN KEY (`Cpccodigo`) REFERENCES `cuentasporcobrar` (`Cpccodigo`),
  CONSTRAINT `cobrosemision_ibfk_2` FOREIGN KEY (`Movbid`) REFERENCES `movimientobancario` (`Movbid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cobrosemision`
--

LOCK TABLES `cobrosemision` WRITE;
/*!40000 ALTER TABLE `cobrosemision` DISABLE KEYS */;
/*!40000 ALTER TABLE `cobrosemision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comisionesvendedores`
--

DROP TABLE IF EXISTS `comisionesvendedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comisionesvendedores` (
  `Comid` int NOT NULL AUTO_INCREMENT,
  `Venid` int NOT NULL,
  `Commontoventas` decimal(10,2) NOT NULL,
  `Commeta` decimal(10,2) DEFAULT NULL,
  `Commarca` varchar(100) DEFAULT NULL,
  `Comventasadicionales` decimal(10,2) DEFAULT NULL,
  `Comcomision` decimal(10,2) NOT NULL,
  `Cppcodigo` int DEFAULT NULL,
  PRIMARY KEY (`Comid`),
  KEY `Venid` (`Venid`),
  KEY `Cppcodigo` (`Cppcodigo`),
  CONSTRAINT `comisionesvendedores_ibfk_1` FOREIGN KEY (`Venid`) REFERENCES `vendedores` (`Venid`),
  CONSTRAINT `comisionesvendedores_ibfk_2` FOREIGN KEY (`Cppcodigo`) REFERENCES `cuentasporpagar` (`Cppcodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comisionesvendedores`
--

LOCK TABLES `comisionesvendedores` WRITE;
/*!40000 ALTER TABLE `comisionesvendedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `comisionesvendedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conceptosexcepcion`
--

DROP TABLE IF EXISTS `conceptosexcepcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conceptosexcepcion` (
  `Exccodigo` int NOT NULL AUTO_INCREMENT,
  `Concodigo` int NOT NULL,
  `Empcodigo` int NOT NULL,
  PRIMARY KEY (`Exccodigo`),
  UNIQUE KEY `Concodigo` (`Concodigo`,`Empcodigo`),
  KEY `Empcodigo` (`Empcodigo`),
  CONSTRAINT `conceptosexcepcion_ibfk_1` FOREIGN KEY (`Concodigo`) REFERENCES `conceptosplanilla` (`Concodigo`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `conceptosexcepcion_ibfk_2` FOREIGN KEY (`Empcodigo`) REFERENCES `empleados` (`Empcodigo`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conceptosexcepcion`
--

LOCK TABLES `conceptosexcepcion` WRITE;
/*!40000 ALTER TABLE `conceptosexcepcion` DISABLE KEYS */;
/*!40000 ALTER TABLE `conceptosexcepcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conceptosplanilla`
--

DROP TABLE IF EXISTS `conceptosplanilla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conceptosplanilla` (
  `Concodigo` int NOT NULL AUTO_INCREMENT,
  `Connombre` varchar(50) NOT NULL,
  `Contipo` enum('PERCEPCION','DEDUCCION') NOT NULL,
  `Conporcentaje` decimal(5,2) DEFAULT NULL,
  `Conmonto` decimal(10,2) DEFAULT NULL,
  `Conaplica` enum('TODOS','INDIVIDUAL','EXCEPCION') DEFAULT 'TODOS',
  `Conestado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Concodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conceptosplanilla`
--

LOCK TABLES `conceptosplanilla` WRITE;
/*!40000 ALTER TABLE `conceptosplanilla` DISABLE KEYS */;
/*!40000 ALTER TABLE `conceptosplanilla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conciliacionbancaria`
--

DROP TABLE IF EXISTS `conciliacionbancaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conciliacionbancaria` (
  `Conbid` int NOT NULL AUTO_INCREMENT,
  `conbfecha` datetime DEFAULT CURRENT_TIMESTAMP,
  `Conbsaldosistema` decimal(12,2) NOT NULL,
  `Conbsaldobanco` decimal(12,2) NOT NULL,
  `Conbdiferencia` decimal(12,2) NOT NULL,
  `CBANid` int NOT NULL,
  `Catesid` int NOT NULL,
  PRIMARY KEY (`Conbid`),
  KEY `CBANid` (`CBANid`),
  KEY `Catesid` (`Catesid`),
  CONSTRAINT `conciliacionbancaria_ibfk_1` FOREIGN KEY (`CBANid`) REFERENCES `cuentabancaria` (`CBANid`),
  CONSTRAINT `conciliacionbancaria_ibfk_2` FOREIGN KEY (`Catesid`) REFERENCES `catestadoconciliacion` (`Catesid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conciliacionbancaria`
--

LOCK TABLES `conciliacionbancaria` WRITE;
/*!40000 ALTER TABLE `conciliacionbancaria` DISABLE KEYS */;
/*!40000 ALTER TABLE `conciliacionbancaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuentabancaria`
--

DROP TABLE IF EXISTS `cuentabancaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuentabancaria` (
  `CBANid` int NOT NULL AUTO_INCREMENT,
  `CBANnumerocuenta` varchar(50) NOT NULL,
  `CBANsaldoactual` decimal(12,2) DEFAULT '0.00',
  `CBANfechaapertura` date NOT NULL,
  `Banid` int NOT NULL,
  `Cliid` int NOT NULL,
  `TCidcuenta` int NOT NULL,
  PRIMARY KEY (`CBANid`),
  UNIQUE KEY `CBANnumerocuenta` (`CBANnumerocuenta`),
  KEY `Banid` (`Banid`),
  KEY `Cliid` (`Cliid`),
  KEY `TCidcuenta` (`TCidcuenta`),
  CONSTRAINT `cuentabancaria_ibfk_1` FOREIGN KEY (`Banid`) REFERENCES `banco` (`Banid`),
  CONSTRAINT `cuentabancaria_ibfk_2` FOREIGN KEY (`Cliid`) REFERENCES `clientes` (`Cliid`),
  CONSTRAINT `cuentabancaria_ibfk_3` FOREIGN KEY (`TCidcuenta`) REFERENCES `cattipocuenta` (`TCidcuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuentabancaria`
--

LOCK TABLES `cuentabancaria` WRITE;
/*!40000 ALTER TABLE `cuentabancaria` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuentabancaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuentasporcobrar`
--

DROP TABLE IF EXISTS `cuentasporcobrar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuentasporcobrar` (
  `Cpccodigo` int NOT NULL AUTO_INCREMENT,
  `Cliid` int NOT NULL,
  `Cpcfecha` date NOT NULL,
  `Cpcmonto` decimal(12,2) NOT NULL,
  `Cpcsaldo` decimal(12,2) NOT NULL,
  `Cpcestado` char(1) NOT NULL,
  PRIMARY KEY (`Cpccodigo`),
  KEY `Cliid` (`Cliid`),
  CONSTRAINT `cuentasporcobrar_ibfk_1` FOREIGN KEY (`Cliid`) REFERENCES `clientes` (`Cliid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuentasporcobrar`
--

LOCK TABLES `cuentasporcobrar` WRITE;
/*!40000 ALTER TABLE `cuentasporcobrar` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuentasporcobrar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuentasporpagar`
--

DROP TABLE IF EXISTS `cuentasporpagar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuentasporpagar` (
  `Cppcodigo` int NOT NULL AUTO_INCREMENT,
  `Procodigo` int DEFAULT NULL,
  `Acrecodigo` int DEFAULT NULL,
  `Venid` int DEFAULT NULL,
  `Cppfechaemision` date NOT NULL,
  `Cppmontototal` decimal(12,2) NOT NULL,
  `Cppsaldopendiente` decimal(12,2) NOT NULL,
  `Cppestado` char(1) NOT NULL,
  `TTid` int NOT NULL,
  `Cpporigenid` int DEFAULT NULL,
  PRIMARY KEY (`Cppcodigo`),
  KEY `Procodigo` (`Procodigo`),
  KEY `Acrecodigo` (`Acrecodigo`),
  KEY `Venid` (`Venid`),
  KEY `TTid` (`TTid`),
  CONSTRAINT `cuentasporpagar_ibfk_1` FOREIGN KEY (`Procodigo`) REFERENCES `proveedores` (`Procodigo`),
  CONSTRAINT `cuentasporpagar_ibfk_2` FOREIGN KEY (`Acrecodigo`) REFERENCES `acreedores` (`Acrecodigo`),
  CONSTRAINT `cuentasporpagar_ibfk_3` FOREIGN KEY (`Venid`) REFERENCES `vendedores` (`Venid`),
  CONSTRAINT `cuentasporpagar_ibfk_4` FOREIGN KEY (`TTid`) REFERENCES `cattipotransaccion` (`TTid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuentasporpagar`
--

LOCK TABLES `cuentasporpagar` WRITE;
/*!40000 ALTER TABLE `cuentasporpagar` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuentasporpagar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamentos` (
  `Depcodigo` int NOT NULL AUTO_INCREMENT,
  `Depnombre` varchar(50) NOT NULL,
  `Depestado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Depcodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallearribo`
--

DROP TABLE IF EXISTS `detallearribo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detallearribo` (
  `Detallearriboid` int NOT NULL AUTO_INCREMENT,
  `Arriboid` int DEFAULT NULL,
  `Prodid` int DEFAULT NULL,
  `Detarribocantidad` int NOT NULL,
  `Detarribopreciounitariocompra` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Detallearriboid`),
  KEY `Arriboid` (`Arriboid`),
  KEY `Prodid` (`Prodid`),
  CONSTRAINT `fk_detallearribo_arribo` FOREIGN KEY (`Arriboid`) REFERENCES `arribosmercancia` (`Arriboid`),
  CONSTRAINT `fk_detallearribo_producto` FOREIGN KEY (`Prodid`) REFERENCES `productos` (`Prodid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallearribo`
--

LOCK TABLES `detallearribo` WRITE;
/*!40000 ALTER TABLE `detallearribo` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallearribo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalleconceptosplanilla`
--

DROP TABLE IF EXISTS `detalleconceptosplanilla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalleconceptosplanilla` (
  `Detconcodigo` int NOT NULL AUTO_INCREMENT,
  `Detcodigo` int NOT NULL,
  `Concodigo` int NOT NULL,
  `Monto` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Detconcodigo`),
  UNIQUE KEY `Detcodigo` (`Detcodigo`,`Concodigo`),
  KEY `Concodigo` (`Concodigo`),
  CONSTRAINT `detalleconceptosplanilla_ibfk_1` FOREIGN KEY (`Detcodigo`) REFERENCES `planilladetalle` (`Detcodigo`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `detalleconceptosplanilla_ibfk_2` FOREIGN KEY (`Concodigo`) REFERENCES `conceptosplanilla` (`Concodigo`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalleconceptosplanilla`
--

LOCK TABLES `detalleconceptosplanilla` WRITE;
/*!40000 ALTER TABLE `detalleconceptosplanilla` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalleconceptosplanilla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalleordencompra`
--

DROP TABLE IF EXISTS `detalleordencompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalleordencompra` (
  `Detordid` int NOT NULL AUTO_INCREMENT,
  `Ordid` int DEFAULT NULL,
  `Prodid` int DEFAULT NULL,
  `Cantcompra` int DEFAULT NULL,
  `Costounitario` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Detordid`),
  KEY `Prodid` (`Prodid`),
  KEY `Ordid` (`Ordid`),
  CONSTRAINT `detalleordencompra_ibfk_1` FOREIGN KEY (`Prodid`) REFERENCES `productos` (`Prodid`),
  CONSTRAINT `detalleordencompra_ibfk_2` FOREIGN KEY (`Ordid`) REFERENCES `ordencompra` (`Ordid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalleordencompra`
--

LOCK TABLES `detalleordencompra` WRITE;
/*!40000 ALTER TABLE `detalleordencompra` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalleordencompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallepedidos`
--

DROP TABLE IF EXISTS `detallepedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detallepedidos` (
  `Detallepedidoid` int NOT NULL AUTO_INCREMENT,
  `Pedid` int DEFAULT NULL,
  `Prodid` int DEFAULT NULL,
  `Detallepedidocantidad` int NOT NULL,
  PRIMARY KEY (`Detallepedidoid`),
  KEY `Pedid` (`Pedid`),
  KEY `Prodid` (`Prodid`),
  CONSTRAINT `fk_detallepedidos_pedido` FOREIGN KEY (`Pedid`) REFERENCES `pedidos` (`Pedid`),
  CONSTRAINT `fk_detallepedidos_producto` FOREIGN KEY (`Prodid`) REFERENCES `productos` (`Prodid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallepedidos`
--

LOCK TABLES `detallepedidos` WRITE;
/*!40000 ALTER TABLE `detallepedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallepedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `Empcodigo` int NOT NULL AUTO_INCREMENT,
  `Empnombre` varchar(100) NOT NULL,
  `Empdpi` varchar(20) DEFAULT NULL,
  `Puecodigo` int NOT NULL,
  `Empfecha_ingreso` date DEFAULT NULL,
  `Empestado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Empcodigo`),
  UNIQUE KEY `Empdpi` (`Empdpi`),
  KEY `Puecodigo` (`Puecodigo`),
  CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`Puecodigo`) REFERENCES `puestos` (`Puecodigo`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `envios`
--

DROP TABLE IF EXISTS `envios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `envios` (
  `Envid` int NOT NULL AUTO_INCREMENT,
  `Pedid` int DEFAULT NULL,
  `Tranid` int DEFAULT NULL,
  `Envfechasalida` datetime DEFAULT NULL,
  `Envnumeroguia` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Envid`),
  KEY `Pedid` (`Pedid`),
  KEY `Tranid` (`Tranid`),
  CONSTRAINT `fk_envios_pedido` FOREIGN KEY (`Pedid`) REFERENCES `pedidos` (`Pedid`),
  CONSTRAINT `fk_envios_transportista` FOREIGN KEY (`Tranid`) REFERENCES `transportistas` (`Tranid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `envios`
--

LOCK TABLES `envios` WRITE;
/*!40000 ALTER TABLE `envios` DISABLE KEYS */;
/*!40000 ALTER TABLE `envios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `existencias`
--

DROP TABLE IF EXISTS `existencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `existencias` (
  `Existenciaid` int NOT NULL AUTO_INCREMENT,
  `Prodid` int NOT NULL,
  `Exnombreproducto` varchar(100) DEFAULT NULL,
  `bodegaid` int NOT NULL,
  `Existock` int DEFAULT '0',
  `Exmarca` varchar(100) DEFAULT NULL,
  `Exlinea` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Existenciaid`),
  UNIQUE KEY `uniqueproductobodega` (`Prodid`,`bodegaid`),
  KEY `bodegaid` (`bodegaid`),
  CONSTRAINT `fk_existencias_bodega` FOREIGN KEY (`bodegaid`) REFERENCES `bodegas` (`bodegaid`),
  CONSTRAINT `fk_existencias_producto` FOREIGN KEY (`Prodid`) REFERENCES `productos` (`Prodid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `existencias`
--

LOCK TABLES `existencias` WRITE;
/*!40000 ALTER TABLE `existencias` DISABLE KEYS */;
INSERT INTO `existencias` VALUES (1,1,'Martillo',1,50,'Truper','Ferretería'),(2,2,'',1,50,'Truper','Ferretería');
/*!40000 ALTER TABLE `existencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturasventa`
--

DROP TABLE IF EXISTS `facturasventa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturasventa` (
  `Facid` int NOT NULL AUTO_INCREMENT,
  `Cliid` int DEFAULT NULL,
  `Venid` int DEFAULT NULL,
  `Facfecha` date DEFAULT NULL,
  `Factotal` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Facid`),
  KEY `Cliid` (`Cliid`),
  KEY `Venid` (`Venid`),
  CONSTRAINT `facturasventa_ibfk_1` FOREIGN KEY (`Cliid`) REFERENCES `clientes` (`Cliid`),
  CONSTRAINT `facturasventa_ibfk_2` FOREIGN KEY (`Venid`) REFERENCES `vendedores` (`Venid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturasventa`
--

LOCK TABLES `facturasventa` WRITE;
/*!40000 ALTER TABLE `facturasventa` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturasventa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturaventadetalle`
--

DROP TABLE IF EXISTS `facturaventadetalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturaventadetalle` (
  `Detfacid` int NOT NULL AUTO_INCREMENT,
  `Facid` int DEFAULT NULL,
  `Prodid` int DEFAULT NULL,
  `Cantidad` int DEFAULT NULL,
  `Preciounitario` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Detfacid`),
  KEY `Facid` (`Facid`),
  KEY `Prodid` (`Prodid`),
  CONSTRAINT `facturaventadetalle_ibfk_1` FOREIGN KEY (`Facid`) REFERENCES `facturasventa` (`Facid`),
  CONSTRAINT `facturaventadetalle_ibfk_2` FOREIGN KEY (`Prodid`) REFERENCES `productos` (`Prodid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturaventadetalle`
--

LOCK TABLES `facturaventadetalle` WRITE;
/*!40000 ALTER TABLE `facturaventadetalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturaventadetalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lineas`
--

DROP TABLE IF EXISTS `lineas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lineas` (
  `lineaid` int NOT NULL AUTO_INCREMENT,
  `linnombre` varchar(100) NOT NULL,
  `linestado` tinyint(1) DEFAULT '1',
  `lincomision` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`lineaid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lineas`
--

LOCK TABLES `lineas` WRITE;
/*!40000 ALTER TABLE `lineas` DISABLE KEYS */;
INSERT INTO `lineas` VALUES (1,'Ferretería',1,0.00);
/*!40000 ALTER TABLE `lineas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcas`
--

DROP TABLE IF EXISTS `marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marcas` (
  `marcaid` int NOT NULL AUTO_INCREMENT,
  `marnombre` varchar(100) NOT NULL,
  `marestado` tinyint(1) DEFAULT '1',
  `marcomision` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`marcaid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcas`
--

LOCK TABLES `marcas` WRITE;
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
INSERT INTO `marcas` VALUES (1,'Truper',1,NULL);
/*!40000 ALTER TABLE `marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientobancario`
--

DROP TABLE IF EXISTS `movimientobancario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimientobancario` (
  `Movbid` int NOT NULL AUTO_INCREMENT,
  `Movbfechamovimiento` datetime DEFAULT CURRENT_TIMESTAMP,
  `Movbmonto` decimal(12,2) NOT NULL,
  `Movdescripcion` varchar(255) DEFAULT NULL,
  `CBANid` int NOT NULL,
  `TTid` int NOT NULL,
  `Movbtipomov` varchar(20) NOT NULL,
  `Movbreferencia` varchar(50) DEFAULT NULL,
  `Movbconciliado` char(1) DEFAULT 'N',
  PRIMARY KEY (`Movbid`),
  KEY `CBANid` (`CBANid`),
  KEY `TTid` (`TTid`),
  CONSTRAINT `movimientobancario_ibfk_1` FOREIGN KEY (`CBANid`) REFERENCES `cuentabancaria` (`CBANid`),
  CONSTRAINT `movimientobancario_ibfk_2` FOREIGN KEY (`TTid`) REFERENCES `cattipotransaccion` (`TTid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientobancario`
--

LOCK TABLES `movimientobancario` WRITE;
/*!40000 ALTER TABLE `movimientobancario` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimientobancario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientosinventario`
--

DROP TABLE IF EXISTS `movimientosinventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimientosinventario` (
  `Movimientoid` int NOT NULL AUTO_INCREMENT,
  `Prodid` int NOT NULL,
  `bodegaid` int NOT NULL,
  `Movtipomovimiento` enum('entrada','salida') NOT NULL,
  `Movmotivo` enum('compra','venta','merma','ajuste','devolucion') NOT NULL,
  `Movcantidad` int NOT NULL,
  `Movmarca` varchar(100) DEFAULT NULL,
  `Movlinea` varchar(100) DEFAULT NULL,
  `Movfecha` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Movimientoid`),
  KEY `Prodid` (`Prodid`),
  KEY `bodegaid` (`bodegaid`),
  CONSTRAINT `fk_movimientosinventario_bodega` FOREIGN KEY (`bodegaid`) REFERENCES `bodegas` (`bodegaid`),
  CONSTRAINT `fk_movimientosinventario_producto` FOREIGN KEY (`Prodid`) REFERENCES `productos` (`Prodid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientosinventario`
--

LOCK TABLES `movimientosinventario` WRITE;
/*!40000 ALTER TABLE `movimientosinventario` DISABLE KEYS */;
INSERT INTO `movimientosinventario` VALUES (2,1,1,'entrada','compra',50,'Truper','Ferretería','2026-05-13 19:27:07');
/*!40000 ALTER TABLE `movimientosinventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordencompra`
--

DROP TABLE IF EXISTS `ordencompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordencompra` (
  `Ordid` int NOT NULL AUTO_INCREMENT,
  `Procodigo` int DEFAULT NULL,
  `Ordfecha` date DEFAULT NULL,
  `Ordtotal` decimal(10,2) DEFAULT NULL,
  `Ordestado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Ordid`),
  KEY `Procodigo` (`Procodigo`),
  CONSTRAINT `ordencompra_ibfk_1` FOREIGN KEY (`Procodigo`) REFERENCES `proveedores` (`Procodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordencompra`
--

LOCK TABLES `ordencompra` WRITE;
/*!40000 ALTER TABLE `ordencompra` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordencompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagosemision`
--

DROP TABLE IF EXISTS `pagosemision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagosemision` (
  `Pagemid` int NOT NULL AUTO_INCREMENT,
  `Cppcodigo` int NOT NULL,
  `Movbid` int NOT NULL,
  `Pagefecha` datetime NOT NULL,
  `Pagemonto` decimal(12,2) NOT NULL,
  `Pagetipo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Pagemid`),
  KEY `Cppcodigo` (`Cppcodigo`),
  KEY `Movbid` (`Movbid`),
  CONSTRAINT `pagosemision_ibfk_1` FOREIGN KEY (`Cppcodigo`) REFERENCES `cuentasporpagar` (`Cppcodigo`),
  CONSTRAINT `pagosemision_ibfk_2` FOREIGN KEY (`Movbid`) REFERENCES `movimientobancario` (`Movbid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagosemision`
--

LOCK TABLES `pagosemision` WRITE;
/*!40000 ALTER TABLE `pagosemision` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagosemision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `Pedid` int NOT NULL AUTO_INCREMENT,
  `Cliid` int DEFAULT NULL,
  `Prodid` int DEFAULT NULL,
  `Pedcantidad` int DEFAULT NULL,
  `Pedmarca` varchar(100) DEFAULT NULL,
  `Pedlinea` varchar(100) DEFAULT NULL,
  `Pedestado` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Pedid`),
  KEY `Cliid` (`Cliid`),
  CONSTRAINT `fk_pedidos_cliente` FOREIGN KEY (`Cliid`) REFERENCES `clientes` (`Cliid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,1,1,15,'Truper','Ferretería','Pendiente');
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfiles`
--

DROP TABLE IF EXISTS `perfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perfiles` (
  `Percodigo` int NOT NULL AUTO_INCREMENT,
  `Pernombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Perestado` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`Percodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfiles`
--

LOCK TABLES `perfiles` WRITE;
/*!40000 ALTER TABLE `perfiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `perfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planilladetalle`
--

DROP TABLE IF EXISTS `planilladetalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planilladetalle` (
  `Detcodigo` int NOT NULL AUTO_INCREMENT,
  `Placodigo` int NOT NULL,
  `Empcodigo` int NOT NULL,
  `Detsalario` decimal(10,2) NOT NULL,
  `Dettotalpercepciones` decimal(10,2) DEFAULT '0.00',
  `Dettotaldeducciones` decimal(10,2) DEFAULT '0.00',
  `Detliquido` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Detcodigo`),
  KEY `Placodigo` (`Placodigo`),
  KEY `Empcodigo` (`Empcodigo`),
  CONSTRAINT `planilladetalle_ibfk_1` FOREIGN KEY (`Placodigo`) REFERENCES `planillaencabezado` (`Placodigo`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `planilladetalle_ibfk_2` FOREIGN KEY (`Empcodigo`) REFERENCES `empleados` (`Empcodigo`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planilladetalle`
--

LOCK TABLES `planilladetalle` WRITE;
/*!40000 ALTER TABLE `planilladetalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `planilladetalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planillaencabezado`
--

DROP TABLE IF EXISTS `planillaencabezado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planillaencabezado` (
  `Placodigo` int NOT NULL AUTO_INCREMENT,
  `Plafecha` date NOT NULL,
  `Platotal` decimal(10,2) DEFAULT '0.00',
  `Plaestado` tinyint(1) DEFAULT '1',
  `Movbid` int DEFAULT NULL,
  PRIMARY KEY (`Placodigo`),
  KEY `Movbid` (`Movbid`),
  CONSTRAINT `planillaencabezado_ibfk_1` FOREIGN KEY (`Movbid`) REFERENCES `movimientobancario` (`Movbid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planillaencabezado`
--

LOCK TABLES `planillaencabezado` WRITE;
/*!40000 ALTER TABLE `planillaencabezado` DISABLE KEYS */;
/*!40000 ALTER TABLE `planillaencabezado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `Prodid` int NOT NULL AUTO_INCREMENT,
  `Prodnombre` varchar(100) DEFAULT NULL,
  `Prodstockactual` int DEFAULT NULL,
  `Prodpuntoreorden` int DEFAULT NULL,
  `Prodprecioventa` decimal(12,2) DEFAULT NULL,
  `lineaid` int DEFAULT NULL,
  `marcaid` int DEFAULT NULL,
  `prodcomision` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Prodid`),
  KEY `fk_productos_linea` (`lineaid`),
  KEY `fk_productos_marca` (`marcaid`),
  CONSTRAINT `fk_productos_linea` FOREIGN KEY (`lineaid`) REFERENCES `lineas` (`lineaid`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_productos_marca` FOREIGN KEY (`marcaid`) REFERENCES `marcas` (`marcaid`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Martillo',100,NULL,NULL,1,1,NULL),(2,'Pinza',100,NULL,NULL,1,1,NULL);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `Procodigo` int NOT NULL AUTO_INCREMENT,
  `Pronombre` varchar(100) NOT NULL,
  `Pronit` varchar(20) NOT NULL,
  `Procuentabancaria` varchar(50) DEFAULT NULL,
  `Proestado` varchar(20) DEFAULT NULL,
  `Procontacto` varchar(100) DEFAULT NULL,
  `Prodepartamento` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Procodigo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Distribuidora XYZ','1234567-8','1234-56789','A',NULL,NULL);
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puestos`
--

DROP TABLE IF EXISTS `puestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puestos` (
  `Puecodigo` int NOT NULL AUTO_INCREMENT,
  `Puenombre` varchar(50) NOT NULL,
  `Puesalario_base` decimal(10,2) NOT NULL,
  `Depcodigo` int NOT NULL,
  PRIMARY KEY (`Puecodigo`),
  KEY `Depcodigo` (`Depcodigo`),
  CONSTRAINT `puestos_ibfk_1` FOREIGN KEY (`Depcodigo`) REFERENCES `departamentos` (`Depcodigo`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puestos`
--

LOCK TABLES `puestos` WRITE;
/*!40000 ALTER TABLE `puestos` DISABLE KEYS */;
/*!40000 ALTER TABLE `puestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportes`
--

DROP TABLE IF EXISTS `reportes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reportes` (
  `Repid` int NOT NULL AUTO_INCREMENT,
  `Repfecha` date NOT NULL,
  `Rephora` time NOT NULL,
  `Cliid` int NOT NULL,
  `Venid` int NOT NULL,
  `Repmontoventas` decimal(10,2) NOT NULL,
  `Repmeta` decimal(10,2) NOT NULL,
  `Repmarca` varchar(100) DEFAULT NULL,
  `Repventasadicionales` decimal(10,2) NOT NULL,
  `Repcomision` decimal(10,2) NOT NULL,
  `Repdescripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Repid`),
  KEY `Cliid` (`Cliid`),
  KEY `Venid` (`Venid`),
  CONSTRAINT `reportes_ibfk_1` FOREIGN KEY (`Cliid`) REFERENCES `clientes` (`Cliid`),
  CONSTRAINT `reportes_ibfk_2` FOREIGN KEY (`Venid`) REFERENCES `vendedores` (`Venid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportes`
--

LOCK TABLES `reportes` WRITE;
/*!40000 ALTER TABLE `reportes` DISABLE KEYS */;
/*!40000 ALTER TABLE `reportes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transportistas`
--

DROP TABLE IF EXISTS `transportistas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transportistas` (
  `Tranid` int NOT NULL AUTO_INCREMENT,
  `Trantipovehiculo` varchar(50) DEFAULT NULL,
  `Empcodigo` int NOT NULL,
  PRIMARY KEY (`Tranid`),
  KEY `fk_transportista_empleado` (`Empcodigo`),
  CONSTRAINT `fk_transportista_empleado` FOREIGN KEY (`Empcodigo`) REFERENCES `empleados` (`Empcodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transportistas`
--

LOCK TABLES `transportistas` WRITE;
/*!40000 ALTER TABLE `transportistas` DISABLE KEYS */;
/*!40000 ALTER TABLE `transportistas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `usuid` int NOT NULL AUTO_INCREMENT,
  `usunombre` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `usucontrasena` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `usuultimasesion` date DEFAULT NULL,
  `usuestatus` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `usunombrereal` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `usucorreoe` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `usutelefono` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `usudireccion` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`usuid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'admon','MTIzNDU2','2026-01-01','T','Administrador','admon@gmail.com','502-23311017','conocida'),(2,'kev','MTIzNDU=','2026-01-01','A','Kevin','kev@gmail.com','123-123','Ciudad de gUATEMALA'),(4,'test','MTIzNA==','0001-01-01','A','Boris','boris@gmail.com','32561343','zona 1'),(5,'Ivan','MTI=','0001-01-01','A','Boris','boris1','33223344','zona 1');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedores`
--

DROP TABLE IF EXISTS `vendedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedores` (
  `Venid` int NOT NULL AUTO_INCREMENT,
  `Empcodigo` int DEFAULT NULL,
  `Vennombre` varchar(100) DEFAULT NULL,
  `Ventelefono` varchar(20) DEFAULT NULL,
  `Vendireccion` varchar(200) DEFAULT NULL,
  `Vencorreo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Venid`),
  KEY `Empcodigo` (`Empcodigo`),
  CONSTRAINT `vendedores_ibfk_1` FOREIGN KEY (`Empcodigo`) REFERENCES `empleados` (`Empcodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedores`
--

LOCK TABLES `vendedores` WRITE;
/*!40000 ALTER TABLE `vendedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendedores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-13 20:30:12
