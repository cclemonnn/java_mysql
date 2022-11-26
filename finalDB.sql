-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: final_project
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
-- Table structure for table `administrators`
--

DROP TABLE IF EXISTS `administrators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrators` (
  `admin_id` varchar(20) NOT NULL,
  `category` varchar(20) NOT NULL,
  `employee_id` varchar(20) NOT NULL,
  PRIMARY KEY (`admin_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `administrators_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrators`
--

LOCK TABLES `administrators` WRITE;
/*!40000 ALTER TABLE `administrators` DISABLE KEYS */;
INSERT INTO `administrators` VALUES ('a1','administrator','e8'),('a2','administrator','e9');
/*!40000 ALTER TABLE `administrators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admission_diagnosis`
--

DROP TABLE IF EXISTS `admission_diagnosis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admission_diagnosis` (
  `admission_id` varchar(20) NOT NULL,
  `admission_date` date NOT NULL,
  `init_diagnosis` varchar(100) NOT NULL,
  PRIMARY KEY (`admission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admission_diagnosis`
--

LOCK TABLES `admission_diagnosis` WRITE;
/*!40000 ALTER TABLE `admission_diagnosis` DISABLE KEYS */;
INSERT INTO `admission_diagnosis` VALUES ('admission1','2022-10-01','good'),('admission10','2022-03-01','good'),('admission2','2022-10-02','bad'),('admission3','2022-10-03','mediocre'),('admission4','2022-10-04','good'),('admission5','2022-10-05','bad'),('admission6','2022-09-05','good'),('admission7','2022-08-07','mediocre'),('admission8','2022-09-20','good'),('admission9','2022-01-01','bad');
/*!40000 ALTER TABLE `admission_diagnosis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admitted_patients`
--

DROP TABLE IF EXISTS `admitted_patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admitted_patients` (
  `patient_id` varchar(20) NOT NULL,
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `admitted_patients_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admitted_patients`
--

LOCK TABLES `admitted_patients` WRITE;
/*!40000 ALTER TABLE `admitted_patients` DISABLE KEYS */;
INSERT INTO `admitted_patients` VALUES ('p1'),('p2'),('p3'),('p4'),('p5');
/*!40000 ALTER TABLE `admitted_patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assigned_doctors`
--

DROP TABLE IF EXISTS `assigned_doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assigned_doctors` (
  `assignment_id` varchar(20) NOT NULL,
  `doctor_id` varchar(20) NOT NULL,
  `patient_id` varchar(20) NOT NULL,
  `admission_id` varchar(20) NOT NULL,
  PRIMARY KEY (`assignment_id`),
  KEY `doctor_id` (`doctor_id`),
  KEY `patient_id` (`patient_id`),
  KEY `admission_id` (`admission_id`),
  CONSTRAINT `assigned_doctors_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`),
  CONSTRAINT `assigned_doctors_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`),
  CONSTRAINT `assigned_doctors_ibfk_3` FOREIGN KEY (`admission_id`) REFERENCES `admission_diagnosis` (`admission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assigned_doctors`
--

LOCK TABLES `assigned_doctors` WRITE;
/*!40000 ALTER TABLE `assigned_doctors` DISABLE KEYS */;
INSERT INTO `assigned_doctors` VALUES ('assign1','d1','p2','admission2'),('assign10','d1','p1','admission1'),('assign2','d1','p3','admission3'),('assign3','d2','p1','admission1'),('assign4','d3','p5','admission5'),('assign5','d1','p5','admission5'),('assign6','d2','p6','admission6'),('assign7','d2','p7','admission7'),('assign8','d2','p7','admission8'),('assign9','d1','p4','admission4');
/*!40000 ALTER TABLE `assigned_doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnosis`
--

DROP TABLE IF EXISTS `diagnosis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnosis` (
  `diag_id` varchar(20) NOT NULL,
  `diag_name` varchar(50) NOT NULL,
  PRIMARY KEY (`diag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnosis`
--

LOCK TABLES `diagnosis` WRITE;
/*!40000 ALTER TABLE `diagnosis` DISABLE KEYS */;
INSERT INTO `diagnosis` VALUES ('diag1','Problem-focused diagnosis'),('diag2','Risk nursing diagnosis'),('diag3','Health promotion diagnosis'),('diag4','Syndrome diagnosis');
/*!40000 ALTER TABLE `diagnosis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discharge`
--

DROP TABLE IF EXISTS `discharge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discharge` (
  `admin_id` varchar(20) NOT NULL,
  `patient_id` varchar(20) NOT NULL,
  `discharge_time` datetime NOT NULL,
  `admission_id` varchar(20) NOT NULL,
  KEY `admin_id` (`admin_id`),
  KEY `patient_id` (`patient_id`),
  KEY `admission_id` (`admission_id`),
  CONSTRAINT `discharge_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `administrators` (`admin_id`),
  CONSTRAINT `discharge_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`),
  CONSTRAINT `discharge_ibfk_3` FOREIGN KEY (`admission_id`) REFERENCES `admission_diagnosis` (`admission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discharge`
--

LOCK TABLES `discharge` WRITE;
/*!40000 ALTER TABLE `discharge` DISABLE KEYS */;
INSERT INTO `discharge` VALUES ('a1','p6','2022-10-08 00:00:01','admission6'),('a2','p7','2022-09-08 00:00:01','admission7'),('a1','p7','2022-10-08 00:00:01','admission8'),('a1','p7','2022-02-01 00:00:01','admission9'),('a2','p7','2022-04-01 00:00:01','admission10');
/*!40000 ALTER TABLE `discharge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctors` (
  `doctor_id` varchar(20) NOT NULL,
  `category` varchar(20) NOT NULL,
  `employee_id` varchar(20) NOT NULL,
  PRIMARY KEY (`doctor_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `doctors_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES ('d1','doctor','e1'),('d2','doctor','e2'),('d3','doctor','e3');
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `employee_id` varchar(20) NOT NULL,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `contact` varchar(20) NOT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES ('e1','John','Doe','7319 Richardson St.\nMunster, IN 46321','5020001001'),('e10','Marry','Williams','7 Sierra Drive\nGreenfield, IN 46140','5020001010'),('e11','Oscar','Taylor','7997 Lees Creek Rd.\nVista, CA 92083','5020001011'),('e2','Olivia','Thomas','509 Henry Drive\nMetairie, LA 70001','5020001002'),('e3','Harry','Smith','8136 Joy Ridge Street\nDavison, MI 48423','5020001003'),('e4','Emily','Green','8724 Virginia St.\nMarysville, OH 43040','5020001004'),('e5','Jason','Brown','504 West Jefferson Lane\nJackson Heights, NY 11372','5020001005'),('e6','Lily','Parker','7 Essex Ave.\nConcord, NH 03301','5020001006'),('e7','Harry','Jones','188 Market Drive\nNew Albany, IN 47150','5020001007'),('e8','Lily','White','7465 St Louis Drive\nBethpage, NY 11714','5020001008'),('e9','Kevin','Davies','7034 Armstrong St.\nGermantown, MD 20874','5020001009');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nurses`
--

DROP TABLE IF EXISTS `nurses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nurses` (
  `nurse_id` varchar(20) NOT NULL,
  `category` varchar(20) NOT NULL,
  `employee_id` varchar(20) NOT NULL,
  PRIMARY KEY (`nurse_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `nurses_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nurses`
--

LOCK TABLES `nurses` WRITE;
/*!40000 ALTER TABLE `nurses` DISABLE KEYS */;
INSERT INTO `nurses` VALUES ('n1','nurse','e4'),('n2','nurse','e5');
/*!40000 ALTER TABLE `nurses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_perform_treatment`
--

DROP TABLE IF EXISTS `order_perform_treatment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_perform_treatment` (
  `assignment_id` varchar(20) NOT NULL,
  `patient_treatment_id` varchar(20) NOT NULL,
  `order_time` datetime NOT NULL,
  KEY `assignment_id` (`assignment_id`),
  KEY `patient_treatment_id` (`patient_treatment_id`),
  CONSTRAINT `order_perform_treatment_ibfk_1` FOREIGN KEY (`assignment_id`) REFERENCES `assigned_doctors` (`assignment_id`),
  CONSTRAINT `order_perform_treatment_ibfk_2` FOREIGN KEY (`patient_treatment_id`) REFERENCES `patient_treatment` (`patient_treatment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_perform_treatment`
--

LOCK TABLES `order_perform_treatment` WRITE;
/*!40000 ALTER TABLE `order_perform_treatment` DISABLE KEYS */;
INSERT INTO `order_perform_treatment` VALUES ('assign1','pt2','2022-10-07 00:00:01'),('assign2','pt3','2022-10-07 00:00:02'),('assign3','pt11','2022-10-08 00:00:01'),('assign3','pt12','2022-10-09 00:00:01'),('assign3','pt13','2022-10-10 00:00:01'),('assign9','pt4','2022-10-08 00:00:04'),('assign10','pt1','2022-10-08 00:01:01'),('assign5','pt5','2022-10-08 00:00:05');
/*!40000 ALTER TABLE `order_perform_treatment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_diagnosis`
--

DROP TABLE IF EXISTS `patient_diagnosis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_diagnosis` (
  `diag_date` date NOT NULL,
  `diag_id` varchar(20) NOT NULL,
  `doctor_id` varchar(20) NOT NULL,
  `admission_id` varchar(20) NOT NULL,
  KEY `diag_id` (`diag_id`),
  KEY `doctor_id` (`doctor_id`),
  KEY `admission_id` (`admission_id`),
  CONSTRAINT `patient_diagnosis_ibfk_1` FOREIGN KEY (`diag_id`) REFERENCES `diagnosis` (`diag_id`),
  CONSTRAINT `patient_diagnosis_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`),
  CONSTRAINT `patient_diagnosis_ibfk_3` FOREIGN KEY (`admission_id`) REFERENCES `admission_diagnosis` (`admission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_diagnosis`
--

LOCK TABLES `patient_diagnosis` WRITE;
/*!40000 ALTER TABLE `patient_diagnosis` DISABLE KEYS */;
INSERT INTO `patient_diagnosis` VALUES ('2022-10-13','diag1','d1','admission1'),('2022-10-13','diag2','d1','admission1'),('2022-10-13','diag3','d1','admission1'),('2022-10-13','diag4','d1','admission1'),('2022-10-14','diag1','d2','admission2'),('2022-10-14','diag2','d3','admission3'),('2022-10-14','diag3','d1','admission4'),('2022-10-01','diag4','d1','admission6'),('2022-10-02','diag3','d2','admission6'),('2022-10-01','diag1','d1','admission8'),('2022-10-02','diag2','d2','admission8'),('2022-10-03','diag3','d3','admission8'),('2022-09-01','diag1','d1','admission7'),('2022-01-02','diag2','d2','admission9'),('2022-03-02','diag2','d3','admission10'),('2022-03-03','diag3','d3','admission10');
/*!40000 ALTER TABLE `patient_diagnosis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_treatment`
--

DROP TABLE IF EXISTS `patient_treatment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_treatment` (
  `patient_treatment_id` varchar(20) NOT NULL,
  `patient_id` varchar(20) NOT NULL,
  `treatment_id` varchar(20) NOT NULL,
  `admission_id` varchar(20) NOT NULL,
  PRIMARY KEY (`patient_treatment_id`),
  KEY `patient_id` (`patient_id`),
  KEY `treatment_id` (`treatment_id`),
  KEY `admission_id` (`admission_id`),
  CONSTRAINT `patient_treatment_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`),
  CONSTRAINT `patient_treatment_ibfk_2` FOREIGN KEY (`treatment_id`) REFERENCES `treatments` (`treatment_id`),
  CONSTRAINT `patient_treatment_ibfk_3` FOREIGN KEY (`admission_id`) REFERENCES `admission_diagnosis` (`admission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_treatment`
--

LOCK TABLES `patient_treatment` WRITE;
/*!40000 ALTER TABLE `patient_treatment` DISABLE KEYS */;
INSERT INTO `patient_treatment` VALUES ('pt1','p1','treat1','admission1'),('pt10','p7','treat5','admission7'),('pt11','p1','treat1','admission1'),('pt12','p1','treat2','admission1'),('pt13','p1','treat3','admission1'),('pt2','p2','treat2','admission2'),('pt3','p3','treat3','admission3'),('pt4','p4','treat4','admission4'),('pt5','p5','treat5','admission5'),('pt6','p6','treat6','admission6'),('pt7','p7','treat7','admission7'),('pt8','p7','treat5','admission8'),('pt9','p7','treat3','admission8');
/*!40000 ALTER TABLE `patient_treatment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `patient_id` varchar(20) NOT NULL,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `emergency_contact` varchar(20) NOT NULL,
  `insurance_policy` varchar(20) NOT NULL,
  PRIMARY KEY (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES ('p1','Lisa','Orange','7805 Woodsman Road\nClementon, NJ 08021','805-672-4901','774-581-0901','life'),('p2','Mark','Grey','9173 Wagon Court\nPalatine, IL 60067','805-672-4902','774-581-0902','health'),('p3','Amanda','White','545 Joy Ridge St.\nCedar Rapids, IA 52402','805-672-4903','774-581-0903','auto'),('p4','Paul','Blue','72 Euclid St.\nGlasgow, KY 42141','805-672-4904','774-581-0904','life'),('p5','Amy','Black','491 County St.\nGreat Falls, MT 59404','805-672-4905','774-581-0905','health'),('p6','John','Blue','333 County St.\nGreat Falls, MT 12345','805-672-4906','774-581-0906','auto'),('p7','Jerry','Green','7777 Wagon Court\nPalatine, IL 67767','805-672-4907','774-581-0907','health');
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `primary_doctor`
--

DROP TABLE IF EXISTS `primary_doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `primary_doctor` (
  `doctor_id` varchar(20) NOT NULL,
  `patient_id` varchar(20) NOT NULL,
  `admission_id` varchar(20) NOT NULL,
  KEY `doctor_id` (`doctor_id`),
  KEY `patient_id` (`patient_id`),
  KEY `admission_id` (`admission_id`),
  CONSTRAINT `primary_doctor_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`),
  CONSTRAINT `primary_doctor_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`),
  CONSTRAINT `primary_doctor_ibfk_3` FOREIGN KEY (`admission_id`) REFERENCES `admission_diagnosis` (`admission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `primary_doctor`
--

LOCK TABLES `primary_doctor` WRITE;
/*!40000 ALTER TABLE `primary_doctor` DISABLE KEYS */;
INSERT INTO `primary_doctor` VALUES ('d1','p1','admission1'),('d2','p2','admission2'),('d3','p3','admission3'),('d1','p4','admission4'),('d2','p5','admission5'),('d1','p6','admission6'),('d3','p7','admission7'),('d3','p7','admission8'),('d1','p7','admission9'),('d2','p7','admission10');
/*!40000 ALTER TABLE `primary_doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_assignment`
--

DROP TABLE IF EXISTS `room_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_assignment` (
  `room_id` varchar(20) NOT NULL,
  `admin_id` varchar(20) DEFAULT NULL,
  `patient_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_assignment`
--

LOCK TABLES `room_assignment` WRITE;
/*!40000 ALTER TABLE `room_assignment` DISABLE KEYS */;
INSERT INTO `room_assignment` VALUES ('r1','a1','p1'),('r10',NULL,NULL),('r11',NULL,NULL),('r12',NULL,NULL),('r13',NULL,NULL),('r14',NULL,NULL),('r15',NULL,NULL),('r16',NULL,NULL),('r17',NULL,NULL),('r18',NULL,NULL),('r19',NULL,NULL),('r2','a1','p2'),('r20',NULL,NULL),('r3','a1','p3'),('r4','a2','p4'),('r5','a2','p5'),('r6',NULL,NULL),('r7',NULL,NULL),('r8',NULL,NULL),('r9',NULL,NULL);
/*!40000 ALTER TABLE `room_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staffs`
--

DROP TABLE IF EXISTS `staffs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staffs` (
  `staff_id` varchar(20) NOT NULL,
  `category` varchar(20) NOT NULL,
  `employee_id` varchar(20) NOT NULL,
  PRIMARY KEY (`staff_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `staffs_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staffs`
--

LOCK TABLES `staffs` WRITE;
/*!40000 ALTER TABLE `staffs` DISABLE KEYS */;
INSERT INTO `staffs` VALUES ('s1','staff','e10'),('s2','staff','e11');
/*!40000 ALTER TABLE `staffs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `technicians`
--

DROP TABLE IF EXISTS `technicians`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `technicians` (
  `tech_id` varchar(20) NOT NULL,
  `category` varchar(20) NOT NULL,
  `employee_id` varchar(20) NOT NULL,
  PRIMARY KEY (`tech_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `technicians_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technicians`
--

LOCK TABLES `technicians` WRITE;
/*!40000 ALTER TABLE `technicians` DISABLE KEYS */;
INSERT INTO `technicians` VALUES ('tech1','technician','e6'),('tech2','technician','e7');
/*!40000 ALTER TABLE `technicians` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treatment_administration`
--

DROP TABLE IF EXISTS `treatment_administration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treatment_administration` (
  `patient_treatment_id` varchar(20) NOT NULL,
  `employee_id` varchar(20) NOT NULL,
  `administer_time` datetime NOT NULL,
  KEY `patient_treatment_id` (`patient_treatment_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `treatment_administration_ibfk_1` FOREIGN KEY (`patient_treatment_id`) REFERENCES `patient_treatment` (`patient_treatment_id`),
  CONSTRAINT `treatment_administration_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatment_administration`
--

LOCK TABLES `treatment_administration` WRITE;
/*!40000 ALTER TABLE `treatment_administration` DISABLE KEYS */;
INSERT INTO `treatment_administration` VALUES ('pt7','e4','2022-09-06 00:00:01'),('pt10','e5','2022-09-07 00:00:01'),('pt8','e6','2022-10-06 00:00:01'),('pt9','e7','2022-10-07 00:00:01');
/*!40000 ALTER TABLE `treatment_administration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treatments`
--

DROP TABLE IF EXISTS `treatments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treatments` (
  `treatment_id` varchar(20) NOT NULL,
  `proc` varchar(20) NOT NULL,
  `medication` varchar(20) NOT NULL,
  `treat_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`treatment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatments`
--

LOCK TABLES `treatments` WRITE;
/*!40000 ALTER TABLE `treatments` DISABLE KEYS */;
INSERT INTO `treatments` VALUES ('treat1','proc1','med1','Chemotherapy'),('treat2','proc2','med2','Radiation therapy'),('treat3','proc3','med3','Immunotherapy'),('treat4','proc4','med4','Vaccine therapy'),('treat5','proc5','med5','Stem cell transplantation'),('treat6','proc6','med6','Blood transfusion'),('treat7','proc7','med7','Palliative care');
/*!40000 ALTER TABLE `treatments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-18  1:28:41
