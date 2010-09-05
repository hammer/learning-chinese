-- MySQL dump 10.13  Distrib 5.1.49, for apple-darwin9.8.0 (i386)
--
-- Host: localhost    Database: learning_chinese
-- ------------------------------------------------------
-- Server version	5.1.49

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
-- Current Database: `learning_chinese`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `learning_chinese` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `learning_chinese`;

--
-- Table structure for table `quiz_words`
--

DROP TABLE IF EXISTS `quiz_words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz_words` (
  `quiz_id` int(11) DEFAULT NULL,
  `word_id` int(11) DEFAULT NULL,
  `attempts` int(11) DEFAULT NULL,
  `correct` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_words`
--

LOCK TABLES `quiz_words` WRITE;
/*!40000 ALTER TABLE `quiz_words` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiz_words` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quizzes`
--

DROP TABLE IF EXISTS `quizzes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quizzes` (
  `quiz_id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` text,
  `front` text,
  `time_entered` int(11) DEFAULT NULL,
  PRIMARY KEY (`quiz_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quizzes`
--

LOCK TABLES `quizzes` WRITE;
/*!40000 ALTER TABLE `quizzes` DISABLE KEYS */;
/*!40000 ALTER TABLE `quizzes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `word_examples`
--

DROP TABLE IF EXISTS `word_examples`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `word_examples` (
  `word_id` int(11) DEFAULT NULL,
  `example_use` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `word_examples`
--

LOCK TABLES `word_examples` WRITE;
/*!40000 ALTER TABLE `word_examples` DISABLE KEYS */;
/*!40000 ALTER TABLE `word_examples` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `word_tags`
--

DROP TABLE IF EXISTS `word_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `word_tags` (
  `word_id` int(11) DEFAULT NULL,
  `tag` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `word_tags`
--

LOCK TABLES `word_tags` WRITE;
/*!40000 ALTER TABLE `word_tags` DISABLE KEYS */;
INSERT INTO `word_tags` VALUES (1,'npcr'),(1,'chapter1'),(1,'firsttext'),(2,'npcr'),(2,'chapter1'),(2,'firsttext'),(3,'npcr'),(3,'chapter1'),(3,'firsttext'),(4,'npcr'),(4,'chapter1'),(4,'firsttext'),(4,'npcr_character'),(5,'npcr'),(5,'chapter1'),(5,'second_text'),(6,'npcr'),(6,'chapter1'),(6,'second_text'),(7,'npcr'),(7,'chapter1'),(7,'second_text'),(8,'npcr'),(8,'chapter1'),(8,'second_text'),(9,'npcr'),(9,'chapter1'),(9,'second_text'),(10,'npcr'),(10,'chapter1'),(10,'second_text'),(10,'npcr_character');
/*!40000 ALTER TABLE `word_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `words`
--

DROP TABLE IF EXISTS `words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `words` (
  `word_id` int(11) NOT NULL AUTO_INCREMENT,
  `hanzi` text,
  `pinyin` text,
  `english` text,
  `part_of_speech` text,
  `time_entered` int(11) DEFAULT NULL,
  PRIMARY KEY (`word_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `words`
--

LOCK TABLES `words` WRITE;
/*!40000 ALTER TABLE `words` DISABLE KEYS */;
INSERT INTO `words` VALUES (1,'你','ni3','you','Pr',1283727824),(2,'好','hao3','good; well; fine; OK','A',1283727907),(3,'陆雨平','Lu4 Yu3ping2','Name of the Chinese reporter in 新实用汉语课本','PN',1283728004),(4,'丁力波','Ding1 Li4bo1','Name of the Canadian student in 新实用汉语课本','PN',1283728100),(5,'吗','ma0','(interrogative particle for question expecting yes-no answer)','QPt',1283728159),(6,'我','wo3','I; me','Pr',1283728202),(7,'很','hen3','very','Adv',1283728227),(8,'呢','ne0','(a modal particle used for elliptical questions)','MdPt',1283728440),(9,'也','ye3','too; also','Adv',1283728466),(10,'林娜','Lin2Na4','Name of the British student in 新实用汉语课本','PN',1283728533);
/*!40000 ALTER TABLE `words` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-09-05 16:18:34
