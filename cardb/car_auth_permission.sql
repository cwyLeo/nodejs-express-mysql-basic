-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: car
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add auth group',7,'add_authgroup'),(26,'Can change auth group',7,'change_authgroup'),(27,'Can delete auth group',7,'delete_authgroup'),(28,'Can view auth group',7,'view_authgroup'),(29,'Can add auth group permissions',8,'add_authgrouppermissions'),(30,'Can change auth group permissions',8,'change_authgrouppermissions'),(31,'Can delete auth group permissions',8,'delete_authgrouppermissions'),(32,'Can view auth group permissions',8,'view_authgrouppermissions'),(33,'Can add auth permission',9,'add_authpermission'),(34,'Can change auth permission',9,'change_authpermission'),(35,'Can delete auth permission',9,'delete_authpermission'),(36,'Can view auth permission',9,'view_authpermission'),(37,'Can add auth user',10,'add_authuser'),(38,'Can change auth user',10,'change_authuser'),(39,'Can delete auth user',10,'delete_authuser'),(40,'Can view auth user',10,'view_authuser'),(41,'Can add auth user groups',11,'add_authusergroups'),(42,'Can change auth user groups',11,'change_authusergroups'),(43,'Can delete auth user groups',11,'delete_authusergroups'),(44,'Can view auth user groups',11,'view_authusergroups'),(45,'Can add auth user user permissions',12,'add_authuseruserpermissions'),(46,'Can change auth user user permissions',12,'change_authuseruserpermissions'),(47,'Can delete auth user user permissions',12,'delete_authuseruserpermissions'),(48,'Can view auth user user permissions',12,'view_authuseruserpermissions'),(49,'Can add classroom',13,'add_classroom'),(50,'Can change classroom',13,'change_classroom'),(51,'Can delete classroom',13,'delete_classroom'),(52,'Can view classroom',13,'view_classroom'),(53,'Can add course',14,'add_course'),(54,'Can change course',14,'change_course'),(55,'Can delete course',14,'delete_course'),(56,'Can view course',14,'view_course'),(57,'Can add department',15,'add_department'),(58,'Can change department',15,'change_department'),(59,'Can delete department',15,'delete_department'),(60,'Can view department',15,'view_department'),(61,'Can add django admin log',16,'add_djangoadminlog'),(62,'Can change django admin log',16,'change_djangoadminlog'),(63,'Can delete django admin log',16,'delete_djangoadminlog'),(64,'Can view django admin log',16,'view_djangoadminlog'),(65,'Can add django content type',17,'add_djangocontenttype'),(66,'Can change django content type',17,'change_djangocontenttype'),(67,'Can delete django content type',17,'delete_djangocontenttype'),(68,'Can view django content type',17,'view_djangocontenttype'),(69,'Can add django migrations',18,'add_djangomigrations'),(70,'Can change django migrations',18,'change_djangomigrations'),(71,'Can delete django migrations',18,'delete_djangomigrations'),(72,'Can view django migrations',18,'view_djangomigrations'),(73,'Can add django session',19,'add_djangosession'),(74,'Can change django session',19,'change_djangosession'),(75,'Can delete django session',19,'delete_djangosession'),(76,'Can view django session',19,'view_djangosession'),(77,'Can add instructor',20,'add_instructor'),(78,'Can change instructor',20,'change_instructor'),(79,'Can delete instructor',20,'delete_instructor'),(80,'Can view instructor',20,'view_instructor'),(81,'Can add student',21,'add_student'),(82,'Can change student',21,'change_student'),(83,'Can delete student',21,'delete_student'),(84,'Can view student',21,'view_student'),(85,'Can add testmodel test',22,'add_testmodeltest'),(86,'Can change testmodel test',22,'change_testmodeltest'),(87,'Can delete testmodel test',22,'delete_testmodeltest'),(88,'Can view testmodel test',22,'view_testmodeltest'),(89,'Can add time slot',23,'add_timeslot'),(90,'Can change time slot',23,'change_timeslot'),(91,'Can delete time slot',23,'delete_timeslot'),(92,'Can view time slot',23,'view_timeslot'),(93,'Can add advisor',24,'add_advisor'),(94,'Can change advisor',24,'change_advisor'),(95,'Can delete advisor',24,'delete_advisor'),(96,'Can view advisor',24,'view_advisor'),(97,'Can add prereq',25,'add_prereq'),(98,'Can change prereq',25,'change_prereq'),(99,'Can delete prereq',25,'delete_prereq'),(100,'Can view prereq',25,'view_prereq'),(101,'Can add section',26,'add_section'),(102,'Can change section',26,'change_section'),(103,'Can delete section',26,'delete_section'),(104,'Can view section',26,'view_section'),(105,'Can add takes',27,'add_takes'),(106,'Can change takes',27,'change_takes'),(107,'Can delete takes',27,'delete_takes'),(108,'Can view takes',27,'view_takes'),(109,'Can add teaches',28,'add_teaches'),(110,'Can change teaches',28,'change_teaches'),(111,'Can delete teaches',28,'delete_teaches'),(112,'Can view teaches',28,'view_teaches'),(113,'Can add build',29,'add_build'),(114,'Can change build',29,'change_build'),(115,'Can delete build',29,'delete_build'),(116,'Can view build',29,'view_build'),(117,'Can add buy',30,'add_buy'),(118,'Can change buy',30,'change_buy'),(119,'Can delete buy',30,'delete_buy'),(120,'Can view buy',30,'view_buy'),(121,'Can add car',31,'add_car'),(122,'Can change car',31,'change_car'),(123,'Can delete car',31,'delete_car'),(124,'Can view car',31,'view_car'),(125,'Can add customer',32,'add_customer'),(126,'Can change customer',32,'change_customer'),(127,'Can delete customer',32,'delete_customer'),(128,'Can view customer',32,'view_customer'),(129,'Can add industry',33,'add_industry'),(130,'Can change industry',33,'change_industry'),(131,'Can delete industry',33,'delete_industry'),(132,'Can view industry',33,'view_industry'),(133,'Can add sizes',34,'add_sizes'),(134,'Can change sizes',34,'change_sizes'),(135,'Can delete sizes',34,'delete_sizes'),(136,'Can view sizes',34,'view_sizes'),(137,'Can add base',35,'add_base'),(138,'Can change base',35,'change_base'),(139,'Can delete base',35,'delete_base'),(140,'Can view base',35,'view_base');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-16  0:21:09
