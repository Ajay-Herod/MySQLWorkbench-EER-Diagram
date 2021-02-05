CREATE DATABASE  IF NOT EXISTS `CompanyDB` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `CompanyDB`;

-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: CompanyDB
-- ------------------------------------------------------
-- Server version	5.7.28-0ubuntu0.18.04.4

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
-- Table structure for table `DEPARTMENT`
--

DROP TABLE IF EXISTS `DEPARTMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEPARTMENT` (
  `Dname` varchar(20) DEFAULT NULL,
  `Dnumber` int(1) DEFAULT NULL,
  `MgrSsn` char(9) DEFAULT NULL,
  `MgrStartDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPARTMENT`
--

LOCK TABLES `DEPARTMENT` WRITE;
/*!40000 ALTER TABLE `DEPARTMENT` DISABLE KEYS */;
INSERT INTO `DEPARTMENT` VALUES ('Headquarters',1,'333445555','1981-06-19'),('Marketing',2,'453453453','1988-05-22'),('Administration',4,'453453453','1995-01-01'),('Research',5,'808080808','2017-06-12');
/*!40000 ALTER TABLE `DEPARTMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEPENDENT`
--

DROP TABLE IF EXISTS `DEPENDENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEPENDENT` (
  `Essn` char(9) DEFAULT NULL,
  `DependentName` varchar(20) DEFAULT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Bdate` date DEFAULT NULL,
  `Relationship` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPENDENT`
--

LOCK TABLES `DEPENDENT` WRITE;
/*!40000 ALTER TABLE `DEPENDENT` DISABLE KEYS */;
INSERT INTO `DEPENDENT` VALUES ('123456789','Alice','F','1988-12-30','Daughter'),('123456789','Elizabeth','F','1967-05-05','Spouse'),('123456789','John','M','1988-02-28','Son'),('333445555','Alice','F','1986-04-05','Daughter'),('333445555','Joy','F','1958-05-03','Spouse'),('333445555','Theodore','M','1983-10-25','Son'),('453453453','Joyce','F','1990-04-05','Daughter'),('987654321','Andrew','M','1988-01-04','Son'),('987654321','Jennifer','F','1988-01-04','Daughter'),('987987987','Nabil','M','1999-08-05','Son');
/*!40000 ALTER TABLE `DEPENDENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEPT_LOCATIONS`
--

DROP TABLE IF EXISTS `DEPT_LOCATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEPT_LOCATIONS` (
  `Dnumber` int(11) DEFAULT NULL,
  `Dlocation` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPT_LOCATIONS`
--

LOCK TABLES `DEPT_LOCATIONS` WRITE;
/*!40000 ALTER TABLE `DEPT_LOCATIONS` DISABLE KEYS */;
INSERT INTO `DEPT_LOCATIONS` VALUES (1,'East York'),(2,'North York'),(3,'North York'),(4,'Etobicoke'),(5,'Old Toronto');
/*!40000 ALTER TABLE `DEPT_LOCATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMPLOYEE`
--

DROP TABLE IF EXISTS `EMPLOYEE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EMPLOYEE` (
  `Fname` varchar(20) DEFAULT NULL,
  `Lname` varchar(20) DEFAULT NULL,
  `Ssn` char(9) DEFAULT NULL,
  `Bdate` date DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `Gender` char(1) DEFAULT NULL,
  `Salary` float DEFAULT NULL,
  `SuperSsn` char(9) DEFAULT NULL,
  `Dno` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPLOYEE`
--

LOCK TABLES `EMPLOYEE` WRITE;
/*!40000 ALTER TABLE `EMPLOYEE` DISABLE KEYS */;
INSERT INTO `EMPLOYEE` VALUES ('Susan','Westerberg','121231234','1960-01-01','1010 Rockspring, Houston, TX','F',75000,NULL,1),('Jack','English','123456789','1965-01-09','731 Fondren, Houston, TX','M',30000,'333445555',2),('Frank','Wong','333445555','1955-12-08','297Victoria, Toronto, ON','M',42000,'888665575',2),('Joanne','English','453453453','1972-07-31','5631 Rice, Houston, TX','F',25000,'333445555',2),('Rakesh','Narayan','666884444','1980-09-15','975 Fire Oak, Humble, TX','M',38000,'333445555',2),('Melinda','Jones','808080808','1970-07-10','1001 Western, Houston, TX','F',27500,'333445555',2),('John','Baines','888665575','1947-11-10','450 Stone, Houston, TX','M',60000,'121231234',1),('Janine','Wallace','987654321','1941-06-20','291 Berry, Bellaire, TX','F',49000,'888665575',4),('Ahmad','Jabbar','987987987','1969-03-29','980 Dallas, Houston, TX','M',33000,'987654321',4),('Amelia','English','999887777','1968-01-19','3321 Castle, Spring, TX','F',26000,'987654321',4);
/*!40000 ALTER TABLE `EMPLOYEE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROJECT`
--

DROP TABLE IF EXISTS `PROJECT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROJECT` (
  `Pname` varchar(20) DEFAULT NULL,
  `Pnumber` int(3) DEFAULT NULL,
  `Plocation` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROJECT`
--

LOCK TABLES `PROJECT` WRITE;
/*!40000 ALTER TABLE `PROJECT` DISABLE KEYS */;
INSERT INTO `PROJECT` VALUES ('ProductX',100,'Bellaire'),('ProductY',200,'Sugarland'),('ProductZ',300,'Houston'),('Computerization',400,'Stafford'),('Reorganization',500,'Houston'),('Newbenefits',600,'Stafford'),('ProjectW',700,'Toronto');
/*!40000 ALTER TABLE `PROJECT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WORKSON`
--

DROP TABLE IF EXISTS `WORKSON`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WORKSON` (
  `Essn` char(9) DEFAULT NULL,
  `Pno` int(3) DEFAULT NULL,
  `Hours` float(3,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WORKSON`
--

LOCK TABLES `WORKSON` WRITE;
/*!40000 ALTER TABLE `WORKSON` DISABLE KEYS */;
INSERT INTO `WORKSON` VALUES ('121231234',500,12.0),('123456789',100,20.0),('123456789',200,18.0),('333445555',100,10.0),('333445555',200,10.0),('333445555',300,15.0),('333445555',400,10.0),('333445555',500,20.0),('333445555',600,5.0),('453453453',100,32.0),('453453453',200,12.0),('888665575',500,12.0),('987654321',500,15.0),('987654321',600,20.0),('987987987',400,35.0),('987987987',600,5.0),('999887777',400,10.0),('999887777',600,20.0);
/*!40000 ALTER TABLE `WORKSON` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-14 10:53:04
