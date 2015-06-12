CREATE DATABASE  IF NOT EXISTS `carhireservice` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `carhireservice`;
-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: carhireservice
-- ------------------------------------------------------
-- Server version	5.6.24

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
-- Table structure for table `card_types`
--

DROP TABLE IF EXISTS `card_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `card_types` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `type_name` char(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card_types`
--

LOCK TABLES `card_types` WRITE;
/*!40000 ALTER TABLE `card_types` DISABLE KEYS */;
INSERT INTO `card_types` VALUES (1,'Visa Debit'),(2,'Mastercard'),(3,'American Expres');
/*!40000 ALTER TABLE `card_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `uname` varchar(22) NOT NULL,
  `pword` varchar(16) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `fname` varchar(25) NOT NULL,
  `lname` varchar(25) NOT NULL,
  `date_of_birth` date NOT NULL,
  `address_line_1` varchar(50) NOT NULL,
  `address_line_2` varchar(50) DEFAULT NULL,
  `city` varchar(25) DEFAULT NULL,
  `postcode` varchar(9) NOT NULL,
  `contact_number` varchar(15) NOT NULL,
  `email_address` varchar(30) DEFAULT NULL,
  `driving_licence_number` varchar(50) DEFAULT NULL,
  `licence_expiration` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'SThomas','SThomas',0,'Sarah','Thomas','1992-10-09','46 Inglewood Close','Birchwood','Warrington','WA36UJ','07964907663','SThomas@gmail.com','THOMA960092SA8AD','2025-06-07'),(2,'CGrimward','CGrimward',0,'Chris','Grimward','1993-08-21','18 Church Street',NULL,'Leeds','LS89BD','07153958809','CGrimward@gmail.com','GRIMW908213G98AD','2022-09-22'),(3,'BFry','BFry',1,'Brandon','Fry','1995-04-05','90 Bow Lane',NULL,'Salford','M275AW','07764298745','BFry@gmail.com','FRY99904055B98AD','2026-11-16');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `full_invoice_info`
--

DROP TABLE IF EXISTS `full_invoice_info`;
/*!50001 DROP VIEW IF EXISTS `full_invoice_info`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `full_invoice_info` AS SELECT 
 1 AS `id`,
 1 AS `fname`,
 1 AS `lname`,
 1 AS `address_line_1`,
 1 AS `address_line_2`,
 1 AS `city`,
 1 AS `postcode`,
 1 AS `hire_start`,
 1 AS `hire_end`,
 1 AS `registration_num`,
 1 AS `make`,
 1 AS `model`,
 1 AS `fuel_type`,
 1 AS `engine_size`,
 1 AS `group_name`,
 1 AS `daily_rate`,
 1 AS `num_of_days`,
 1 AS `total_cost`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoices` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `customer_id` int(5) NOT NULL,
  `vehicle_id` int(5) NOT NULL,
  `hire_start` date NOT NULL,
  `hire_end` date NOT NULL,
  `total_cost` decimal(4,2) NOT NULL,
  `mileage_start` int(6) NOT NULL,
  `mileage_end` int(6) DEFAULT NULL,
  `is_outstanding` tinyint(1) DEFAULT NULL,
  `payment_info_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`customer_id`),
  KEY `vehicle_id` (`vehicle_id`),
  CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `invoices_ibfk_2` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
INSERT INTO `invoices` VALUES (1,1,1,'2015-06-08','2015-06-12',40.00,14915,15000,0,1),(2,2,2,'2015-06-10','2015-06-11',20.00,6680,6780,0,4),(3,3,3,'2015-06-08','2015-06-08',30.00,2168,2300,0,5),(4,3,4,'2015-06-11','2015-06-12',40.00,546,600,0,5);
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_info`
--

DROP TABLE IF EXISTS `payment_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_info` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `customer_id` int(5) NOT NULL,
  `card_type_id` int(5) NOT NULL,
  `card_num` varchar(20) NOT NULL,
  `card_expire` int(4) NOT NULL,
  `card_auth` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`customer_id`),
  KEY `card_type_id` (`card_type_id`),
  CONSTRAINT `payment_info_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `payment_info_ibfk_2` FOREIGN KEY (`card_type_id`) REFERENCES `card_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_info`
--

LOCK TABLES `payment_info` WRITE;
/*!40000 ALTER TABLE `payment_info` DISABLE KEYS */;
INSERT INTO `payment_info` VALUES (1,1,1,'1234567887654321',915,98),(2,1,2,'0987654334567890',1217,765),(3,1,3,'1234098712340987',516,432),(4,2,1,'7890654378906543',1015,109),(5,3,2,'1234567809871234',116,876);
/*!40000 ALTER TABLE `payment_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_records`
--

DROP TABLE IF EXISTS `service_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_records` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `vehicle_id` int(5) NOT NULL,
  `service_number` int(2) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `mileage_at_service` int(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vehicle_id` (`vehicle_id`),
  CONSTRAINT `service_records_ibfk_1` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_records`
--

LOCK TABLES `service_records` WRITE;
/*!40000 ALTER TABLE `service_records` DISABLE KEYS */;
INSERT INTO `service_records` VALUES (1,1,1,'Passed with flying colours.',14500),(2,2,1,'Passed with flying colours.',5438),(3,3,1,'Passed with flying colours.',1796),(4,4,1,'Passed with flying colours.',450),(5,5,1,'Passed with flying colours.',467),(6,6,1,'Passed with flying colours.',1300);
/*!40000 ALTER TABLE `service_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_groups`
--

DROP TABLE IF EXISTS `vehicle_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_groups` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `group_name` char(3) NOT NULL,
  `daily_rate` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_groups`
--

LOCK TABLES `vehicle_groups` WRITE;
/*!40000 ALTER TABLE `vehicle_groups` DISABLE KEYS */;
INSERT INTO `vehicle_groups` VALUES (1,'A',10.00),(2,'B',20.00),(3,'C',30.00),(4,'D',40.00);
/*!40000 ALTER TABLE `vehicle_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicles` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `registration_num` char(8) NOT NULL,
  `make` varchar(12) NOT NULL,
  `model` varchar(12) NOT NULL,
  `fuel_type` char(1) NOT NULL,
  `engine_size` double(2,1) NOT NULL,
  `group_id` int(5) NOT NULL,
  `num_of_doors` int(1) DEFAULT NULL,
  `mileage` int(6) DEFAULT NULL,
  `days_hired` int(5) DEFAULT NULL,
  `is_on_hire` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `vehicles_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `vehicle_groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicles`
--

LOCK TABLES `vehicles` WRITE;
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` VALUES (1,'TK64 JKL','Toyota','Aygo','P',1.0,1,3,15000,98,0),(2,'HK14 YPU','Smart','forTwo','P',0.9,1,3,6780,57,0),(3,'GJ62 GKG','Seat','Ibiza','D',1.6,2,5,2300,26,0),(4,'WR15 WOW','Peugeot','208','P',1.4,2,5,600,9,0),(5,'LE63 ETL','Vauxhall','Insignia','D',2.0,3,5,780,12,0),(6,'KT14 LMO','Nissan','Navara','D',2.0,4,5,2000,56,0);
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vehicles_currently_available`
--

DROP TABLE IF EXISTS `vehicles_currently_available`;
/*!50001 DROP VIEW IF EXISTS `vehicles_currently_available`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vehicles_currently_available` AS SELECT 
 1 AS `registration_num`,
 1 AS `make`,
 1 AS `model`,
 1 AS `fuel_type`,
 1 AS `engine_size`,
 1 AS `group_id`,
 1 AS `group_name`,
 1 AS `daily_rate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vehicles_currently_on_hire`
--

DROP TABLE IF EXISTS `vehicles_currently_on_hire`;
/*!50001 DROP VIEW IF EXISTS `vehicles_currently_on_hire`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vehicles_currently_on_hire` AS SELECT 
 1 AS `registration_num`,
 1 AS `make`,
 1 AS `model`,
 1 AS `fuel_type`,
 1 AS `engine_size`,
 1 AS `group_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'carhireservice'
--

--
-- Dumping routines for database 'carhireservice'
--
/*!50003 DROP PROCEDURE IF EXISTS `available_vehicles_for_dates` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `available_vehicles_for_dates`(in startDate date, in endDate date)
Begin
	Select vehicles.id, vehicles.registration_num, vehicles.make, vehicles.model, vehicles.fuel_type, vehicles.engine_size, vehicle_groups.group_name, vehicle_groups.daily_rate, (DateDiff(@endDate, @startDate) * vehicle_groups.daily_rate) as "Total Cost" from vehicles
    inner join vehicle_groups
    on vehicles.group_id = vehicle_groups.id
    where vehicles.id not in (select vehicles.id from vehicles inner join invoices  on vehicles.id = invoices.vehicle_id where (hire_start between @startDate AND @endDate ) OR (hire_end  between @startDate and @endDate) group by vehicles.id);End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `book_hire_vehicle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `book_hire_vehicle`(in reg char(8), in startDate date, in endDate date, in username varchar(20))
BEGIN
		Declare userID INT;
        Declare startMileage INT;
        Declare vehicleID INT;
        Declare totalHireCost Decimal;
        SET userID = (Select id from users where uname = username);
        SET startMileage = (select mileage from vehicles where registration_num = reg);
        SET vehicleID = (select id from vehicles where registration_num = reg);
		SET totalHireCost = sum(DateDIFF(end_date, start_date) * (select daily_rate from vehicle_groups inner join vehicle on vehicle.group_id = vehicle_groups.id));
        insert into invoices
		values (null, userID, vehicleID, startDate, endDate, totalHireCost, startMileage, null, true, null);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `checkout_vehicle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `checkout_vehicle`(in invoiceID int(5), in username varchar(20))
BEGIN
	Declare userID INT;
    Declare vehicleID INT;
    SET userID = (Select id from users where uname = username);
    SET vehicleID = (Select vehicles.id from vehicles inner join invoices on invoices.id = vehicles.id);
    update vehicles
    set is_on_hire = true
    where id = vehicleID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteInvoice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteInvoice`(idinput int(10))
BEGIN
	delete from invoices where id = idinput;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_payment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_payment`(payid int(5))
BEGIN
	DELETE FROM payment_info
    WHERE payid=payment_info.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_invoice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_invoice`(in invoice_id int(10))
BEGIN
	SELECT * FROM full_invoice_info
    WHERE full_invoice_info.id  = invoice_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_vehicle_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_vehicle_details`(regnum char(8))
BEGIN
	SELECT vehicles.registration_num, vehicles.make, vehicles.model , vehicles.fuel_type, vehicles.engine_size, vehicle_groups.group_name FROM vehicles
    inner join vehicle_groups
    on vehicle.group_id=vehicle_group.id
    WHERE vehicles.registration_num=regnum;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `hires_by_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `hires_by_user`(in userID int(4))
begin
	Select invoices.id, vehicles.registration_num, vehicles.make, vehicles.model, vehicles.fuel_type, vehicles.engine_size , 
    invoices.hire_start, invoices.hire_end from invoices
    inner join vehicles
    on invoices.id = vehicles.id
    where invoices.user_id = userID;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertCustomer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertCustomer`(uname varchar(22),pword varchar(16),staff tinyint(1),fname varchar(25),lname varchar(25),dob date,al1 varchar(50),al2 varchar(50),city varchar(25), postcode varchar(9),cnumber varchar(15),email varchar(30),dln varchar(50),expiredate date)
BEGIN
insert into customer
values(null,uname,pword,staff,fname,lname,dob,al1,al2,city,postcode,cnumber,email,dln,expiredate);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertInvoice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertInvoice`(custid int(5), vehid int(5), hirestart date, hireend date, cost decimal(4,2), mileagestart int(6), mileageend int(6), outstanding tinyint(1), paymentid int(5))
BEGIN
	insert into invoices
	values(null,custid,vehid,hirestart,hireend,cost,mileagestart,mileageend,outstanding,paymentid);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertPaymentInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertPaymentInfo`(custid int(5),cardtypeid int(5),cardnum varchar(20),cardexpire int(4),cardauth int(3))
BEGIN
	insert into payment_info
	values(null,custid,cardtypeid,cardnum,cardexpire,cardauth);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `list_customer_invoices` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `list_customer_invoices`(cusid int)
BEGIN
	SELECT * FROM full_invoice_info 
    WHERE cusid = (select customer.id from customer where customer.fname = full_invoice_info.fname AND customer.lname = full_invoice_info.lname AND customer.postcode = full_invoice_info.postcode);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `list_vehicle_groups` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `list_vehicle_groups`()
BEGIN
	
	SELECT id,group_name FROM vehicle_groups;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `retrieve_customer_history` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `retrieve_customer_history`(in userid int(5))
begin
	select invoices.id, vehicles.registration_num, vehicles.make, vehicles.model, invoices.hire_start, invoices.hire_end, invoices.mileage_start, invoices.mileage_end from invoices
    inner join vehicles
	on invoices.vehicle_id = vehicles.id
    where invoices.user_id = userid;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `retrieve_vehicle_service_records` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `retrieve_vehicle_service_records`(in regNum varchar(9))
begin
	select vehicles.registration_num, vehicles.make, vehicles.model, service_records.service_number, service_records.description, service_records.mileage_at_service from vehicles
    inner join service_records
    on vehicles.vehicle_id = service_records.vehicle_id
    where vehicles.registration_num = regNum;
    end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `return_vehicle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `return_vehicle`(in vehicleRegistration varchar(9))
BEGIN
	Declare vehicleID INT;
    SET vehicleID = (Select vehicles.id  from vehicles inner join invoices on vehicles.id = invoices.id where vehicles.registration_num = vehicleRegistration);
    update vehicles
    set is_on_hire = false
    where id = vehicleID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateCarAsHired` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateCarAsHired`(reg char(8))
BEGIN
	update vehicles set is_on_hire = 1 where registration_num = reg;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateCustomerDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateCustomerDetails`(idinput int(5), un varchar(22),pw varchar(16),staff tinyint(1),fn varchar(25),ln varchar(25),dob date,al1 varchar(50),al2 varchar(50),cityinput varchar(25), pcode varchar(9),cnumber varchar(15),email varchar(30),dln varchar(50),expiredate date)
BEGIN
	update customer
	set
	uname = un,
	pword = pw,
	is_staff = staff,
	fname = fn,
	lname = ln,
	date_of_birth = dob,
	address_line_1 = al1,
	address_line_2 = al2,
	city = cityinput,
	postcode = pcode,
	contact_number = cnumber,
	email_address = email,
	driving_licence_number = dln,
	licence_expiration = expiredate
	where id = idinput;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdatePaymentInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdatePaymentInfo`(idinput int(5), cardtypeid int(5), cardnum varchar(20), cardexpire int(4), cardauth int(3))
BEGIN
	update payment_info
	set
	card_type_id = cardtypeid,
	card_num = cardnum,
	card_expire = cardexpire,
	card_auth = cardauth
	where id = idinput;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `full_invoice_info`
--

/*!50001 DROP VIEW IF EXISTS `full_invoice_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `full_invoice_info` AS select `invoices`.`id` AS `id`,`customer`.`fname` AS `fname`,`customer`.`lname` AS `lname`,`customer`.`address_line_1` AS `address_line_1`,`customer`.`address_line_2` AS `address_line_2`,`customer`.`city` AS `city`,`customer`.`postcode` AS `postcode`,`invoices`.`hire_start` AS `hire_start`,`invoices`.`hire_end` AS `hire_end`,`vehicles`.`registration_num` AS `registration_num`,`vehicles`.`make` AS `make`,`vehicles`.`model` AS `model`,`vehicles`.`fuel_type` AS `fuel_type`,`vehicles`.`engine_size` AS `engine_size`,`vehicle_groups`.`group_name` AS `group_name`,`vehicle_groups`.`daily_rate` AS `daily_rate`,(to_days(`invoices`.`hire_end`) - to_days(`invoices`.`hire_start`)) AS `num_of_days`,((to_days(`invoices`.`hire_end`) - to_days(`invoices`.`hire_start`)) * `invoices`.`total_cost`) AS `total_cost` from (((`customer` join `invoices` on((`customer`.`id` = `invoices`.`customer_id`))) join `vehicles` on((`invoices`.`vehicle_id` = `vehicles`.`id`))) join `vehicle_groups` on((`vehicles`.`group_id` = `vehicle_groups`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vehicles_currently_available`
--

/*!50001 DROP VIEW IF EXISTS `vehicles_currently_available`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vehicles_currently_available` AS select `vehicles`.`registration_num` AS `registration_num`,`vehicles`.`make` AS `make`,`vehicles`.`model` AS `model`,`vehicles`.`fuel_type` AS `fuel_type`,`vehicles`.`engine_size` AS `engine_size`,`vehicles`.`group_id` AS `group_id`,`vehicle_groups`.`group_name` AS `group_name`,`vehicle_groups`.`daily_rate` AS `daily_rate` from (`vehicles` join `vehicle_groups` on((`vehicles`.`group_id` = `vehicle_groups`.`id`))) where (`vehicles`.`is_on_hire` = 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vehicles_currently_on_hire`
--

/*!50001 DROP VIEW IF EXISTS `vehicles_currently_on_hire`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vehicles_currently_on_hire` AS select `vehicles`.`registration_num` AS `registration_num`,`vehicles`.`make` AS `make`,`vehicles`.`model` AS `model`,`vehicles`.`fuel_type` AS `fuel_type`,`vehicles`.`engine_size` AS `engine_size`,`vehicle_groups`.`group_name` AS `group_name` from (`vehicles` join `vehicle_groups` on((`vehicles`.`group_id` = `vehicle_groups`.`id`))) where (`vehicles`.`is_on_hire` = 1) */;
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

-- Dump completed on 2015-06-12 14:54:38
