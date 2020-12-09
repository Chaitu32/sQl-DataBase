-- MySQL dump 10.13  Distrib 8.0.21, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: Hosdb
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `CLEANER`
--

DROP TABLE IF EXISTS `CLEANER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLEANER` (
  `NAME` varchar(255) NOT NULL,
  `AGE` int DEFAULT NULL,
  `ROOM_NUM` int NOT NULL,
  `FLOOR_NUM` int NOT NULL,
  KEY `ROOMC_ID` (`ROOM_NUM`,`FLOOR_NUM`),
  CONSTRAINT `ROOMC_ID` FOREIGN KEY (`ROOM_NUM`, `FLOOR_NUM`) REFERENCES `ROOM` (`ROOM_NUM`, `FLOOR_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLEANER`
--

LOCK TABLES `CLEANER` WRITE;
/*!40000 ALTER TABLE `CLEANER` DISABLE KEYS */;
INSERT INTO `CLEANER` VALUES ('Durga Rau',47,1,1),('Kanti Bhat',34,2,1),('Lila Ratta',52,1,2),('Haiya Dyal',31,2,2);
/*!40000 ALTER TABLE `CLEANER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLERK`
--

DROP TABLE IF EXISTS `CLERK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLERK` (
  `CLERK_ID` int NOT NULL,
  PRIMARY KEY (`CLERK_ID`),
  CONSTRAINT `CLERK_ibfk_1` FOREIGN KEY (`CLERK_ID`) REFERENCES `EMPLOYEE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLERK`
--

LOCK TABLES `CLERK` WRITE;
/*!40000 ALTER TABLE `CLERK` DISABLE KEYS */;
INSERT INTO `CLERK` VALUES (30001);
/*!40000 ALTER TABLE `CLERK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DOCTORS`
--

DROP TABLE IF EXISTS `DOCTORS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DOCTORS` (
  `DOCTOR_ID` int NOT NULL,
  `SPECIALIZATION` varchar(255) DEFAULT NULL,
  `SUPER_ID` int DEFAULT NULL,
  PRIMARY KEY (`DOCTOR_ID`),
  KEY `SUPER_ID` (`SUPER_ID`),
  CONSTRAINT `DOCTORS_ibfk_1` FOREIGN KEY (`DOCTOR_ID`) REFERENCES `EMPLOYEE` (`ID`),
  CONSTRAINT `DOCTORS_ibfk_2` FOREIGN KEY (`SUPER_ID`) REFERENCES `DOCTORS` (`DOCTOR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DOCTORS`
--

LOCK TABLES `DOCTORS` WRITE;
/*!40000 ALTER TABLE `DOCTORS` DISABLE KEYS */;
INSERT INTO `DOCTORS` VALUES (10001,'Neurologist',NULL),(10002,'Dermatologist',10001),(10003,'Gynecologist',10001),(10004,'Cardiologist',10001);
/*!40000 ALTER TABLE `DOCTORS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DOCTOR_QUAILF`
--

DROP TABLE IF EXISTS `DOCTOR_QUAILF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DOCTOR_QUAILF` (
  `DOCTOR_ID` int NOT NULL,
  `QUAILFICATION` varchar(255) NOT NULL,
  KEY `DOCTOR_ID` (`DOCTOR_ID`),
  CONSTRAINT `DOCTOR_QUAILF_ibfk_1` FOREIGN KEY (`DOCTOR_ID`) REFERENCES `DOCTORS` (`DOCTOR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DOCTOR_QUAILF`
--

LOCK TABLES `DOCTOR_QUAILF` WRITE;
/*!40000 ALTER TABLE `DOCTOR_QUAILF` DISABLE KEYS */;
INSERT INTO `DOCTOR_QUAILF` VALUES (10001,'MD'),(10001,'MMed'),(10001,'MBBS'),(10002,'MBBS'),(10002,'MMSc'),(10003,'MBBS'),(10003,'MD'),(10004,'MBBS'),(10004,'MD');
/*!40000 ALTER TABLE `DOCTOR_QUAILF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMPLOYEE`
--

DROP TABLE IF EXISTS `EMPLOYEE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EMPLOYEE` (
  `ID` int NOT NULL,
  `SSN` bigint NOT NULL,
  `FNAME` varchar(20) NOT NULL,
  `MNAME` varchar(20) DEFAULT NULL,
  `LNAME` varchar(20) NOT NULL,
  `DOB` date DEFAULT NULL,
  `SALARY` int DEFAULT NULL,
  `GENDER` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPLOYEE`
--

LOCK TABLES `EMPLOYEE` WRITE;
/*!40000 ALTER TABLE `EMPLOYEE` DISABLE KEYS */;
INSERT INTO `EMPLOYEE` VALUES (10001,531946090165,'Suraj','Kirti','Rana','1975-12-15',95000,'Male'),(10002,489950991097,'Bharat',NULL,'Soman','1989-08-02',80000,'Male'),(10003,514006194765,'Vimala','Uday','Beharry','1988-04-21',82000,'Female'),(10004,453935229716,'Nitika',NULL,'Savant','1982-11-01',75000,'Female'),(10005,789413510213,'Jay','','Prakash','1989-05-13',76000,'Male'),(10006,45791378345,'Dasari','','Rohith','1978-06-06',56000,'Male'),(20001,402400717846,'Chameli','Naresh','Sunder','1996-01-12',15000,'Female'),(20002,438681944576,'Drishti',NULL,'Sabharwal','1989-05-16',15000,'Female'),(30001,530488618494,'Aditya','Sohail','More','1992-04-22',25000,'Male'),(40001,471673363530,'Mahmood','Arvind','Kota','1987-06-06',35000,'Male'),(50001,601112445525,'Moti','Raj','Biyani','1995-12-15',40000,'Male'),(50002,370914492035,'Venkat',NULL,'Mehan','1994-09-04',42000,'Male');
/*!40000 ALTER TABLE `EMPLOYEE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMPLOYEE_ADDRESS`
--

DROP TABLE IF EXISTS `EMPLOYEE_ADDRESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EMPLOYEE_ADDRESS` (
  `EMPLOYEE_ID` int NOT NULL,
  `ADDRESS` text NOT NULL,
  KEY `EMPLOYEE_ID` (`EMPLOYEE_ID`),
  CONSTRAINT `EMPLOYEE_ADDRESS_ibfk_1` FOREIGN KEY (`EMPLOYEE_ID`) REFERENCES `EMPLOYEE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPLOYEE_ADDRESS`
--

LOCK TABLES `EMPLOYEE_ADDRESS` WRITE;
/*!40000 ALTER TABLE `EMPLOYEE_ADDRESS` DISABLE KEYS */;
INSERT INTO `EMPLOYEE_ADDRESS` VALUES (10001,'38 UmaGunj Kota-105776'),(10002,'54 Jatin Villas Mansarovar New Delhi-159551'),(10003,'11 PrabhaPur Jaipur-330942'),(10004,'35 EshaPur Rajkot-261552'),(20001,'94 Kamelesh nagar New Delhi-159550'),(20002,'84 AjayNagar New Delhi-159550'),(30001,'28 Shashank Apartments Goregaon New Delhi-159545'),(40001,'18 Umar Villas Vikhroli New Delhi-159401'),(50001,'41 MunafPur New Delhi-159465'),(50002,'51 Padmini Villas New Delhi-159423'),(10006,'tuni');
/*!40000 ALTER TABLE `EMPLOYEE_ADDRESS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMPLOYEE_EMAIL`
--

DROP TABLE IF EXISTS `EMPLOYEE_EMAIL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EMPLOYEE_EMAIL` (
  `EMPLOYEE_ID` int NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  KEY `EMPLOYEE_ID` (`EMPLOYEE_ID`),
  CONSTRAINT `EMPLOYEE_EMAIL_ibfk_1` FOREIGN KEY (`EMPLOYEE_ID`) REFERENCES `EMPLOYEE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPLOYEE_EMAIL`
--

LOCK TABLES `EMPLOYEE_EMAIL` WRITE;
/*!40000 ALTER TABLE `EMPLOYEE_EMAIL` DISABLE KEYS */;
INSERT INTO `EMPLOYEE_EMAIL` VALUES (10001,'surajkana@gmail.com'),(10002,'bharman@gmail.com'),(10003,'vimalrry@gmail.com'),(10004,'nitikant@gmail.com'),(20001,'chameler@gmail.com'),(20002,'drishwal@gmail.com'),(30001,'adityaore@gmail.com'),(40001,'mahmoota@gmail.com'),(50001,'motini@gmail.com'),(50002,'venkahan@gmail.com');
/*!40000 ALTER TABLE `EMPLOYEE_EMAIL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMPLOYEE_PHONENO`
--

DROP TABLE IF EXISTS `EMPLOYEE_PHONENO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EMPLOYEE_PHONENO` (
  `EMPLOYEE_ID` int NOT NULL,
  `PHONENO` bigint NOT NULL,
  KEY `EMPLOYEE_ID` (`EMPLOYEE_ID`),
  CONSTRAINT `EMPLOYEE_PHONENO_ibfk_1` FOREIGN KEY (`EMPLOYEE_ID`) REFERENCES `EMPLOYEE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPLOYEE_PHONENO`
--

LOCK TABLES `EMPLOYEE_PHONENO` WRITE;
/*!40000 ALTER TABLE `EMPLOYEE_PHONENO` DISABLE KEYS */;
INSERT INTO `EMPLOYEE_PHONENO` VALUES (10001,2944067217),(10002,5219002468),(10003,6268096548),(10004,8700183897),(20001,9924296300),(20002,9957821094),(30001,9188332880),(40001,8091521345),(50001,8412747345),(50002,8444511596);
/*!40000 ALTER TABLE `EMPLOYEE_PHONENO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GUARDIANS`
--

DROP TABLE IF EXISTS `GUARDIANS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GUARDIANS` (
  `NAME` varchar(255) NOT NULL,
  `AGE` int NOT NULL,
  `PATIENT_ID` int NOT NULL,
  KEY `PATIENT_ID` (`PATIENT_ID`),
  CONSTRAINT `GUARDIANS_ibfk_1` FOREIGN KEY (`PATIENT_ID`) REFERENCES `PATIENTS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GUARDIANS`
--

LOCK TABLES `GUARDIANS` WRITE;
/*!40000 ALTER TABLE `GUARDIANS` DISABLE KEYS */;
INSERT INTO `GUARDIANS` VALUES ('rahul',34,1),('rohith',43,2),('Adithya',24,3),('Jay prakash',20,4);
/*!40000 ALTER TABLE `GUARDIANS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LABS`
--

DROP TABLE IF EXISTS `LABS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LABS` (
  `NUMBER` int NOT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`NUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LABS`
--

LOCK TABLES `LABS` WRITE;
/*!40000 ALTER TABLE `LABS` DISABLE KEYS */;
INSERT INTO `LABS` VALUES (1,'Hematology lab'),(2,'X-ray MRI lab');
/*!40000 ALTER TABLE `LABS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NURSES`
--

DROP TABLE IF EXISTS `NURSES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NURSES` (
  `NURSE_ID` int NOT NULL,
  PRIMARY KEY (`NURSE_ID`),
  CONSTRAINT `NURSES_ibfk_1` FOREIGN KEY (`NURSE_ID`) REFERENCES `EMPLOYEE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NURSES`
--

LOCK TABLES `NURSES` WRITE;
/*!40000 ALTER TABLE `NURSES` DISABLE KEYS */;
INSERT INTO `NURSES` VALUES (20001),(20002);
/*!40000 ALTER TABLE `NURSES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PATIENTS`
--

DROP TABLE IF EXISTS `PATIENTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PATIENTS` (
  `ID` int NOT NULL,
  `SSN` bigint NOT NULL,
  `FNAME` varchar(20) NOT NULL,
  `MNAME` varchar(20) DEFAULT NULL,
  `LNAME` varchar(20) NOT NULL,
  `DATE_ADMIT` date DEFAULT NULL,
  `AGE` int NOT NULL,
  `DIAGNOSIS` text NOT NULL,
  `NURSE_ID` int DEFAULT NULL,
  `ROOM_NUM` int DEFAULT NULL,
  `FLOOR_NUM` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `NURSE_ID` (`NURSE_ID`),
  KEY `ROOMP_ID` (`ROOM_NUM`,`FLOOR_NUM`),
  CONSTRAINT `PATIENTS_ibfk_1` FOREIGN KEY (`NURSE_ID`) REFERENCES `NURSES` (`NURSE_ID`),
  CONSTRAINT `ROOMP_ID` FOREIGN KEY (`ROOM_NUM`, `FLOOR_NUM`) REFERENCES `ROOM` (`ROOM_NUM`, `FLOOR_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PATIENTS`
--

LOCK TABLES `PATIENTS` WRITE;
/*!40000 ALTER TABLE `PATIENTS` DISABLE KEYS */;
INSERT INTO `PATIENTS` VALUES (1,12,'PHILLIP','J','COULSON','2020-10-05',34,'FLU',20001,1,1),(2,123,'MELLINDA','','MAY','2020-10-05',44,'COUGH',20002,2,1),(3,1234,'DAISY','','JOHNSON','2020-10-05',29,'COLD',20001,1,2),(4,1242,'MACHENZEE','','C','2020-10-05',35,'HEADACHE',20001,2,2);
/*!40000 ALTER TABLE `PATIENTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PATIENT_ADDRESS`
--

DROP TABLE IF EXISTS `PATIENT_ADDRESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PATIENT_ADDRESS` (
  `PATIENT_ID` int NOT NULL,
  `ADDRESS` varchar(255) NOT NULL,
  KEY `PATIENT_ID` (`PATIENT_ID`),
  CONSTRAINT `PATIENT_ADDRESS_ibfk_1` FOREIGN KEY (`PATIENT_ID`) REFERENCES `PATIENTS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PATIENT_ADDRESS`
--

LOCK TABLES `PATIENT_ADDRESS` WRITE;
/*!40000 ALTER TABLE `PATIENT_ADDRESS` DISABLE KEYS */;
INSERT INTO `PATIENT_ADDRESS` VALUES (1,'56 suraj heigths New Delhi-159450'),(2,'23 Ajay heigths New Delhi-159405'),(3,'21 Loki heigths New Delhi-159445'),(4,'12 Thor heigths New Delhi-159444');
/*!40000 ALTER TABLE `PATIENT_ADDRESS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PATIENT_EMAIL`
--

DROP TABLE IF EXISTS `PATIENT_EMAIL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PATIENT_EMAIL` (
  `PATIENT_ID` int NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  KEY `PATIENT_ID` (`PATIENT_ID`),
  CONSTRAINT `PATIENT_EMAIL_ibfk_1` FOREIGN KEY (`PATIENT_ID`) REFERENCES `PATIENTS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PATIENT_EMAIL`
--

LOCK TABLES `PATIENT_EMAIL` WRITE;
/*!40000 ALTER TABLE `PATIENT_EMAIL` DISABLE KEYS */;
INSERT INTO `PATIENT_EMAIL` VALUES (1,'couloson@gmail.com'),(2,'may@gmail.com'),(3,'daisy@gmail.com'),(4,'mac@gmail.com');
/*!40000 ALTER TABLE `PATIENT_EMAIL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PATIENT_PHONENO`
--

DROP TABLE IF EXISTS `PATIENT_PHONENO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PATIENT_PHONENO` (
  `PATIENT_ID` int NOT NULL,
  `PHONE_NO` bigint NOT NULL,
  KEY `PATIENT_ID` (`PATIENT_ID`),
  CONSTRAINT `PATIENT_PHONENO_ibfk_1` FOREIGN KEY (`PATIENT_ID`) REFERENCES `PATIENTS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PATIENT_PHONENO`
--

LOCK TABLES `PATIENT_PHONENO` WRITE;
/*!40000 ALTER TABLE `PATIENT_PHONENO` DISABLE KEYS */;
INSERT INTO `PATIENT_PHONENO` VALUES (1,8915315375),(2,8913555375),(3,9813555375),(4,9913555357);
/*!40000 ALTER TABLE `PATIENT_PHONENO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PHARMACISTS`
--

DROP TABLE IF EXISTS `PHARMACISTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PHARMACISTS` (
  `PHARMACIST_ID` int NOT NULL,
  PRIMARY KEY (`PHARMACIST_ID`),
  CONSTRAINT `PHARMACISTS_ibfk_1` FOREIGN KEY (`PHARMACIST_ID`) REFERENCES `EMPLOYEE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PHARMACISTS`
--

LOCK TABLES `PHARMACISTS` WRITE;
/*!40000 ALTER TABLE `PHARMACISTS` DISABLE KEYS */;
INSERT INTO `PHARMACISTS` VALUES (40001);
/*!40000 ALTER TABLE `PHARMACISTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PHARMACY`
--

DROP TABLE IF EXISTS `PHARMACY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PHARMACY` (
  `DRUG_ID` int NOT NULL,
  `DRUG_NAME` varchar(255) NOT NULL,
  `AVAILABLITY` int NOT NULL,
  `COST` int NOT NULL,
  PRIMARY KEY (`DRUG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PHARMACY`
--

LOCK TABLES `PHARMACY` WRITE;
/*!40000 ALTER TABLE `PHARMACY` DISABLE KEYS */;
INSERT INTO `PHARMACY` VALUES (1,'Vicodin',500,25),(3,'Delasone',150,30),(4,'Amoxil',50,32),(5,'Neurontin',100,70),(7,'Glucophage',200,40),(8,'Lipitor',200,80),(9,'Zofran',200,60),(10,'Motrin',220,40);
/*!40000 ALTER TABLE `PHARMACY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REPORT`
--

DROP TABLE IF EXISTS `REPORT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REPORT` (
  `PATIENT_ID` int NOT NULL,
  `DOCTOR_ID` int NOT NULL,
  `DRUG_ID` int NOT NULL,
  PRIMARY KEY (`PATIENT_ID`,`DOCTOR_ID`,`DRUG_ID`),
  KEY `DOCTOR_ID` (`DOCTOR_ID`),
  KEY `DRUG_ID` (`DRUG_ID`),
  CONSTRAINT `REPORT_ibfk_1` FOREIGN KEY (`PATIENT_ID`) REFERENCES `PATIENTS` (`ID`),
  CONSTRAINT `REPORT_ibfk_2` FOREIGN KEY (`DOCTOR_ID`) REFERENCES `DOCTORS` (`DOCTOR_ID`),
  CONSTRAINT `REPORT_ibfk_3` FOREIGN KEY (`DRUG_ID`) REFERENCES `PHARMACY` (`DRUG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REPORT`
--

LOCK TABLES `REPORT` WRITE;
/*!40000 ALTER TABLE `REPORT` DISABLE KEYS */;
INSERT INTO `REPORT` VALUES (4,10001,5),(4,10001,8),(1,10002,7),(1,10002,10),(3,10003,5),(3,10003,9),(3,10003,10),(2,10004,1),(2,10004,3),(2,10004,7);
/*!40000 ALTER TABLE `REPORT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROOM`
--

DROP TABLE IF EXISTS `ROOM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ROOM` (
  `ROOM_NUM` int NOT NULL,
  `FLOOR_NUM` int NOT NULL,
  `TYPE` varchar(255) NOT NULL,
  PRIMARY KEY (`ROOM_NUM`,`FLOOR_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROOM`
--

LOCK TABLES `ROOM` WRITE;
/*!40000 ALTER TABLE `ROOM` DISABLE KEYS */;
INSERT INTO `ROOM` VALUES (1,1,'NON-AC'),(1,2,'AC'),(2,1,'NON-AC'),(2,2,'AC');
/*!40000 ALTER TABLE `ROOM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TECHINICANS`
--

DROP TABLE IF EXISTS `TECHINICANS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TECHINICANS` (
  `TECHINICAN_ID` int NOT NULL,
  `SPECIALIZTION` varchar(255) DEFAULT NULL,
  `LAB_NUMBER` int NOT NULL,
  PRIMARY KEY (`TECHINICAN_ID`),
  KEY `LAB_NUMBER` (`LAB_NUMBER`),
  CONSTRAINT `TECHINICANS_ibfk_1` FOREIGN KEY (`TECHINICAN_ID`) REFERENCES `EMPLOYEE` (`ID`),
  CONSTRAINT `TECHINICANS_ibfk_2` FOREIGN KEY (`LAB_NUMBER`) REFERENCES `LABS` (`NUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TECHINICANS`
--

LOCK TABLES `TECHINICANS` WRITE;
/*!40000 ALTER TABLE `TECHINICANS` DISABLE KEYS */;
INSERT INTO `TECHINICANS` VALUES (50001,'Hematopathology',1),(50002,'radiologist',2);
/*!40000 ALTER TABLE `TECHINICANS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-06 20:03:57
