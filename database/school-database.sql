-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: school
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `archive`
--

DROP TABLE IF EXISTS `archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `archive` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `archived_date` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `document` blob,
  `title` varchar(255) DEFAULT NULL,
  `archived_by_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKlrb08cig6m2bednqmokcll74h` (`archived_by_id`),
  CONSTRAINT `FKlrb08cig6m2bednqmokcll74h` FOREIGN KEY (`archived_by_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archive`
--

LOCK TABLES `archive` WRITE;
/*!40000 ALTER TABLE `archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `author` varchar(255) DEFAULT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `is_available` bit(1) NOT NULL,
  `isbn` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `year_published` int NOT NULL,
  `available_copies` int NOT NULL,
  `total_copies` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'Joshua Bloch','1234567890123',_binary '\0','9780134685991','Effective Java',2018,7,5),(2,'Robert C. Martin','1234567890124',_binary '\0','9780132350884','Clean Code',2008,2,7),(3,'Andrew Hunt and David Thomas','1234567890125',_binary '\0','9780201616224','The Pragmatic Programmer',1999,5,8),(4,'Erich Gamma, Richard Helm, Ralph Johnson, John Vlissides','1234567890126',_binary '\0','9780201633610','Design Patterns: Elements of Reusable Object-Oriented Software',1994,7,10),(6,'Martin Fowler','1234567890137',_binary '\0','9780201485677','Refactoring: Improving the Design of Existing Code',1999,0,6);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) DEFAULT NULL,
  `year` int NOT NULL,
  `class_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKmnu3p9g5gonf262p8d498nh38` (`class_id`),
  CONSTRAINT `FKmnu3p9g5gonf262p8d498nh38` FOREIGN KEY (`class_id`) REFERENCES `teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (1,'Class 1A',2024,NULL),(2,'Class 1B',2024,NULL),(3,'Class 2A',2024,NULL),(4,'Class 2B',2024,NULL),(5,'Class 3A',2024,NULL),(6,'Class 3B',2024,NULL),(7,'Class 4A',2024,NULL),(8,'Class 4B',2024,NULL),(9,'Class 5A',2024,NULL),(10,'Class 5B',2024,NULL);
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_subject`
--

DROP TABLE IF EXISTS `class_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_subject` (
  `class_id` bigint NOT NULL,
  `subject_id` bigint NOT NULL,
  PRIMARY KEY (`class_id`,`subject_id`),
  KEY `FKdlgjr0dqrf9r1yie7dreii2uv` (`subject_id`),
  CONSTRAINT `FKdlgjr0dqrf9r1yie7dreii2uv` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`),
  CONSTRAINT `FKno5smkktaps9904bebmh1bln5` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_subject`
--

LOCK TABLES `class_subject` WRITE;
/*!40000 ALTER TABLE `class_subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `class_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `librarian`
--

DROP TABLE IF EXISTS `librarian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `librarian` (
  `id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FKqbusk7jhr5ny4fgrd8sdau2cb` FOREIGN KEY (`id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `librarian`
--

LOCK TABLES `librarian` WRITE;
/*!40000 ALTER TABLE `librarian` DISABLE KEYS */;
INSERT INTO `librarian` VALUES (1005),(1006);
/*!40000 ALTER TABLE `librarian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan`
--

DROP TABLE IF EXISTS `loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `extended` bit(1) NOT NULL,
  `loan_date` datetime(6) DEFAULT NULL,
  `return_date` datetime(6) DEFAULT NULL,
  `book_id` bigint DEFAULT NULL,
  `student_id` bigint DEFAULT NULL,
  `borrow_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `extension_count` int NOT NULL,
  `returned` bit(1) NOT NULL,
  `status` enum('ACTIVE','EXPIRED','EXTENDED','RESERVED') DEFAULT NULL,
  `borrower_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK88c0ydlo57pcgp137tntrgqx1` (`book_id`),
  KEY `FKfbonj141xsdw24nn37kvpcr4d` (`student_id`),
  KEY `FKdo0kxmbq1y1lul08fbog5lsxu` (`borrower_id`),
  CONSTRAINT `FK88c0ydlo57pcgp137tntrgqx1` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
  CONSTRAINT `FKdo0kxmbq1y1lul08fbog5lsxu` FOREIGN KEY (`borrower_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKfbonj141xsdw24nn37kvpcr4d` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan`
--

LOCK TABLES `loan` WRITE;
/*!40000 ALTER TABLE `loan` DISABLE KEYS */;
INSERT INTO `loan` VALUES (1,_binary '\0',NULL,NULL,1,NULL,'2024-08-25','2024-11-23',2,_binary '','EXTENDED',538),(2,_binary '\0',NULL,NULL,4,NULL,'2024-08-25','2024-09-24',0,_binary '\0','ACTIVE',530);
/*!40000 ALTER TABLE `loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager` (
  `managed_departments` varchar(255) DEFAULT NULL,
  `id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FKmqwhyh7lyvaoxegkx6nwj5u43` FOREIGN KEY (`id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (NULL,1003),(NULL,1004);
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parent`
--

DROP TABLE IF EXISTS `parent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parent` (
  `id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FKhel7l7y5qgdytssc6tw4dqpsk` FOREIGN KEY (`id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parent`
--

LOCK TABLES `parent` WRITE;
/*!40000 ALTER TABLE `parent` DISABLE KEYS */;
INSERT INTO `parent` VALUES (621),(622),(623),(624),(625),(626),(627),(628),(629),(630),(631),(632),(633),(634),(635),(636),(637),(638),(639),(640),(641),(642),(643),(644),(645),(646),(647),(648),(649),(761),(762),(763),(764),(765),(766),(767),(768),(769),(770),(771),(772),(773),(774),(775),(776),(777),(778),(779),(780),(781),(782),(783),(784),(785),(786),(787),(788),(789),(790),(791),(792),(793),(794),(795),(796),(797),(798),(799),(800),(801),(802),(803),(804),(805),(806),(807),(808),(809),(810),(811),(812),(813),(814),(815),(816),(817),(818),(819),(820),(821),(822),(823),(824),(825),(826),(827),(828),(829),(830),(831),(832),(833),(834),(835),(836),(837),(838),(839),(840),(841),(842),(843),(844),(845),(846),(847),(848),(849),(850),(851),(852),(853),(854),(855),(856),(857),(858),(859),(860),(861),(862),(863),(864),(865),(866),(867),(868),(869);
/*!40000 ALTER TABLE `parent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parent_student`
--

DROP TABLE IF EXISTS `parent_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parent_student` (
  `parent_id` bigint NOT NULL,
  `student_id` bigint NOT NULL,
  PRIMARY KEY (`parent_id`,`student_id`),
  KEY `FK3h9b41twcc107v5me9pvdswaw` (`student_id`),
  CONSTRAINT `FK3h9b41twcc107v5me9pvdswaw` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`),
  CONSTRAINT `FKgf58e0fmkymwetklxvjxrbt6n` FOREIGN KEY (`parent_id`) REFERENCES `parent` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parent_student`
--

LOCK TABLES `parent_student` WRITE;
/*!40000 ALTER TABLE `parent_student` DISABLE KEYS */;
/*!40000 ALTER TABLE `parent_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `expiration_date` date DEFAULT NULL,
  `fulfilled` bit(1) NOT NULL,
  `reservation_date` date DEFAULT NULL,
  `book_id` bigint DEFAULT NULL,
  `borrower_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKirxtcw4s6lhwi6l9ocrk6bjfy` (`book_id`),
  KEY `FK3vl3xxlm61bkv4us30xs9bhfi` (`borrower_id`),
  CONSTRAINT `FK3vl3xxlm61bkv4us30xs9bhfi` FOREIGN KEY (`borrower_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKirxtcw4s6lhwi6l9ocrk6bjfy` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `enrollment_year` varchar(255) DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK3w7xmt19i6a0cr7kp8c80ek40` FOREIGN KEY (`id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('2024','10',523),('2024','10',524),('2024','10',525),('2024','10',526),('2024','10',527),('2024','10',528),('2024','10',529),('2024','10',530),('2024','10',531),('2024','10',532),('2024','10',533),('2024','10',534),('2024','10',535),('2024','10',536),('2024','10',537),('2024','10',538),('2024','10',539),('2024','10',540),('2024','10',541),('2024','10',542),('2024','10',543),('2024','10',544),('2024','10',545),('2024','10',546),('2024','10',547),('2024','10',548),('2024','10',549),('2024','10',550),('2024','10',551),('2024','10',552),('2024','10',553),('2024','10',554),('2024','10',555),('2024','10',556),('2024','10',557),('2024','10',558),('2024','10',559),('2024','10',560),('2024','10',561),('2024','10',562),('2024','10',563),('2024','10',564),('2024','10',565),('2024','10',566),('2024','10',567),('2024','10',568),('2024','10',569),('2024','10',570),('2024','10',571),('2024','10',572),('2024','10',573),('2024','10',574),('2024','10',575),('2024','10',576),('2024','10',577),('2024','10',578),('2024','10',579),('2024','10',580),('2024','10',581),('2024','10',582),('2024','10',583),('2024','10',584),('2024','10',585),('2024','10',586),('2024','10',587),('2024','10',588),('2024','10',589),('2024','10',590),('2024','10',591),('2024','10',592),('2024','10',593),('2024','10',594),('2024','10',595),('2024','10',596),('2024','10',597),('2024','10',598),('2024','10',599),('2024','10',600),('2024','10',601),('2024','10',602),('2024','10',603),('2024','10',604),('2024','10',605),('2024','10',606),('2024','10',607),('2024','10',608),('2024','10',609),('2024','10',610),('2024','10',611),('2024','10',612),('2024','10',613),('2024','10',614),('2024','10',615),('2024','10',616),('2024','10',617),('2024','10',618),('2024','10',619),('2024','10',620),(NULL,NULL,997);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_class`
--

DROP TABLE IF EXISTS `student_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_class` (
  `student_id` bigint NOT NULL,
  `class_id` bigint NOT NULL,
  PRIMARY KEY (`student_id`,`class_id`),
  KEY `FKfyryxclt2okb0bxjfhct0pv5u` (`class_id`),
  CONSTRAINT `FK2f81ovfviq7rv4jhpdr46dk3e` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`),
  CONSTRAINT `FKfyryxclt2okb0bxjfhct0pv5u` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_class`
--

LOCK TABLES `student_class` WRITE;
/*!40000 ALTER TABLE `student_class` DISABLE KEYS */;
INSERT INTO `student_class` VALUES (541,1),(550,1),(557,1),(583,1),(606,1),(608,1),(527,2),(545,2),(562,2),(581,2),(588,2),(594,2),(598,2),(611,2),(614,2),(524,3),(532,3),(590,3),(591,3),(593,3),(601,3),(523,4),(544,4),(567,4),(596,4),(603,4),(605,4),(613,4),(619,4),(529,5),(531,5),(552,5),(560,5),(561,5),(563,5),(570,5),(592,5),(607,5),(617,5),(534,6),(537,6),(540,6),(551,6),(564,6),(565,6),(569,6),(580,6),(602,6),(612,6),(620,6),(533,7),(535,7),(539,7),(542,7),(547,7),(549,7),(553,7),(556,7),(558,7),(572,7),(585,7),(586,7),(587,7),(597,7),(599,7),(610,7),(615,7),(528,8),(530,8),(548,8),(554,8),(568,8),(573,8),(578,8),(584,8),(589,8),(595,8),(609,8),(618,8),(538,9),(543,9),(546,9),(559,9),(571,9),(574,9),(575,9),(577,9),(600,9),(604,9),(616,9),(525,10),(526,10),(536,10),(555,10),(566,10),(576,10),(579,10),(582,10);
/*!40000 ALTER TABLE `student_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `subject_code` varchar(255) DEFAULT NULL,
  `subject_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,'MATH101','Mathematics'),(2,'PHYS101','Physics'),(3,'CHEM101','Chemistry'),(4,'BIOL101','Biology'),(5,'ENGL101','English'),(6,'HIST101','History'),(7,'GEOG101','Geography'),(8,'CS101','Computer Science'),(9,'ART101','Art'),(10,'PE101','Physical Education'),(11,'FREN101','French'),(12,'SPAN101','Spanish'),(13,'MATH101','Mathematics'),(14,'PHYS101','Physics'),(15,'CHEM101','Chemistry'),(16,'BIOL101','Biology'),(17,'ENGL101','English'),(18,'HIST101','History'),(19,'GEOG101','Geography'),(20,'CS101','Computer Science'),(21,'ART101','Art'),(22,'PE101','Physical Education'),(23,'FREN101','French'),(24,'SPAN101','Spanish');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher` (
  `department` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FKspqy2s83gvl6g8nt5aubls90k` FOREIGN KEY (`id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES ('Languages Department','Art',5),('Art Department','Biology',6),('Mathematics Department','Computer Science',7),('Science Department','Chemistry',8),('Mathematics Department','Physics',9),('Technology Department','Spanish',10),('Science Department','Chemistry',11),('History Department','Spanish',12),('English Department','Geography',13),('Science Department','Biology',14),('Technology Department','Physical Education',15),('Science Department','Physical Education',16);
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_subject`
--

DROP TABLE IF EXISTS `teacher_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher_subject` (
  `teacher_id` bigint NOT NULL,
  `subject_id` bigint NOT NULL,
  PRIMARY KEY (`teacher_id`,`subject_id`),
  KEY `FKdnhs9kxdlnrvhq5k111c87pna` (`subject_id`),
  CONSTRAINT `FK625xnjha5rs0qqynxsthk646k` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`),
  CONSTRAINT `FKdnhs9kxdlnrvhq5k111c87pna` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_subject`
--

LOCK TABLES `teacher_subject` WRITE;
/*!40000 ALTER TABLE `teacher_subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `teacher_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `profile_image` blob,
  `profile_photo` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`),
  UNIQUE KEY `UKkwds03ohobcd8p6eowkw0f5bm` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=1007 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'alice.johnson@example.com','password123','1234567890',NULL,'alice.jpg','ROLE_MANAGER','Alice','Johnson'),(2,'bob.smith@example.com','password123','1234567891',NULL,'bob.jpg','ROLE_MANAGER','Bob','Smith'),(3,'clara.taylor@example.com','password123','1234567892',NULL,'clara.jpg','ROLE_LIBRARIAN','Clara','Taylor'),(4,'david.miller@example.com','password123','1234567893',NULL,'david.jpg','ROLE_LIBRARIAN','David','Miller'),(5,'emily.davis@example.com','password123','1234567894',NULL,'emily.jpg','ROLE_TEACHER','Emily','Davis'),(6,'frank.harris@example.com','password123','1234567895',NULL,'frank.jpg','ROLE_TEACHER','Frank','Harris'),(7,'grace.clark@example.com','password123','1234567896',NULL,'grace.jpg','ROLE_TEACHER','Grace','Clark'),(8,'henry.lewis@example.com','password123','1234567897',NULL,'henry.jpg','ROLE_TEACHER','Henry','Lewis'),(9,'ivy.walker@example.com','password123','1234567898',NULL,'ivy.jpg','ROLE_TEACHER','Ivy','Walker'),(10,'jack.king@example.com','password123','1234567899',NULL,'jack.jpg','ROLE_TEACHER','Jack','King'),(11,'karen.wright@example.com','password123','1234567800',NULL,'karen.jpg','ROLE_TEACHER','Karen','Wright'),(12,'leo.scott@example.com','password123','1234567801',NULL,'leo.jpg','ROLE_TEACHER','Leo','Scott'),(13,'mia.adams@example.com','password123','1234567802',NULL,'mia.jpg','ROLE_TEACHER','Mia','Adams'),(14,'nathan.baker@example.com','password123','1234567803',NULL,'nathan.jpg','ROLE_TEACHER','Nathan','Baker'),(15,'olivia.turner@example.com','password123','1234567804',NULL,'olivia.jpg','ROLE_TEACHER','Olivia','Turner'),(16,'paul.carter@example.com','password123','1234567805',NULL,'paul.jpg','ROLE_TEACHER','Paul','Carter'),(523,'alexander.thomas@example.com','password123','2234567812',NULL,'alexander.jpg','ROLE_STUDENT','Alexander','Thomas'),(524,'michael.moore@example.com','password123','2234567813',NULL,'michael.jpg','ROLE_STUDENT','Michael','Moore'),(525,'daniel.jackson@example.com','password123','2234567814',NULL,'daniel.jpg','ROLE_STUDENT','Daniel','Jackson'),(526,'matthew.white@example.com','password123','2234567815',NULL,'matthew.jpg','ROLE_STUDENT','Matthew','White'),(527,'aiden.harris@example.com','password123','2234567816',NULL,'aiden.jpg','ROLE_STUDENT','Aiden','Harris'),(528,'joseph.martin@example.com','password123','2234567817',NULL,'joseph.jpg','ROLE_STUDENT','Joseph','Martin'),(529,'samuel.thompson@example.com','password123','2234567818',NULL,'samuel.jpg','ROLE_STUDENT','Samuel','Thompson'),(530,'david.garcia@example.com','password123','2234567819',NULL,'david.jpg','ROLE_STUDENT','David','Garcia'),(531,'james.martinez@example.com','password123','2234567820',NULL,'james.jpg','ROLE_STUDENT','James','Martinez'),(532,'benjamin.rodriguez@example.com','password123','2234567821',NULL,'benjamin.jpg','ROLE_STUDENT','Benjamin','Rodriguez'),(533,'elijah.wilson@example.com','password123','2234567822',NULL,'elijah.jpg','ROLE_STUDENT','Elijah','Wilson'),(534,'lucas.lee@example.com','password123','2234567823',NULL,'lucas.jpg','ROLE_STUDENT','Lucas','Lee'),(535,'mason.walker@example.com','password123','2234567824',NULL,'mason.jpg','ROLE_STUDENT','Mason','Walker'),(536,'logan.hall@example.com','password123','2234567825',NULL,'logan.jpg','ROLE_STUDENT','Logan','Hall'),(537,'jackson.allen@example.com','password123','2234567826',NULL,'jackson.jpg','ROLE_STUDENT','Jackson','Allen'),(538,'sebasstian.young@example.com','password123','2234567827',NULL,'sebastian.jpg','ROLE_STUDENT','Sebastian','Young'),(539,'owen.hernandez@example.com','password123','2234567828',NULL,'owen.jpg','ROLE_STUDENT','Owen','Hernandez'),(540,'matthew.king@example.com','password123','2234567829',NULL,'matthew.jpg','ROLE_STUDENT','Matthew','King'),(541,'jack.wright@example.com','password123','2234567830',NULL,'jack.jpg','ROLE_STUDENT','Jack','Wright'),(542,'lucas.lopez@example.com','password123','2234567831',NULL,'lucas.jpg','ROLE_STUDENT','Lucas','Lopez'),(543,'henry.hill@example.com','password123','2234567832',NULL,'henry.jpg','ROLE_STUDENT','Henry','Hill'),(544,'levi.scott@example.com','password123','2234567833',NULL,'levi.jpg','ROLE_STUDENT','Levi','Scott'),(545,'isaac.green@example.com','password123','2234567834',NULL,'isaac.jpg','ROLE_STUDENT','Isaac','Green'),(546,'ryan.adams@example.com','password123','2234567835',NULL,'ryan.jpg','ROLE_STUDENT','Ryan','Adams'),(547,'wyatt.baker@example.com','password123','2234567836',NULL,'wyatt.jpg','ROLE_STUDENT','Wyatt','Baker'),(548,'carter.nelson@example.com','password123','2234567837',NULL,'carter.jpg','ROLE_STUDENT','Carter','Nelson'),(549,'dylan.carter@example.com','password123','2234567838',NULL,'dylan.jpg','ROLE_STUDENT','Dylan','Carter'),(550,'nathan.mitchell@example.com','password123','2234567839',NULL,'nathan.jpg','ROLE_STUDENT','Nathan','Mitchell'),(551,'caleb.perez@example.com','password123','2234567840',NULL,'caleb.jpg','ROLE_STUDENT','Caleb','Perez'),(552,'christian.roberts@example.com','password123','2234567841',NULL,'christian.jpg','ROLE_STUDENT','Christian','Roberts'),(553,'hunter.turner@example.com','password123','2234567842',NULL,'hunter.jpg','ROLE_STUDENT','Hunter','Turner'),(554,'joshua.phillips@example.com','password123','2234567843',NULL,'joshua.jpg','ROLE_STUDENT','Joshua','Phillips'),(555,'luke.campbell@example.com','password123','2234567844',NULL,'luke.jpg','ROLE_STUDENT','Luke','Campbell'),(556,'andrew.parker@example.com','password123','2234567845',NULL,'andrew.jpg','ROLE_STUDENT','Andrew','Parker'),(557,'jonathan.evans@example.com','password123','2234567846',NULL,'jonathan.jpg','ROLE_STUDENT','Jonathan','Evans'),(558,'aaron.edwards@example.com','password123','2234567847',NULL,'aaron.jpg','ROLE_STUDENT','Aaron','Edwards'),(559,'brayden.collins@example.com','password123','2234567848',NULL,'brayden.jpg','ROLE_STUDENT','Brayden','Collins'),(560,'thomas.stewart@example.com','password123','2234567849',NULL,'thomas.jpg','ROLE_STUDENT','Thomas','Stewart'),(561,'jose.sanchez@example.com','password123','2234567850',NULL,'jose.jpg','ROLE_STUDENT','Jose','Sanchez'),(562,'adrian.morris@example.com','password123','2234567851',NULL,'adrian.jpg','ROLE_STUDENT','Adrian','Morris'),(563,'eli.rogers@example.com','password123','2234567852',NULL,'eli.jpg','ROLE_STUDENT','Eli','Rogers'),(564,'adam.reed@example.com','password123','2234567853',NULL,'adam.jpg','ROLE_STUDENT','Adam','Reed'),(565,'julian.cook@example.com','password123','2234567854',NULL,'julian.jpg','ROLE_STUDENT','Julian','Cook'),(566,'gavin.morgan@example.com','password123','2234567855',NULL,'gavin.jpg','ROLE_STUDENT','Gavin','Morgan'),(567,'isaiah.bell@example.com','password123','2234567856',NULL,'isaiah.jpg','ROLE_STUDENT','Isaiah','Bell'),(568,'austin.murphy@example.com','password123','2234567857',NULL,'austin.jpg','ROLE_STUDENT','Austin','Murphy'),(569,'evan.bailey@example.com','password123','2234567858',NULL,'evan.jpg','ROLE_STUDENT','Evan','Bailey'),(570,'charles.rivera@example.com','password123','2234567859',NULL,'charles.jpg','ROLE_STUDENT','Charles','Rivera'),(571,'jordan.cooper@example.com','password123','2234567860',NULL,'jordan.jpg','ROLE_STUDENT','Jordan','Cooper'),(572,'brandon.richardson@example.com','password123','2234567861',NULL,'brandon.jpg','ROLE_STUDENT','Brandon','Richardson'),(573,'tyler.cox@example.com','password123','2234567862',NULL,'tyler.jpg','ROLE_STUDENT','Tyler','Cox'),(574,'nicholas.howard@example.com','password123','2234567863',NULL,'nicholas.jpg','ROLE_STUDENT','Nicholas','Howard'),(575,'zachary.ward@example.com','password123','2234567864',NULL,'zachary.jpg','ROLE_STUDENT','Zachary','Ward'),(576,'kevin.brooks@example.com','password123','2234567865',NULL,'kevin.jpg','ROLE_STUDENT','Kevin','Brooks'),(577,'parker.gray@example.com','password123','2234567866',NULL,'parker.jpg','ROLE_STUDENT','Parker','Gray'),(578,'angel.james@example.com','password123','2234567867',NULL,'angel.jpg','ROLE_STUDENT','Angel','James'),(579,'connor.bennett@example.com','password123','2234567868',NULL,'connor.jpg','ROLE_STUDENT','Connor','Bennett'),(580,'aiden.diaz@example.com','password123','2234567869',NULL,'aiden.jpg','ROLE_STUDENT','Aiden','Diaz'),(581,'hayden.wood@example.com','password123','2234567870',NULL,'hayden.jpg','ROLE_STUDENT','Hayden','Wood'),(582,'aaron.richardson@example.com','password123','2234567871',NULL,'aaron.jpg','ROLE_STUDENT','Aaron','Richardson'),(583,'chase.stewart@example.com','password123','2234567872',NULL,'chase.jpg','ROLE_STUDENT','Chase','Stewart'),(584,'adrian.green@example.com','password123','2234567873',NULL,'adrian.jpg','ROLE_STUDENT','Adrian','Green'),(585,'christian.cooper@example.com','password123','2234567874',NULL,'christian.jpg','ROLE_STUDENT','Christian','Cooper'),(586,'henry.parker@example.com','password123','2234567875',NULL,'henry.jpg','ROLE_STUDENT','Henry','Parker'),(587,'isaiah.campbell@example.com','password123','2234567876',NULL,'isaiah.jpg','ROLE_STUDENT','Isaiah','Campbell'),(588,'eli.williams@example.com','password123','2234567877',NULL,'eli.jpg','ROLE_STUDENT','Eli','Williams'),(589,'jonathan.mitchell@example.com','password123','2234567878',NULL,'jonathan.jpg','ROLE_STUDENT','Jonathan','Mitchell'),(590,'sebastian.young@example.com','password123','2234567879',NULL,'sebastian.jpg','ROLE_STUDENT','Sebastian','Young'),(591,'jackson.torres@example.com','password123','2234567880',NULL,'jackson.jpg','ROLE_STUDENT','Jackson','Torres'),(592,'julian.stewart@example.com','password123','2234567881',NULL,'julian.jpg','ROLE_STUDENT','Julian','Stewart'),(593,'mateo.morris@example.com','password123','2234567882',NULL,'mateo.jpg','ROLE_STUDENT','Mateo','Morris'),(594,'ezra.rogers@example.com','password123','2234567883',NULL,'ezra.jpg','ROLE_STUDENT','Ezra','Rogers'),(595,'jayden.reed@example.com','password123','2234567884',NULL,'jayden.jpg','ROLE_STUDENT','Jayden','Reed'),(596,'hudson.cook@example.com','password123','2234567885',NULL,'hudson.jpg','ROLE_STUDENT','Hudson','Cook'),(597,'grayson.bell@example.com','password123','2234567886',NULL,'grayson.jpg','ROLE_STUDENT','Grayson','Bell'),(598,'leo.rivera@example.com','password123','2234567887',NULL,'leo.jpg','ROLE_STUDENT','Leo','Rivera'),(599,'christian.howard@example.com','password123','2234567888',NULL,'christian.jpg','ROLE_STUDENT','Christian','Howard'),(600,'asher.ward@example.com','password123','2234567889',NULL,'asher.jpg','ROLE_STUDENT','Asher','Ward'),(601,'nolan.gray@example.com','password123','2234567890',NULL,'nolan.jpg','ROLE_STUDENT','Nolan','Gray'),(602,'leo.james@example.com','password123','2234567891',NULL,'leo.jpg','ROLE_STUDENT','Leo','James'),(603,'landon.bennett@example.com','password123','2234567892',NULL,'landon.jpg','ROLE_STUDENT','Landon','Bennett'),(604,'caleb.alexander@example.com','password123','2234567893',NULL,'caleb.jpg','ROLE_STUDENT','Caleb','Alexander'),(605,'easton.hayes@example.com','password123','2234567894',NULL,'easton.jpg','ROLE_STUDENT','Easton','Hayes'),(606,'jaxon.myers@example.com','password123','2234567895',NULL,'jaxon.jpg','ROLE_STUDENT','Jaxon','Myers'),(607,'jordan.ford@example.com','password123','2234567896',NULL,'jordan.jpg','ROLE_STUDENT','Jordan','Ford'),(608,'xavier.hamilton@example.com','password123','2234567897',NULL,'xavier.jpg','ROLE_STUDENT','Xavier','Hamilton'),(609,'ryder.graham@example.com','password123','2234567898',NULL,'ryder.jpg','ROLE_STUDENT','Ryder','Graham'),(610,'nathaniel.sullivan@example.com','password123','2234567899',NULL,'nathaniel.jpg','ROLE_STUDENT','Nathaniel','Sullivan'),(611,'elias.wallace@example.com','password123','2234567900',NULL,'elias.jpg','ROLE_STUDENT','Elias','Wallace'),(612,'cooper.woods@example.com','password123','2234567901',NULL,'cooper.jpg','ROLE_STUDENT','Cooper','Woods'),(613,'zachary.cole@example.com','password123','2234567902',NULL,'zachary.jpg','ROLE_STUDENT','Zachary','Cole'),(614,'bentley.riley@example.com','password123','2234567903',NULL,'bentley.jpg','ROLE_STUDENT','Bentley','Riley'),(615,'jace.russell@example.com','password123','2234567904',NULL,'jace.jpg','ROLE_STUDENT','Jace','Russell'),(616,'kayden.perry@example.com','password123','2234567905',NULL,'kayden.jpg','ROLE_STUDENT','Kayden','Perry'),(617,'carson.henderson@example.com','password123','2234567906',NULL,'carson.jpg','ROLE_STUDENT','Carson','Henderson'),(618,'dominic.barnes@example.com','password123','2234567907',NULL,'dominic.jpg','ROLE_STUDENT','Dominic','Barnes'),(619,'declan.powell@example.com','password123','2234567908',NULL,'declan.jpg','ROLE_STUDENT','Declan','Powell'),(620,'nolan.long@example.com','password123','2234567909',NULL,'nolan.jpg','ROLE_STUDENT','Nolan','Long'),(621,'emily.anderson@example.com','password123','3274567811',NULL,'emily.jpg','ROLE_PARENT','Emily','Anderson'),(622,'michael.anderson@example.com','password123','3234567911',NULL,'michael.jpg','ROLE_PARENT','Michael','Anderson'),(623,'sophia.thomas@example.com','password123','3234567812',NULL,'sophia.jpg','ROLE_PARENT','Sophia','Thomas'),(624,'david.moore@example.com','password123','3234567813',NULL,'david.jpg','ROLE_PARENT','David','Moore'),(625,'olivia.jackson@example.com','password123','3234567814',NULL,'olivia.jpg','ROLE_PARENT','Olivia','Jackson'),(626,'william.jackson@example.com','password123','3234567914',NULL,'william.jpg','ROLE_PARENT','William','Jackson'),(627,'emma.white@example.com','password123','3234567815',NULL,'emma.jpg','ROLE_PARENT','Emma','White'),(628,'isabella.harris@example.com','password123','3234567816',NULL,'isabella.jpg','ROLE_PARENT','Isabella','Harris'),(629,'james.harris@example.com','password123','3234567916',NULL,'james.jpg','ROLE_PARENT','James','Harris'),(630,'liam.martin@example.com','password123','3234567817',NULL,'liam.jpg','ROLE_PARENT','Liam','Martin'),(631,'mia.thompson@example.com','password123','3234567818',NULL,'mia.jpg','ROLE_PARENT','Mia','Thompson'),(632,'charlotte.garcia@example.com','password123','3234567819',NULL,'charlotte.jpg','ROLE_PARENT','Charlotte','Garcia'),(633,'benjamin.garcia@example.com','password123','3234567919',NULL,'benjamin.jpg','ROLE_PARENT','Benjamin','Garcia'),(634,'amelia.martinez@example.com','password123','3234567820',NULL,'amelia.jpg','ROLE_PARENT','Amelia','Martinez'),(635,'evelyn.rodriguez@example.com','password123','3234567821',NULL,'evelyn.jpg','ROLE_PARENT','Evelyn','Rodriguez'),(636,'lucas.rodriguez@example.com','password123','3234567921',NULL,'lucas.jpg','ROLE_PARENT','Lucas','Rodriguez'),(637,'harper.wilson@example.com','password123','3234567822',NULL,'harper.jpg','ROLE_PARENT','Harper','Wilson'),(638,'henry.lee@example.com','password123','3234567823',NULL,'henry.jpg','ROLE_PARENT','Henry','Lee'),(639,'ella.walker@example.com','password123','3234567824',NULL,'ella.jpg','ROLE_PARENT','Ella','Walker'),(640,'alexander.walker@example.com','password123','3234567924',NULL,'alexander.jpg','ROLE_PARENT','Alexander','Walker'),(641,'abigail.hall@example.com','password123','3234567825',NULL,'abigail.jpg','ROLE_PARENT','Abigail','Hall'),(642,'daniel.hall@example.com','password123','3234567925',NULL,'daniel.jpg','ROLE_PARENT','Daniel','Hall'),(643,'avery.allen@example.com','password123','3234567826',NULL,'avery.jpg','ROLE_PARENT','Avery','Allen'),(644,'sofia.young@example.com','password123','3234567827',NULL,'sofia.jpg','ROLE_PARENT','Sofia','Young'),(645,'jacob.young@example.com','password123','3234567927',NULL,'jacob.jpg','ROLE_PARENT','Jacob','Young'),(646,'david.hernandez@example.com','password123','3234567828',NULL,'david.jpg','ROLE_PARENT','David','Hernandez'),(647,'scarlett.king@example.com','password123','3234567829',NULL,'scarlett.jpg','ROLE_PARENT','Scarlett','King'),(648,'victoria.wright@example.com','password123','3234567830',NULL,'victoria.jpg','ROLE_PARENT','Victoria','Wright'),(649,'oliver.wright@example.com','password123','3234567930',NULL,'oliver.jpg','ROLE_PARENT','Oliver','Wright'),(761,'grace.lopez@example.com','password123','3234567831',NULL,'grace.jpg','ROLE_PARENT','Grace','Lopez'),(762,'ethan.lopez@example.com','password123','3234567931',NULL,'ethan.jpg','ROLE_PARENT','Ethan','Lopez'),(763,'lily.hill@example.com','password123','3234567832',NULL,'lily.jpg','ROLE_PARENT','Lily','Hill'),(764,'owen.scott@example.com','password123','3234567833',NULL,'owen.jpg','ROLE_PARENT','Owen','Scott'),(765,'ella.green@example.com','password123','3234567834',NULL,'ella.jpg','ROLE_PARENT','Ella','Green'),(766,'jack.green@example.com','password123','3234567934',NULL,'jack.jpg','ROLE_PARENT','Jack','Green'),(767,'amelia.adams@example.com','password123','3234567835',NULL,'amelia.jpg','ROLE_PARENT','Amelia','Adams'),(768,'noah.adams@example.com','password123','3234567935',NULL,'noah.jpg','ROLE_PARENT','Noah','Adams'),(769,'mia.baker@example.com','password123','3234567836',NULL,'mia.jpg','ROLE_PARENT','Mia','Baker'),(770,'james.nelson@example.com','password123','3234567837',NULL,'james.jpg','ROLE_PARENT','James','Nelson'),(771,'sophia.carter@example.com','password123','3234567838',NULL,'sophia.jpg','ROLE_PARENT','Sophia','Carter'),(772,'benjamin.carter@example.com','password123','3234567938',NULL,'benjamin.jpg','ROLE_PARENT','Benjamin','Carter'),(773,'isabella.mitchell@example.com','password123','3234567839',NULL,'isabella.jpg','ROLE_PARENT','Isabella','Mitchell'),(774,'emma.perez@example.com','password123','3234567840',NULL,'emma.jpg','ROLE_PARENT','Emma','Perez'),(775,'liam.perez@example.com','password123','3234567940',NULL,'liam.jpg','ROLE_PARENT','Liam','Perez'),(776,'olivia.roberts@example.com','password123','3234567841',NULL,'olivia.jpg','ROLE_PARENT','Olivia','Roberts'),(777,'elijah.turner@example.com','password123','3234567842',NULL,'elijah.jpg','ROLE_PARENT','Elijah','Turner'),(778,'ava.phillips@example.com','password123','3234567843',NULL,'ava.jpg','ROLE_PARENT','Ava','Phillips'),(779,'ethan.phillips@example.com','password123','3234567943',NULL,'ethan.jpg','ROLE_PARENT','Ethan','Phillips'),(780,'sophia.campbell@example.com','password123','3234567844',NULL,'sophia.jpg','ROLE_PARENT','Sophia','Campbell'),(781,'jackson.parker@example.com','password123','3234567845',NULL,'jackson.jpg','ROLE_PARENT','Jackson','Parker'),(782,'isabella.evans@example.com','password123','3234567846',NULL,'isabella.jpg','ROLE_PARENT','Isabella','Evans'),(783,'alexander.evans@example.com','password123','3234567946',NULL,'alexander.jpg','ROLE_PARENT','Alexander','Evans'),(784,'mia.edwards@example.com','password123','3234567847',NULL,'mia.jpg','ROLE_PARENT','Mia','Edwards'),(785,'william.edwards@example.com','password123','3234567947',NULL,'william.jpg','ROLE_PARENT','William','Edwards'),(786,'charlotte.collins@example.com','password123','3234567848',NULL,'charlotte.jpg','ROLE_PARENT','Charlotte','Collins'),(787,'amelia.stewart@example.com','password123','3234567849',NULL,'amelia.jpg','ROLE_PARENT','Amelia','Stewart'),(788,'elijah.stewart@example.com','password123','3234567949',NULL,'elijah.jpg','ROLE_PARENT','Elijah','Stewart'),(789,'james.sanchez@example.com','password123','3234567850',NULL,'james.jpg','ROLE_PARENT','James','Sanchez'),(790,'harper.morris@example.com','password123','3234567851',NULL,'harper.jpg','ROLE_PARENT','Harper','Morris'),(791,'emma.rogers@example.com','password123','3234567852',NULL,'emma.jpg','ROLE_PARENT','Emma','Rogers'),(792,'michael.rogers@example.com','password123','3234567952',NULL,'michael.jpg','ROLE_PARENT','Michael','Rogers'),(793,'sophia.reed@example.com','password123','3234567853',NULL,'sophia.jpg','ROLE_PARENT','Sophia','Reed'),(794,'ava.cook@example.com','password123','3234567854',NULL,'ava.jpg','ROLE_PARENT','Ava','Cook'),(795,'william.cook@example.com','password123','3234567954',NULL,'william.jpg','ROLE_PARENT','William','Cook'),(796,'oliver.morgan@example.com','password123','3234567855',NULL,'oliver.jpg','ROLE_PARENT','Oliver','Morgan'),(797,'isabella.bell@example.com','password123','3234567856',NULL,'isabella.jpg','ROLE_PARENT','Isabella','Bell'),(798,'emma.murphy@example.com','password123','3234567857',NULL,'emma.jpg','ROLE_PARENT','Emma','Murphy'),(799,'jackson.murphy@example.com','password123','3234567957',NULL,'jackson.jpg','ROLE_PARENT','Jackson','Murphy'),(800,'avery.bailey@example.com','password123','3234567858',NULL,'avery.jpg','ROLE_PARENT','Avery','Bailey'),(801,'ethan.rivera@example.com','password123','3234567859',NULL,'ethan.jpg','ROLE_PARENT','Ethan','Rivera'),(802,'olivia.cooper@example.com','password123','3234567860',NULL,'olivia.jpg','ROLE_PARENT','Olivia','Cooper'),(803,'james.cooper@example.com','password123','3234567960',NULL,'james.jpg','ROLE_PARENT','James','Cooper'),(804,'mia.richardson@example.com','password123','3234567861',NULL,'mia.jpg','ROLE_PARENT','Mia','Richardson'),(805,'sophia.cox@example.com','password123','3234567862',NULL,'sophia.jpg','ROLE_PARENT','Sophia','Cox'),(806,'benjamin.cox@example.com','password123','3234567962',NULL,'benjamin.jpg','ROLE_PARENT','Benjamin','Cox'),(807,'william.howard@example.com','password123','3234567863',NULL,'william.jpg','ROLE_PARENT','William','Howard'),(808,'emma.ward@example.com','password123','3234567864',NULL,'emma.jpg','ROLE_PARENT','Emma','Ward'),(809,'isabella.brooks@example.com','password123','3234567865',NULL,'isabella.jpg','ROLE_PARENT','Isabella','Brooks'),(810,'oliver.brooks@example.com','password123','3234567965',NULL,'oliver.jpg','ROLE_PARENT','Oliver','Brooks'),(811,'sophia.gray@example.com','password123','3234567866',NULL,'sophia.jpg','ROLE_PARENT','Sophia','Gray'),(812,'ava.james@example.com','password123','3234567867',NULL,'ava.jpg','ROLE_PARENT','Ava','James'),(813,'ethan.james@example.com','password123','3234567967',NULL,'ethan.jpg','ROLE_PARENT','Ethan','James'),(814,'liam.bennett@example.com','password123','3234567868',NULL,'liam.jpg','ROLE_PARENT','Liam','Bennett'),(815,'mia.diaz@example.com','password123','3234567869',NULL,'mia.jpg','ROLE_PARENT','Mia','Diaz'),(816,'olivia.wood@example.com','password123','3234567870',NULL,'olivia.jpg','ROLE_PARENT','Olivia','Wood'),(817,'benjamin.wood@example.com','password123','3234567970',NULL,'benjamin.jpg','ROLE_PARENT','Benjamin','Wood'),(818,'sophia.richardson@example.com','password123','3234567871',NULL,'sophia.jpg','ROLE_PARENT','Sophia','Richardson'),(819,'james.stewart@example.com','password123','3234567972',NULL,'james.jpg','ROLE_PARENT','James','Stewart'),(820,'elijah.green@example.com','password123','3234567873',NULL,'elijah.jpg','ROLE_PARENT','Elijah','Green'),(821,'avery.cooper@example.com','password123','3234567874',NULL,'avery.jpg','ROLE_PARENT','Avery','Cooper'),(822,'sophia.parker@example.com','password123','3234567875',NULL,'sophia.jpg','ROLE_PARENT','Sophia','Parker'),(823,'william.parker@example.com','password123','3234567975',NULL,'william.jpg','ROLE_PARENT','William','Parker'),(824,'emma.campbell@example.com','password123','3234567876',NULL,'emma.jpg','ROLE_PARENT','Emma','Campbell'),(825,'olivia.williams@example.com','password123','3234567877',NULL,'olivia.jpg','ROLE_PARENT','Olivia','Williams'),(826,'james.williams@example.com','password123','3234567977',NULL,'james.jpg','ROLE_PARENT','James','Williams'),(827,'liam.mitchell@example.com','password123','3234567878',NULL,'liam.jpg','ROLE_PARENT','Liam','Mitchell'),(828,'emma.young@example.com','password123','3234567879',NULL,'emma.jpg','ROLE_PARENT','Emma','Young'),(829,'oliver.young@example.com','password123','3234567979',NULL,'oliver.jpg','ROLE_PARENT','Oliver','Young'),(830,'sophia.torres@example.com','password123','3234567880',NULL,'sophia.jpg','ROLE_PARENT','Sophia','Torres'),(831,'mia.stewart@example.com','password123','3234567881',NULL,'mia.jpg','ROLE_PARENT','Mia','Stewart'),(832,'benjamin.morris@example.com','password123','3234567882',NULL,'benjamin.jpg','ROLE_PARENT','Benjamin','Morris'),(833,'isabella.rogers@example.com','password123','3234567883',NULL,'isabella.jpg','ROLE_PARENT','Isabella','Rogers'),(834,'olivia.reed@example.com','password123','3234567884',NULL,'olivia.jpg','ROLE_PARENT','Olivia','Reed'),(835,'liam.reed@example.com','password123','3234567984',NULL,'liam.jpg','ROLE_PARENT','Liam','Reed'),(836,'avery.cook@example.com','password123','3234567885',NULL,'avery.jpg','ROLE_PARENT','Avery','Cook'),(837,'james.bell@example.com','password123','3234567886',NULL,'james.jpg','ROLE_PARENT','James','Bell'),(838,'sophia.rivera@example.com','password123','3234567887',NULL,'sophia.jpg','ROLE_PARENT','Sophia','Rivera'),(839,'oliver.rivera@example.com','password123','3234567987',NULL,'oliver.jpg','ROLE_PARENT','Oliver','Rivera'),(840,'mia.howard@example.com','password123','3234567888',NULL,'mia.jpg','ROLE_PARENT','Mia','Howard'),(841,'isabella.ward@example.com','password123','3234567889',NULL,'isabella.jpg','ROLE_PARENT','Isabella','Ward'),(842,'william.ward@example.com','password123','3234567989',NULL,'william.jpg','ROLE_PARENT','William','Ward'),(843,'benjamin.gray@example.com','password123','3234567890',NULL,'benjamin.jpg','ROLE_PARENT','Benjamin','Gray'),(844,'emma.james@example.com','password123','3234567891',NULL,'emma.jpg','ROLE_PARENT','Emma','James'),(845,'sophia.bennett@example.com','password123','3234567892',NULL,'sophia.jpg','ROLE_PARENT','Sophia','Bennett'),(846,'oliver.bennett@example.com','password123','3234567992',NULL,'oliver.jpg','ROLE_PARENT','Oliver','Bennett'),(847,'ava.alexander@example.com','password123','3234567893',NULL,'ava.jpg','ROLE_PARENT','Ava','Alexander'),(848,'james.hayes@example.com','password123','3234567894',NULL,'james.jpg','ROLE_PARENT','James','Hayes'),(849,'emma.myers@example.com','password123','3234567895',NULL,'emma.jpg','ROLE_PARENT','Emma','Myers'),(850,'liam.myers@example.com','password123','3234567995',NULL,'liam.jpg','ROLE_PARENT','Liam','Myers'),(851,'isabella.ford@example.com','password123','3234567896',NULL,'isabella.jpg','ROLE_PARENT','Isabella','Ford'),(852,'william.hamilton@example.com','password123','3234567897',NULL,'william.jpg','ROLE_PARENT','William','Hamilton'),(853,'olivia.graham@example.com','password123','3234567898',NULL,'olivia.jpg','ROLE_PARENT','Olivia','Graham'),(854,'james.graham@example.com','password123','3234567998',NULL,'james.jpg','ROLE_PARENT','James','Graham'),(855,'sophia.sullivan@example.com','password123','3234567899',NULL,'sophia.jpg','ROLE_PARENT','Sophia','Sullivan'),(856,'mia.wallace@example.com','password123','3234567900',NULL,'mia.jpg','ROLE_PARENT','Mia','Wallace'),(857,'benjamin.wallace@example.com','password123','3234568000',NULL,'benjamin.jpg','ROLE_PARENT','Benjamin','Wallace'),(858,'oliver.woods@example.com','password123','3234567901',NULL,'oliver.jpg','ROLE_PARENT','Oliver','Woods'),(859,'isabella.cole@example.com','password123','3234567902',NULL,'isabella.jpg','ROLE_PARENT','Isabella','Cole'),(860,'emma.riley@example.com','password123','3234567903',NULL,'emma.jpg','ROLE_PARENT','Emma','Riley'),(861,'james.riley@example.com','password123','3234568003',NULL,'james.jpg','ROLE_PARENT','James','Riley'),(862,'ava.russell@example.com','password123','3234567904',NULL,'ava.jpg','ROLE_PARENT','Ava','Russell'),(863,'liam.perry@example.com','password123','3234567905',NULL,'liam.jpg','ROLE_PARENT','Liam','Perry'),(864,'sophia.henderson@example.com','password123','3234567906',NULL,'sophia.jpg','ROLE_PARENT','Sophia','Henderson'),(865,'benjamin.henderson@example.com','password123','3234568006',NULL,'benjamin.jpg','ROLE_PARENT','Benjamin','Henderson'),(866,'oliver.barnes@example.com','password123','3234567907',NULL,'oliver.jpg','ROLE_PARENT','Oliver','Barnes'),(867,'mia.powell@example.com','password123','3234567908',NULL,'mia.jpg','ROLE_PARENT','Mia','Powell'),(868,'olivia.long@example.com','password123','3234567909',NULL,'olivia.jpg','ROLE_PARENT','Olivia','Long'),(869,'james.long@example.com','password123','3234568009',NULL,'james.jpg','ROLE_PARENT','James','Long'),(997,'teasr1d@example.com','passsword123','1121467870',NULL,NULL,'TEACHER','Asss','Asss'),(1003,NULL,NULL,NULL,NULL,NULL,'Role_MANAGER',NULL,NULL),(1004,NULL,'password123',NULL,NULL,NULL,'Role_MANAGER','Rico',NULL),(1005,NULL,'123',NULL,NULL,NULL,'ROLE_LIBRARIAN','Mike',NULL),(1006,NULL,'123',NULL,NULL,NULL,'ROLE_LIBRARIAN','ziko',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'school'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-26  4:34:54
