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
INSERT INTO `student_data` VALUES (1,'166147','Rutuja Ranjit Nikum','166147','166147','CM',3,'ODD',NULL,NULL,47,NULL,NULL,NULL,NULL,NULL,NULL,'[B@7e475106',NULL,NULL,NULL,NULL,2019,NULL,NULL,95,1,NULL,'r',NULL,'F',93,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ritupatil123@gmail.com','9652413256',1),(2,'174157','Patil Ritu Ranjit','174157','174157','ME',3,'ODD',NULL,NULL,164157,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2019,NULL,NULL,92,1,NULL,'r',NULL,'F',94,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ritu@gmail.com','3776527635',1),(3,'166161','Aishwarya','166161','654321','CM',2,'ODD',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,97,1,NULL,'d',NULL,'F',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ritu69@gmail.com','8596741526',1),(4,'166126','utkarsha R Nehe','166126','166126','CM',3,'ODD',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,0,NULL,'r',NULL,'F',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ritu@gmail.com','765512435',1),(5,'166129','shreya kumbhakarna','166129','166129','CM',3,'ODD',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\03\0\0\04\0\0\0�Ɨ�\0\0\0sRGB\0���\0\0\0gAMA\0\0���a\0\0\0	pHYs\0\0�\0\0��o�d\0\0�IDAThC5Y[�d�U��s�{WwO����g��Lb��@A \" <��� ��+BBB� ��^��,EB�Q��g<�L��LOw׽��Թ��:�F�U�O��Z���o��߿�w�zǜu�^;�M����xS��͊��~�˂Dɐ�@[�<��n��֠�w%S���@Jn���s��������\\	!kkg�V���˿��f:n�u�X�Y�-Z�n]Ƙ��q����g�;��9�\n!��Rp&� ���O�vI�q+�Rq����{,#�PBK�\\�ׁbZ��rZlr�����?z<�_:��0���9ǝ����~~�Lבt�D��ko\Z�O���KWW�:�B�d�o���)\'�g����z{g��r��+V��6%��6����A�5C�X������#b���d�\\g���ɳ����w����v��^Xg����\\�导��w���	���RUU-�C�c�Gʐ��B0$�ko��p�D��߮+1_VEγ\"G5�����3͋��9/�e2��6�L^��\\�$\nF�ɻ?��.T\"��	9�ꥫ��\'�q�ZkX�=�R�>㹣T�����i]��TeY�.]WU!9�RQ�~�ڔ����\0�ϊ�բ6U\n[�qb f���ܓ�������gǈ��Z����Ԁ�N8�:Ǌ��69�F�҅���� %�\Z^�Y^�<�����U�Im�A�(��\Z��� ΋���\0�Q+�U��ao`�(�G�ޤuU<x|��޻�������ꚺ�3�g��&�6�M����|>_4�����``�B�w���v4�Ң��1%�)�MʊK�����AeQ\\m��2D�{�NU��Y��_yc��k׳ҭ��]�:/P}[9�@K��z�\n\0��\rwƙ�čh�����h7#�]ӎ­Nx,P�T,-����*/�\"���F�2�X��8����(nǝ�ݝk������`����¬6�r�F^�<C�뺰��IB��2�(H���9˙K°�p�\0Cl@s�!���E�\0f�`�>�.�6JPI�� HZ*衳Wi=[���_��:ZqMm��颪_�u��[S�QZ6CpP�>�9��;+�,�W(�&�PB��a�Zr���!��C�R�KDP\0\0�v\'I�`n��be^̊��T���9������.�$��ġND�XՐ+��#F��/_�+�^	��8i&�8��{�Y��Y�N�%�I���nu:R�F�+y��ak��t̶B�)�+�,m����bU,��x1[m����CGT��#�_$E�Ẉ�>{�\":�\n����0Ĩ�:\0��Rؚ;G��v\"/��bV�\Z��Ç�F���t1����������\'�K#yfs�ē-��by�L�\n]��IHu�z��)$���B�zB��|�[��Q@D�D�\'L��{:��$!�3-�ő\\%�\nXV�2ͫn��X���Ι�E��+s2J+ΖEmE�D���X{�^���s�X�n�� ā�:��o[���u�U0H7W8���<Z�����A�I)�چ̐�7}R�U��h�5跣6U�ⓓ(�a�E*诖(w�n��ď��[U|�;��eP�~���K��\rʺo�C�nr~����9�f�*�uô���6�V���Al� �L�C#h���AJ�e�h��l|qv^���z:˦�M;�oݹ1�Ծ^Hò�����J?��K��;\Z�Ѥ�+���ْx��b�H������I\r��d��\'�\0�!��\Zo��L/Q�t��:КE���o�5����p���n�僇\'Q�-�)V{�A�Ƣ F�&\'��,��չfe+��ن��\\\\���U����_��5W�@\0Hښ��@9�!�w)���,n@\'��@ٚ�q��۝�����Ao�s:Yhn�P=v:��������:fY `m��2\n�\r�jaD����;w:7v����}��Zq�9!=y`�&g0\\WX��c5\n��vt�M�sd*d�YUq��,���cđ(@�h B#�����*�@\ZbO!S�\'��T[/���\r�e;r���\'K�\n�9Ѱ�����~����ak2���র%j+ϑ�AL%���ё�2�ң�(�PvN�E�(�C ���uT�R5�cåW�Ů�N����}��9�X��a�@H��EXp�`��rd�Y�ޜ���&+!g�VE�@u�pB\'�|mW����A~�KH�K0q`\n[���\nB0�6�*\n�	�uUvu�7�m|Y��� ��+&�r�-h��WJ�U	o��Z�J��klL]�y�\\�u��X&�6,|�8�2\0V���Ng��l�$��S.x�Vܿ�]��\"��7�t�ߺS@�B���Z=�\0*�U;�C1��\n�>�1�z���tʛ�Y�*�D�$�#�pE�rZ�V�\'-�	�����dR��C~�G�\0K\r�\\���e�U�:|�Ɵ��!��ްsLBk��n�z�\nj��\'��)@lYH+��a�?H�B2�L\n�ҕ<�oY�f[�%WR\n@bt:V�ut���(`NW��z�ҧ1��&�ӳ5$\n���$�8�/��\nf�����b��&��퐩D��_���U����N[1���\08�ց����]�6	�0e�ݿa���x��Ge�ݭ����k�䩙�0�\\@��0⺌��A�Ɲ/B\n-S�����Z:���Ȁ�A�\rg�ͷ�(�,�1a(g�����\0��=�m5���(6�������\'g�g�����/�°g������oP�@�<F��~�5��T����:<B �`��{�]C�e��(ɪ�-S�K�i�U/,vڛ(���].f����dغۑ��*����?�����f�岼��Ǟ����)�����@D�O�	m�)84�߇윟��3��h�d3�o��/)zM�\Z�ڦ� RD!�L��c�.�.��=���A�coذ���,]i�YN./�?�ʨ\ZN�<;=����;TE���i Xp�+J	��ö��/߾������͠��\0����f�ƻ��\r�utV\0���Dsq��ֹ򺷩DjA��գ�t~z>:G��|\r��V�C�Mc�����\'��_�yY�����Ã��^�Bv0�B�0��z�[>�\\>���Ç��td@^u[��1�w��7�p���~���`v��\r��:<��Ea�p--���I~mk�J�^���5x��i�����]9G��YY�>~0/.�>?t����-1�����q����ƍ��_<=}��Æ�\\����YKjH6\Z�X��(��]]k}���\\��:���S氟��iz��d�����)g�(N/��m��DV]�F�}��d�*N_�\'�� KpD�\r�#\n�፽v�w~1�(�a@����jK˂\0\Z+<�5��fʴ��4�|�I\"yG�<�$ְ����t��m��r�ތ&gy^Φ��w��p���=\0>x���|2;y~Q�e��@��\r@\rB�d�N�D��O���A@E���K�IdZ[X��{:�Ǐ3pK��ݭa?�-���e�����n�OV�K�g��F��䷿�-0���(<w�F�(����r�X�_L���0N\rm���tuՌ3��oo�;��x�\r*�v��8,�/�\n���0���,�Z���7������>}��r��G�V�a�<?��:c~�C�.k�&��J���Ý���[�Y������xr�e��xQ�0`��~��}|���{�PNO̸���������#1����������?�sn�CX곆���k��\'��cB<\0�_���ٟ�>9 <Y�h_}���8�LY[_���#~:�`�2:Z�Ѵu�ől\'�0Խv4��Ng�����Q$�$ư?�ه?{�e\Z_�D^��V\'¤8�,�|�>�i˲5�{�.o�OU5!�2�o��x�������\'�3k|+�!����ĸ�n0^����l��r�� B�1��P��,fg����,PQ]���J��(b�e���R�#;���1d���Z�qR@���A����_~���ee�,z�~��\ZU^����8;��/�U��L�����(��\0f,�}BK�\0cS�S ��(:��;�����<N����M�\0*\'�����hA���z���V?~�Gc���c$8\rlO�L.+*�9�PD:���aW��^s����`�Z�`��\r2���;�.�E���S\0�B�f�����?4�<��ͧ�$��\Z�q�P`铧���}�����k� ;I{����\"�u�l���V������v���~�{�?yt�u0C!+�>�+$�ՆV�t\r�DA�\\*�\\&�g��B�y��\"���#>\Z�1�U�����>:��.���D��X�(	v�7����{;�T�����h���������j�(��<�sBr�>���)_\rm	��^����ٜ\"���M\Z�\rBd�5�n2�4~�nx�ʊϧy�^�����{����Ǧ0��`T!`9��n�b^����\n�ٌ1Cm eQ����,�R\Z�`�\Z��`�}k��{tnZ@�X��ç����,:R�����C�*@]����pA��~���4=p�Z�����e���|�E�JjcJ|\0�OkB���s���[�_���/��B `��q�/7��k(� �@s �{5�(��0��j����7��&��.�����9BN�TqԢ����A\\A�aR�����7��������GFrH�4\'�Wb@�Hq�}s��(�\n\\V�J:L��fW��&��)L�ª����@�(�n|pp�Ո���JFZ%������n�E�X��f&B�p+yYZ�º���<�\0<>�h��8�i�a��NQ$�\r��1d��t�D?�\Zʬn��p{>_ ��7ъ��Q�m)���.2���B��:�E*�{()I��I�����\nM��B^��J�x�|�d��q\r_�&�<��m�t��WQd@,��2�<����lA~ ��|u��Vm�� ��ip3��	�6�Լ��t�E�. �����fM�M�q>�.|���9>��_A����b�e��\n�iXe��{!��,�i�x|^�k-4AR\r���V��G�Dp�t0O<���J�4�)����}�������j�����\r��ݤ\n[o\'�v�ב�������4�@)�	M�m�	����V��&��R��iX�\'|�)و׀$�>,���l̓�c�t��p0�-(k�ޢ9���k�\n*:(���YY�\\��TAx0.$����Mq x��o��$(���RHWp�E�*e�p&CU?;_���8�It�|���pO��S��:\0�\nn�ŐdXH=�?\"fF�WդEtDW�5�-Pz��H��WP͆�����:��#�?������gF����MڤG���i�)����B���� uw���@!JӧX�B��K���ă�v�� +tЇ�o�\r:Fq;�L\0���������*�����ƛ_�f���p\n\n������O�Էo��iaw��L��I�DL(�!#\0\0\0\0IEND�B`�',NULL,NULL,NULL,NULL,0,NULL,NULL,0,0,NULL,'r',NULL,'F',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ritu@gmail.com','6254625',1),(6,'166127','Vaishnavi R. Shirsath','166127','166127','CM',3,'ODD',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,0,NULL,'r',NULL,'F',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'r@gmail.com','1234567891',1),(7,'166128','Vedangi S. Bhavsar','166128','166128','CM',3,'ODD',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,0,NULL,'r',NULL,'F',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'v@gmail.com','671235716',1);
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
