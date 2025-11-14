-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: bienesraices_curso
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `propiedades`
--

DROP TABLE IF EXISTS `propiedades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propiedades` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `imagen` varchar(200) NOT NULL,
  `descripcion` longtext NOT NULL,
  `habitaciones` int NOT NULL,
  `wc` int NOT NULL,
  `estacionamiento` int NOT NULL,
  `creado` date NOT NULL,
  `vendedorId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_propiedades_vendedores_idx` (`vendedorId`),
  CONSTRAINT `fk_propiedades_vendedores` FOREIGN KEY (`vendedorId`) REFERENCES `vendedores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propiedades`
--

LOCK TABLES `propiedades` WRITE;
/*!40000 ALTER TABLE `propiedades` DISABLE KEYS */;
INSERT INTO `propiedades` VALUES (1,'Casa en la playa en OFERTA',1000008.00,'39718197f7ffd0b7064f5d1e7e8f7c22.jpg','Casa en la playa',3,3,3,'2025-06-21',1),(9,' Casde prueba actualizado',1000000.00,'7a391c53457f343bec9095cffdc082c9.jpg','Casde pruebaCasde pruebaCasde pruebaCasde pruebaCasde pruebaCasde pruebaCasde pruebaCasde pruebaCasde pruebaCasde pruebaCasde pruebaCasde pruebaCasde pruebaCasde pruebaCasde pruebaCasde pruebaCasde prueba',3,3,3,'2025-06-21',1),(12,' Casde prueba',1000000.00,'744d9310a7fb4d4d84eee7d2da265a26.jpg','Casde pruebaCasde pruebaCasde pruebaCasde pruebaCasde pruebaCasde pruebaCasde pruebaCasde pruebaCasde pruebaCasde pruebaCasde pruebaCasde pruebaCasde pruebaCasde pruebaCasde pruebaCasde pruebaCasde prueba',3,3,3,'2025-06-21',1),(14,' Casde prueba',1000000.00,'9f6350b6d548b0f3a8515ba912599777.jpg','Casde pruebaCasde pruebaCasde pruebaCasde pruebaCasde pruebaCasde pruebaCasde pruebaCasde pruebaCasde pruebaCasde pruebaCasde pruebaCasde pruebaCasde pruebaCasde pruebaCasde pruebaCasde pruebaCasde prueba',3,3,3,'2025-06-21',1),(15,' Casa en la playa',12000000.00,'118670de3ad6123f778d0761d00cf7b9.jpg','ejemploooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo',3,3,3,'2025-06-21',1),(16,' nueva',12300000.00,'561ca0689d483cf9ab04b5d56482bc1c.jpg','nuevaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',3,3,3,'2025-06-21',1),(17,' Casa en la playa',1234567.00,'384ae4b46236faaefb020c0ec2e119b5.jpg','casa en l aplayaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',3,2,2,'2025-06-21',1),(25,' prueba1111',12345556.00,'916d6ae095ab47ec8ba6a6b55fb7f5f9.jpg','CASAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',1,1,1,'2025-07-19',10),(26,' PRUEBA DEFINITIVA',1500000.00,'89ed40ad86efd30031e19153f54b3413.jpg','CASAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',1,1,1,'2025-07-19',7);
/*!40000 ALTER TABLE `propiedades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` char(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (2,'admin@gmail.com','$2y$10$b2dq/BV.Gx58VPmysEXzfOFAAaxEoQyIbG4ajY0x7wavDNb65LjD2');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedores`
--

DROP TABLE IF EXISTS `vendedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedores`
--

LOCK TABLES `vendedores` WRITE;
/*!40000 ALTER TABLE `vendedores` DISABLE KEYS */;
INSERT INTO `vendedores` VALUES (1,'Diego','Castañeda','8132652508'),(5,' Francisco','Bonilla','8180901084'),(6,' Juan','Perez','8110204050'),(7,' Prueba','Juarez2','8132652508'),(10,' prueba','prueba','8132652508');
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

-- Dump completed on 2025-11-14 17:44:19
