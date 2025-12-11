-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mfcvacations
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `departmentpositions`
--

DROP TABLE IF EXISTS `departmentpositions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departmentpositions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `department_id` int NOT NULL,
  `position_id` int NOT NULL,
  `max_simultaneous_vacations` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `position_id` (`position_id`),
  KEY `idx_department_positions` (`department_id`,`position_id`),
  CONSTRAINT `departmentpositions_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `departmentpositions_ibfk_2` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departmentpositions`
--

LOCK TABLES `departmentpositions` WRITE;
/*!40000 ALTER TABLE `departmentpositions` DISABLE KEYS */;
INSERT INTO `departmentpositions` VALUES (1,1,1,2),(2,1,2,1);
/*!40000 ALTER TABLE `departmentpositions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `manager_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_departments_manager` (`manager_id`),
  CONSTRAINT `fk_departments_manager` FOREIGN KEY (`manager_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'IT-отдел',1),(2,'Отдел удаленного приема',4),(3,'Отдел информационного и хозяйственного обеспечения',3);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(200) NOT NULL,
  `department_id` int NOT NULL,
  `position_id` int NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_employees_department` (`department_id`),
  KEY `idx_employees_position` (`position_id`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Иванов Иван',1,1,1),(2,'Петров Петр',1,1,1),(3,'Владимиров Константин Романович',3,9,1),(4,'Козлова Анна',2,4,1),(5,'Волкова Аиша Леоновна',3,6,1),(6,'Владимиров Андрей Артёмович',3,7,1);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeevacationbalance`
--

DROP TABLE IF EXISTS `employeevacationbalance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeevacationbalance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `year` int NOT NULL,
  `total_days` int DEFAULT '28',
  `used_days` int DEFAULT '0',
  `available_days` int DEFAULT '28',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_employee_year` (`employee_id`,`year`),
  CONSTRAINT `employeevacationbalance_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeevacationbalance`
--

LOCK TABLES `employeevacationbalance` WRITE;
/*!40000 ALTER TABLE `employeevacationbalance` DISABLE KEYS */;
INSERT INTO `employeevacationbalance` VALUES (5,2,2025,28,28,0),(6,1,2025,28,0,28);
/*!40000 ALTER TABLE `employeevacationbalance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `positions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
INSERT INTO `positions` VALUES (1,'Разработчик'),(2,'Тестировщик'),(3,'Аналитик'),(4,'Менеджер'),(5,'Ведущий специалист(курьер)'),(6,'Главный специалист по закупкам'),(7,'Системный администратор'),(8,'Уборщик служебных помещений'),(9,'Начальник отдела');
/*!40000 ALTER TABLE `positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Employee'),(2,'Manager');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sickleaves`
--

DROP TABLE IF EXISTS `sickleaves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sickleaves` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `diagnosis` text,
  `status` varchar(20) DEFAULT 'active',
  PRIMARY KEY (`id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `sickleaves_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sickleaves`
--

LOCK TABLES `sickleaves` WRITE;
/*!40000 ALTER TABLE `sickleaves` DISABLE KEYS */;
/*!40000 ALTER TABLE `sickleaves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userroles`
--

DROP TABLE IF EXISTS `userroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userroles` (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `userroles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `userroles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userroles`
--

LOCK TABLES `userroles` WRITE;
/*!40000 ALTER TABLE `userroles` DISABLE KEYS */;
INSERT INTO `userroles` VALUES (2,1),(5,1),(6,1),(1,2),(3,2);
/*!40000 ALTER TABLE `userroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `employee_id` int NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'ivanov','password123',1,1),(2,'petrov','password123',2,1),(3,'konst','password321',3,1),(5,'aisha','password321',5,1),(6,'andrey','password321',6,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacations`
--

DROP TABLE IF EXISTS `vacations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vacations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` varchar(20) DEFAULT 'pending',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_14_day_chunk` tinyint(1) DEFAULT '0',
  `original_vacation_id` int DEFAULT NULL,
  `is_transfer` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `original_vacation_id` (`original_vacation_id`),
  KEY `idx_vacations_employee` (`employee_id`),
  KEY `idx_vacations_dates` (`start_date`,`end_date`),
  KEY `idx_vacations_status` (`status`),
  CONSTRAINT `vacations_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `vacations_ibfk_2` FOREIGN KEY (`original_vacation_id`) REFERENCES `vacations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacations`
--

LOCK TABLES `vacations` WRITE;
/*!40000 ALTER TABLE `vacations` DISABLE KEYS */;
INSERT INTO `vacations` VALUES (21,2,'2026-01-12','2026-01-28','approved','2025-12-12 00:35:30',0,NULL,0),(22,2,'2026-02-11','2026-02-20','approved','2025-12-12 00:35:30',0,NULL,0),(23,2,'2026-03-20','2026-03-20','rejected','2025-12-12 00:35:30',0,NULL,0);
/*!40000 ALTER TABLE `vacations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacationsubmissionperiods`
--

DROP TABLE IF EXISTS `vacationsubmissionperiods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vacationsubmissionperiods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `department_id` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `is_active` tinyint DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `vacationsubmissionperiods_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacationsubmissionperiods`
--

LOCK TABLES `vacationsubmissionperiods` WRITE;
/*!40000 ALTER TABLE `vacationsubmissionperiods` DISABLE KEYS */;
INSERT INTO `vacationsubmissionperiods` VALUES (10,1,'2025-12-12','2025-12-13',1,'2025-12-11 21:23:45');
/*!40000 ALTER TABLE `vacationsubmissionperiods` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-12  1:01:38
