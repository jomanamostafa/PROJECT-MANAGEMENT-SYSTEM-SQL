CREATE DATABASE  IF NOT EXISTS `project_management_system` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `project_management_system`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: project_management_system
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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (22,'administration'),(28,'ai'),(15,'analytics'),(13,'cloud'),(19,'consulting'),(16,'creative'),(12,'customer service'),(27,'data science'),(6,'design'),(7,'development'),(1,'finance'),(4,'hr'),(20,'innovation'),(23,'legal'),(17,'logistics'),(30,'management'),(2,'marketing'),(14,'mobile'),(9,'operations'),(24,'planning'),(26,'product'),(8,'qa'),(29,'reporting'),(25,'research'),(3,'sales'),(10,'security'),(21,'strategy'),(5,'support'),(18,'testing'),(11,'training');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `client_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `client_name` varchar(100) NOT NULL,
  PRIMARY KEY (`client_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Ahmed','Ali','1990-05-12','01012345678','ahmed.ali@gmail.com','Cairo, Nasr City','Ahmed Ali'),(2,'Mohamed','Hassan','1985-03-20','01198765432','mohamed.hassan@yahoo.com','Giza, Dokki','Mohamed Hassan'),(3,'Fatma','Ibrahim','1992-07-15','01234567890','fatma.ibrahim@gmail.com','Alexandria, Smouha','Fatma Ibrahim'),(4,'Youssef','Mahmoud','1988-11-02','01567891234','youssef.mahmoud@hotmail.com','Cairo, Maadi','Youssef Mahmoud'),(5,'Mariam','Saleh','1995-01-25','01087654321','mariam.saleh@gmail.com','Giza, Haram','Mariam Saleh'),(6,'Omar','Mostafa','1987-09-10','01122334455','omar.mostafa@gmail.com','Cairo, Heliopolis','Omar Mostafa'),(7,'Sara','Khaled','1993-04-18','01299887766','sara.khaled@yahoo.com','Alexandria, Montaza','Sara Khaled'),(8,'Hossam','Fathy','1989-12-05','01511223344','hossam.fathy@gmail.com','Cairo, Downtown','Hossam Fathy'),(9,'Nour','Adel','1994-06-30','01033445566','nour.adel@gmail.com','Giza, Mohandessin','Nour Adel'),(10,'Aya','Samir','1991-08-22','01155667788','aya.samir@gmail.com','Cairo, Shoubra','Aya Samir'),(11,'Karim','Farouk','1986-02-14','01266778899','karim.farouk@gmail.com','Alexandria, Sporting','Karim Farouk'),(12,'Laila','Hamed','1990-10-01','01544556677','laila.hamed@gmail.com','Cairo, Garden City','Laila Hamed'),(13,'Mostafa','Gamal','1984-07-19','01077889900','mostafa.gamal@gmail.com','Giza, Faisal','Mostafa Gamal'),(14,'Salma','Nasser','1996-12-12','01188990011','salma.nasser@gmail.com','Cairo, Mokattam','Salma Nasser'),(15,'Mahmoud','Said','1983-03-03','01299001122','mahmoud.said@gmail.com','Alexandria, Agami','Mahmoud Said'),(16,'Hana','Reda','1997-09-09','01522334455','hana.reda@gmail.com','Cairo, New Cairo','Hana Reda'),(17,'Tamer','Lotfy','1982-11-11','01044556677','tamer.lotfy@gmail.com','Giza, Imbaba','Tamer Lotfy'),(18,'Dina','Ashraf','1995-05-05','01166778899','dina.ashraf@gmail.com','Cairo, Zamalek','Dina Ashraf'),(19,'Ali','Younes','1989-01-01','01277889900','ali.younes@gmail.com','Alexandria, Raml','Ali Younes'),(20,'Reem','Hussein','1994-04-04','01588990011','reem.hussein@gmail.com','Cairo, Nasr City','Reem Hussein'),(21,'Khaled','Amer','1987-07-07','01099001122','khaled.amer@gmail.com','Giza, Haram','Khaled Amer'),(22,'Nadia','Lotfi','1992-02-02','01122334455','nadia.lotfi@gmail.com','Cairo, Downtown','Nadia Lotfi'),(23,'Sherif','Mansour','1986-06-06','01233445566','sherif.mansour@gmail.com','Alexandria, Smouha','Sherif Mansour'),(24,'Heba','Ali','1993-03-03','01544556677','heba.ali@gmail.com','Cairo, Maadi','Heba Ali'),(25,'Adel','Fouad','1985-08-08','01055667788','adel.fouad@gmail.com','Giza, Dokki','Adel Fouad'),(26,'Manar','Kamal','1991-09-09','01166778899','manar.kamal@gmail.com','Cairo, Mokattam','Manar Kamal'),(27,'Ibrahim','Salem','1984-12-12','01277889900','ibrahim.salem@gmail.com','Alexandria, Montaza','Ibrahim Salem'),(28,'Rania','Farid','1996-01-01','01588990011','rania.farid@gmail.com','Cairo, New Cairo','Rania Farid'),(29,'Samy','Hassan','1988-05-05','01099001122','samy.hassan@gmail.com','Giza, Mohandessin','Samy Hassan'),(30,'Nahla','Mostafa','1992-07-07','01122334455','nahla.mostafa@gmail.com','Cairo, Shoubra','Nahla Mostafa');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deadlines`
--

DROP TABLE IF EXISTS `deadlines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deadlines` (
  `deadline_id` int NOT NULL AUTO_INCREMENT,
  `project_id` int DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`deadline_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `deadlines_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`),
  CONSTRAINT `chk_deadline_dates` CHECK ((`end_date` > `start_date`))
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deadlines`
--

LOCK TABLES `deadlines` WRITE;
/*!40000 ALTER TABLE `deadlines` DISABLE KEYS */;
INSERT INTO `deadlines` VALUES (1,1,'2023-01-01','2023-06-01'),(2,2,'2023-02-15','2023-08-15'),(3,3,'2023-03-10','2023-09-10'),(4,4,'2023-04-05','2023-10-05'),(5,5,'2023-05-20','2023-11-20'),(6,6,'2023-06-01','2023-12-01'),(7,7,'2023-07-15','2024-01-15'),(8,8,'2023-08-10','2024-02-10'),(9,9,'2023-09-05','2024-03-05'),(10,10,'2023-10-01','2024-04-01'),(11,11,'2023-11-12','2024-05-12'),(12,12,'2023-12-20','2024-06-20'),(13,13,'2024-01-15','2024-07-15'),(14,14,'2024-02-10','2024-08-10'),(15,15,'2024-03-05','2024-09-05'),(16,16,'2024-04-01','2024-10-01'),(17,17,'2024-05-12','2024-11-12'),(18,18,'2024-06-20','2024-12-20'),(19,19,'2024-07-15','2025-01-15'),(20,20,'2024-08-10','2025-02-10'),(21,21,'2024-09-05','2025-03-05'),(22,22,'2024-10-01','2025-04-01'),(23,23,'2024-11-12','2025-05-12'),(24,24,'2024-12-20','2025-06-20'),(25,25,'2025-01-15','2025-07-15'),(26,26,'2025-02-10','2025-08-10'),(27,27,'2025-03-05','2025-09-05'),(28,28,'2025-04-01','2025-10-01'),(29,29,'2025-05-12','2025-11-12'),(30,30,'2025-06-20','2025-12-20');
/*!40000 ALTER TABLE `deadlines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `team_id` int NOT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `team_id` (`team_id`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'ahmed','ali','1990-05-12',1),(2,'mohamed','hassan','1985-03-20',2),(3,'fatma','ibrahim','1992-07-15',3),(4,'youssef','mahmoud','1988-11-02',4),(5,'mariam','saleh','1995-01-25',5),(6,'omar','mostafa','1987-09-10',6),(7,'sara','khaled','1993-04-18',7),(8,'hossam','fathy','1989-12-05',8),(9,'nour','adel','1994-06-30',9),(10,'aya','samir','1991-08-22',10),(11,'karim','farouk','1986-02-14',11),(12,'laila','hamed','1990-10-01',12),(13,'mostafa','gamal','1984-07-19',13),(14,'salma','nasser','1996-12-12',14),(15,'mahmoud','said','1983-03-03',15),(16,'hana','reda','1997-09-09',16),(17,'tamer','lotfy','1982-11-11',17),(18,'dina','ashraf','1995-05-05',18),(19,'ali','younes','1989-01-01',19),(20,'reem','hussein','1994-04-04',20),(21,'khaled','amer','1987-07-07',21),(22,'nadia','lotfi','1992-02-02',22),(23,'sherif','mansour','1986-06-06',23),(24,'heba','ali','1993-03-03',24),(25,'adel','fouad','1985-08-08',25),(26,'manar','kamal','1991-09-09',26),(27,'ibrahim','salem','1984-12-12',27),(28,'rania','farid','1996-01-01',28),(29,'samy','hassan','1988-05-05',29),(30,'nahla','mostafa','1992-07-07',30);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `report_id` int NOT NULL,
  `deadline_id` int NOT NULL,
  `log_date` date NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`log_id`),
  KEY `report_id` (`report_id`),
  KEY `deadline_id` (`deadline_id`),
  CONSTRAINT `logs_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `reports` (`report_id`),
  CONSTRAINT `logs_ibfk_2` FOREIGN KEY (`deadline_id`) REFERENCES `deadlines` (`deadline_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES (1,1,1,'2023-01-12','initial sales report logged'),(2,2,2,'2023-02-18','project update report logged'),(3,3,3,'2023-03-22','financial summary logged'),(4,4,4,'2023-04-27','marketing campaign report logged'),(5,5,5,'2023-05-31','client feedback logged'),(6,6,6,'2023-06-07','bug report logged'),(7,7,7,'2023-07-12','training evaluation logged'),(8,8,8,'2023-08-17','annual performance logged'),(9,9,9,'2023-09-22','support tickets logged'),(10,10,10,'2023-10-27','security audit logged'),(11,11,11,'2023-11-15','budget allocation logged'),(12,12,12,'2023-12-22','customer satisfaction logged'),(13,13,13,'2024-01-12','cloud migration logged'),(14,14,14,'2024-02-18','mobile app testing logged'),(15,15,15,'2024-03-22','financial forecast logged'),(16,16,16,'2024-04-27','marketing strategy logged'),(17,17,17,'2024-05-31','client meeting logged'),(18,18,18,'2024-06-07','technical upgrade logged'),(19,19,19,'2024-07-12','employee performance logged'),(20,20,20,'2024-08-17','sales growth logged'),(21,21,21,'2024-09-22','ux feedback logged'),(22,22,22,'2024-10-27','admin operations logged'),(23,23,23,'2024-11-15','innovation project logged'),(24,24,24,'2024-12-22','consulting summary logged'),(25,25,25,'2025-01-12','hr policy logged'),(26,26,26,'2025-02-18','devops pipeline logged'),(27,27,27,'2025-03-22','strategy planning logged'),(28,28,28,'2025-04-27','ai demo logged'),(29,29,29,'2025-05-31','data science workshop logged'),(30,30,30,'2025-06-07','final project closure logged');
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings`
--

DROP TABLE IF EXISTS `meetings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meetings` (
  `meeting_id` int NOT NULL AUTO_INCREMENT,
  `subject` varchar(100) NOT NULL,
  `meeting_date` date NOT NULL,
  `employee_id` int NOT NULL,
  PRIMARY KEY (`meeting_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `meetings_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings`
--

LOCK TABLES `meetings` WRITE;
/*!40000 ALTER TABLE `meetings` DISABLE KEYS */;
INSERT INTO `meetings` VALUES (1,'project kickoff','2023-01-05',1),(2,'design review','2023-02-10',2),(3,'client update','2023-03-15',3),(4,'budget discussion','2023-04-20',4),(5,'marketing strategy','2023-05-25',5),(6,'team sync','2023-06-30',6),(7,'qa planning','2023-07-10',7),(8,'sales pitch','2023-08-15',8),(9,'support training','2023-09-20',9),(10,'product demo','2023-10-25',10),(11,'security briefing','2023-11-30',11),(12,'hr onboarding','2023-12-05',12),(13,'finance report','2024-01-10',13),(14,'cloud migration','2024-02-15',14),(15,'mobile app demo','2024-03-20',15),(16,'analytics workshop','2024-04-25',16),(17,'creative brainstorming','2024-05-30',17),(18,'logistics planning','2024-06-05',18),(19,'testing results','2024-07-10',19),(20,'client feedback','2024-08-15',20),(21,'invoice review','2024-09-20',21),(22,'ux design session','2024-10-25',22),(23,'admin updates','2024-11-30',23),(24,'innovation ideas','2024-12-05',24),(25,'consulting call','2025-01-10',25),(26,'hr policy review','2025-02-15',26),(27,'devops sync','2025-03-20',27),(28,'strategy planning','2025-04-25',28),(29,'ai project demo','2025-05-30',29),(30,'data science workshop','2025-06-05',30);
/*!40000 ALTER TABLE `meetings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `message_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `client_id` int NOT NULL,
  `content` varchar(500) NOT NULL,
  `sent_date` date NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `employee_id` (`employee_id`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`),
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,1,1,'hello ahmed, project kickoff scheduled','2023-01-06'),(2,2,2,'mohamed, please review design draft','2023-02-12'),(3,3,3,'fatma, financial report shared','2023-03-18'),(4,4,4,'youssef, proposal ready for client','2023-04-22'),(5,5,5,'mariam, mobile app login tested','2023-05-28'),(6,6,6,'omar, payment gateway integration update','2023-06-15'),(7,7,7,'sara, marketing plan draft attached','2023-07-20'),(8,8,8,'hossam, flyer design completed','2023-08-25'),(9,9,9,'nour, email server configured','2023-09-10'),(10,10,10,'aya, social media ads live','2023-10-03'),(11,11,11,'karim, user manual draft ready','2023-11-16'),(12,12,12,'laila, dashboard ui shared','2023-12-21'),(13,13,13,'mostafa, api endpoints deployed','2024-01-18'),(14,14,14,'salma, mobile app testing results','2024-02-22'),(15,15,15,'mahmoud, q2 forecast attached','2024-03-19'),(16,16,16,'hana, project timeline updated','2024-04-23'),(17,17,17,'tamer, brochure design completed','2024-05-29'),(18,18,18,'dina, cloud hosting setup done','2024-06-06'),(19,19,19,'ali, chat module deployed','2024-07-14'),(20,20,20,'reem, security features tested','2024-08-18'),(21,21,21,'khaled, presentation slides ready','2024-09-24'),(22,22,22,'nadia, invoice template shared','2024-10-28'),(23,23,23,'sherif, reporting module completed','2024-11-17'),(24,24,24,'heba, backup system tested','2024-12-23'),(25,25,25,'adel, landing page live','2025-01-19'),(26,26,26,'manar, hr documents prepared','2025-02-24'),(27,27,27,'ibrahim, newsletter design finished','2025-03-28'),(28,28,28,'rania, analytics module deployed','2025-04-30'),(29,29,29,'samy, registration module tested','2025-05-14'),(30,30,30,'nahla, final project report shared','2025-06-22');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `client_id` int DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `deposit` decimal(10,2) NOT NULL,
  `payment_date` date NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`),
  CONSTRAINT `chk_payment_amount` CHECK ((`amount` >= `deposit`))
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,1,5000.00,1000.00,'2023-01-15'),(2,2,7500.00,2000.00,'2023-02-20'),(3,3,6200.00,1500.00,'2023-03-25'),(4,4,8000.00,2500.00,'2023-04-30'),(5,5,4500.00,1000.00,'2023-05-10'),(6,6,9000.00,3000.00,'2023-06-18'),(7,7,7000.00,2000.00,'2023-07-22'),(8,8,6500.00,1500.00,'2023-08-28'),(9,9,7200.00,1800.00,'2023-09-12'),(10,10,8100.00,2500.00,'2023-10-05'),(11,11,5600.00,1200.00,'2023-11-14'),(12,12,9400.00,3000.00,'2023-12-20'),(13,13,8800.00,2800.00,'2024-01-16'),(14,14,7700.00,2000.00,'2024-02-22'),(15,15,6900.00,1500.00,'2024-03-18'),(16,16,8200.00,2500.00,'2024-04-25'),(17,17,9300.00,3000.00,'2024-05-30'),(18,18,6100.00,1200.00,'2024-06-12'),(19,19,7500.00,2000.00,'2024-07-19'),(20,20,6800.00,1500.00,'2024-08-23'),(21,21,8400.00,2500.00,'2024-09-28'),(22,22,9200.00,3000.00,'2024-10-10'),(23,23,5700.00,1200.00,'2024-11-15'),(24,24,9600.00,3200.00,'2024-12-20'),(25,25,8900.00,2800.00,'2025-01-14'),(26,26,7700.00,2000.00,'2025-02-18'),(27,27,6500.00,1500.00,'2025-03-22'),(28,28,8100.00,2500.00,'2025-04-26'),(29,29,9400.00,3000.00,'2025-05-30'),(30,30,7000.00,2000.00,'2025-06-15');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects` (
  `project_id` int NOT NULL AUTO_INCREMENT,
  `client_id` int DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`project_id`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`),
  CONSTRAINT `chk_project_dates` CHECK ((`end_date` > `start_date`))
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,1,'2023-01-01','2023-06-01','completed'),(2,2,'2023-02-15','2023-08-15','completed'),(3,3,'2023-03-10','2023-09-10','in progress'),(4,4,'2023-04-05','2023-10-05','in progress'),(5,5,'2023-05-20','2023-11-20','completed'),(6,6,'2023-06-01','2023-12-01','pending'),(7,7,'2023-07-15','2024-01-15','in progress'),(8,8,'2023-08-10','2024-02-10','completed'),(9,9,'2023-09-05','2024-03-05','pending'),(10,10,'2023-10-01','2024-04-01','in progress'),(11,11,'2023-11-12','2024-05-12','completed'),(12,12,'2023-12-20','2024-06-20','pending'),(13,13,'2024-01-15','2024-07-15','in progress'),(14,14,'2024-02-10','2024-08-10','completed'),(15,15,'2024-03-05','2024-09-05','pending'),(16,16,'2024-04-01','2024-10-01','in progress'),(17,17,'2024-05-12','2024-11-12','completed'),(18,18,'2024-06-20','2024-12-20','pending'),(19,19,'2024-07-15','2025-01-15','in progress'),(20,20,'2024-08-10','2025-02-10','completed'),(21,21,'2024-09-05','2025-03-05','pending'),(22,22,'2024-10-01','2025-04-01','in progress'),(23,23,'2024-11-12','2025-05-12','completed'),(24,24,'2024-12-20','2025-06-20','pending'),(25,25,'2025-01-15','2025-07-15','in progress'),(26,26,'2025-02-10','2025-08-10','completed'),(27,27,'2025-03-05','2025-09-05','pending'),(28,28,'2025-04-01','2025-10-01','in progress'),(29,29,'2025-05-12','2025-11-12','completed'),(30,30,'2025-06-20','2025-12-20','pending');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reports` (
  `report_id` int NOT NULL AUTO_INCREMENT,
  `report_date` date NOT NULL,
  `content` text NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
INSERT INTO `reports` VALUES (1,'2023-01-10','monthly sales report for cairo branch',1),(2,'2023-02-15','project status update for alexandria office',2),(3,'2023-03-20','financial summary for q1',3),(4,'2023-04-25','marketing campaign results in giza',4),(5,'2023-05-30','client feedback report nasr city',5),(6,'2023-06-05','technical bug report for mobile app',6),(7,'2023-07-10','training evaluation report for hr team',7),(8,'2023-08-15','annual performance review summary',8),(9,'2023-09-20','support tickets analysis report',9),(10,'2023-10-25','security audit report for servers',10),(11,'2023-11-30','budget allocation report for projects',11),(12,'2023-12-05','customer satisfaction survey results',12),(13,'2024-01-10','cloud migration progress report',13),(14,'2024-02-15','mobile app testing report',14),(15,'2024-03-20','financial forecast for q2',15),(16,'2024-04-25','marketing strategy evaluation',16),(17,'2024-05-30','client meeting summary report',17),(18,'2024-06-05','technical upgrade report',18),(19,'2024-07-10','employee performance report',19),(20,'2024-08-15','sales growth analysis report',20),(21,'2024-09-20','ux design feedback report',21),(22,'2024-10-25','admin operations report',22),(23,'2024-11-30','innovation project report',23),(24,'2024-12-05','consulting engagement summary',24),(25,'2025-01-10','hr policy changes report',25),(26,'2025-02-15','devops pipeline status report',26),(27,'2025-03-20','strategy planning report',27),(28,'2025-04-25','ai project demo report',28),(29,'2025-05-30','data science workshop summary',29),(30,'2025-06-05','final project closure report',30);
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks` (
  `task_id` int NOT NULL AUTO_INCREMENT,
  `project_id` int DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_due` date NOT NULL,
  PRIMARY KEY (`task_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`),
  CONSTRAINT `chk_task_dates` CHECK ((`end_due` > `start_date`))
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (1,1,'design company logo','2023-01-02','2023-01-20'),(2,2,'setup database schema','2023-02-16','2023-03-01'),(3,3,'create website homepage','2023-03-11','2023-03-25'),(4,4,'write project proposal','2023-04-06','2023-04-15'),(5,5,'develop mobile app login','2023-05-21','2023-06-05'),(6,6,'test payment gateway','2023-06-02','2023-06-18'),(7,7,'prepare marketing plan','2023-07-16','2023-07-30'),(8,8,'design flyer for event','2023-08-11','2023-08-20'),(9,9,'setup email server','2023-09-06','2023-09-15'),(10,10,'create social media ads','2023-10-02','2023-10-12'),(11,11,'write user manual','2023-11-13','2023-11-25'),(12,12,'design dashboard UI','2023-12-21','2024-01-05'),(13,13,'develop api endpoints','2024-01-16','2024-01-30'),(14,14,'test mobile app features','2024-02-11','2024-02-25'),(15,15,'prepare financial report','2024-03-06','2024-03-20'),(16,16,'create project timeline','2024-04-02','2024-04-12'),(17,17,'design company brochure','2024-05-13','2024-05-25'),(18,18,'setup cloud hosting','2024-06-21','2024-07-05'),(19,19,'develop chat module','2024-07-16','2024-07-30'),(20,20,'test security features','2024-08-11','2024-08-25'),(21,21,'prepare client presentation','2024-09-06','2024-09-15'),(22,22,'design invoice template','2024-10-02','2024-10-12'),(23,23,'develop reporting module','2024-11-13','2024-11-25'),(24,24,'test backup system','2024-12-21','2025-01-05'),(25,25,'create landing page','2025-01-16','2025-01-30'),(26,26,'prepare HR documents','2025-02-11','2025-02-25'),(27,27,'design email newsletter','2025-03-06','2025-03-20'),(28,28,'develop analytics module','2025-04-02','2025-04-15'),(29,29,'test user registration','2025-05-13','2025-05-25'),(30,30,'prepare final project report','2025-06-21','2025-07-05');
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `team_id` int NOT NULL AUTO_INCREMENT,
  `team_name` varchar(100) NOT NULL,
  PRIMARY KEY (`team_id`),
  UNIQUE KEY `team_name` (`team_name`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (19,'agami logistics team'),(26,'alexandria hr team'),(2,'alexandria marketing team'),(30,'cairo data science team'),(1,'cairo dev team'),(23,'dokki admin team'),(6,'dokki hr team'),(22,'downtown ux team'),(11,'faisal product team'),(13,'garden city analytics team'),(27,'giza devops team'),(3,'giza sales team'),(20,'haram testing team'),(7,'heliopolis finance team'),(17,'imbaba security team'),(5,'maadi design team'),(24,'maadi innovation team'),(9,'mohandessin qa team'),(14,'mokattam cloud team'),(28,'mokattam strategy team'),(12,'montaza mobile team'),(25,'nasr city consulting team'),(4,'nasr city support team'),(29,'new cairo ai team'),(16,'new cairo frontend team'),(15,'raml backend team'),(10,'shoubra operations team'),(8,'smouha research team'),(21,'sporting ui team'),(18,'zamalek creative team');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'project_management_system'
--

--
-- Dumping routines for database 'project_management_system'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-15 21:53:06
