-- MySQL dump 10.13  Distrib 5.5.27, for osx10.6 (i386)
--
-- Host: localhost    Database: geogame_django
-- ------------------------------------------------------
-- Server version	5.5.27

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_425ae3c4` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_1bb8f392` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add site',6,'add_site'),(17,'Can change site',6,'change_site'),(18,'Can delete site',6,'delete_site'),(19,'Can add log entry',7,'add_logentry'),(20,'Can change log entry',7,'change_logentry'),(21,'Can delete log entry',7,'delete_logentry'),(54,'Can delete road',18,'delete_road'),(53,'Can change road',18,'change_road'),(52,'Can add road',18,'add_road'),(25,'Can add item',9,'add_item'),(26,'Can change item',9,'change_item'),(27,'Can delete item',9,'delete_item'),(28,'Can add location',10,'add_location'),(29,'Can change location',10,'change_location'),(30,'Can delete location',10,'delete_location'),(31,'Can add action',11,'add_action'),(32,'Can change action',11,'change_action'),(33,'Can delete action',11,'delete_action'),(34,'Can add command',12,'add_command'),(35,'Can change command',12,'change_command'),(36,'Can delete command',12,'delete_command'),(37,'Can add message',13,'add_message'),(38,'Can change message',13,'change_message'),(39,'Can delete message',13,'delete_message'),(40,'Can add item type',14,'add_itemtype'),(41,'Can change item type',14,'change_itemtype'),(42,'Can delete item type',14,'delete_itemtype'),(43,'Can add synonym',15,'add_synonym'),(44,'Can change synonym',15,'change_synonym'),(45,'Can delete synonym',15,'delete_synonym'),(46,'Can add player',16,'add_player'),(47,'Can change player',16,'change_player'),(48,'Can delete player',16,'delete_player'),(49,'Can add accepted form',17,'add_acceptedform'),(50,'Can change accepted form',17,'change_acceptedform'),(51,'Can delete accepted form',17,'delete_acceptedform'),(55,'Can add visitor',19,'add_visitor'),(56,'Can change visitor',19,'change_visitor'),(57,'Can delete visitor',19,'delete_visitor'),(58,'Can add Untracked User-Agent',20,'add_untrackeduseragent'),(59,'Can change Untracked User-Agent',20,'change_untrackeduseragent'),(60,'Can delete Untracked User-Agent',20,'delete_untrackeduseragent'),(61,'Can add Banned IP',21,'add_bannedip'),(62,'Can change Banned IP',21,'change_bannedip'),(63,'Can delete Banned IP',21,'delete_bannedip');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'jerry','','','grapesmoker@gmail.com','pbkdf2_sha256$10000$ahhiP3kfUbDg$qwtPCiYilUYDL32gbGFGoINTuHOn0trduYBY2lfRMws=',1,1,1,'2013-05-10 12:07:48','2012-05-01 18:14:42'),(2,'joe','','','','pbkdf2_sha256$10000$mlbxuva4T07W$hjetGZ6WDp6yt3p6ZP7A3mphquoh6PLlbUWAR4XVN5c=',0,1,0,'2012-10-02 16:22:01','2012-05-08 09:42:36'),(3,'testplayer','','','','pbkdf2_sha256$10000$o1dPTLiO7NeN$m5ceHJBKCWhK875sUkBGkIB7ippMay/kizNkvuPdh3M=',0,1,0,'2012-09-24 12:38:34','2012-05-16 13:26:38'),(4,'test1','','','','pbkdf2_sha256$10000$oh9Uw4YGKC2A$RDRbRCKNFyW4BGK/mgEXeRx6m5uM7iNBnWcfnmYIlSo=',0,1,0,'2013-05-10 12:07:18','2012-05-16 13:52:49');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_403f60f` (`user_id`),
  KEY `auth_user_groups_425ae3c4` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_403f60f` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_403f60f` (`user_id`),
  KEY `django_admin_log_1bb8f392` (`content_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'content type','contenttypes','contenttype'),(5,'session','sessions','session'),(6,'site','sites','site'),(7,'log entry','admin','logentry'),(18,'road','geogame_core','road'),(9,'item','geogame_core','item'),(10,'location','geogame_core','location'),(11,'action','geogame_core','action'),(12,'command','geogame_core','command'),(13,'message','geogame_core','message'),(14,'item type','geogame_core','itemtype'),(15,'synonym','geogame_core','synonym'),(16,'player','geogame_core','player'),(17,'accepted form','geogame_core','acceptedform'),(19,'visitor','tracking','visitor'),(20,'Untracked User-Agent','tracking','untrackeduseragent'),(21,'Banned IP','tracking','bannedip');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_3da3d3d8` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('44524bb4c6b0a94f15199db6cfc18b18','OWJiZDUzYzNhODE0NjBlOWFmOGJkOWZmNDJhMzg2YTcxOGNmNDQ3NzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-05-21 15:43:13'),('659c2c88ad025901d6cf513e248c2313','MGJkN2Y2Njk4NjBjY2EzNTYwZjI3ZDRkYTFkNTExZDA4ODI1MGNkNjqAAn1xAShVCnRlc3Rjb29r\naWVVBndvcmtlZHECVQ1fYXV0aF91c2VyX2lkigECVRJfYXV0aF91c2VyX2JhY2tlbmRVKWRqYW5n\nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kdS4=\n','2012-05-22 10:48:38'),('e950367046383237d42a5695e2fe82d1','N2E3ODBiYWUwNGUyNzkwMjQ2MTNkNjUxNjZkOWU2N2RhMmFkNDY3NjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQJ1Lg==\n','2012-05-30 13:59:44'),('83d392aac214a065a2bbe6c8d81e532b','N2E3ODBiYWUwNGUyNzkwMjQ2MTNkNjUxNjZkOWU2N2RhMmFkNDY3NjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQJ1Lg==\n','2012-05-30 21:29:38'),('b1d396bbce9c8dbc4eaab0d61315e47b','N2E3ODBiYWUwNGUyNzkwMjQ2MTNkNjUxNjZkOWU2N2RhMmFkNDY3NjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQJ1Lg==\n','2012-06-09 00:24:36'),('2c89065e7f87f61bb0467b017261b5b9','ZTYzNmExYzFmYzVmY2NmMTI2NWMwOGM5YTQ3NTE5OWVkN2RjYTllMjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmRxAlUN\nX2F1dGhfdXNlcl9pZIoBBHUu\n','2012-08-01 15:41:59'),('494bb6acc0d5a3beed146f89c6a5e2b7','ZjExNjA2ZTliY2IxNmJhZTBlYjM3ZmJjYzczMTViZTQ2MWMwYzI2MDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmRxAlUN\nX2F1dGhfdXNlcl9pZIoBAnUu\n','2012-09-05 14:49:01'),('bd1ebfeb1c673a147b0e1967410fde5c','N2E3ODBiYWUwNGUyNzkwMjQ2MTNkNjUxNjZkOWU2N2RhMmFkNDY3NjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQJ1Lg==\n','2012-09-12 16:45:58'),('beceeef7bcb4624b19c9e6f66dac3a2b','YzhkNDk4MWJjMWFiOTMzYzk2YThjM2EyYWVlMmNiNTQwNjM2NjQ1ZDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQN1Lg==\n','2012-10-03 13:59:18'),('f47fe0165b98500bf41d45cccabcbddc','N2E3ODBiYWUwNGUyNzkwMjQ2MTNkNjUxNjZkOWU2N2RhMmFkNDY3NjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQJ1Lg==\n','2012-10-03 14:54:17'),('b826d469e904bb337e7d03b38c4e7b2c','ZGQ4NWYwYTFhMGY2Nzk2ODE4NWY2NjZiYzQ1Y2VkMmFmNDllZDVjMzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmRxAlUN\nX2F1dGhfdXNlcl9pZIoBAXUu\n','2012-10-08 12:34:30'),('edd297665fffbbb516af9fc14497aaee','YzhkNDk4MWJjMWFiOTMzYzk2YThjM2EyYWVlMmNiNTQwNjM2NjQ1ZDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQN1Lg==\n','2012-10-03 14:57:57'),('d8192b396e66fda2186007bc544623eb','OWJiZDUzYzNhODE0NjBlOWFmOGJkOWZmNDJhMzg2YTcxOGNmNDQ3NzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-10-08 12:38:18'),('199dfaae7994862b6b036dc3a5bb5c39','YzhkNDk4MWJjMWFiOTMzYzk2YThjM2EyYWVlMmNiNTQwNjM2NjQ1ZDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQN1Lg==\n','2012-10-08 12:38:34'),('ffa596a6e13abfbb15e07caff8a9c41b','N2E3ODBiYWUwNGUyNzkwMjQ2MTNkNjUxNjZkOWU2N2RhMmFkNDY3NjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQJ1Lg==\n','2012-10-08 12:38:52'),('640096cbd0436a2b7648a8677a448a44','N2E3ODBiYWUwNGUyNzkwMjQ2MTNkNjUxNjZkOWU2N2RhMmFkNDY3NjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQJ1Lg==\n','2012-10-16 16:22:01'),('18e75d91d5f1991093463bf3459d52cc','OWJiZDUzYzNhODE0NjBlOWFmOGJkOWZmNDJhMzg2YTcxOGNmNDQ3NzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-10-16 18:14:34'),('bee0c09aa945432bcab9acba156f52e8','OWJiZDUzYzNhODE0NjBlOWFmOGJkOWZmNDJhMzg2YTcxOGNmNDQ3NzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2013-05-24 12:07:48');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geogame_core_acceptedform`
--

DROP TABLE IF EXISTS `geogame_core_acceptedform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geogame_core_acceptedform` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `order` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `button1_text` varchar(100) NOT NULL,
  `button2_text` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geogame_core_acceptedform`
--

LOCK TABLES `geogame_core_acceptedform` WRITE;
/*!40000 ALTER TABLE `geogame_core_acceptedform` DISABLE KEYS */;
INSERT INTO `geogame_core_acceptedform` VALUES (1,'some form','butts',0,1,'accept','reject');
/*!40000 ALTER TABLE `geogame_core_acceptedform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geogame_core_action`
--

DROP TABLE IF EXISTS `geogame_core_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geogame_core_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_type` varchar(100) NOT NULL,
  `player_id` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `dest_player_id` int(11) DEFAULT NULL,
  `source_location_id` int(11) DEFAULT NULL,
  `dest_location_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `score_increase` int(11) DEFAULT NULL,
  `new_score` int(11) DEFAULT NULL,
  `location_items` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `source_location_id_refs_id_d4edaaa` (`source_location_id`),
  KEY `dest_location_id_refs_id_d4edaaa` (`dest_location_id`),
  KEY `item_id_refs_id_1d22498a` (`item_id`),
  KEY `player_id_refs_id_558a1556` (`player_id`),
  KEY `dest_player_id_refs_id_558a1556` (`dest_player_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geogame_core_action`
--

LOCK TABLES `geogame_core_action` WRITE;
/*!40000 ALTER TABLE `geogame_core_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `geogame_core_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geogame_core_command`
--

DROP TABLE IF EXISTS `geogame_core_command`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geogame_core_command` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geogame_core_command`
--

LOCK TABLES `geogame_core_command` WRITE;
/*!40000 ALTER TABLE `geogame_core_command` DISABLE KEYS */;
/*!40000 ALTER TABLE `geogame_core_command` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geogame_core_game`
--

DROP TABLE IF EXISTS `geogame_core_game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geogame_core_game` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `settings_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `settings_id_refs_id_4c53e8c6` (`settings_id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geogame_core_game`
--

LOCK TABLES `geogame_core_game` WRITE;
/*!40000 ALTER TABLE `geogame_core_game` DISABLE KEYS */;
INSERT INTO `geogame_core_game` VALUES (1,'2012-09-20 18:46:07','2012-09-20 18:46:13',1),(2,'2012-09-24 13:05:22','2012-09-24 13:15:22',1),(3,'2012-09-24 13:08:01','2012-09-24 13:18:01',1),(4,'2012-09-24 13:08:57','2012-09-24 13:18:57',1),(5,'2012-09-24 13:10:46','2012-09-24 13:20:46',1),(6,'2012-09-24 13:11:19','2012-09-24 13:21:19',1),(7,'2012-09-24 13:17:53','2012-09-24 13:27:52',1),(8,'2012-09-24 13:33:30','2012-09-24 13:43:29',1),(9,'2012-09-24 13:51:52','2012-09-24 14:01:52',1),(10,'2012-09-24 13:55:52','2012-09-24 14:05:52',1),(11,'2012-09-24 13:56:42','2012-09-24 14:06:42',1),(12,'2012-09-24 13:57:09','2012-09-24 14:07:09',1),(13,'2012-09-24 17:38:22','2012-09-24 17:48:22',1),(14,'2012-09-25 15:48:27','2012-09-25 15:58:26',1),(15,'2012-09-25 15:49:57','2012-09-25 15:59:57',1),(16,'2012-09-25 15:51:30','2012-09-25 16:01:30',1),(17,'2012-09-25 16:09:35','2012-09-25 16:19:35',1),(18,'2012-09-25 16:39:05','2012-09-25 16:49:04',1),(19,'2012-09-25 18:05:26','2012-09-25 18:15:26',1),(20,'2012-09-26 13:24:12','2012-09-26 13:34:12',1),(21,'2012-09-26 13:24:27','2012-09-26 13:34:27',1),(22,'2012-09-26 13:24:32','2012-09-26 13:34:32',1),(23,'2012-09-26 13:24:46','2012-09-26 13:34:46',1),(24,'2012-09-26 13:24:54','2012-09-26 13:34:54',1),(25,'2012-09-26 13:25:02','2012-09-26 13:35:01',1),(26,'2012-09-26 16:01:02','2012-09-26 16:11:02',1),(27,'2012-09-26 16:02:48','2012-09-26 16:12:48',1);
/*!40000 ALTER TABLE `geogame_core_game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geogame_core_game_participants`
--

DROP TABLE IF EXISTS `geogame_core_game_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geogame_core_game_participants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `game_id` (`game_id`,`player_id`),
  KEY `player_id_refs_id_7807cc2` (`player_id`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geogame_core_game_participants`
--

LOCK TABLES `geogame_core_game_participants` WRITE;
/*!40000 ALTER TABLE `geogame_core_game_participants` DISABLE KEYS */;
INSERT INTO `geogame_core_game_participants` VALUES (1,4,3),(2,4,1),(3,5,3),(4,5,1),(5,6,3),(6,6,1),(7,7,3),(8,7,1),(9,8,3),(10,8,1),(11,9,3),(12,9,1),(13,10,3),(14,10,1),(15,12,3),(16,12,1),(17,13,3),(18,13,1),(19,14,3),(20,14,1),(21,15,3),(22,15,1),(23,16,3),(24,16,1),(25,17,3),(26,17,1),(27,18,3),(28,18,1),(29,19,3),(30,19,1),(31,20,3),(32,20,1),(33,21,3),(34,21,1),(35,22,3),(36,22,1),(37,23,3),(38,23,1),(39,24,3),(40,24,1),(41,25,3),(42,25,1),(43,26,3),(44,26,1),(45,27,3),(46,27,1);
/*!40000 ALTER TABLE `geogame_core_game_participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geogame_core_item`
--

DROP TABLE IF EXISTS `geogame_core_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geogame_core_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) DEFAULT NULL,
  `item_type_id` int(11) NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `location_id_refs_id_2cd795c7` (`location_id`),
  KEY `item_type_id_refs_id_5c44cf09` (`item_type_id`),
  KEY `owner_id_refs_id_4de6775` (`owner_id`)
) ENGINE=MyISAM AUTO_INCREMENT=368 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geogame_core_item`
--

LOCK TABLES `geogame_core_item` WRITE;
/*!40000 ALTER TABLE `geogame_core_item` DISABLE KEYS */;
INSERT INTO `geogame_core_item` VALUES (1,NULL,10,NULL),(2,NULL,3,NULL),(3,NULL,11,NULL),(4,NULL,1,NULL),(5,NULL,1,NULL),(6,NULL,8,NULL),(7,NULL,2,NULL),(8,NULL,11,NULL),(9,NULL,12,NULL),(10,NULL,7,NULL),(11,NULL,3,NULL),(12,NULL,5,NULL),(13,NULL,2,NULL),(14,NULL,6,NULL),(15,NULL,4,NULL),(16,NULL,1,NULL),(17,NULL,4,NULL),(18,NULL,12,NULL),(19,NULL,8,NULL),(20,NULL,12,NULL),(21,NULL,5,NULL),(22,NULL,1,NULL),(23,NULL,8,NULL),(24,NULL,6,NULL),(25,NULL,5,NULL),(26,NULL,8,NULL),(27,NULL,3,NULL),(28,NULL,1,NULL),(29,NULL,7,NULL),(30,NULL,8,NULL),(31,NULL,10,NULL),(32,NULL,6,NULL),(33,NULL,6,NULL),(34,NULL,3,NULL),(35,NULL,8,NULL),(36,NULL,7,NULL),(37,NULL,12,NULL),(38,NULL,10,NULL),(39,NULL,4,NULL),(40,NULL,2,NULL),(41,NULL,10,NULL),(42,NULL,1,NULL),(43,NULL,8,NULL),(44,NULL,8,NULL),(45,NULL,5,NULL),(46,NULL,11,NULL),(47,NULL,5,NULL),(48,NULL,1,NULL),(49,NULL,3,NULL),(50,NULL,9,NULL),(51,NULL,5,NULL),(52,NULL,3,NULL),(53,NULL,6,NULL),(54,NULL,11,NULL),(55,NULL,2,NULL),(56,NULL,4,NULL),(57,NULL,12,NULL),(58,NULL,5,NULL),(59,NULL,3,NULL),(60,NULL,3,NULL),(61,NULL,4,NULL),(62,NULL,8,NULL),(63,NULL,1,NULL),(64,NULL,11,NULL),(65,NULL,12,NULL),(66,NULL,4,NULL),(67,NULL,1,NULL),(68,NULL,5,NULL),(69,NULL,4,NULL),(70,NULL,4,NULL),(71,NULL,3,NULL),(72,NULL,10,NULL),(73,NULL,10,NULL),(74,NULL,8,NULL),(75,NULL,11,NULL),(76,NULL,11,NULL),(77,NULL,6,NULL),(78,NULL,7,NULL),(79,NULL,10,NULL),(80,NULL,9,NULL),(81,NULL,9,NULL),(82,NULL,5,NULL),(83,NULL,1,NULL),(84,NULL,5,NULL),(85,NULL,2,NULL),(86,NULL,5,NULL),(87,NULL,5,NULL),(88,NULL,3,NULL),(89,NULL,2,NULL),(90,NULL,5,NULL),(91,NULL,6,NULL),(92,NULL,8,NULL),(93,NULL,7,NULL),(94,NULL,3,NULL),(95,NULL,9,NULL),(96,NULL,7,NULL),(97,NULL,12,NULL),(98,NULL,9,NULL),(99,NULL,2,NULL),(100,NULL,2,NULL),(101,NULL,11,NULL),(102,NULL,12,NULL),(103,NULL,11,NULL),(104,NULL,1,NULL),(105,NULL,1,NULL),(106,NULL,6,NULL),(107,NULL,7,NULL),(108,NULL,12,NULL),(109,NULL,9,NULL),(110,NULL,9,NULL),(111,NULL,5,NULL),(112,NULL,1,NULL),(113,NULL,1,NULL),(114,NULL,4,NULL),(115,NULL,8,NULL),(116,NULL,7,NULL),(117,NULL,8,NULL),(118,NULL,1,NULL),(119,NULL,7,NULL),(120,NULL,9,NULL),(121,NULL,7,NULL),(122,NULL,3,NULL),(123,NULL,2,NULL),(124,NULL,1,NULL),(125,NULL,8,NULL),(126,NULL,2,NULL),(127,NULL,12,NULL),(128,NULL,6,NULL),(129,NULL,7,NULL),(130,NULL,6,NULL),(131,NULL,1,NULL),(132,NULL,8,NULL),(133,NULL,9,NULL),(134,NULL,2,NULL),(135,NULL,6,NULL),(136,NULL,8,NULL),(137,NULL,9,NULL),(138,NULL,12,NULL),(139,NULL,6,NULL),(140,NULL,1,NULL),(141,NULL,8,NULL),(142,NULL,8,NULL),(143,NULL,8,NULL),(144,NULL,3,NULL),(145,NULL,3,NULL),(146,NULL,3,NULL),(147,NULL,5,NULL),(148,NULL,9,NULL),(149,NULL,9,NULL),(150,NULL,8,NULL),(151,NULL,9,NULL),(152,NULL,12,NULL),(153,NULL,1,NULL),(154,NULL,4,NULL),(155,NULL,5,NULL),(156,NULL,9,NULL),(157,NULL,4,NULL),(158,NULL,10,NULL),(159,NULL,9,NULL),(160,NULL,3,NULL),(161,NULL,3,NULL),(162,NULL,5,NULL),(163,NULL,12,NULL),(164,NULL,12,NULL),(165,NULL,11,NULL),(166,NULL,4,NULL),(167,NULL,8,NULL),(168,NULL,5,NULL),(169,NULL,7,NULL),(170,NULL,9,NULL),(171,NULL,12,NULL),(172,NULL,8,NULL),(173,NULL,9,NULL),(174,NULL,5,NULL),(175,NULL,4,NULL),(176,NULL,9,NULL),(177,NULL,4,NULL),(178,NULL,7,NULL),(179,NULL,11,NULL),(180,NULL,12,NULL),(181,NULL,7,NULL),(182,NULL,8,NULL),(183,NULL,8,NULL),(184,NULL,1,NULL),(185,NULL,9,NULL),(186,NULL,2,NULL),(187,NULL,8,NULL),(188,NULL,4,NULL),(189,NULL,5,NULL),(190,NULL,3,NULL),(191,NULL,9,NULL),(192,NULL,8,NULL),(193,NULL,2,NULL),(194,NULL,1,NULL),(195,NULL,2,NULL),(196,NULL,11,NULL),(197,NULL,5,NULL),(198,NULL,8,NULL),(199,NULL,5,NULL),(200,NULL,4,NULL),(201,NULL,2,NULL),(202,NULL,11,NULL),(203,NULL,4,NULL),(204,NULL,11,NULL),(205,NULL,12,NULL),(206,NULL,2,NULL),(207,NULL,10,NULL),(208,NULL,4,NULL),(209,NULL,6,NULL),(210,NULL,3,NULL),(211,NULL,1,NULL),(212,NULL,3,NULL),(213,NULL,5,NULL),(214,NULL,12,NULL),(215,NULL,9,NULL),(216,NULL,9,NULL),(217,NULL,2,NULL),(218,NULL,9,NULL),(219,NULL,5,NULL),(220,NULL,4,NULL),(221,NULL,1,NULL),(222,NULL,8,NULL),(223,NULL,1,NULL),(224,NULL,4,NULL),(225,NULL,8,NULL),(226,NULL,5,NULL),(227,NULL,6,NULL),(228,NULL,2,NULL),(229,NULL,6,NULL),(230,NULL,1,NULL),(231,NULL,3,NULL),(232,NULL,5,NULL),(233,NULL,4,NULL),(234,NULL,9,NULL),(235,NULL,9,NULL),(236,NULL,4,NULL),(237,NULL,10,NULL),(238,NULL,6,NULL),(239,NULL,8,NULL),(240,NULL,6,NULL),(241,NULL,10,NULL),(242,NULL,1,NULL),(243,NULL,5,NULL),(244,NULL,2,NULL),(245,NULL,12,NULL),(246,NULL,9,NULL),(247,NULL,12,NULL),(248,NULL,7,NULL),(249,NULL,5,NULL),(250,NULL,1,NULL),(251,NULL,5,NULL),(252,NULL,5,NULL),(253,NULL,2,NULL),(254,NULL,7,NULL),(255,NULL,8,NULL),(256,NULL,5,NULL),(257,NULL,8,NULL),(258,NULL,8,NULL),(259,NULL,3,NULL),(260,NULL,6,NULL),(261,NULL,12,NULL),(262,NULL,4,NULL),(263,NULL,9,NULL),(264,NULL,5,NULL),(265,NULL,8,NULL),(266,NULL,7,NULL),(267,NULL,5,NULL),(268,NULL,10,NULL),(269,NULL,11,NULL),(270,NULL,3,NULL),(271,NULL,5,NULL),(272,NULL,11,NULL),(273,NULL,10,NULL),(274,NULL,1,NULL),(275,NULL,11,NULL),(276,NULL,8,NULL),(277,NULL,2,NULL),(278,NULL,12,NULL),(279,NULL,1,NULL),(280,NULL,5,NULL),(281,NULL,10,NULL),(282,NULL,1,NULL),(283,NULL,2,NULL),(284,NULL,8,NULL),(285,NULL,10,NULL),(286,NULL,12,NULL),(287,NULL,1,NULL),(288,NULL,6,NULL),(289,NULL,8,NULL),(290,NULL,8,NULL),(291,NULL,5,NULL),(292,NULL,8,NULL),(293,NULL,8,NULL),(294,NULL,11,NULL),(295,NULL,9,NULL),(296,NULL,12,NULL),(297,NULL,11,NULL),(298,NULL,7,NULL),(299,NULL,11,NULL),(300,NULL,10,NULL),(301,NULL,4,NULL),(302,NULL,10,NULL),(303,NULL,9,NULL),(304,NULL,12,NULL),(305,NULL,9,NULL),(306,NULL,12,NULL),(307,NULL,12,NULL),(308,NULL,12,NULL),(309,NULL,11,NULL),(310,NULL,4,NULL),(311,NULL,4,NULL),(312,NULL,3,NULL),(313,NULL,4,NULL),(314,NULL,1,NULL),(315,NULL,2,NULL),(316,NULL,11,NULL),(317,NULL,10,NULL),(318,NULL,11,NULL),(319,NULL,2,NULL),(320,NULL,12,NULL),(321,NULL,8,NULL),(322,NULL,4,NULL),(323,NULL,7,NULL),(324,NULL,5,NULL),(325,NULL,6,NULL),(326,NULL,10,NULL),(327,NULL,12,NULL),(328,NULL,6,NULL),(329,NULL,12,NULL),(330,NULL,6,NULL),(331,NULL,3,NULL),(332,NULL,11,NULL),(333,NULL,10,NULL),(334,NULL,10,NULL),(335,NULL,5,NULL),(336,NULL,8,NULL),(337,NULL,5,NULL),(338,NULL,5,22),(339,NULL,9,16),(340,NULL,3,5),(341,NULL,2,17),(342,NULL,2,45),(343,NULL,8,27),(344,NULL,10,6),(345,NULL,1,22),(346,NULL,9,36),(347,1,10,NULL),(348,NULL,3,11),(349,NULL,10,43),(350,NULL,11,21),(351,NULL,5,29),(352,NULL,12,9),(353,NULL,8,37),(354,NULL,2,27),(355,NULL,2,10),(356,NULL,1,18),(357,NULL,6,46),(358,NULL,3,28),(359,NULL,3,26),(360,NULL,8,35),(361,NULL,11,16),(362,NULL,9,2),(363,3,10,NULL),(364,1,10,NULL),(365,NULL,8,10),(366,NULL,10,46),(367,NULL,12,34);
/*!40000 ALTER TABLE `geogame_core_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geogame_core_itemtype`
--

DROP TABLE IF EXISTS `geogame_core_itemtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geogame_core_itemtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `replenishable` tinyint(1) NOT NULL,
  `icon` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geogame_core_itemtype`
--

LOCK TABLES `geogame_core_itemtype` WRITE;
/*!40000 ALTER TABLE `geogame_core_itemtype` DISABLE KEYS */;
INSERT INTO `geogame_core_itemtype` VALUES (1,'Man','',1,'man-person.png'),(2,'Rifle','',1,'rifle-gun.png'),(3,'Muffin','',1,'muffin-snack.png'),(4,'Diamond','',1,'gemstone-diamond.png'),(5,'Umbrella','',1,'umbrella-sunshade.png'),(6,'Hat','',1,'hat-cap.png'),(7,'Boat','',1,'boat-ship.png'),(8,'Bunny','',1,'bunny-rabbit.png'),(9,'Garbage','',1,'garbage-trash.png'),(10,'Rug','',1,'rug-carpet.png'),(11,'Box','',1,'box-crate.png'),(12,'Stone','',1,'stone-rock.png');
/*!40000 ALTER TABLE `geogame_core_itemtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geogame_core_itemtype_synonyms`
--

DROP TABLE IF EXISTS `geogame_core_itemtype_synonyms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geogame_core_itemtype_synonyms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemtype_id` int(11) NOT NULL,
  `synonym_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `itemtype_id` (`itemtype_id`,`synonym_id`),
  KEY `synonym_id_refs_id_15ba5a26` (`synonym_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geogame_core_itemtype_synonyms`
--

LOCK TABLES `geogame_core_itemtype_synonyms` WRITE;
/*!40000 ALTER TABLE `geogame_core_itemtype_synonyms` DISABLE KEYS */;
/*!40000 ALTER TABLE `geogame_core_itemtype_synonyms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geogame_core_location`
--

DROP TABLE IF EXISTS `geogame_core_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geogame_core_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `icon` varchar(500) NOT NULL,
  `location_type` int(11) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geogame_core_location`
--

LOCK TABLES `geogame_core_location` WRITE;
/*!40000 ALTER TABLE `geogame_core_location` DISABLE KEYS */;
INSERT INTO `geogame_core_location` VALUES (1,'Rome','/static/palace-2.png',0,73.112183,106.27075),(2,'Brussels','/static/palace-2.png',0,73.055842,106.47537),(3,'Normandy','/static/palace-2.png',0,72.9727976361735,106.701965332031),(4,'Thessalonica','/static/palace-2.png',0,72.8731887038633,107.175750732422),(5,'Paris','/static/palace-2.png',0,73.1504399116301,107.020568847656),(6,'Orleans','/static/palace-2.png',0,73.1468569855831,107.679748535156),(7,'Bratislava','/static/palace-2.png',0,73.1101890627716,108.297729492188),(8,'Geneva','/static/palace-2.png',0,73.0149710340272,107.200469970703),(9,'Nilan','/static/palace-2.png',0,72.9554973127264,107.906341552734),(10,'Vienna','/static/palace-2.png',0,72.9760144204706,108.4130859375),(11,'Moscow','/static/palace-2.png',0,73.022591571473,108.715209960938),(12,'Munich','/static/palace-2.png',0,73.1488475913752,108.907470703125),(13,'Pittsburgh','/static/palace-2.png',0,72.7314816244933,108.056030273438),(14,'Guatemala','/static/palace-2.png',0,72.5190565510343,108.967895507812),(15,'Brisbane','/static/palace-2.png',0,72.8266194333168,109.758911132812),(16,'Quito','/static/palace-2.png',0,72.5865833008186,107.102966308594),(17,'Havana','/static/palace-2.png',0,72.6563137137099,106.388854980469),(18,'Miami','/static/palace-2.png',0,72.7485951908625,105.155639648438),(19,'Acapulco','/static/palace-2.png',0,72.4396784729713,109.989624023438),(20,'Trondheim','/static/palace-2.png',0,73.4894164056444,107.990112304688),(21,'Sandefjord','/static/palace-2.png',0,73.6262403302411,107.42431640625),(22,'Drammen','/static/palace-2.png',0,73.6664541134991,106.166381835938),(23,'Columbus','/static/palace-2.png',0,73.4987805176733,104.600830078125),(24,'Dallas','/static/palace-2.png',0,73.2567931598763,103.815307617188),(25,'Guyana','/static/palace-2.png',0,72.9357621982559,106.056518554688),(26,'Montevideo','/static/palace-2.png',0,72.2823815710573,105.122680664062),(27,'Fredrikstad','/static/palace-2.png',0,73.8217595470377,106.885986328125),(28,'Baltimore','/static/palace-2.png',0,73.4064754274297,105.606079101562),(29,'Berkeley','/static/palace-2.png',0,73.0546416586511,103.809814453125),(30,'Anaheim','/static/palace-2.png',0,73.2994673570081,104.688720703125),(31,'Bogota','/static/palace-2.png',0,72.9067234344271,105.66650390625),(32,'Caracas','/static/palace-2.png',0,72.0705296991607,109.27001953125),(33,'Lima','/static/palace-2.png',0,72.7770812644007,109.039306640625),(34,'Sydney','/static/palace-2.png',0,73.0322127704276,109.62158203125),(35,'Springfield','/static/palace-2.png',0,73.0450328039299,103.16162109375),(36,'Monterey','/static/palace-2.png',0,73.2773532019247,108.446044921875),(37,'Farsund','/static/palace-2.png',0,73.346759201486,107.2265625),(38,'Chicago','/static/palace-2.png',0,73.0065444723843,105.5126953125),(39,'Ames','/static/palace-2.png',0,73.2425449028121,105.35888671875),(40,'Santiago','/static/palace-2.png',0,72.6759532561552,107.413330078125),(41,'Recife','/static/palace-2.png',0,72.7412628197648,106.907958984375),(42,'Narvik','/static/palace-2.png',0,73.3373112539892,106.67724609375),(43,'Asuncion','/static/palace-2.png',0,72.2321614349197,109.70947265625),(44,'Newark','/static/palace-2.png',0,73.0834365174476,104.974365234375),(45,'Panajachel','/static/palace-2.png',0,73.5096987893116,106.842041015625),(46,'Panama','/static/palace-2.png',0,72.3224587326886,108.96240234375);
/*!40000 ALTER TABLE `geogame_core_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geogame_core_message`
--

DROP TABLE IF EXISTS `geogame_core_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geogame_core_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time_sent` date NOT NULL,
  `sender_id` int(11) NOT NULL,
  `content` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sender_id_refs_id_2c83f06a` (`sender_id`)
) ENGINE=MyISAM AUTO_INCREMENT=485 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geogame_core_message`
--

LOCK TABLES `geogame_core_message` WRITE;
/*!40000 ALTER TABLE `geogame_core_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `geogame_core_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geogame_core_message_recipient`
--

DROP TABLE IF EXISTS `geogame_core_message_recipient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geogame_core_message_recipient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `message_id` (`message_id`,`player_id`),
  KEY `player_id_refs_id_3805ba64` (`player_id`)
) ENGINE=MyISAM AUTO_INCREMENT=942 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geogame_core_message_recipient`
--

LOCK TABLES `geogame_core_message_recipient` WRITE;
/*!40000 ALTER TABLE `geogame_core_message_recipient` DISABLE KEYS */;
/*!40000 ALTER TABLE `geogame_core_message_recipient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geogame_core_player`
--

DROP TABLE IF EXISTS `geogame_core_player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geogame_core_player` (
  `score` int(11) DEFAULT '0',
  `moving_flag` tinyint(1) NOT NULL DEFAULT '0',
  `accepted_forms_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `assigned_item_id` int(11) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `geogame_core_player_3b7e7dd` (`accepted_forms_id`),
  KEY `geogame_core_player_319d859` (`location_id`),
  KEY `assigned_item_id_refs_id_7fa65ae9` (`assigned_item_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geogame_core_player`
--

LOCK TABLES `geogame_core_player` WRITE;
/*!40000 ALTER TABLE `geogame_core_player` DISABLE KEYS */;
INSERT INTO `geogame_core_player` VALUES (0,0,1,31,1,1,10,0),(0,0,1,1,2,2,NULL,1),(0,0,1,13,3,3,10,0);
/*!40000 ALTER TABLE `geogame_core_player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geogame_core_player_messages`
--

DROP TABLE IF EXISTS `geogame_core_player_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geogame_core_player_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `player_id` (`player_id`,`message_id`),
  KEY `message_id_refs_id_4e75a106` (`message_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geogame_core_player_messages`
--

LOCK TABLES `geogame_core_player_messages` WRITE;
/*!40000 ALTER TABLE `geogame_core_player_messages` DISABLE KEYS */;
INSERT INTO `geogame_core_player_messages` VALUES (1,2,1);
/*!40000 ALTER TABLE `geogame_core_player_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geogame_core_player_neighbors`
--

DROP TABLE IF EXISTS `geogame_core_player_neighbors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geogame_core_player_neighbors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_player_id` int(11) NOT NULL,
  `to_player_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `from_player_id` (`from_player_id`,`to_player_id`),
  KEY `to_player_id_refs_id_435a0c55` (`to_player_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geogame_core_player_neighbors`
--

LOCK TABLES `geogame_core_player_neighbors` WRITE;
/*!40000 ALTER TABLE `geogame_core_player_neighbors` DISABLE KEYS */;
INSERT INTO `geogame_core_player_neighbors` VALUES (1,3,1),(2,1,3);
/*!40000 ALTER TABLE `geogame_core_player_neighbors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geogame_core_road`
--

DROP TABLE IF EXISTS `geogame_core_road`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geogame_core_road` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `location1_id` int(11) NOT NULL,
  `location2_id` int(11) NOT NULL,
  `road_points` longtext NOT NULL,
  `length` int(11) NOT NULL,
  `travel_duration` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `geogame_core_road_1fdb98d7` (`location1_id`),
  KEY `geogame_core_road_16ba8a74` (`location2_id`)
) ENGINE=MyISAM AUTO_INCREMENT=166 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geogame_core_road`
--

LOCK TABLES `geogame_core_road` WRITE;
/*!40000 ALTER TABLE `geogame_core_road` DISABLE KEYS */;
INSERT INTO `geogame_core_road` VALUES (84,'Road10',1,2,'',0,15000),(85,'Road11',3,2,'',0,15000),(86,'Road10',1,5,'',0,15000),(87,'Road11',5,6,'',0,15000),(88,'Road12',5,8,'',0,15000),(89,'Road13',8,6,'',0,15000),(90,'Road14',8,4,'',0,15000),(91,'Road15',8,9,'',0,15000),(92,'Road16',9,7,'',0,15000),(93,'Road17',3,5,'',0,15000),(94,'Road10',7,10,'',0,15000),(95,'Road11',10,11,'',0,15000),(96,'Road12',12,11,'',0,15000),(97,'Road13',7,12,'',0,15000),(98,'Road14',10,13,'',0,15000),(99,'Road17',20,21,'',0,15000),(100,'Road18',22,21,'',0,15000),(101,'Road19',11,15,'',0,15000),(102,'Road20',13,14,'',0,15000),(103,'Road21',13,16,'',0,15000),(104,'Road22',17,16,'',0,15000),(105,'Road23',17,18,'',0,15000),(106,'Road24',23,22,'',0,15000),(107,'Road25',24,23,'',0,15000),(108,'Road10',14,19,'',0,15000),(109,'Road11',18,26,'',0,15000),(110,'Road19',26,17,'',0,15000),(111,'Road20',25,17,'',0,15000),(112,'Road21',19,15,'',0,15000),(113,'Road10',23,28,'',0,15000),(114,'Road11',21,27,'',0,15000),(115,'Road13',22,27,'',0,15000),(116,'Road10',24,29,'',0,15000),(117,'Road12',23,30,'',0,15000),(118,'Road15',25,31,'',0,15000),(119,'Road21',21,37,'',0,15000),(120,'Road22',37,20,'',0,15000),(121,'Road23',28,22,'',0,15000),(122,'Road24',30,28,'',0,15000),(123,'Road25',35,29,'',0,15000),(124,'Road31',15,33,'',0,15000),(125,'Road32',33,11,'',0,15000),(126,'Road33',13,33,'',0,15000),(127,'Road34',38,31,'',0,15000),(128,'Road35',39,38,'',0,15000),(129,'Road36',28,39,'',0,15000),(130,'Road37',39,30,'',0,15000),(131,'Road58',4,40,'',0,15000),(132,'Road59',41,16,'',0,15000),(133,'Road60',41,17,'',0,15000),(134,'Road61',40,13,'',0,15000),(135,'Road67',28,42,'',0,15000),(136,'Road68',37,42,'',0,15000),(137,'Road69',5,37,'',0,15000),(138,'Road72',3,4,'',0,15000),(139,'Road73',1,39,'',0,15000),(140,'Road74',36,12,'',0,15000),(141,'Road75',36,7,'',0,15000),(142,'Road10',35,24,'',0,15000),(143,'Road11',35,23,'',0,15000),(144,'Road12',18,38,'',0,15000),(145,'Road13',18,31,'',0,15000),(146,'Road14',30,18,'',0,15000),(147,'Road15',34,15,'',0,15000),(148,'Road16',34,12,'',0,15000),(149,'Road17',34,11,'',0,15000),(150,'Road19',9,13,'',0,15000),(151,'Road21',36,6,'',0,15000),(152,'Road22',37,45,'',0,15000),(153,'Road23',21,45,'',0,15000),(154,'Road24',42,45,'',0,15000),(155,'Road26',39,44,'',0,15000),(156,'Road27',30,44,'',0,15000),(157,'Road30',46,32,'',0,15000),(158,'Road31',32,43,'',0,15000),(159,'Road32',43,46,'',0,15000),(160,'Road33',46,13,'',0,15000),(161,'Road34',46,14,'',0,15000),(162,'Road35',43,19,'',0,15000),(163,'Road36',46,19,'',0,15000),(164,'Road37',26,16,'',0,15000),(165,'Road10',29,30,'',0,15000);
/*!40000 ALTER TABLE `geogame_core_road` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geogame_core_settings`
--

DROP TABLE IF EXISTS `geogame_core_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geogame_core_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_duration` int(11) NOT NULL,
  `network_type` varchar(100) NOT NULL,
  `graph_density` double NOT NULL,
  `average_degree` double NOT NULL,
  `rebuild_user_network` tinyint(1) NOT NULL,
  `rebuild_road_network` tinyint(1) NOT NULL,
  `new_item_assignment` tinyint(1) NOT NULL,
  `communication_allowed` tinyint(1) NOT NULL,
  `min_road_time` int(11) NOT NULL,
  `max_road_time` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geogame_core_settings`
--

LOCK TABLES `geogame_core_settings` WRITE;
/*!40000 ALTER TABLE `geogame_core_settings` DISABLE KEYS */;
INSERT INTO `geogame_core_settings` VALUES (1,10,'SMALL_WORLD',3,1,1,1,1,1,10,15,'settings 1');
/*!40000 ALTER TABLE `geogame_core_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geogame_core_synonym`
--

DROP TABLE IF EXISTS `geogame_core_synonym`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geogame_core_synonym` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geogame_core_synonym`
--

LOCK TABLES `geogame_core_synonym` WRITE;
/*!40000 ALTER TABLE `geogame_core_synonym` DISABLE KEYS */;
/*!40000 ALTER TABLE `geogame_core_synonym` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracking_bannedip`
--

DROP TABLE IF EXISTS `tracking_bannedip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tracking_bannedip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` char(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracking_bannedip`
--

LOCK TABLES `tracking_bannedip` WRITE;
/*!40000 ALTER TABLE `tracking_bannedip` DISABLE KEYS */;
/*!40000 ALTER TABLE `tracking_bannedip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracking_untrackeduseragent`
--

DROP TABLE IF EXISTS `tracking_untrackeduseragent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tracking_untrackeduseragent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracking_untrackeduseragent`
--

LOCK TABLES `tracking_untrackeduseragent` WRITE;
/*!40000 ALTER TABLE `tracking_untrackeduseragent` DISABLE KEYS */;
/*!40000 ALTER TABLE `tracking_untrackeduseragent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracking_visitor`
--

DROP TABLE IF EXISTS `tracking_visitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tracking_visitor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_key` varchar(40) NOT NULL,
  `ip_address` varchar(20) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_agent` varchar(255) NOT NULL,
  `referrer` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `page_views` int(10) unsigned NOT NULL,
  `session_start` datetime NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `session_key` (`session_key`,`ip_address`),
  KEY `tracking_visitor_403f60f` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracking_visitor`
--

LOCK TABLES `tracking_visitor` WRITE;
/*!40000 ALTER TABLE `tracking_visitor` DISABLE KEYS */;
INSERT INTO `tracking_visitor` VALUES (1,'494bb6acc0d5a3beed146f89c6a5e2b7','127.0.0.1',2,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.79 Safari/537.1','unknown','/favicon.ico',36,'2012-08-22 14:48:37','2012-08-22 16:16:06'),(2,'bd1ebfeb1c673a147b0e1967410fde5c','127.0.0.1',2,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_0) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.89 Safari/537.1','unknown','/favicon.ico',44,'2012-09-10 13:28:41','2012-09-10 14:24:23'),(3,'beceeef7bcb4624b19c9e6f66dac3a2b','127.0.0.1',3,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_4) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.89 Safari/537.1','unknown','/favicon.ico',28,'2012-09-19 13:48:49','2012-09-19 14:08:00'),(4,'','127.0.0.1',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:15.0) Gecko/20100101 Firefox/15.0.1','unknown','/accounts/login/',8,'2012-09-19 14:50:34','2012-09-19 14:55:24');
/*!40000 ALTER TABLE `tracking_visitor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-05-10 13:12:25
