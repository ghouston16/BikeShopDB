CREATE DATABASE  IF NOT EXISTS `bikeshop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bikeshop`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: bikeshop
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Temporary view structure for view `allcustomerloans`
--

DROP TABLE IF EXISTS `allcustomerloans`;
/*!50001 DROP VIEW IF EXISTS `allcustomerloans`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `allcustomerloans` AS SELECT 
 1 AS `ID`,
 1 AS `Name`,
 1 AS `Bike ID`,
 1 AS `Date Out`,
 1 AS `Date Back`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `bike`
--

DROP TABLE IF EXISTS `bike`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bike` (
  `bikeId` int NOT NULL AUTO_INCREMENT,
  `serialNum` varchar(30) NOT NULL,
  `manufacturer` varchar(30) NOT NULL,
  `category` varchar(20) NOT NULL,
  `cost` decimal(6,2) NOT NULL,
  `warrantyLength` int NOT NULL,
  `dateAcquired` date NOT NULL,
  `dateRetired` date DEFAULT NULL,
  `rentalPrice` decimal(5,2) NOT NULL,
  PRIMARY KEY (`bikeId`),
  KEY `bikemanuind` (`manufacturer`),
  KEY `bikecategoryind` (`category`),
  KEY `bikepriceind` (`rentalPrice`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bike`
--

LOCK TABLES `bike` WRITE;
/*!40000 ALTER TABLE `bike` DISABLE KEYS */;
INSERT INTO `bike` VALUES (1,'SN:123456789','Trek','Mountain',870.50,5,'2018-10-08',NULL,7.00),(2,'SN:121245354','Trek','Mountain',870.50,5,'2018-10-08',NULL,7.00),(3,'SN:124356788','Trek','Racer',1200.79,5,'2018-10-08',NULL,7.00),(4,'SN:124356777','Trek','Racer',1200.79,5,'2018-10-08',NULL,7.00),(5,'SN:124356820','Trek','Racer',1200.79,5,'2010-10-08','2018-10-06',7.00),(6,'SN:124356845','Trek','Racer',1200.79,5,'2010-10-08','2017-07-03',7.00),(7,'SN:123453683','Trek','Mountain',870.50,5,'2018-10-08',NULL,7.00),(8,'SN:123453700','Trek','Racer',1200.50,5,'2018-10-08',NULL,7.00),(9,'SN:123453756','Trek','Racer',1200.50,5,'2017-07-08',NULL,7.00),(10,'SN:312896544','Raleigh','Hybrid',1000.39,7,'2020-10-08',NULL,7.00),(11,'SN:312896557','Raleigh','Hybrid',1000.39,7,'2020-10-08',NULL,7.00),(12,'SN:312456544','Raleigh','Mountain',650.39,7,'2020-06-08',NULL,7.00),(13,'SN:312457689','Raleigh','Mountain',650.39,7,'2020-06-08',NULL,7.00),(14,'SN:312459433','Raleigh','City',532.39,5,'2020-06-08',NULL,7.00),(15,'SN:347896572','Raleigh','City',532.39,5,'2020-10-08',NULL,7.00);
/*!40000 ALTER TABLE `bike` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_bike_update` BEFORE UPDATE ON `bike` FOR EACH ROW begin
	insert into bike_audit
    set action = 'update',
    bikeId = old.bikeId,
    serialNum = old.serialNum,
    cost = old.cost,
    rentalPrice = old.rentalPrice,
    changedate = now();
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `bike_audit`
--

DROP TABLE IF EXISTS `bike_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bike_audit` (
  `bikeid` int NOT NULL AUTO_INCREMENT,
  `serialNum` varchar(30) NOT NULL,
  `cost` decimal(6,2) DEFAULT NULL,
  `rentalPrice` decimal(6,2) DEFAULT NULL,
  `changedate` datetime DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`bikeid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bike_audit`
--

LOCK TABLES `bike_audit` WRITE;
/*!40000 ALTER TABLE `bike_audit` DISABLE KEYS */;
INSERT INTO `bike_audit` VALUES (1,'SN:123456789',870.50,5.00,'2020-11-29 18:51:41','update'),(2,'SN:121245354',870.50,5.00,'2020-11-29 18:51:41','update'),(3,'SN:124356788',1200.79,5.00,'2020-11-29 18:51:41','update'),(4,'SN:124356777',1200.79,5.00,'2020-11-29 18:51:41','update'),(5,'SN:124356820',1200.79,5.00,'2020-11-29 18:51:41','update'),(6,'SN:124356845',1200.79,5.00,'2020-11-29 18:51:41','update'),(7,'SN:123453683',870.50,5.00,'2020-11-29 18:51:41','update'),(8,'SN:123453700',1200.50,5.00,'2020-11-29 18:51:41','update'),(9,'SN:123453756',1200.50,5.00,'2020-11-29 18:51:41','update'),(10,'SN:312896544',1000.39,5.00,'2020-11-29 18:51:41','update'),(11,'SN:312896557',1000.39,5.00,'2020-11-29 18:51:41','update'),(12,'SN:312456544',650.39,5.00,'2020-11-29 18:51:41','update'),(13,'SN:312457689',650.39,5.00,'2020-11-29 18:51:41','update'),(14,'SN:312459433',532.39,5.00,'2020-11-29 18:51:41','update'),(15,'SN:347896572',532.39,5.00,'2020-11-29 18:51:41','update');
/*!40000 ALTER TABLE `bike_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `bikeinspectionrecords`
--

DROP TABLE IF EXISTS `bikeinspectionrecords`;
/*!50001 DROP VIEW IF EXISTS `bikeinspectionrecords`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `bikeinspectionrecords` AS SELECT 
 1 AS `Bike ID`,
 1 AS `Inspection ID`,
 1 AS `Date and Time`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `bikerental_count`
--

DROP TABLE IF EXISTS `bikerental_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bikerental_count` (
  `bikeid` int NOT NULL,
  `count` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`bikeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bikerental_count`
--

LOCK TABLES `bikerental_count` WRITE;
/*!40000 ALTER TABLE `bikerental_count` DISABLE KEYS */;
INSERT INTO `bikerental_count` VALUES (1,1),(2,1),(3,1),(4,2),(5,1),(6,2),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,0),(14,0),(15,0);
/*!40000 ALTER TABLE `bikerental_count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `bikerentalcount`
--

DROP TABLE IF EXISTS `bikerentalcount`;
/*!50001 DROP VIEW IF EXISTS `bikerentalcount`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `bikerentalcount` AS SELECT 
 1 AS `Bike ID`,
 1 AS `Manufacturer`,
 1 AS `Type`,
 1 AS `Total Rentals`,
 1 AS `Since`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `bikerentalrecords`
--

DROP TABLE IF EXISTS `bikerentalrecords`;
/*!50001 DROP VIEW IF EXISTS `bikerentalrecords`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `bikerentalrecords` AS SELECT 
 1 AS `Bike ID`,
 1 AS `Rental ID`,
 1 AS `Date`,
 1 AS `Returned`,
 1 AS `Total`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `bikeservice_count`
--

DROP TABLE IF EXISTS `bikeservice_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bikeservice_count` (
  `bikeid` int NOT NULL,
  `count` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`bikeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bikeservice_count`
--

LOCK TABLES `bikeservice_count` WRITE;
/*!40000 ALTER TABLE `bikeservice_count` DISABLE KEYS */;
INSERT INTO `bikeservice_count` VALUES (1,3),(2,0),(3,0),(4,1),(5,0),(6,1),(7,0),(8,0),(9,0),(10,0),(11,0),(12,0),(13,0),(14,0),(15,0);
/*!40000 ALTER TABLE `bikeservice_count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `bikeservicecount`
--

DROP TABLE IF EXISTS `bikeservicecount`;
/*!50001 DROP VIEW IF EXISTS `bikeservicecount`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `bikeservicecount` AS SELECT 
 1 AS `Bike ID`,
 1 AS `Manufacturer`,
 1 AS `Type`,
 1 AS `Total`,
 1 AS `Since`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `bikeservicerecords`
--

DROP TABLE IF EXISTS `bikeservicerecords`;
/*!50001 DROP VIEW IF EXISTS `bikeservicerecords`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `bikeservicerecords` AS SELECT 
 1 AS `Bike ID`,
 1 AS `Service ID`,
 1 AS `Date and Time`,
 1 AS `Total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `citybikes`
--

DROP TABLE IF EXISTS `citybikes`;
/*!50001 DROP VIEW IF EXISTS `citybikes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `citybikes` AS SELECT 
 1 AS `Bike Id`,
 1 AS `Type`,
 1 AS `Manufacturer`,
 1 AS `Price`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `currentbikestock`
--

DROP TABLE IF EXISTS `currentbikestock`;
/*!50001 DROP VIEW IF EXISTS `currentbikestock`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `currentbikestock` AS SELECT 
 1 AS `Bike ID`,
 1 AS `Serial No.`,
 1 AS `Manufacturer`,
 1 AS `Type`,
 1 AS `Price`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customerId` int NOT NULL AUTO_INCREMENT,
  `fName` varchar(20) NOT NULL,
  `lName` varchar(20) NOT NULL,
  `street` varchar(20) NOT NULL,
  `town` varchar(20) NOT NULL,
  `county` varchar(15) NOT NULL,
  `DOB` date NOT NULL,
  `email` varchar(40) DEFAULT NULL,
  `contactNo` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`customerId`),
  KEY `customerfnameind` (`fName`),
  KEY `customerlnameind` (`lName`),
  KEY `customeremailind` (`email`),
  KEY `customerdobind` (`DOB`),
  KEY `customercounty` (`county`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Gary','Houston','8 Home','Town','Cork','1990-01-01','gh@wit.ie','0861277665'),(2,'John','Swann','Around','The Lough','Cork','1962-10-05','js@thelough.ie','0893456546'),(3,'John','Doe','8 Main Street','Birr','Offaly','1990-06-07','jd@work.ie','0894500546'),(4,'Brian','O\'Neill','7 Dubh Carrig','Ardmore','Waterford','1989-11-21','rmd@wit.ie','0892981676'),(5,'Steve','Stevenson','10 Grosvner Place','Ranelagh','Dublin','1982-04-08','ss@wit.ie','0898911546'),(6,'Mary','Kelleher','10 O\'Connell Street','Dublin','Dublin','1993-11-28','mk@outlook.ie','0873457821'),(7,'Jennifer','Murphy','4 Street','Gorey','Wexford','2006-02-25','jm@test.com','0863244646'),(8,'Sarah','Kearney','8 Main Street','Kilkenny','Kilkenny','2002-05-16','sk@email.com','0854743614'),(9,'David','James','The Lodge','Limerick','Limerick','1999-06-13','dj@email.ie','0872235664'),(10,'John','Swann','8 Patrick Street','Cork','Cork','1994-10-17','dob@thelough.ie','08379943216');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_customer_update` BEFORE UPDATE ON `customer` FOR EACH ROW begin
	insert into customer_update
    set action = 'update',
    customerId = old.customerId,
    fname = old.fname,
    lname = old.lname,
    email = old.email,
    contactNo = old.contactNo,
    changedate = now();
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `customer_update`
--

DROP TABLE IF EXISTS `customer_update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_update` (
  `customerId` int DEFAULT NULL,
  `fName` varchar(20) NOT NULL,
  `lName` varchar(20) NOT NULL,
  `email` varchar(40) NOT NULL,
  `contactNo` varchar(15) NOT NULL,
  `changedate` date DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_update`
--

LOCK TABLES `customer_update` WRITE;
/*!40000 ALTER TABLE `customer_update` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_update` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `customerrentalrecords`
--

DROP TABLE IF EXISTS `customerrentalrecords`;
/*!50001 DROP VIEW IF EXISTS `customerrentalrecords`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customerrentalrecords` AS SELECT 
 1 AS `Cust. ID`,
 1 AS `Customer Name`,
 1 AS `Rental ID`,
 1 AS `Bike ID`,
 1 AS `Staff ID`,
 1 AS `Date`,
 1 AS `Returned`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `hybridbikes`
--

DROP TABLE IF EXISTS `hybridbikes`;
/*!50001 DROP VIEW IF EXISTS `hybridbikes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `hybridbikes` AS SELECT 
 1 AS `Bike Id`,
 1 AS `Type`,
 1 AS `Manufacturer`,
 1 AS `Price`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `inspection`
--

DROP TABLE IF EXISTS `inspection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inspection` (
  `inspectionId` int NOT NULL AUTO_INCREMENT,
  `staffId` int NOT NULL,
  `rentalId` int NOT NULL,
  `bikeId` int NOT NULL,
  `inspectionDateTime` datetime NOT NULL,
  `serviceNeeded` varchar(3) NOT NULL,
  PRIMARY KEY (`inspectionId`,`rentalId`,`bikeId`),
  KEY `fk_inspectrental` (`rentalId`),
  KEY `inspectionstaffind` (`staffId`),
  KEY `inspectionbikeind` (`bikeId`),
  KEY `inspectiondateind` (`inspectionDateTime`),
  CONSTRAINT `fk_inspectbike` FOREIGN KEY (`bikeId`) REFERENCES `bike` (`bikeId`),
  CONSTRAINT `fk_inspectrental` FOREIGN KEY (`rentalId`) REFERENCES `rental` (`rentalId`),
  CONSTRAINT `fk_technician` FOREIGN KEY (`staffId`) REFERENCES `staff` (`staffId`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inspection`
--

LOCK TABLES `inspection` WRITE;
/*!40000 ALTER TABLE `inspection` DISABLE KEYS */;
INSERT INTO `inspection` VALUES (1,2,1,1,'2011-12-02 09:30:00','yes'),(2,2,2,2,'2011-12-02 10:00:00','no'),(3,3,3,5,'2018-12-02 09:30:00','no'),(4,6,4,6,'2018-12-01 09:30:00','yes'),(5,5,5,4,'2019-05-13 11:30:00','yes'),(6,6,6,6,'2019-05-13 12:30:00','no'),(7,8,7,4,'2019-05-13 13:30:00','yes'),(8,7,8,6,'2020-06-14 14:30:00','yes');
/*!40000 ALTER TABLE `inspection` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_inspection_update` BEFORE UPDATE ON `inspection` FOR EACH ROW begin
	insert into inspection_update
    set action = 'update',
    inspectionid = old.inspectionid,
    staffId = old.staffid,
    bikeId = old.bikeId,
    serviceNeeded = old.serviceNeeded,
    changedate = now();
    end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `inspection_update`
--

DROP TABLE IF EXISTS `inspection_update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inspection_update` (
  `inspectionId` int NOT NULL,
  `staffId` int NOT NULL,
  `bikeId` int NOT NULL,
  `serviceNeeded` varchar(3) DEFAULT NULL,
  `changedate` date DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inspection_update`
--

LOCK TABLES `inspection_update` WRITE;
/*!40000 ALTER TABLE `inspection_update` DISABLE KEYS */;
/*!40000 ALTER TABLE `inspection_update` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `mountainbikes`
--

DROP TABLE IF EXISTS `mountainbikes`;
/*!50001 DROP VIEW IF EXISTS `mountainbikes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mountainbikes` AS SELECT 
 1 AS `Bike Id`,
 1 AS `Type`,
 1 AS `Manufacturer`,
 1 AS `Price`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `overduebikes`
--

DROP TABLE IF EXISTS `overduebikes`;
/*!50001 DROP VIEW IF EXISTS `overduebikes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `overduebikes` AS SELECT 
 1 AS `Rental ID`,
 1 AS `Bike ID`,
 1 AS `Customer ID`,
 1 AS `Customer Name`,
 1 AS `Rented`,
 1 AS `Due`,
 1 AS `Returned`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `racingbikes`
--

DROP TABLE IF EXISTS `racingbikes`;
/*!50001 DROP VIEW IF EXISTS `racingbikes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `racingbikes` AS SELECT 
 1 AS `Bike Id`,
 1 AS `Type`,
 1 AS `Manufacturer`,
 1 AS `Price`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `rental`
--

DROP TABLE IF EXISTS `rental`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rental` (
  `rentalId` int NOT NULL AUTO_INCREMENT,
  `customerId` int NOT NULL,
  `bikeId` int NOT NULL,
  `staffId` int NOT NULL,
  `dateOut` date NOT NULL,
  `timeOut` time NOT NULL,
  `dateDue` date NOT NULL,
  `timeDue` time NOT NULL,
  `dateBack` date DEFAULT NULL,
  `timeBack` time DEFAULT NULL,
  PRIMARY KEY (`rentalId`),
  KEY `fk_bikeId` (`bikeId`),
  KEY `rentalcustomerind` (`customerId`),
  KEY `rentalstaffind` (`staffId`),
  KEY `rentaldateind` (`dateOut`),
  CONSTRAINT `fk_bikeId` FOREIGN KEY (`bikeId`) REFERENCES `bike` (`bikeId`) ON UPDATE CASCADE,
  CONSTRAINT `fk_customer` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`),
  CONSTRAINT `fk_staffMember` FOREIGN KEY (`staffId`) REFERENCES `staff` (`staffId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rental`
--

LOCK TABLES `rental` WRITE;
/*!40000 ALTER TABLE `rental` DISABLE KEYS */;
INSERT INTO `rental` VALUES (1,1,1,3,'2011-12-01','14:20:00','2011-12-01','17:30:00','2011-12-01','17:15:00'),(2,2,2,2,'2011-12-01','09:20:00','2011-12-01','17:30:00','2011-12-01','17:30:00'),(3,3,5,1,'2018-12-01','12:30:00','2018-12-01','15:30:30','2018-12-01','15:35:00'),(4,3,6,2,'2018-12-01','12:30:00','2018-12-01','15:30:30','2018-12-01','15:35:00'),(5,4,3,3,'2019-05-12','10:30:00','2019-05-19','17:30:00','2019-12-01','17:30:00'),(6,4,4,4,'2019-05-12','10:30:00','2019-05-19','17:30:00','2019-12-01','17:30:00'),(7,5,4,4,'2019-05-12','10:30:00','2019-05-19','17:30:00','2019-12-01','17:30:00'),(8,6,6,3,'2020-06-12','10:30:00','2020-06-26','17:30:00','2020-06-26','15:15:23'),(9,7,7,2,'2020-07-08','10:30:00','2020-07-15','17:30:00','2020-07-15','15:15:23'),(10,8,8,2,'2020-08-05','10:30:00','2020-08-05','17:30:00','2020-08-06','15:15:23'),(11,8,9,2,'2020-08-05','10:30:00','2020-08-05','17:30:00','2020-08-06','15:15:23'),(12,1,10,3,'2020-08-08','09:30:00','2020-08-10','17:30:00','2020-08-10','15:15:23'),(13,1,11,3,'2020-08-08','09:30:00','2020-08-10','17:30:00',NULL,NULL);
/*!40000 ALTER TABLE `rental` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_rental_insert` AFTER INSERT ON `rental` FOR EACH ROW BEGIN
    UPDATE bikerental_count
    SET count  = count + 1
    WHERE rentalid = new.rentalId;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `rentedbikes`
--

DROP TABLE IF EXISTS `rentedbikes`;
/*!50001 DROP VIEW IF EXISTS `rentedbikes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `rentedbikes` AS SELECT 
 1 AS `Bike ID`,
 1 AS `Rental ID`,
 1 AS `Customer`,
 1 AS `Rented`,
 1 AS `Due`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `retiredbikes`
--

DROP TABLE IF EXISTS `retiredbikes`;
/*!50001 DROP VIEW IF EXISTS `retiredbikes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `retiredbikes` AS SELECT 
 1 AS `Bike ID`,
 1 AS `Serial No.`,
 1 AS `Manufacturer`,
 1 AS `Type`,
 1 AS `Date Retired`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `salesstaff`
--

DROP TABLE IF EXISTS `salesstaff`;
/*!50001 DROP VIEW IF EXISTS `salesstaff`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `salesstaff` AS SELECT 
 1 AS `Staff Id`,
 1 AS `Name`,
 1 AS `Commision (%)`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `servicejob`
--

DROP TABLE IF EXISTS `servicejob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicejob` (
  `serviceId` int NOT NULL AUTO_INCREMENT,
  `inspectionId` int NOT NULL,
  `staffId` int NOT NULL,
  `bikeId` int NOT NULL,
  `serviceDate` datetime NOT NULL,
  `partsRepaired` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`serviceId`,`bikeId`,`staffId`),
  KEY `fk_inspection` (`inspectionId`),
  KEY `fk_bike` (`bikeId`),
  KEY `servicedateind` (`serviceDate`),
  KEY `partsrepairedind` (`partsRepaired`),
  CONSTRAINT `fk_bike` FOREIGN KEY (`bikeId`) REFERENCES `bike` (`bikeId`) ON UPDATE CASCADE,
  CONSTRAINT `fk_inspection` FOREIGN KEY (`inspectionId`) REFERENCES `inspection` (`rentalId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicejob`
--

LOCK TABLES `servicejob` WRITE;
/*!40000 ALTER TABLE `servicejob` DISABLE KEYS */;
INSERT INTO `servicejob` VALUES (1,1,2,1,'2011-12-02 09:00:00','Chain'),(2,4,6,6,'2018-12-02 10:00:00','Tyres'),(3,5,5,1,'2011-12-02 11:30:00','Brake Pads'),(4,7,2,1,'2011-12-02 12:00:00','Chain'),(5,8,8,4,'2019-05-13 12:30:30','Mudguard');
/*!40000 ALTER TABLE `servicejob` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_service_insert` AFTER INSERT ON `servicejob` FOR EACH ROW BEGIN
    UPDATE bikeservice_count
    SET count  = count + 1
    WHERE serviceid = new.serviceId;
END */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_service_update` BEFORE UPDATE ON `servicejob` FOR EACH ROW begin
	insert into servicejob_update
    set action = 'update',
    serviceid = old.serviceid,
    staffId = old.staffid,
    bikeId = old.bikeId,
    serviceDate = old.serviceDate,
    partsRepaired = old.partsrepaired,
    changedate = now();
    end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `servicejob_update`
--

DROP TABLE IF EXISTS `servicejob_update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicejob_update` (
  `serviceId` int NOT NULL,
  `staffId` int NOT NULL,
  `bikeId` int NOT NULL,
  `serviceDate` datetime NOT NULL,
  `partsRepaired` varchar(100) DEFAULT NULL,
  `changedate` date DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicejob_update`
--

LOCK TABLES `servicejob_update` WRITE;
/*!40000 ALTER TABLE `servicejob_update` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicejob_update` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staffId` int NOT NULL AUTO_INCREMENT,
  `fName` varchar(20) NOT NULL,
  `lName` varchar(20) NOT NULL,
  `street` varchar(20) NOT NULL,
  `town` varchar(20) NOT NULL,
  `county` varchar(15) NOT NULL,
  `email` varchar(40) NOT NULL,
  `contactNo` varchar(15) NOT NULL,
  `staffRole` varchar(30) NOT NULL,
  `startDate` date NOT NULL,
  `supervisorId` int DEFAULT NULL,
  `commission` tinyint DEFAULT NULL,
  `manHandling` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`staffId`),
  KEY `stafflnameind` (`lName`),
  KEY `staffemailind` (`email`),
  KEY `staffroleind` (`staffRole`),
  KEY `staffcountyind` (`county`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Greg','Huton','1 Cork Road','Killarney','Kerry','greg@bikeshop.ie','0861990665',' technical supervisor','2020-02-10',NULL,NULL,'yes'),(2,'John','Fox','Muckross House','Killarney','Kerry','jf@bikeshop.ie','0872856541','technician','2020-06-01',1,NULL,'yes'),(3,'Jack','Dorney','18 Some Street','Killarney','Kerry','jd@bikeshop.ie','0894500546','technician','2020-02-10',1,NULL,'yes'),(4,'Brian','Lynch','17 Main Road','Killarney','Kerry','bl@bikeshop.ie','0863941671','technician','2019-04-16',1,NULL,'yes'),(5,'Sven','Svenson','10 Cork Road','Killarney','Kerry','ss@bikeshop.ie','0898922546','supervisor','2018-10-08',NULL,3,NULL),(6,'Emma','Jackson','4 Main Street','Waterville','Kerry','ej@bikeshop.ie','0864531546','storefront','2018-10-10',5,3,NULL),(7,'Rachel','Riley','1 Main Street','Cahersiveen','Kerry','rr@bikeshop.ie','0856811194','storefront','2018-10-08',5,3,NULL),(8,'Robert','Ryan','14 Main Street','Kenmare','Kerry','r.ryan@bikeshop.ie','0856823492','storefront','2020-07-12',5,3,NULL);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_staff_update` BEFORE UPDATE ON `staff` FOR EACH ROW begin
	insert into staff_update
    set action = 'update',
    staffId = old.staffId,
    fname = old.fname,
    lname = old.lname,
    staffRole = old.staffRole,
    startDate = old.startdate,
    commission = old.commission,
    changedate = now();
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `staff_update`
--

DROP TABLE IF EXISTS `staff_update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_update` (
  `staffId` int DEFAULT NULL,
  `fName` varchar(20) NOT NULL,
  `lName` varchar(20) NOT NULL,
  `staffRole` varchar(30) NOT NULL,
  `startDate` date NOT NULL,
  `commission` tinyint DEFAULT NULL,
  `changedate` date DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_update`
--

LOCK TABLES `staff_update` WRITE;
/*!40000 ALTER TABLE `staff_update` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_update` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `staffrentalrecords`
--

DROP TABLE IF EXISTS `staffrentalrecords`;
/*!50001 DROP VIEW IF EXISTS `staffrentalrecords`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `staffrentalrecords` AS SELECT 
 1 AS `Staff ID`,
 1 AS `Staff Name`,
 1 AS `Rental ID`,
 1 AS `customerid`,
 1 AS `Date`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `supervisees`
--

DROP TABLE IF EXISTS `supervisees`;
/*!50001 DROP VIEW IF EXISTS `supervisees`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `supervisees` AS SELECT 
 1 AS `Staff Id`,
 1 AS `Name`,
 1 AS `Role`,
 1 AS `Supervisor`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `supervisors`
--

DROP TABLE IF EXISTS `supervisors`;
/*!50001 DROP VIEW IF EXISTS `supervisors`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `supervisors` AS SELECT 
 1 AS `Staff Id`,
 1 AS `Name`,
 1 AS `Role`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `technicianinspectionrecords`
--

DROP TABLE IF EXISTS `technicianinspectionrecords`;
/*!50001 DROP VIEW IF EXISTS `technicianinspectionrecords`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `technicianinspectionrecords` AS SELECT 
 1 AS `Staff ID`,
 1 AS `Inspection ID`,
 1 AS `Bike ID`,
 1 AS `First Name`,
 1 AS `Last Name`,
 1 AS `Date and Time`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `technicians`
--

DROP TABLE IF EXISTS `technicians`;
/*!50001 DROP VIEW IF EXISTS `technicians`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `technicians` AS SELECT 
 1 AS `Staff Id`,
 1 AS `Name`,
 1 AS `Manual Handling Training`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `technicianservicerecords`
--

DROP TABLE IF EXISTS `technicianservicerecords`;
/*!50001 DROP VIEW IF EXISTS `technicianservicerecords`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `technicianservicerecords` AS SELECT 
 1 AS `Staff ID`,
 1 AS `Service ID`,
 1 AS `Bike ID`,
 1 AS `First Name`,
 1 AS `Last Name`,
 1 AS `Date and Time`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `allcustomerloans`
--

/*!50001 DROP VIEW IF EXISTS `allcustomerloans`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `allcustomerloans` AS select `customer`.`customerId` AS `ID`,concat(`customer`.`fName`,' ',`customer`.`lName`) AS `Name`,`bike`.`bikeId` AS `Bike ID`,`rental`.`dateOut` AS `Date Out`,`rental`.`dateBack` AS `Date Back` from (`customer` left join (`bike` join `rental` on((`bike`.`bikeId` = `rental`.`bikeId`))) on((`customer`.`customerId` = `rental`.`customerId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `bikeinspectionrecords`
--

/*!50001 DROP VIEW IF EXISTS `bikeinspectionrecords`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `bikeinspectionrecords` AS select `inspection`.`bikeId` AS `Bike ID`,`inspection`.`inspectionId` AS `Inspection ID`,`inspection`.`inspectionDateTime` AS `Date and Time` from (`inspection` join `staff` on((`inspection`.`staffId` = `staff`.`staffId`))) order by `inspection`.`bikeId` */
/*!50002 WITH CASCADED CHECK OPTION */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `bikerentalcount`
--

/*!50001 DROP VIEW IF EXISTS `bikerentalcount`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `bikerentalcount` AS select distinct `bike`.`bikeId` AS `Bike ID`,`bike`.`manufacturer` AS `Manufacturer`,`bike`.`category` AS `Type`,`bikerental_count`.`count` AS `Total Rentals`,`bike`.`dateAcquired` AS `Since` from (`bike` left join `bikerental_count` on((`bike`.`bikeId` = `bikerental_count`.`bikeid`))) order by `bike`.`bikeId` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `bikerentalrecords`
--

/*!50001 DROP VIEW IF EXISTS `bikerentalrecords`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `bikerentalrecords` AS select `rental`.`bikeId` AS `Bike ID`,`rental`.`rentalId` AS `Rental ID`,`rental`.`dateOut` AS `Date`,`rental`.`dateBack` AS `Returned`,`bikerental_count`.`count` AS `Total` from ((`bike` join `rental` on((`bike`.`bikeId` = `rental`.`bikeId`))) join `bikerental_count` on((`bike`.`bikeId` = `bikerental_count`.`bikeid`))) order by `rental`.`bikeId` */
/*!50002 WITH CASCADED CHECK OPTION */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `bikeservicecount`
--

/*!50001 DROP VIEW IF EXISTS `bikeservicecount`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `bikeservicecount` AS select distinct `bike`.`bikeId` AS `Bike ID`,`bike`.`manufacturer` AS `Manufacturer`,`bike`.`category` AS `Type`,`bikeservice_count`.`count` AS `Total`,`bike`.`dateAcquired` AS `Since` from (`bike` left join `bikeservice_count` on((`bike`.`bikeId` = `bikeservice_count`.`bikeid`))) order by `bike`.`bikeId` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `bikeservicerecords`
--

/*!50001 DROP VIEW IF EXISTS `bikeservicerecords`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `bikeservicerecords` AS select `servicejob`.`bikeId` AS `Bike ID`,`servicejob`.`serviceId` AS `Service ID`,`servicejob`.`serviceDate` AS `Date and Time`,`bikeservice_count`.`count` AS `Total` from (`servicejob` join `bikeservice_count` on((`servicejob`.`bikeId` = `bikeservice_count`.`bikeid`))) order by `servicejob`.`bikeId` */
/*!50002 WITH CASCADED CHECK OPTION */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `citybikes`
--

/*!50001 DROP VIEW IF EXISTS `citybikes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `citybikes` AS select `bike`.`bikeId` AS `Bike Id`,`bike`.`category` AS `Type`,`bike`.`manufacturer` AS `Manufacturer`,`bike`.`rentalPrice` AS `Price` from `bike` where (`bike`.`category` = 'city') */
/*!50002 WITH CASCADED CHECK OPTION */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `currentbikestock`
--

/*!50001 DROP VIEW IF EXISTS `currentbikestock`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `currentbikestock` AS select distinct `bike`.`bikeId` AS `Bike ID`,`bike`.`serialNum` AS `Serial No.`,`bike`.`manufacturer` AS `Manufacturer`,`bike`.`category` AS `Type`,`bike`.`rentalPrice` AS `Price` from `bike` where (`bike`.`dateRetired` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customerrentalrecords`
--

/*!50001 DROP VIEW IF EXISTS `customerrentalrecords`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customerrentalrecords` AS select `rental`.`customerId` AS `Cust. ID`,concat(`customer`.`fName`,' ',`customer`.`lName`) AS `Customer Name`,`rental`.`rentalId` AS `Rental ID`,`rental`.`bikeId` AS `Bike ID`,`rental`.`staffId` AS `Staff ID`,`rental`.`dateOut` AS `Date`,`rental`.`dateBack` AS `Returned` from (`rental` join `customer` on((`rental`.`customerId` = `customer`.`customerId`))) order by `rental`.`customerId` */
/*!50002 WITH CASCADED CHECK OPTION */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `hybridbikes`
--

/*!50001 DROP VIEW IF EXISTS `hybridbikes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `hybridbikes` AS select `bike`.`bikeId` AS `Bike Id`,`bike`.`category` AS `Type`,`bike`.`manufacturer` AS `Manufacturer`,`bike`.`rentalPrice` AS `Price` from `bike` where (`bike`.`category` = 'hybrid') */
/*!50002 WITH CASCADED CHECK OPTION */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mountainbikes`
--

/*!50001 DROP VIEW IF EXISTS `mountainbikes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mountainbikes` AS select `bike`.`bikeId` AS `Bike Id`,`bike`.`category` AS `Type`,`bike`.`manufacturer` AS `Manufacturer`,`bike`.`rentalPrice` AS `Price` from `bike` where (`bike`.`category` = 'mountain') */
/*!50002 WITH CASCADED CHECK OPTION */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `overduebikes`
--

/*!50001 DROP VIEW IF EXISTS `overduebikes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `overduebikes` AS select `rental`.`rentalId` AS `Rental ID`,`rental`.`bikeId` AS `Bike ID`,`rental`.`customerId` AS `Customer ID`,concat(`customer`.`fName`,' ',`customer`.`lName`) AS `Customer Name`,concat(`rental`.`dateOut`,' ',`rental`.`timeOut`) AS `Rented`,concat(`rental`.`dateDue`,' ',`rental`.`timeDue`) AS `Due`,`rental`.`dateBack` AS `Returned` from (`rental` join `customer` on((`rental`.`customerId` = `customer`.`customerId`))) where (`rental`.`dateBack` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `racingbikes`
--

/*!50001 DROP VIEW IF EXISTS `racingbikes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `racingbikes` AS select `bike`.`bikeId` AS `Bike Id`,`bike`.`category` AS `Type`,`bike`.`manufacturer` AS `Manufacturer`,`bike`.`rentalPrice` AS `Price` from `bike` where (`bike`.`category` = 'racer') */
/*!50002 WITH CASCADED CHECK OPTION */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `rentedbikes`
--

/*!50001 DROP VIEW IF EXISTS `rentedbikes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `rentedbikes` AS select `rental`.`bikeId` AS `Bike ID`,`rental`.`rentalId` AS `Rental ID`,`rental`.`customerId` AS `Customer`,concat(`rental`.`dateOut`,' ',`rental`.`timeOut`) AS `Rented`,concat(`rental`.`dateDue`,' ',`rental`.`timeDue`) AS `Due` from `rental` where (now() <= `rental`.`dateDue`) */
/*!50002 WITH CASCADED CHECK OPTION */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `retiredbikes`
--

/*!50001 DROP VIEW IF EXISTS `retiredbikes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `retiredbikes` AS select `bike`.`bikeId` AS `Bike ID`,`bike`.`serialNum` AS `Serial No.`,`bike`.`manufacturer` AS `Manufacturer`,`bike`.`category` AS `Type`,`bike`.`dateRetired` AS `Date Retired` from `bike` where (`bike`.`dateRetired` is not null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `salesstaff`
--

/*!50001 DROP VIEW IF EXISTS `salesstaff`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `salesstaff` AS select `staff`.`staffId` AS `Staff Id`,concat(`staff`.`fName`,' ',`staff`.`lName`) AS `Name`,`staff`.`commission` AS `Commision (%)` from `staff` where (`staff`.`staffRole` like '%storefront%') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `staffrentalrecords`
--

/*!50001 DROP VIEW IF EXISTS `staffrentalrecords`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `staffrentalrecords` AS select `rental`.`staffId` AS `Staff ID`,concat(`staff`.`fName`,' ',`staff`.`lName`) AS `Staff Name`,`rental`.`rentalId` AS `Rental ID`,`rental`.`customerId` AS `customerid`,`rental`.`dateOut` AS `Date` from (`rental` join `staff` on((`rental`.`staffId` = `staff`.`staffId`))) order by `rental`.`staffId` */
/*!50002 WITH CASCADED CHECK OPTION */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `supervisees`
--

/*!50001 DROP VIEW IF EXISTS `supervisees`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `supervisees` AS select `staff`.`staffId` AS `Staff Id`,concat(`staff`.`fName`,' ',`staff`.`lName`) AS `Name`,`staff`.`staffRole` AS `Role`,`staff`.`supervisorId` AS `Supervisor` from `staff` where (not((`staff`.`staffRole` like '%supervisor%'))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `supervisors`
--

/*!50001 DROP VIEW IF EXISTS `supervisors`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `supervisors` AS select `staff`.`staffId` AS `Staff Id`,concat(`staff`.`fName`,' ',`staff`.`lName`) AS `Name`,`staff`.`staffRole` AS `Role` from `staff` where (`staff`.`staffRole` like '%supervisor%') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `technicianinspectionrecords`
--

/*!50001 DROP VIEW IF EXISTS `technicianinspectionrecords`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `technicianinspectionrecords` AS select `inspection`.`staffId` AS `Staff ID`,`inspection`.`inspectionId` AS `Inspection ID`,`inspection`.`bikeId` AS `Bike ID`,`staff`.`fName` AS `First Name`,`staff`.`lName` AS `Last Name`,`inspection`.`inspectionDateTime` AS `Date and Time` from (`inspection` join `staff` on((`inspection`.`staffId` = `staff`.`staffId`))) order by `inspection`.`staffId` */
/*!50002 WITH CASCADED CHECK OPTION */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `technicians`
--

/*!50001 DROP VIEW IF EXISTS `technicians`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `technicians` AS select `staff`.`staffId` AS `Staff Id`,concat(`staff`.`fName`,' ',`staff`.`lName`) AS `Name`,`staff`.`manHandling` AS `Manual Handling Training` from `staff` where (`staff`.`staffRole` like '%technician%') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `technicianservicerecords`
--

/*!50001 DROP VIEW IF EXISTS `technicianservicerecords`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `technicianservicerecords` AS select `servicejob`.`staffId` AS `Staff ID`,`servicejob`.`serviceId` AS `Service ID`,`servicejob`.`bikeId` AS `Bike ID`,`staff`.`fName` AS `First Name`,`staff`.`lName` AS `Last Name`,`servicejob`.`serviceDate` AS `Date and Time` from (`servicejob` join `staff` on((`servicejob`.`staffId` = `staff`.`staffId`))) order by `servicejob`.`staffId` */
/*!50002 WITH CASCADED CHECK OPTION */;
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

-- Dump completed on 2020-11-29 19:44:39
