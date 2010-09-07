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
INSERT INTO `word_tags` VALUES (1,'npcr'),(1,'chapter1'),(1,'firsttext'),(2,'npcr'),(2,'chapter1'),(2,'firsttext'),(3,'npcr'),(3,'chapter1'),(3,'firsttext'),(4,'npcr'),(4,'chapter1'),(4,'firsttext'),(4,'npcr_character'),(5,'npcr'),(5,'chapter1'),(5,'second_text'),(6,'npcr'),(6,'chapter1'),(6,'second_text'),(7,'npcr'),(7,'chapter1'),(7,'second_text'),(8,'npcr'),(8,'chapter1'),(8,'second_text'),(9,'npcr'),(9,'chapter1'),(9,'second_text'),(10,'npcr'),(10,'chapter1'),(10,'second_text'),(10,'npcr_character'),(11,'npcr'),(11,'chapter2'),(11,'first_text'),(12,'npcr'),(12,'chapter2'),(12,'first_text'),(13,'npcr'),(13,'chapter2'),(13,'first_text'),(14,'npcr'),(14,'chapter2'),(14,'first_text'),(15,'npcr'),(15,'chapter2'),(15,'first_text'),(16,'npcr'),(16,'chapter2'),(16,'first_text'),(17,'npcr'),(17,'chapter2'),(17,'first_text'),(18,'npcr'),(18,'chapter2'),(18,'first_text'),(19,'npcr'),(19,'chapter2'),(19,'first_text'),(20,'npcr'),(20,'chapter2'),(20,'first_text'),(21,'npcr'),(21,'chapter2'),(21,'second_text'),(22,'npcr'),(22,'chapter2'),(22,'second_text'),(23,'npcr'),(23,'chapter2'),(23,'second_text'),(24,'npcr'),(24,'chapter2'),(24,'second_text'),(24,'family'),(25,'npcr'),(25,'chapter2'),(25,'second_text'),(26,'npcr'),(26,'chapter2'),(26,'second_text'),(26,'food'),(27,'npcr'),(27,'chapter3'),(27,'first_text'),(28,'npcr'),(28,'chapter3'),(28,'first_text'),(29,'npcr'),(29,'chapter3'),(29,'first_text'),(30,'npcr'),(30,'chapter3'),(30,'first_text'),(31,'npcr'),(31,'chapter3'),(31,'first_text'),(32,'npcr'),(32,'chapter3'),(32,'first_text'),(33,'npcr'),(33,'chapter3'),(33,'first_text'),(34,'npcr'),(34,'chapter3'),(34,'first_text'),(35,'npcr'),(35,'chapter3'),(35,'first_text'),(35,'country'),(36,'npcr'),(36,'chapter3'),(36,'second_text'),(36,'polite'),(37,'npcr'),(37,'chapter3'),(37,'second_text'),(38,'npcr'),(38,'chapter3'),(38,'second_text'),(39,'npcr'),(39,'chapter3'),(39,'second_text'),(40,'npcr'),(40,'chapter3'),(40,'second_text'),(40,'family'),(41,'npcr'),(41,'chapter3'),(41,'second_text'),(41,'family'),(42,'npcr'),(42,'chapter3'),(42,'second_text'),(42,'npcr_character');
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
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `words`
--

LOCK TABLES `words` WRITE;
/*!40000 ALTER TABLE `words` DISABLE KEYS */;
INSERT INTO `words` VALUES (1,'你','ni3','you','Pr',1283727824),(2,'好','hao3','good; well; fine; OK','A',1283727907),(3,'陆雨平','Lu4 Yu3ping2','Name of the Chinese reporter in 新实用汉语课本','PN',1283728004),(4,'丁力波','Ding1 Li4bo1','Name of the Canadian student in 新实用汉语课本','PN',1283728100),(5,'吗','ma0','(interrogative particle for question expecting yes-no answer)','QPt',1283728159),(6,'我','wo3','I; me','Pr',1283728202),(7,'很','hen3','very','Adv',1283728227),(8,'呢','ne0','(a modal particle used for elliptical questions)','MdPt',1283728440),(9,'也','ye3','too; also','Adv',1283728466),(10,'林娜','Lin2Na4','Name of the British student in 新实用汉语课本','PN',1283728533),(11,'忙','mang2','busy','A',1283839660),(12,'爸爸','ba4ba0','dad','N',1283839713),(13,'妈妈','ma1ma0','mom','N',1283839736),(14,'他们','ta1men0','they; them','Pr',1283839760),(15,'他','ta1','he; him','Pr',1283839790),(16,'门','men0','(used after pronouns 我, 你, 他 or certain nouns to denote plural)','Suf',1283839835),(17,'都','dou1','both; all','Adv',1283839862),(18,'不','bu4','not; no','Adv',1283839882),(19,'男','nan2','male','A',1283839927),(20,'朋友','peng2you0','friend','N',1283839947),(21,'哥哥','ge1ge0','older brother','N',1283839991),(22,'要','yao4','to want','V',1283840015),(23,'咖啡','ka1fei1','coffee','N',1283840039),(24,'弟弟','di4di0','younger brother','N',1283840077),(25,'我们','wo3men0','we; us','Pr',1283840104),(26,'喝','he1','to drink','V',1283840158),(27,'她','ta1','she; her','Pr',1283840215),(28,'是','shi4','to be','V',1283840252),(29,'哪','na3','which','QPr',1283840399),(30,'国','guo2','country, nation','N',1283840423),(31,'人','ren2','people, person','N',1283840457),(32,'那','na4','that','Pr',1283840480),(33,'谁','shei2','who; whom','QPr',1283840505),(34,'老师','lao3shi1','teacher','N',1283840530),(35,'中国','Zhong1guo2','China','PN',1283840563),(36,'您','nin2','you (polite form)','Pr',1283840595),(37,'这','zhe4','this','Pr',1283840656),(38,'外语','wai4yu3','foreign language','N',1283840698),(39,'医生','yi1sheng1','doctor; physician','N',1283840917),(40,'奶奶','nai3nai0','paternal grandmother','N',1283841270),(41,'外婆','wai4po2','maternal grandmother','N',1283841307),(42,'陈老师','chen2lao3shi1','Mrs. Chen, Chinese teacher','PN',1283841374);
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

-- Dump completed on 2010-09-06 23:42:30
