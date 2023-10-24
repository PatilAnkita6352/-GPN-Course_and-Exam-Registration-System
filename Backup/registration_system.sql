-- MySQL dump 10.16  Distrib 10.1.19-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: localhost
-- ------------------------------------------------------
-- Server version	10.1.19-MariaDB

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
-- Table structure for table `admin_data`
--

DROP TABLE IF EXISTS `admin_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `is_reg_started` varchar(255) DEFAULT NULL,
  `reg_term_year` varchar(255) DEFAULT NULL,
  `max_reg_courses` int(11) DEFAULT NULL,
  `end_of_term` varchar(255) DEFAULT NULL,
  `or_pr_tw_exam_date` varchar(255) DEFAULT NULL,
  `final_exam_date` varchar(255) DEFAULT NULL,
  `first_PT_date` varchar(255) DEFAULT NULL,
  `second_PT_date` varchar(255) DEFAULT NULL,
  `examination_reg_date` varchar(255) DEFAULT NULL,
  `notice` varchar(255) DEFAULT NULL,
  `mother_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_data`
--

LOCK TABLES `admin_data` WRITE;
/*!40000 ALTER TABLE `admin_data` DISABLE KEYS */;
INSERT INTO `admin_data` VALUES (1,'03c2a2534fba680e0719708e230ce1af','gpn','y','EVEN-19',10,'2019-07-18','Before TH Exam','2019-07-11','2019-07-18','2019-07-25','2019-07-17','Registration is started.','ABC');
/*!40000 ALTER TABLE `admin_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coursereg`
--

DROP TABLE IF EXISTS `coursereg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coursereg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `regno` int(11) DEFAULT NULL,
  `course_code` varchar(255) DEFAULT NULL,
  `reg_date` varchar(255) DEFAULT NULL,
  `reg_term` varchar(255) DEFAULT NULL,
  `reg_exmt` varchar(255) DEFAULT NULL,
  `reg_can` varchar(255) DEFAULT NULL,
  `pass` varchar(255) DEFAULT 'n',
  `fail` varchar(255) DEFAULT 'y',
  `no_app` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `program` varchar(255) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `reg_term_year` varchar(255) DEFAULT NULL,
  `shift` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `regno` (`regno`,`course_code`)
) ENGINE=InnoDB AUTO_INCREMENT=637 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coursereg`
--

LOCK TABLES `coursereg` WRITE;
/*!40000 ALTER TABLE `coursereg` DISABLE KEYS */;
INSERT INTO `coursereg` VALUES (591,166147,' CM6798','10/05/2019','ODD','n','n','n','y',NULL,NULL,'CM',2,'ODD-17',1),(605,166126,' CM6798','12/05/2019','ODD','n','n','n','y',NULL,NULL,'CM',2,'ODD-17',1),(606,166126,' CM4532','12/05/2019','ODD','n','n','n','y',NULL,NULL,'CM',2,'ODD-17',1),(610,166127,' CM6453','21/06/2019','ODD','n','n','n','n',NULL,NULL,'CM',3,'EVEN-19',1),(611,166127,' CM4354','21/06/2019','ODD','n','n','n','n',NULL,NULL,'CM',3,'EVEN-19',1),(614,166126,'CM6453','11/07/2019','ODD','n','n','n','n',NULL,NULL,'CM',3,'EVEN-19',1),(615,166126,'CM4354','11/07/2019','ODD','n','n','n','n',NULL,NULL,'CM',3,'EVEN-19',1),(616,166129,'CM6453','11/07/2019','ODD','n','n','n','n',NULL,NULL,'CM',3,'EVEN-19',1),(617,166129,'CM4354','11/07/2019','ODD','n','n','n','n',NULL,NULL,'CM',3,'EVEN-19',1),(632,166147,'CM6453','23/07/2019','ODD','n','n','n','n',NULL,NULL,'CM',3,'EVEN-19',1),(633,166147,'CM4354','23/07/2019','ODD','n','n','n','n',NULL,NULL,'CM',3,'EVEN-19',1),(634,166161,'CM4532','24/07/2019','ODD','y','y','y','n',NULL,NULL,'CM',1,'EVEN-19',1),(635,166161,'CM6474','24/07/2019','ODD','y','y','y','n',NULL,NULL,'CM',1,'EVEN-19',1),(636,166161,'CM6798','24/07/2019','ODD','n','n','n','n',NULL,NULL,'CM',2,'EVEN-19',1);
/*!40000 ALTER TABLE `coursereg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(11) DEFAULT NULL,
  `term` varchar(255) DEFAULT NULL,
  `course_code` varchar(255) NOT NULL,
  `course_name` varchar(255) DEFAULT NULL,
  `is_offered` varchar(10) DEFAULT NULL,
  `is_validated` varchar(255) DEFAULT NULL,
  `programme` varchar(255) DEFAULT NULL,
  `cou_th_min` int(11) DEFAULT NULL,
  `cou_pt_min` int(11) DEFAULT NULL,
  `cou_tw_min` int(11) DEFAULT NULL,
  `cou_pr_min` int(11) DEFAULT NULL,
  `cou_or_min` int(11) DEFAULT NULL,
  `cou_th_max` int(11) DEFAULT NULL,
  `cou_pt_max` int(11) DEFAULT NULL,
  `cou_tw_max` int(11) DEFAULT NULL,
  `cou_pr_max` int(11) DEFAULT NULL,
  `cou_or_max` int(11) DEFAULT NULL,
  `c_name` varchar(255) DEFAULT NULL,
  `newcode` varchar(255) DEFAULT NULL,
  `cou_credit` int(11) DEFAULT NULL,
  `cou_remar` varchar(255) DEFAULT NULL,
  `cou_pre_r1` varchar(255) DEFAULT NULL,
  `cou_pre_r2` varchar(255) DEFAULT NULL,
  `cou_pre_r3` varchar(255) DEFAULT NULL,
  `cou_pre_r4` varchar(255) DEFAULT NULL,
  `is_exempted` varchar(255) DEFAULT NULL,
  `Course_Abbrevation` varchar(10) DEFAULT NULL,
  `Total_Marks` int(10) NOT NULL,
  `department` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_code` (`course_code`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (5,3,'ODD','CM6453','Java','y','y','CM',40,8,20,20,20,100,20,25,25,25,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,'n',NULL,0,61),(6,3,'ODD','CM4354','Data Communication and technology','y','y','CM',40,8,20,20,20,100,20,25,25,25,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,'n',NULL,0,61),(7,2,'ODD','CM6798','DBMS','y','y','CM',40,8,20,0,20,100,20,25,25,25,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,'n',NULL,0,61),(8,1,'ODD','CM4532','CN','y','y','CM',40,8,20,0,20,100,20,25,0,25,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,'y',NULL,0,61),(9,1,'ODD','CM6474','m4','y','y','CM',40,8,20,20,20,100,20,25,25,25,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,'y',NULL,0,61),(10,3,'ODD','ME2189','Hydyaulics','n','y','ME',40,8,15,15,15,100,20,25,25,25,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,'n',NULL,0,22),(11,2,'ODD','ME2167','TOM','n','y','ME',40,8,15,15,15,100,20,25,25,25,NULL,NULL,7,NULL,NULL,NULL,NULL,NULL,'n',NULL,0,21),(12,3,'ODD','CM1234','fd','n','y','CM',3,3,3,3,3,3,3,3,3,3,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,'n',NULL,0,61),(13,3,'ODD','CM1235','rr','n','y','CM',5,5,5,5,5,5,55,5,5,5,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,'n',NULL,0,61);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examreg`
--

DROP TABLE IF EXISTS `examreg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examreg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `regno` varchar(255) DEFAULT NULL,
  `course_code` varchar(255) DEFAULT NULL,
  `ex_reg_date` varchar(255) DEFAULT NULL,
  `ex_reg_term` varchar(255) DEFAULT NULL,
  `ex_reg_year` int(11) DEFAULT NULL,
  `ex_exmt` int(11) DEFAULT '0',
  `ex_th` int(11) DEFAULT '0',
  `ex_pt` int(11) DEFAULT '0',
  `ex_tw` int(11) DEFAULT '0',
  `ex_pr` int(11) DEFAULT '0',
  `ex_or` int(11) DEFAULT '0',
  `ex_det` int(11) DEFAULT '0',
  `ex_back` int(11) DEFAULT '0',
  `ex_cancel` int(11) DEFAULT '1',
  `ex_pass` int(11) DEFAULT '0',
  `prog` varchar(255) DEFAULT NULL,
  `Ex` int(11) DEFAULT '0',
  `shift` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `regno_5` (`regno`,`course_code`,`ex_reg_date`,`ex_reg_term`,`ex_reg_year`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examreg`
--

LOCK TABLES `examreg` WRITE;
/*!40000 ALTER TABLE `examreg` DISABLE KEYS */;
INSERT INTO `examreg` VALUES (73,'166126',' CM6798','ODD-17','ODD',2,0,1,1,1,1,1,0,0,1,0,'CM',0,1),(74,'166126',' CM4532','ODD-17','ODD',2,0,1,1,1,0,1,0,0,1,0,'CM',0,1),(75,'166127',' CM6453','EVEN-19','ODD',3,0,1,1,1,1,1,0,0,0,0,'CM',0,1),(76,'166127',' CM4354','ODD-19','ODD',3,0,1,1,1,1,1,0,0,0,0,'CM',0,1),(78,'166126','CM6453','EVEN-19','ODD',3,0,1,1,1,1,1,0,0,0,0,'CM',0,1),(79,'166126','CM4354','EVEN-19','ODD',3,0,1,1,1,1,1,0,0,0,0,'CM',0,1),(83,'166129','CM4354','EVEN-19','ODD',3,0,1,1,1,1,1,0,0,0,0,'CM',0,1),(84,'166129','CM6453','EVEN-19','ODD',3,0,1,1,1,1,1,0,0,0,0,'CM',0,1),(94,'166147','CM4354','EVEN-19','ODD',3,0,1,1,1,1,1,0,0,0,0,'CM',0,1),(95,'166147','CM6453','EVEN-19','ODD',3,0,1,1,1,1,1,0,0,0,0,'CM',0,1),(96,'166147','CM6798','EVEN-19','ODD',3,0,1,0,1,1,1,0,1,0,0,'CM',0,1),(110,'166161','CM4532','EVEN-19','ODD',1,1,1,1,1,1,1,0,0,0,1,'CM',0,0),(111,'166161','CM6474','EVEN-19','ODD',1,1,1,1,1,1,1,0,0,0,1,'CM',0,0),(113,'166161','CM6798','EVEN-19','ODD',2,0,1,1,1,0,1,0,0,0,0,'CM',0,1);
/*!40000 ALTER TABLE `examreg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hod_data`
--

DROP TABLE IF EXISTS `hod_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hod_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `education` varchar(255) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `is_reg_started` varchar(2) DEFAULT 'n',
  `programme` varchar(255) DEFAULT NULL,
  `shift` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hod_data`
--

LOCK TABLES `hod_data` WRITE;
/*!40000 ALTER TABLE `hod_data` DISABLE KEYS */;
INSERT INTO `hod_data` VALUES (1,'yogesh','sanap','comp123','cm','m.tec','hod','y','CM',1),(12,'Abc','Simekari','mech','mech','M. tech','hod','n','ME',1),(13,NULL,NULL,'mech123','mech',NULL,'registrar','n','ME',1),(17,'yogesh','sanap','if','if','UPSC','hod','n','IF',1),(18,'Pravin','Mali','technology','Information','M.tech','hod','n','IF',1),(19,'','','comp123','comp','m.tec','registrar','y','CM',1);
/*!40000 ALTER TABLE `hod_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invigilator_details`
--

DROP TABLE IF EXISTS `invigilator_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invigilator_details` (
  `Invigilator_Id` varchar(20) NOT NULL,
  `Invigilator_Password` varchar(30) DEFAULT NULL,
  `Invigilator_Name` varchar(30) DEFAULT NULL,
  `Invigilator_Base` varchar(30) NOT NULL,
  `Department` int(10) DEFAULT NULL,
  `Designation` varchar(30) DEFAULT NULL,
  `Allowance_Key` varchar(20) DEFAULT NULL,
  `Email_Id` varchar(30) NOT NULL,
  `Contact_Number` bigint(12) NOT NULL,
  `Qualification` varchar(30) NOT NULL,
  `Experience` varchar(30) NOT NULL,
  `Specialized_Subject1` varchar(30) NOT NULL,
  `Specialized_Subject2` varchar(30) NOT NULL,
  `Specialized_Subject3` varchar(30) NOT NULL,
  `Specialized_Subject4` varchar(30) NOT NULL,
  `Address` varchar(70) NOT NULL,
  PRIMARY KEY (`Invigilator_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invigilator_details`
--

LOCK TABLES `invigilator_details` WRITE;
/*!40000 ALTER TABLE `invigilator_details` DISABLE KEYS */;
INSERT INTO `invigilator_details` VALUES ('Administrator','dgplq','Administrator','indigenous',NULL,'Administrator',NULL,'bagulpragati15@gmail.com',9874663310,'M.E(Computer Technology)','52','Java Programming','C Programming','None','None','College Road,Nashik'),('DTEGPN1232','vhohqdjrphc','Selena Gomez','indigenous',0,'','DTEGPN123224267','bagulpragati15@gmail.com',7845123690,'B.E(Computer Technology)','36','COM. FUNDA. & ORGANIZATIO','COMMUNICATION SKILLS','None','None','College Road,Nashik'),('DTEGPN1233','mxvwlqelhehu','Justin Drew Bieber','indigenous',61,'Head Of Department','DTEGPN123385633','bagulpragati15@gmail.com',9874563210,'B.E(Computer Technology)','36','COMMUNICATION SKILLS','None','None','None','College Road,Nashik'),('DTEGPN1234','jljlkdglg','Zayn Malik','external',0,'','DTEGPN12347629','bagulpragati15@gmail.com',9874563210,'B.E(Computer Technology)','24','C PROGRAMMING','C++ PROGRAMMING','None','None','College Road,Nashik'),('DTEGPN15462','jljlkdglg','Gigi Hadid','indigenous',0,'','DTEGPN1546260845','bagulpragati15@gmail.com',9874512306,'B.Tech(Computer Technology)','36','COMMUNICATION SKILLS','C++ PROGRAMMING','None','None','College Road,Nashik'),('DTEGPN4444','GWHJSQ7777','Radhi Jay Shetty','indigenous',61,'Lecturer','DTEGPN444420060','radhishetty@gmail.com',8830675426,'B.Tech(Computer Technology)','36','DATA STRUCTURE USING C','C PROGRAMMING','JAVA PROGRAMMING','OBJ.ORIENTED PROGRAMMING C++','College Road, Nashik'),('dtepbm18601','456','pravin','indigenous',0,'','dtepbm1860174828','pravinmali598@gmail.com',81088993352,'Mtech','10','JAVA PROGRAMMING','None','None','None','gp nashik');
/*!40000 ALTER TABLE `invigilator_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mark_sheets`
--

DROP TABLE IF EXISTS `mark_sheets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mark_sheets` (
  `Mark_Sheet_Number` int(20) NOT NULL,
  `Course_Code` varchar(10) NOT NULL,
  `Examination_Scheme` varchar(20) DEFAULT NULL,
  `Department` int(10) NOT NULL,
  `Invigilator_Assigned` varchar(20) DEFAULT NULL,
  `Examination` varchar(30) DEFAULT NULL,
  `Confirmation` varchar(6) DEFAULT 'false',
  PRIMARY KEY (`Mark_Sheet_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mark_sheets`
--

LOCK TABLES `mark_sheets` WRITE;
/*!40000 ALTER TABLE `mark_sheets` DISABLE KEYS */;
INSERT INTO `mark_sheets` VALUES (7896,'CM6453','Periodic Test',61,'DTEGPN1233','Summer-2019','false'),(8521,'CM6453','Periodic Test',61,NULL,'Summer-2019','false'),(9632,'CM4354','Periodic Test',61,NULL,'Summer-2019','false'),(12351,'CM6101','Periodic Test',61,'Administrator','Summer-2019','false'),(12352,'CM6106','Periodic Test',61,'Administrator','Summer-2019','false'),(611903,'CM6453','Theory',61,'Administrator','Summer-2019','false'),(611904,'CM6453','Termwork',61,'DTEGPN1233','Summer-2019','true'),(1691121,'CM6453','Periodic Test',61,'DTEGPN1233','Summer-2019','false'),(1691122,'CM6453','Periodic Test',61,'DTEGPN1233','Summer-2019','false');
/*!40000 ALTER TABLE `mark_sheets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_courses`
--

DROP TABLE IF EXISTS `student_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_courses` (
  `Student_Id` int(11) NOT NULL,
  `Course_Code` varchar(20) NOT NULL,
  `Is_Backlog` int(11) NOT NULL,
  `Periodic_Test` int(11) NOT NULL,
  `Theory` int(11) NOT NULL,
  `Theory_Mark_Sheet_Number` int(11) NOT NULL,
  `Theory_Is_Pass` bit(1) NOT NULL,
  `Termwork` int(11) NOT NULL,
  `Termwork_Is_Pass` bit(1) NOT NULL,
  `Practical` int(11) NOT NULL,
  `Practical_Is_Pass` bit(1) NOT NULL,
  `Oral` int(11) NOT NULL,
  `Oral_Is_Pass` bit(1) NOT NULL,
  `Total` int(11) NOT NULL,
  `Examination` varchar(50) NOT NULL,
  PRIMARY KEY (`Student_Id`,`Course_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_courses`
--

LOCK TABLES `student_courses` WRITE;
/*!40000 ALTER TABLE `student_courses` DISABLE KEYS */;
INSERT INTO `student_courses` VALUES (166126,'CM6453',0,20,35,0,'\0',25,'\0',30,'\0',25,'',65,'WINTER-18'),(166126,'CM6798',0,20,35,0,'\0',25,'\0',30,'\0',25,'',65,'WINTER-18');
/*!40000 ALTER TABLE `student_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_data`
--

DROP TABLE IF EXISTS `student_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rollno` varchar(255) DEFAULT NULL,
  `s_name` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `programme` varchar(255) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `term` varchar(255) DEFAULT NULL,
  `adm_date` varchar(255) DEFAULT NULL,
  `caste` varchar(255) DEFAULT NULL,
  `cerno` int(11) DEFAULT NULL,
  `conduct` varchar(255) DEFAULT NULL,
  `dob_place` varchar(255) DEFAULT NULL,
  `dob_words` varchar(255) DEFAULT NULL,
  `leaving_date` varchar(255) DEFAULT NULL,
  `ncode1` varchar(255) DEFAULT NULL,
  `ncode2` varchar(255) DEFAULT NULL,
  `photo` blob,
  `progress` varchar(255) DEFAULT NULL,
  `reason_of_learning` varchar(255) DEFAULT NULL,
  `reg_cand_no` varchar(255) DEFAULT NULL,
  `s_add` varchar(255) DEFAULT NULL,
  `s_adm_yr` int(11) DEFAULT NULL,
  `s_category` varchar(255) DEFAULT NULL,
  `s_dob` varchar(255) DEFAULT NULL,
  `s_hsc_mark` float DEFAULT NULL,
  `s_hsc_pass` int(11) DEFAULT NULL,
  `s_l_school` varchar(255) DEFAULT NULL,
  `s_regular` varchar(255) DEFAULT NULL,
  `s_remark` varchar(255) DEFAULT NULL,
  `s_sex` varchar(255) DEFAULT NULL,
  `s_ssc_mark` float DEFAULT NULL,
  `s_ssc_tech` int(11) DEFAULT NULL,
  `s_ut_ru` varchar(255) DEFAULT NULL,
  `shift2007` varchar(255) DEFAULT NULL,
  `sign` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `status1` varchar(255) DEFAULT NULL,
  `status2` varchar(255) DEFAULT NULL,
  `stcr1` varchar(255) DEFAULT NULL,
  `stcr2` varchar(255) DEFAULT NULL,
  `studying_when` varchar(255) DEFAULT NULL,
  `s_email` varchar(255) DEFAULT NULL,
  `phone_no` varchar(255) DEFAULT NULL,
  `shift` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_data`
--

LOCK TABLES `student_data` WRITE;
/*!40000 ALTER TABLE `student_data` DISABLE KEYS */;
INSERT INTO `student_data` VALUES (1,'166147','Rutuja Ranjit Nikum','166147','166147','CM',3,'ODD',NULL,NULL,47,NULL,NULL,NULL,NULL,NULL,NULL,'[B@7e475106',NULL,NULL,NULL,NULL,2019,NULL,NULL,95,1,NULL,'r',NULL,'F',93,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ritupatil123@gmail.com','9652413256',1),(2,'174157','Patil Ritu Ranjit','174157','174157','ME',3,'ODD',NULL,NULL,164157,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2019,NULL,NULL,92,1,NULL,'r',NULL,'F',94,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ritu@gmail.com','3776527635',1),(3,'166161','Aishwarya','166161','654321','CM',2,'ODD',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,97,1,NULL,'d',NULL,'F',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ritu69@gmail.com','8596741526',1),(4,'166126','utkarsha R Nehe','166126','166126','CM',3,'ODD',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,0,NULL,'r',NULL,'F',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ritu@gmail.com','765512435',1),(5,'166129','shreya kumbhakarna','166129','166129','CM',3,'ODD',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\03\0\0\04\0\0\0®∆ó≈\0\0\0sRGB\0ÆŒÈ\0\0\0gAMA\0\0±è¸a\0\0\0	pHYs\0\0√\0\0√«o®d\0\0õIDAThC5Y[èd◊Uﬁ◊s´{WwO˜Ù¥ßg«ÿLb£Ä@A \" <Úà„ ë¡+BBBº ûà^ë†,EBÏQÏ±g<ˆLœÙLOw◊Ω´Í‘πÓﬂ:ÌîF›UßOÌ≥ˆZﬂ˙æoÌ·ﬂøÁúwﬁz«úu∂^;õM÷Ê›¸xS≠“ÕäπÀ~ØÀÇD…ê´@[Ó<üßnƒÓ÷†∆w%Sí∑„@JnùÉÄsﬁÈÙæˆµﬂ—\\	!kkg‹V£ç˘Àø˝ﬁf:n©u‡XÌYª-ZÌn]∆ò∑åqÆ§òŒgÚ;˛œ9Æ\n!úÂRp&Í ﬁË„O•vI‰µq+ñRq¡∫ÌñÃ{,#∏PBKœ\\ñ◊ÅbZÚŸrZlr≠£ÁœŒ?z<ô_:∆¬0äÇ–9«ùù≠À˜~~øL◊ët≠DºÒko\Z„èOû≠÷KWW÷:≠B•dûoÑ˜Ù)\'µgä´àÒz{g∏ r§Å+Vô™6%æÈ6˜ëµÅAÖ5C˛X†õ¨é#b°¸Ÿdº\\g´ıÊ…≥ßˇ˛Éwﬂ˝œˇvïì^Xg¨≠ôÂ\\ÓÂØºˆäwˆ—Ò	≠µ¬RUU-óCµcôG êé∑B0$∆koÌˆp‡D∏”ﬂÆ+1_VEŒ≥\"G5´ç´Ñ‰∏3Õã˘‚í9/Öe2¿∫6ÃL^∆•\\Ú$\nF£…ª?˙«.T\"ıÑ	9ÿÍ•´‚—\'«q≈ZkXÀ=„R„>„π£T°ñ¿«™i]ÄƒTeY’.]WU!9»RQÂ~µ⁄îπ¡∑ù\0úœä ’¢6U\n[◊qb fãâÛ•‹ì≥”˘·ˆ‰…g«àº«Z⁄Ò‰‹‘ÄÓN8ÍÜ:«äº»69ñFÓ“Ö´ÃÛ  %Œ\Z^ñY^∫<∑ÃÈ≤ÎU∂ImæA¨(ô„\Z∏Åø Œã∫∂‡\0–Q+«U®„ao`≠(çGﬁ§uU<x|Ú„üﬁª˜¡›ÿ¨¿ñÍö∫é3ãgñà&À6õMö¶”…|>_4ë°¯•˛``Ò≥BËw°Û¢Åv4Å“¢≤ï1%÷)™M äK¥ó∫¶æAeQ\\mç»2DÏ{ΩNUàëY¡á_ycÔŒk◊≥“≠≤≠]ª:/P}[9@KóÂzù\n\0ú·\rw∆ô∫ƒçhê™≤±Êh7#ë]”é¬≠Nx,P≈T,-πâ¥¬*/Ä\"ÄóñF«2£XÓ 8éùØ‚(n«ù£›ùkΩ–€Ã…Ÿ`Ø◊È¥À¬¨6ÈrΩF^Ú<C¬ù…Î∫∞∆ËIB§ô2ƒ(H°ÒË9ÀôK¬∞™p•\0Cl@sÜ!–ÖëEú\0fÅ`â>∑.∑6JPI©ì HZ*Ë°≥Wi=[ª∞Ï_∑è:ZqMmÊ÷È¢™_óuñ“[S≈QZ6CpPÉ>Î9£‚;+û,ΩW(’&œPB¡“a´Zrºë¿!æ√CªR¨KDP\0\0›v\'I⁄`nÌòÒbe^Ãä£πT¡Ÿ˘9»˛‡˛ìº.¢$™¯ƒ°NDˆX’ê+“‡#FÊ/_û+è^	å8i&√8¡ã{æYØÁ≥Y∂Nó%—Iˆí“nu:R∑F„µ+y‰√ak¿–tÃ∂Bµ)◊+≥,m˘‰˘¯bU,À’x1[mÃÓÓµ⁄CGT¡–#ƒ_$EéWÃ£¡>{Ü\":‘\n¨¡ºÇ0ƒ® :\0ÿÒRÿö;GÁ¨v\"/ …bVõ\Z‡Ë√áƒF‚ÈÒt1±ˇÛﬁ„ü¸Ù·Ω˚ß\'£K#yfs…eÃÑ-´ÈbyπLÀ\n]ôÑIHuˆzõÒ)$Œ÷òBôzBÖë|˚[äåQ@DçD¢\'L¨ﬂ{:ıÆ$!‰3-©≈ë\\%¡\nXVë2Õ´nß≥X€˚èŒôóEÌ«+s2J+ŒñEmEÌ¥D‰ Á¶X{ù^ûñ∏s∂X‹nıæ ƒÅï:≠¬o[∂ß¯u•U0H7W8£í–<Zœ‡íÑ¯AõI)ç⁄ÜÃê⁄7}RóUÆ√h∞5Ë∑£6Uˇ‚ìì(‘aàE*ËØñ(wùn‹ŸƒèÁ[U|ë;´‚eP√~¸˙˛K˝ \r ∫o™C©nr~õ˚ó≠9¥fß*˙u√¥öˇÄ6£VÄ˙°Al® –L£C#höËƒAJÙeúh∞Èl|qv^¨ñàz:À¶ÛM;ño›π1Ï‘æ^H√≤±û••œJ?üÁãK¿†;\Zπ—§Œ+ﬂÍ∑ÊŸíx‘bòHï¿£ÑâåI\r¥údâ√\'í\0–!ﬁ\ZoÑ⁄L/QÕtù∆:–öE≠∞”oÅ5˙Ωﬁﬁp∏’ÎnÎÂÉá\'Q´-Ï•)V{˝A€∆¢ FÅ&\'˙µ,Çƒ’πfe+À„ŸÜª‹\\\\ŒÊ“Uù∂⁄È_∂É5W°@\0H⁄öÙ—@9ÒØ!“w)†ö»,n@\'¿á@Ÿö»qüà€ù››¡ı›Ao∏s:Yhn‚P=v:πòÇ±íÑıì:fY `mòæ2\n≠\rÀjaDÚ¸Ù‚≠;w:7v‰≠˝ÏÊ∞}˚ÊZqÉ9!=y`Î&g0\\WXÉ÷c5\nöÌvtúM√sd*d°YUqÈÚ,ˇﬁcƒë(@ªh B#ÄÁÌÿ£*õ@\ZbO!S∆\'´µT[/çäö\r˚e;rΩéÈ\'K≈\n•9—∞íê∑¶ê~Ç≤Ö¸ak2ÉÖú‡¶∞%j+œëáAL%ùùŒ—ë—2ï“£˝(ëPvN∏E˜(êC Ã¡ÄuT⁄R5ﬁc√•W÷≈ÆåN«˘è∆}ˆ˙9ªXÃ¡aõ@HéÑEXpΩ`˘®rdÒÅY≤ﬁú£†È&+!gËVE…@u‹pB\'ı|mW´™®≠A~ÅKHïK0q`\n[Ó‚ñÏ\nB0ñ6˚*\nÚû´	øuUvu¥7Ëm|Yˇ∞Ù ¯Ÿ+&Û†r∞-hˆòWJÖU	oöÑZ™Jç´klL]‘yæ\\Æu®˚X&∏6,|Ò8Ç2\0Vïı·Ng´çlÊ$âåS.xﬂV‹øò]Œ”\"å£7øtÎçﬂ∫S@ÖB’»ˆZ=Ü\0*ÂU;¿C1´¢\n‡>—1†zÅßËt õßY∂*ÀDÚå$É#êpEŸrZõV€\'-»	ÇÄáŸ‚¢dRÿ C~âG¬\0K\rü\\ë˙ÿeëU¶:|ë∆üöú!Ö–ﬁ∞sLBkèén¬z·\njàº\'Ç∆)@lYH+îóa–?H≥B2∏L\nπ“ï<åoY±f[™%WR\n@bt:V∏utîõ™(`NWµ˘zﬁ“ß1ª∆&–”≥5$\n≥ìÇ$«8€/æ˙\nfû¢¨ößb˚Ó&Ü‰ãÌê©D¢Ë_Ö‘„ØUé∞†‚N[1ˆà˘\08—÷Å´ÂÌÎ]®6	˙0e¥›øa¥¨„xÔÓΩGe®›≠≠ó˜´k∏‰©ôõ0È°\\@ôÖ0‚∫å¢ùAÚ∆ù/B\n-S¡®Ø£Z:òÙ¥»Ä≥A´\rgâÕ∑ì(Ö,ß1a(g°ˆ€ﬁÌ\0øÿ=Ém5∂–≈(6öâÂı…˘ì\'gÁg√Œˆùå/”¬∞g≥πËËØˇﬁoPô@£<Fƒ⁄~¡5áÄTÒ˙ÎØ›:<B –`•ä{•]Cúe–(…™Ñ-SòKéi‡U/,v⁄õ(‹‘ºå].fìÈô∆dÿ∫€ë°∆*§˚£è?˝Ù¡±‰fìÂ≤º˚˛«ûÖÚÌ∑ﬂ)´íêÉı@DêOî	mÁ)84£ﬂáÏúüû£3ïéhûd3ÄoÿÔ/)zMÛ\Z√⁄¶ƒ RD!Lñıc®.£.‡ö=î†ˆA¡coÿ∞•ˆí,]i∫YN./Å?å ®\ZN∏<;=óﬂ¸Ê;TE∆Ê”i XpÌ+J	¸É√∂∑á/ﬂæµ©‹Ò≥”æÕ†£¡\0∞ßàçf‡∆ªå·\r–utV\0ÆÜùDsq‡≠÷πÚ∫∑©DjAàÊ’£Ωt~z>:GŒ |\ràÓVÌCÖMcööØ÷¸\'ˇ˚_®yY∞ÛÛãü¯ì√É˛ó^˚Bv0åBå0¬Ÿzï[>ª\\>¸‰≈√áßòtd@^u[ñö1‰∏w≥Œ7“p≤¡ñ~©øŸ`v©§\r´Ì:<˙‡≥Ea„∂p--”ıîI~mkÿJÇ^Øªµ5xˆÏiŸ¸‚ﬁˇ]9Gü’YYÍ>~0/.ü>?tˆ˜∑º-1∫¡¨†¿q∂„ËË∆çóÆ_<=}é≤√Üê\\∞†¥‹YKjH6\Z™X◊‡(Ïÿ]]k}˝¯Ã\\Æ≠:ÇóŒSÊ∞ü†ﬂiz≠⁄d„…ÙÈ…)g–(N/àÏm…»DV]ﬂF£}ÙŸdæ*N_Ã\'„… KpD‡\rË#\nƒ·çΩvøw~1∆(‰a@ºÃ ¨jKÀÇ\0\Z+<∫5¨Ωf ¥€Ì4‹|ÖI\"yGÉ<Î$÷∞ÒË…Ìt∫∏mñ´r≥ﬁå&gy^Œ¶óÚùwæÓáíêp∫≤ø=\0>x¸ì—|2;y~QÊeØì@Ö∞\r@\rB¸dÛN∑DùßOœ¡ºA@E¡“ K†IdZ[Xöû{:µ«è3pKâÉ›≠a?ô-ÁÀÂeö“∑µ’nÌúOVKﬁg§⁄F¢±‰∑ø˝-0∏í∫(<w˝Fø(¸ŸÈÖÊr∫Xù_LœŒŒ0N\rmå∏tu’å3ÃÌoo˜;Ω˘xì\r*‹vØ›8,≠/≤\n‰Ç¨0‹¯†,€ZıΩˆ7˛ËñõÀœ>}ú≠rõ∞GÆVáaª<?üô:c~∂Câ.k™&ö·J÷‰µ˚√ù—Ë›[∆YÆ™ã—ÚÈãxrŒe∑◊xQÖ0`˝Å~ÂÂ}|µÿÃ{âPNOÃ∏É˝É®›…Úıˆ#1°ø˛’◊¡–ˇˆØ?Œsn‡CXÍ≥ÜÔÌ¬kÀ«\'æ¶cB<\0∏_Ø◊»ŸüÑ>9 <Y¬h_}Ò∑ø8ØLY[_°›»#~:ç`ß2:Zã—¥uù≈ël\'Ì0‘Ωv4ùÄNg∆Ïè€√ÎªQ$Ë$∆∞?¸Ÿá?{®e\Z_õD^üÒV\'¬§8û,Å|–>ÑiÀ≤5ø{˜.oúOU5!ì2∞oÿ–x∂˛è˝Ï˛√\'ò3k|+Ê!áôÉ∑ƒ∏ÏnÔÄ∑0^µí‰ÙlƒÍræÃ B∆1ÊÁP°®,fg≥òÁ´’,PQ]¬‰ˆJ•†(bòe≈≈¯R∏#;ò¶„1dä¡éZéqR@çÛ›A˚ø˛€_~ıïÄee‹,zû~”\ZU^¨ã‘ÁÖ8;õé/“UäæL¢∏ó¥‚(äî\0f,è}BK\0cSÔS ◊(:â·;ú¢…”<NÅëÒóËM“\0*\'Ë†‰‡ŒhA§íñzÈÊıV?~ÜGc™≤Ôc$8\rlO«L.+*∂9‘PD:Å¶‡aWñΩ^sÊ˘≈ƒ`ßZí`ﬂ…\r2∑ªª;õ.åE«¿éS\0‹B˝fùÒ˜ﬂ”?4Ö<ûÅÕßÛ$èº\ZåqèP`ÈìßÛªÔ›}˛‚Ã¯òk£ ;I{ÈÑ§∑‡≥\"äu®l§√ÓVßï¥ØÔÓvªÆ›~˜{ﬂ?ytÇu0C!+ÿ>Ê+$®’ÜV˙t\rÁDA®\\*‚\\&£gç˜B–y§ÿ\"É´¶#>\ZŸ1ÿU∂»Ã˝á>:ùÕ.ù£„D∏∫Xâ(	v€7éˆ¡ {;◊TàÅ´Ë¥˚hÂ“Ÿ⁄¸›ﬂˇÛj∂(Ûπà<†sBrÅ>œ·€)_\rm	Ã˘^–˘–ÂŸú\"ìíºM\Z‚Å\rBd‘5–n2—4~¢nxŒ äœßy∫^Ωòå¨á{◊˜√ı«¶0ø÷`T!`9ã©n˘b^ˇ’ﬂ¸\nøŸå1Cm eQÄ†®Òë,ÿR\Zî`í\ZÍÚ`ª}k†Ÿ{tnZ@∑Xçœ√ß¸âãÜ,:RÉ¿≈Ë≈C„*@]ñ©¡‰pAêÄ~¡û‘4=pêZ≤ÚÓÉã¸Ó˜eΩÆÀ|æEﬁJjcJ|\0–OkBª¥∏s´˜Â[Ω_ΩΩÊ/àÀB `˘∆q¬/7∞£k(º ñ@s ë{5É(ûï0ìëjÇá∞ê7Ê&˚à.∫ßÁ¸Ç9BNîTq‘¢Ë·Îõ„A\\AœaRÛ≈Í≠√÷7æ¥˝ÂπñÎüGFrH°4\'‹Wb@˙Hq‡}sÜ–(˘\n\\VêJ:L†¯fWÙô&Æé)L¸¬™úçß£@±(ùn|ppΩ’àöâåJFZ%ûøµ◊˘„∑nˆEªXÓÎf&B™p+yYZå¬∫ä◊<ø\0<>·âhó¿8âi∆aîáNQ$»\r±Õ1d£©tƒD?‡\Z ¨n…ˆp{>_ ó∏7—äËÏQ©m)ˇŒ·.2´±≤BÀ†:µE*ê{()IØÊIàè∏±·\nMˇ√B^àäJÜx≈|ãd¢ëq\r_«&‡<çÿmË≥tΩŒWQd@,£È2É<¡ù¸ÄlA~ ˆﬂ|uÔÊVm·‰± ùñip3•ß	ã6ö‘ºπ⁄tΩEî. äÚÅ˚ëùfM∏M∂q>‚.|©ÖÑ9>ïÑ_A£¿ç¯b≥eÃ˚\nøiXeÏµÌê{!¿Å,êiÉx|^Ôk-4AR\rê¢ÊÖV¯ÂG¸Dp§t0O<á∫–JÙ4⁄)ÖáãÑ}“ØÉËÁüîÀjø°È¸≥\ròﬁ›§\n[o\'·vü◊ë∂ÅÑóºÈŸ4≠@)®	Mÿm∫	´â‡ÛV¿ &ù”RîÿiXÛ\'|Ô)Ÿà◊Ä$È>,®ÑﬁlÃìÁòc‡tÉ˛p0ƒ-(k‡ﬁ¢9ö¡Ëkﬁ\n*:(ßº”YYì\\ÄëTAx0.$îÇ•ûMq x∂Ço‡Òî$(ÑÉ∂RHWp«E“*eÕp&CU?;_úüé8ÉItÎ¥|˘ï•pOÑ˝Së»:\0∑\nn†≈êdXH=ã?\"fFßW’§EtDW°5Ë°-Pz® H“‘WPÕÜ…¬Õ¯:·†#©?¯≈«¬ﬂÈgF‹’——M⁄§G«‡ÙÄi‰)Ê—˚ƒBÇÅö  uwÔ˛õ@!J”ßXôBπíKÑ€¸ƒÉ©vàå¬†+t–áΩo \r:Fq;©L\0ÛÒ◊ˇÏ¯§´*Ïﬂ∆‡˘∆õ_çf„Òœp\n\n°ôÓÓ⁄ÚOﬁ‘∑oÜ•iawù·Lπ˙IˆDL(ö!#\0\0\0\0IENDÆB`Ç',NULL,NULL,NULL,NULL,0,NULL,NULL,0,0,NULL,'r',NULL,'F',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ritu@gmail.com','6254625',1),(6,'166127','Vaishnavi R. Shirsath','166127','166127','CM',3,'ODD',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,0,NULL,'r',NULL,'F',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'r@gmail.com','1234567891',1),(7,'166128','Vedangi S. Bhavsar','166128','166128','CM',3,'ODD',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,0,NULL,'r',NULL,'F',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'v@gmail.com','671235716',1);
/*!40000 ALTER TABLE `student_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_details`
--

DROP TABLE IF EXISTS `student_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_details` (
  `Student_Id` int(10) NOT NULL,
  `Student_Password` varchar(20) DEFAULT NULL,
  `Student_Name` varchar(20) DEFAULT NULL,
  `Student_Department` int(10) DEFAULT NULL,
  `Student_Year` varchar(10) DEFAULT NULL,
  `Student_Term` varchar(10) DEFAULT NULL,
  `Student_Address` varchar(50) DEFAULT NULL,
  `Student_Date_Of_Birth` varchar(20) DEFAULT NULL,
  `Student_Blood_Group` varchar(5) DEFAULT NULL,
  `Gender` varchar(5) NOT NULL,
  `Student_Contact_Number` int(12) DEFAULT NULL,
  `Student_Email_Id` varchar(20) DEFAULT NULL,
  `Previous_Credits` int(20) NOT NULL,
  `Total_Credits` int(20) NOT NULL,
  PRIMARY KEY (`Student_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_details`
--

LOCK TABLES `student_details` WRITE;
/*!40000 ALTER TABLE `student_details` DISABLE KEYS */;
INSERT INTO `student_details` VALUES (166101,'166101','Gautam K Gambhir',61,'1','EVEN','Nashik','7/0',NULL,'',NULL,NULL,64,200);
/*!40000 ALTER TABLE `student_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-25 18:44:01
