-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: nova_v1_1.0
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
-- Table structure for table `appointment_details`
--

DROP TABLE IF EXISTS `appointment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `consumer_id` bigint DEFAULT NULL,
  `shop_id` bigint DEFAULT NULL,
  `service_id` bigint DEFAULT NULL,
  `slot_id` bigint DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_details`
--

LOCK TABLES `appointment_details` WRITE;
/*!40000 ALTER TABLE `appointment_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gift_cards`
--

DROP TABLE IF EXISTS `gift_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gift_cards` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_by` bigint DEFAULT NULL,
  `gift_amont` float DEFAULT NULL,
  `gift_percentage` bigint DEFAULT NULL,
  `is_amont` bit(1) DEFAULT NULL,
  `is_percentage` bit(1) DEFAULT NULL,
  `gift_code` varchar(45) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT NULL,
  `shop_list` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gift_code_UNIQUE` (`gift_code`),
  KEY `fk_creater_id_idx` (`created_by`),
  CONSTRAINT `fk_creater_id` FOREIGN KEY (`created_by`) REFERENCES `user_details` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gift_cards`
--

LOCK TABLES `gift_cards` WRITE;
/*!40000 ALTER TABLE `gift_cards` DISABLE KEYS */;
INSERT INTO `gift_cards` VALUES (1,2,100,NULL,_binary '',_binary '\0','1002ABCD',NULL,NULL,_binary '',_binary '\0','[1,2]');
/*!40000 ALTER TABLE `gift_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotionans`
--

DROP TABLE IF EXISTS `promotionans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotionans` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `shop_id` bigint DEFAULT NULL,
  `is_percentage` bit(1) DEFAULT NULL,
  `is_amount` bit(1) DEFAULT NULL,
  `percentage_value` bigint DEFAULT NULL,
  `amount_value` float DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `promotion_name` varchar(45) DEFAULT NULL,
  `min_service_count` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_promotor_id_idx` (`shop_id`),
  CONSTRAINT `fk_promotor_id` FOREIGN KEY (`shop_id`) REFERENCES `shop_details` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotionans`
--

LOCK TABLES `promotionans` WRITE;
/*!40000 ALTER TABLE `promotionans` DISABLE KEYS */;
INSERT INTO `promotionans` VALUES (1,1,_binary '',_binary '\0',2,0,NULL,NULL,'shop1_combo',2);
/*!40000 ALTER TABLE `promotionans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `code` varchar(45) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ADMIN','ADM',_binary ''),(2,'OWNER','OWN',_binary ''),(3,'EMPLOYEE','EMP',_binary ''),(4,'CONSUMER','CON',_binary '');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serice_master`
--

DROP TABLE IF EXISTS `serice_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serice_master` (
  `id` bigint NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `shop_type_id` bigint DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_shop_typ_id_idx` (`shop_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serice_master`
--

LOCK TABLES `serice_master` WRITE;
/*!40000 ALTER TABLE `serice_master` DISABLE KEYS */;
INSERT INTO `serice_master` VALUES (1,'RBC',2,_binary '',_binary '\0'),(2,'WBC',2,_binary '',_binary '\0'),(3,'COVID',2,_binary '',_binary '\0'),(4,'BP',2,_binary '',_binary '\0'),(5,'SUGER',2,_binary '',_binary '\0'),(6,'TRIM',3,_binary '',_binary '\0'),(7,'HAIR CUT',3,_binary '',_binary '\0'),(8,'FACE WASH',3,_binary '',_binary '\0'),(9,'HAIR COLOR',3,_binary '',_binary '\0'),(10,'GAMING',4,_binary '',_binary '\0'),(11,'INTERNET',4,_binary '',_binary '\0'),(12,'TAKE PRING',4,_binary '',_binary '\0'),(13,'SYSTEM SERVICE',4,_binary '',_binary '\0'),(14,'HAIR WASH',3,_binary '',_binary '\0');
/*!40000 ALTER TABLE `serice_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_availibility`
--

DROP TABLE IF EXISTS `shop_availibility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_availibility` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `from_date` datetime DEFAULT NULL,
  `to_date` datetime DEFAULT NULL,
  `from_time` time DEFAULT NULL,
  `to_time` time DEFAULT NULL,
  `interval` time DEFAULT NULL,
  `shop_id` bigint DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `is_deleted` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_shp_id_idx` (`shop_id`),
  CONSTRAINT `fk_shp_id` FOREIGN KEY (`shop_id`) REFERENCES `shop_details` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_availibility`
--

LOCK TABLES `shop_availibility` WRITE;
/*!40000 ALTER TABLE `shop_availibility` DISABLE KEYS */;
INSERT INTO `shop_availibility` VALUES (1,'2023-04-28 00:00:00','2023-04-30 00:00:00','09:00:00','12:00:00','00:30:00',1,'1','0'),(2,'2023-04-28 00:00:00','2023-04-30 00:00:00','09:00:00','12:00:00','00:30:00',2,'1','0'),(3,'2023-05-28 00:00:00','2023-05-30 00:00:00','09:00:00','12:00:00','00:30:00',3,'1','0');
/*!40000 ALTER TABLE `shop_availibility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_details`
--

DROP TABLE IF EXISTS `shop_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `shop_name` varchar(45) DEFAULT NULL,
  `shop_address` varchar(45) DEFAULT NULL,
  `latitude` varchar(45) DEFAULT NULL,
  `logitude` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `logo` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT NULL,
  `shop_type` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_shop_typ_id_idx` (`shop_type`),
  CONSTRAINT `fk_shop_typ_id` FOREIGN KEY (`shop_type`) REFERENCES `shop_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_details`
--

LOCK TABLES `shop_details` WRITE;
/*!40000 ALTER TABLE `shop_details` DISABLE KEYS */;
INSERT INTO `shop_details` VALUES (1,'santosh_shop1','Bagalkot',NULL,NULL,'santoshshop1@gmail.com','9731717188',NULL,NULL,_binary '',_binary '\0',1),(2,'santosh_shop2','Bagalkot',NULL,NULL,'santoshshop2@gmail.com','9731717189',NULL,NULL,_binary '',_binary '\0',1),(3,'santosh_lab_shop3','Bagalkot',NULL,NULL,'santoshlabshop2@gmail.com','9731717190',NULL,NULL,_binary '',_binary '\0',2);
/*!40000 ALTER TABLE `shop_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_employee_ower_relation`
--

DROP TABLE IF EXISTS `shop_employee_ower_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_employee_ower_relation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `owner_id` bigint DEFAULT NULL,
  `shop_id` bigint DEFAULT NULL,
  `employee_id` bigint DEFAULT NULL,
  `join_date` datetime DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_wonerid_idx` (`owner_id`),
  KEY `fk_employe_id_idx` (`employee_id`),
  KEY `fk_shop_id_idx` (`shop_id`),
  CONSTRAINT `fk_employe_id` FOREIGN KEY (`employee_id`) REFERENCES `user_details` (`id`),
  CONSTRAINT `fk_shop_id` FOREIGN KEY (`shop_id`) REFERENCES `shop_details` (`id`),
  CONSTRAINT `fk_wonerid` FOREIGN KEY (`owner_id`) REFERENCES `user_details` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_employee_ower_relation`
--

LOCK TABLES `shop_employee_ower_relation` WRITE;
/*!40000 ALTER TABLE `shop_employee_ower_relation` DISABLE KEYS */;
INSERT INTO `shop_employee_ower_relation` VALUES (1,2,1,2,NULL,_binary '',_binary '\0'),(2,2,2,3,NULL,_binary '',_binary '\0'),(3,2,2,4,NULL,_binary '',_binary '\0');
/*!40000 ALTER TABLE `shop_employee_ower_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_ratings`
--

DROP TABLE IF EXISTS `shop_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_ratings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `shop_id` bigint DEFAULT NULL,
  `consumer_id` bigint DEFAULT NULL,
  `ratings` float DEFAULT NULL,
  `comments` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sp_id_idx` (`shop_id`),
  KEY `fk_con_id_idx` (`consumer_id`),
  CONSTRAINT `fk_con_id` FOREIGN KEY (`consumer_id`) REFERENCES `user_details` (`id`),
  CONSTRAINT `fk_sp_id` FOREIGN KEY (`shop_id`) REFERENCES `shop_details` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_ratings`
--

LOCK TABLES `shop_ratings` WRITE;
/*!40000 ALTER TABLE `shop_ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_service_relation`
--

DROP TABLE IF EXISTS `shop_service_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_service_relation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `shop_id` bigint DEFAULT NULL,
  `service_id` bigint DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk+shp_id_idx` (`shop_id`),
  KEY `fk_service_id_idx` (`service_id`),
  CONSTRAINT `fk_service_id` FOREIGN KEY (`service_id`) REFERENCES `serice_master` (`id`),
  CONSTRAINT `fk_shpdet_id` FOREIGN KEY (`shop_id`) REFERENCES `shop_details` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_service_relation`
--

LOCK TABLES `shop_service_relation` WRITE;
/*!40000 ALTER TABLE `shop_service_relation` DISABLE KEYS */;
INSERT INTO `shop_service_relation` VALUES (2,1,6,_binary '',_binary '\0',100),(3,1,7,_binary '',_binary '\0',50),(4,1,8,_binary '',_binary '\0',80),(5,1,9,_binary '',_binary '\0',50),(6,3,1,_binary '',_binary '\0',150),(7,3,2,_binary '',_binary '\0',200),(8,3,3,_binary '',_binary '\0',120),(9,2,6,_binary '',_binary '\0',100),(10,2,7,_binary '',_binary '\0',50),(11,2,8,_binary '',_binary '\0',80),(12,2,9,_binary '',_binary '\0',50),(13,1,14,_binary '',_binary '\0',60);
/*!40000 ALTER TABLE `shop_service_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_types`
--

DROP TABLE IF EXISTS `shop_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_types` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL,
  `code` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_types`
--

LOCK TABLES `shop_types` WRITE;
/*!40000 ALTER TABLE `shop_types` DISABLE KEYS */;
INSERT INTO `shop_types` VALUES (1,'SPA','SPA'),(2,'LAB','LAB'),(3,'SHALON','SHAL'),(4,'CSC','CSC'),(5,'CLINIC','CLINIC'),(6,'BUS','BUS');
/*!40000 ALTER TABLE `shop_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slot_availibility`
--

DROP TABLE IF EXISTS `slot_availibility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slot_availibility` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `time` time DEFAULT NULL,
  `app_status` varchar(45) DEFAULT NULL,
  `staus` bit(1) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT NULL,
  `app_created_date` datetime DEFAULT NULL,
  `shop_id` bigint DEFAULT NULL,
  `counsumer_id` bigint DEFAULT NULL,
  `reson_for_calncel` varchar(45) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slot_availibility`
--

LOCK TABLES `slot_availibility` WRITE;
/*!40000 ALTER TABLE `slot_availibility` DISABLE KEYS */;
INSERT INTO `slot_availibility` VALUES (1,'2023-04-28 00:00:00','11:00:00','BOOKED',_binary '',_binary '\0','2023-04-23 00:00:00',1,5,NULL,NULL),(2,'2023-04-28 00:00:00','11:30:00','BOOKED',_binary '',_binary '\0','2023-04-23 00:00:00',1,6,NULL,NULL),(3,'2023-04-28 00:00:00','12:00:00','CANCLE',_binary '',_binary '\0','2023-04-27 00:00:00',1,7,NULL,NULL),(4,'2023-04-29 00:00:00','09:00:00','CANCLE',_binary '',_binary '\0','2303-04-26 00:00:00',1,8,'SHOP IS TOO FAR',NULL),(5,'2023-04-29 00:00:00','09:30:00','OPEN',_binary '\0',_binary '\0',NULL,1,NULL,NULL,NULL),(6,'2023-04-29 00:00:00','10:00:00','OPEN',_binary '\0',_binary '\0',NULL,1,NULL,NULL,NULL),(7,'2023-04-29 00:00:00','10:30:00','OPEN',_binary '\0',_binary '\0',NULL,1,NULL,NULL,NULL),(8,'2023-04-29 00:00:00','11:00:00','OPEN',_binary '',_binary '\0',NULL,1,NULL,NULL,NULL),(9,'2023-04-29 00:00:00','11:30:00','OPEN',_binary '',_binary '\0',NULL,1,NULL,NULL,NULL),(10,'2023-04-29 00:00:00','12:00:00','OPEN',_binary '',_binary '\0',NULL,1,NULL,NULL,NULL),(11,'2023-04-30 00:00:00','09:00:00','OPEN',_binary '',_binary '\0',NULL,1,NULL,NULL,NULL),(12,'2023-04-30 00:00:00','09:30:00','OPEN',_binary '',_binary '\0',NULL,1,NULL,NULL,NULL),(13,'2023-04-30 00:00:00','10:00:00','OPEN',_binary '',_binary '\0',NULL,1,NULL,NULL,NULL),(14,'2023-04-30 00:00:00','10:30:00','OPEN',_binary '',_binary '\0',NULL,1,NULL,NULL,NULL),(15,'2023-04-30 00:00:00','11:00:00','OPEN',_binary '',_binary '\0',NULL,1,NULL,NULL,NULL),(16,'2023-04-30 00:00:00','11:30:00','OPEN',_binary '',_binary '\0',NULL,1,NULL,NULL,NULL),(17,'2023-04-30 00:00:00','12:00:00','OPEN',_binary '',_binary '\0',NULL,1,NULL,NULL,NULL),(18,'2023-04-28 00:00:00','11:00:00','OPEN',_binary '',_binary '\0',NULL,2,NULL,NULL,NULL),(19,'2023-04-28 00:00:00','11:30:00','OPEN',_binary '',_binary '\0',NULL,2,NULL,NULL,NULL),(20,'2023-04-28 00:00:00','12:00:00','OPEN',_binary '',_binary '\0',NULL,2,NULL,NULL,NULL),(21,'2023-04-29 00:00:00','09:00:00','OPEN',_binary '',_binary '\0',NULL,2,NULL,NULL,NULL),(22,'2023-04-29 00:00:00','09:30:00','OPEN',_binary '',_binary '\0',NULL,2,NULL,NULL,NULL),(23,'2023-04-29 00:00:00','10:00:00','OPEN',_binary '',_binary '\0',NULL,2,NULL,NULL,NULL),(24,'2023-04-29 00:00:00','10:30:00','OPEN',_binary '',_binary '\0',NULL,2,NULL,NULL,NULL),(25,'2023-04-29 00:00:00','11:00:00','OPEN',_binary '',_binary '\0',NULL,2,NULL,NULL,NULL),(26,'2023-04-29 00:00:00','11:30:00','OPEN',_binary '',_binary '\0',NULL,2,NULL,NULL,NULL),(27,'2023-04-29 00:00:00','12:00:00','OPEN',_binary '',_binary '\0',NULL,2,NULL,NULL,NULL),(28,'2023-04-30 00:00:00','09:00:00','OPEN',_binary '',_binary '\0',NULL,2,NULL,NULL,NULL),(29,'2023-04-30 00:00:00','09:30:00','OPEN',_binary '',_binary '\0',NULL,2,NULL,NULL,NULL),(30,'2023-04-30 00:00:00','10:00:00','OPEN',_binary '',_binary '\0',NULL,2,NULL,NULL,NULL),(31,'2023-04-30 00:00:00','10:30:00','OPEN',_binary '',_binary '\0',NULL,2,NULL,NULL,NULL),(32,'2023-04-30 00:00:00','11:00:00','OPEN',_binary '',_binary '\0',NULL,2,NULL,NULL,NULL),(33,'2023-04-30 00:00:00','11:30:00','OPEN',_binary '',_binary '\0',NULL,2,NULL,NULL,NULL),(34,'2023-04-30 00:00:00','12:00:00','OPEN',_binary '',_binary '\0',NULL,2,NULL,NULL,NULL),(35,'2023-04-28 00:00:00','11:00:00','OPEN',_binary '',_binary '\0',NULL,3,NULL,NULL,NULL),(36,'2023-04-28 00:00:00','11:30:00','OPEN',_binary '',_binary '\0',NULL,3,NULL,NULL,NULL),(37,'2023-04-28 00:00:00','12:00:00','OPEN',_binary '',_binary '\0',NULL,3,NULL,NULL,NULL),(38,'2023-04-29 00:00:00','09:00:00','OPEN',_binary '',_binary '\0',NULL,3,NULL,NULL,NULL),(39,'2023-04-29 00:00:00','09:30:00','OPEN',_binary '',_binary '\0',NULL,3,NULL,NULL,NULL),(40,'2023-04-29 00:00:00','10:00:00','OPEN',_binary '',_binary '\0',NULL,3,NULL,NULL,NULL),(41,'2023-04-29 00:00:00','10:30:00','OPEN',_binary '',_binary '\0',NULL,3,NULL,NULL,NULL),(42,'2023-04-29 00:00:00','11:00:00','OPEN',_binary '',_binary '\0',NULL,3,NULL,NULL,NULL),(43,'2023-04-29 00:00:00','11:30:00','OPEN',_binary '',_binary '\0',NULL,3,NULL,NULL,NULL),(44,'2023-04-29 00:00:00','12:00:00','OPEN',_binary '',_binary '\0',NULL,3,NULL,NULL,NULL),(45,'2023-04-30 00:00:00','09:00:00','OPEN',_binary '',_binary '\0',NULL,3,NULL,NULL,NULL),(46,'2023-04-30 00:00:00','09:30:00','OPEN',_binary '',_binary '\0',NULL,3,NULL,NULL,NULL),(47,'2023-04-30 00:00:00','10:00:00','OPEN',_binary '',_binary '\0',NULL,3,NULL,NULL,NULL),(48,'2023-04-30 00:00:00','10:30:00','OPEN',_binary '',_binary '\0',NULL,3,NULL,NULL,NULL),(49,'2023-04-30 00:00:00','11:00:00','OPEN',_binary '',_binary '\0',NULL,3,NULL,NULL,NULL),(50,'2023-04-30 00:00:00','11:30:00','OPEN',_binary '',_binary '\0',NULL,3,NULL,NULL,NULL),(51,'2023-04-30 00:00:00','12:00:00','OPEN',_binary '',_binary '\0',NULL,3,NULL,NULL,NULL),(52,'2023-04-28 00:00:00','11:00:00','OPEN',_binary '',_binary '\0',NULL,3,NULL,NULL,NULL),(53,'2023-04-28 00:00:00','11:30:00','OPEN',_binary '',_binary '\0',NULL,3,NULL,NULL,NULL),(54,'2023-04-28 00:00:00','12:00:00','OPEN',_binary '',_binary '\0',NULL,3,NULL,NULL,NULL),(55,'2023-04-29 00:00:00','09:00:00','OPEN',_binary '',_binary '\0',NULL,3,NULL,NULL,NULL),(56,'2023-04-29 00:00:00','09:30:00','OPEN',_binary '',_binary '\0',NULL,3,NULL,NULL,NULL),(57,'2023-04-29 00:00:00','10:00:00','OPEN',_binary '',_binary '\0',NULL,3,NULL,NULL,NULL),(58,'2023-04-29 00:00:00','10:30:00','OPEN',_binary '',_binary '\0',NULL,3,NULL,NULL,NULL),(59,'2023-04-29 00:00:00','11:00:00','OPEN',_binary '',_binary '\0',NULL,3,NULL,NULL,NULL),(60,'2023-04-29 00:00:00','11:30:00','OPEN',_binary '',_binary '\0',NULL,3,NULL,NULL,NULL),(61,'2023-04-29 00:00:00','12:00:00','OPEN',_binary '',_binary '\0',NULL,3,NULL,NULL,NULL),(62,'2023-04-30 00:00:00','09:00:00','OPEN',_binary '',_binary '\0',NULL,3,NULL,NULL,NULL),(63,'2023-04-30 00:00:00','09:30:00','OPEN',_binary '',_binary '\0',NULL,3,NULL,NULL,NULL),(64,'2023-04-30 00:00:00','10:00:00','OPEN',_binary '',_binary '\0',NULL,3,NULL,NULL,NULL),(65,'2023-04-30 00:00:00','10:30:00','OPEN',_binary '',_binary '\0',NULL,3,NULL,NULL,NULL),(66,'2023-04-30 00:00:00','11:00:00','OPEN',_binary '',_binary '\0',NULL,3,NULL,NULL,NULL),(67,'2023-04-30 00:00:00','11:30:00','OPEN',_binary '',_binary '\0',NULL,3,NULL,NULL,NULL),(68,'2023-04-30 00:00:00','12:00:00','OPEN',_binary '',_binary '\0',NULL,3,NULL,NULL,NULL),(69,'2023-04-28 00:00:00','11:00:00','OPEN',_binary '',_binary '\0',NULL,3,NULL,NULL,NULL),(70,'2023-04-28 00:00:00','11:30:00','OPEN',_binary '',_binary '\0',NULL,3,NULL,NULL,NULL),(71,'2023-04-28 00:00:00','12:00:00','OPEN',_binary '',_binary '\0',NULL,3,NULL,NULL,NULL),(72,'2023-04-29 00:00:00','09:00:00','OPEN',_binary '',_binary '\0',NULL,3,NULL,NULL,NULL),(73,'2023-04-29 00:00:00','09:30:00','OPEN',_binary '',_binary '\0',NULL,3,NULL,NULL,NULL),(74,'2023-04-29 00:00:00','10:00:00','OPEN',_binary '',_binary '\0',NULL,3,NULL,NULL,NULL),(75,'2023-04-29 00:00:00','10:30:00','OPEN',_binary '',_binary '\0',NULL,3,NULL,NULL,NULL),(76,'2023-04-29 00:00:00','11:00:00','OPEN',_binary '',_binary '\0',NULL,3,NULL,NULL,NULL),(77,'2023-04-29 00:00:00','11:30:00','OPEN',_binary '',_binary '\0',NULL,3,NULL,NULL,NULL),(78,'2023-04-29 00:00:00','12:00:00','OPEN',_binary '',_binary '\0',NULL,3,NULL,NULL,NULL),(79,'2023-04-30 00:00:00','09:00:00','OPEN',_binary '',_binary '\0',NULL,3,NULL,NULL,NULL),(80,'2023-04-30 00:00:00','09:30:00','OPEN',_binary '',_binary '\0',NULL,3,NULL,NULL,NULL),(81,'2023-04-30 00:00:00','10:00:00','OPEN',_binary '',_binary '\0',NULL,3,NULL,NULL,NULL),(82,'2023-04-30 00:00:00','10:30:00','OPEN',_binary '',_binary '\0',NULL,3,NULL,NULL,NULL),(83,'2023-04-30 00:00:00','11:00:00','OPEN',_binary '',_binary '\0',NULL,3,NULL,NULL,NULL),(84,'2023-04-30 00:00:00','11:30:00','OPEN',_binary '',_binary '\0',NULL,3,NULL,NULL,NULL),(85,'2023-04-30 00:00:00','12:00:00','OPEN',_binary '',_binary '\0',NULL,3,NULL,NULL,NULL);
/*!40000 ALTER TABLE `slot_availibility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_details`
--

DROP TABLE IF EXISTS `user_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `user_name` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `role_id` bigint DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT NULL,
  `owner_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name_UNIQUE` (`user_name`),
  UNIQUE KEY `phone_UNIQUE` (`phone`),
  KEY `fk_rl_id_idx` (`role_id`),
  CONSTRAINT `fk_rl_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_details`
--

LOCK TABLES `user_details` WRITE;
/*!40000 ALTER TABLE `user_details` DISABLE KEYS */;
INSERT INTO `user_details` VALUES (1,'santosh_admin','admin','admin','Admin@123','admin@gmail.com','9731717195','M',1,NULL,_binary '',_binary '\0',1),(2,'santosh_owner','owner','owner','Owner@123','owner@gmail.com','9731717176','M',2,NULL,_binary '',_binary '\0',2),(3,'santosh_employee1','employee1','employee1','Employee@123','employee1@gmail.com','9731717177','M',3,NULL,_binary '',_binary '\0',2),(4,'santosh_employee2','employee2','employee2','Employee@123','employee2@gmail.com','9731717178','M',3,NULL,_binary '',_binary '\0',2),(5,'san_consumer1','consumer1','consumer1','Consumer@123','consumer1@gmail.com','9731757575','M',4,NULL,_binary '',_binary '\0',NULL),(7,'san_consumer2','consumer2','consumer2','Consumer@123','consumer2@gmail.com','9731757566','M',4,NULL,_binary '',_binary '\0',NULL),(16,'san_consumer3','consumer3','consumer3','Consumer@123','consumer3@gmail.com','9731757598','M',4,NULL,_binary '',_binary '\0',NULL),(17,'san_consumer4','consumer4','consumer4','Consumer@123','consumer4@gmail.com','9731757599','M',4,NULL,_binary '',_binary '\0',NULL),(18,'san_consumer5','consumer5','consumer5','Consumer@123','consumer5@gmail.com','9731757545','M',4,NULL,_binary '',_binary '\0',NULL),(19,'san_consumer6','consumer6','consumer6','Consumer@123','consumer6@gmail.com','9731757565','M',4,NULL,_binary '',_binary '\0',NULL),(22,'san_consumer7','consumer7','consumer7','Consumer@123','consumer7@gmail.com','9731757525','M',4,NULL,_binary '',_binary '\0',NULL),(23,'san_consumer8','consumer8','consumer8','Consumer@123','consumer8@gmail.com','9731757515','M',4,NULL,_binary '',_binary '\0',NULL),(24,'san_consumer9','consumer9','consumer9','Consumer@123','consumer9@gmail.com','9731757511','M',4,NULL,_binary '',_binary '\0',NULL),(25,'san_consumer10','consumer10','consumer10','Consumer@123','consumer10@gmail.com','9731757512','M',4,NULL,_binary '',_binary '\0',NULL),(26,'san_consumer11','consumer11','consumer11','Consumer@123','consumer11@gmail.com','9731757513','M',4,NULL,_binary '',_binary '\0',NULL),(27,'san_consumer12','consumer12','consumer12','Consumer@123','consumer12@gmail.com','9731757514','M',4,NULL,_binary '',_binary '\0',NULL),(29,'san_consumer14','consumer14','consumer14','Consumer@123','consumer14@gmail.com','9731757516','M',4,NULL,_binary '',_binary '\0',NULL),(30,'san_consumer15','consumer15','consumer15','Consumer@123','consumer15@gmail.com','9731757517','M',4,NULL,_binary '',_binary '\0',NULL),(31,'san_consumer16','consumer16','consumer16','Consumer@123','consumer16@gmail.com','9731757519','M',4,NULL,_binary '',_binary '\0',NULL),(33,'san_lab_owner','sanLabOwner','shopLabOwner','shopLabowner@123','sanlabowner@gmail.com','9731747485','M',2,NULL,_binary '',_binary '\0',33);
/*!40000 ALTER TABLE `user_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-01 21:04:12
