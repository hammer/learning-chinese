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
INSERT INTO `word_tags` VALUES (1,'npcr'),(1,'chapter1'),(1,'firsttext'),(2,'npcr'),(2,'chapter1'),(2,'firsttext'),(3,'npcr'),(3,'chapter1'),(3,'firsttext'),(4,'npcr'),(4,'chapter1'),(4,'firsttext'),(4,'npcr_character'),(5,'npcr'),(5,'chapter1'),(5,'second_text'),(6,'npcr'),(6,'chapter1'),(6,'second_text'),(7,'npcr'),(7,'chapter1'),(7,'second_text'),(8,'npcr'),(8,'chapter1'),(8,'second_text'),(9,'npcr'),(9,'chapter1'),(9,'second_text'),(10,'npcr'),(10,'chapter1'),(10,'second_text'),(10,'npcr_character'),(11,'npcr'),(11,'chapter2'),(11,'first_text'),(12,'npcr'),(12,'chapter2'),(12,'first_text'),(13,'npcr'),(13,'chapter2'),(13,'first_text'),(14,'npcr'),(14,'chapter2'),(14,'first_text'),(15,'npcr'),(15,'chapter2'),(15,'first_text'),(16,'npcr'),(16,'chapter2'),(16,'first_text'),(17,'npcr'),(17,'chapter2'),(17,'first_text'),(18,'npcr'),(18,'chapter2'),(18,'first_text'),(19,'npcr'),(19,'chapter2'),(19,'first_text'),(20,'npcr'),(20,'chapter2'),(20,'first_text'),(21,'npcr'),(21,'chapter2'),(21,'second_text'),(22,'npcr'),(22,'chapter2'),(22,'second_text'),(23,'npcr'),(23,'chapter2'),(23,'second_text'),(24,'npcr'),(24,'chapter2'),(24,'second_text'),(24,'family'),(25,'npcr'),(25,'chapter2'),(25,'second_text'),(26,'npcr'),(26,'chapter2'),(26,'second_text'),(26,'food'),(27,'npcr'),(27,'chapter3'),(27,'first_text'),(28,'npcr'),(28,'chapter3'),(28,'first_text'),(29,'npcr'),(29,'chapter3'),(29,'first_text'),(30,'npcr'),(30,'chapter3'),(30,'first_text'),(31,'npcr'),(31,'chapter3'),(31,'first_text'),(32,'npcr'),(32,'chapter3'),(32,'first_text'),(33,'npcr'),(33,'chapter3'),(33,'first_text'),(34,'npcr'),(34,'chapter3'),(34,'first_text'),(35,'npcr'),(35,'chapter3'),(35,'first_text'),(35,'country'),(36,'npcr'),(36,'chapter3'),(36,'second_text'),(36,'polite'),(37,'npcr'),(37,'chapter3'),(37,'second_text'),(38,'npcr'),(38,'chapter3'),(38,'second_text'),(39,'npcr'),(39,'chapter3'),(39,'second_text'),(40,'npcr'),(40,'chapter3'),(40,'second_text'),(40,'family'),(41,'npcr'),(41,'chapter3'),(41,'second_text'),(41,'family'),(42,'npcr'),(42,'chapter3'),(42,'second_text'),(42,'npcr_character'),(43,'npcr'),(43,'chapter4'),(43,'first_text'),(44,'npcr'),(44,'chapter4'),(44,'first_text'),(45,'npcr'),(45,'chapter4'),(45,'first_text'),(46,'npcr'),(46,'chapter4'),(46,'first_text'),(47,'npcr'),(47,'chapter4'),(47,'first_text'),(48,'npcr'),(48,'chapter4'),(48,'first_text'),(49,'npcr'),(49,'chapter4'),(49,'first_text'),(50,'npcr'),(50,'chapter4'),(50,'first_text'),(50,'job'),(51,'npcr'),(51,'chapter4'),(51,'first_text'),(52,'npcr'),(52,'chapter4'),(52,'first_text'),(53,'npcr'),(53,'chapter4'),(53,'first_text'),(54,'npcr'),(54,'chapter4'),(54,'first_text'),(55,'npcr'),(55,'chapter4'),(55,'first_text'),(56,'npcr'),(56,'chapter4'),(56,'first_text'),(57,'npcr'),(57,'chapter4'),(57,'first_text'),(57,'npcr_character'),(58,'npcr'),(58,'chapter4'),(58,'second_text'),(59,'npcr'),(59,'chapter4'),(59,'second_text'),(60,'npcr'),(60,'chapter4'),(60,'second_text'),(61,'npcr'),(61,'chapter4'),(61,'second_text'),(62,'npcr'),(62,'chapter4'),(62,'second_text'),(63,'npcr'),(63,'chapter4'),(63,'second_text'),(64,'npcr'),(64,'chapter4'),(64,'second_text'),(65,'npcr'),(65,'chapter2'),(65,'second_text'),(65,'country'),(66,'npcr'),(66,'chapter4'),(66,'second_text'),(66,'npcr_character'),(67,'npcr'),(67,'chapter4'),(67,'second_text'),(67,'country'),(68,'npcr'),(68,'chapter4'),(68,'second_text'),(68,'country'),(69,'npcr'),(69,'chapter5'),(69,'first_text'),(70,'npcr'),(70,'chapter5'),(70,'first_text'),(71,'npcr'),(71,'chapter5'),(71,'first_text'),(72,'npcr'),(72,'chapter5'),(72,'first_text'),(73,'npcr'),(73,'chapter5'),(73,'first_text'),(73,'gender'),(74,'npcr'),(74,'chapter5'),(74,'first_text'),(75,'npcr'),(75,'chapter5'),(75,'first_text'),(76,'npcr'),(76,'chapter5'),(76,'first_text'),(77,'npcr'),(77,'chapter5'),(77,'first_text'),(78,'npcr'),(78,'chapter5'),(78,'first_text'),(79,'npcr'),(79,'chapter5'),(79,'first_text'),(80,'npcr'),(80,'chapter5'),(80,'first_text'),(81,'npcr'),(81,'chapter5'),(81,'first_text'),(81,'npcr_character'),(82,'npcr'),(82,'chapter5'),(82,'second_text'),(83,'npcr'),(83,'chapter5'),(83,'second_text'),(83,'number'),(84,'npcr'),(84,'chapter5'),(84,'second_text'),(85,'npcr'),(85,'chapter5'),(85,'second_text'),(85,'number'),(86,'npcr'),(86,'chapter5'),(86,'second_text'),(86,'number'),(87,'npcr'),(87,'chapter5'),(87,'second_text'),(88,'npcr'),(88,'chapter5'),(88,'second_text'),(89,'npcr'),(89,'chapter5'),(89,'second_text'),(90,'npcr'),(90,'chapter3'),(90,'second_text'),(90,'time'),(91,'npcr'),(91,'chapter5'),(91,'second_text'),(92,'npcr'),(92,'chapter5'),(92,'second_text'),(92,'npcr_character');
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
) ENGINE=MyISAM AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `words`
--

LOCK TABLES `words` WRITE;
/*!40000 ALTER TABLE `words` DISABLE KEYS */;
INSERT INTO `words` VALUES (1,'你','ni3','you','Pr',1283727824),(2,'好','hao3','good; well; fine; OK','A',1283727907),(3,'陆雨平','Lu4 Yu3ping2','Name of the Chinese reporter in 新实用汉语课本','PN',1283728004),(4,'丁力波','Ding1 Li4bo1','Name of the Canadian student in 新实用汉语课本','PN',1283728100),(5,'吗','ma0','(interrogative particle for question expecting yes-no answer)','QPt',1283728159),(6,'我','wo3','I; me','Pr',1283728202),(7,'很','hen3','very','Adv',1283728227),(8,'呢','ne0','(a modal particle used for elliptical questions)','MdPt',1283728440),(9,'也','ye3','too; also','Adv',1283728466),(10,'林娜','Lin2Na4','Name of the British student in 新实用汉语课本','PN',1283728533),(11,'忙','mang2','busy','A',1283839660),(12,'爸爸','ba4ba0','dad','N',1283839713),(13,'妈妈','ma1ma0','mom','N',1283839736),(14,'他们','ta1men0','they; them','Pr',1283839760),(15,'他','ta1','he; him','Pr',1283839790),(16,'门','men0','(used after pronouns 我, 你, 他 or certain nouns to denote plural)','Suf',1283839835),(17,'都','dou1','both; all','Adv',1283839862),(18,'不','bu4','not; no','Adv',1283839882),(19,'男','nan2','male','A',1283839927),(20,'朋友','peng2you0','friend','N',1283839947),(21,'哥哥','ge1ge0','older brother','N',1283839991),(22,'要','yao4','to want','V',1283840015),(23,'咖啡','ka1fei1','coffee','N',1283840039),(24,'弟弟','di4di0','younger brother','N',1283840077),(25,'我们','wo3men0','we; us','Pr',1283840104),(26,'喝','he1','to drink','V',1283840158),(27,'她','ta1','she; her','Pr',1283840215),(28,'是','shi4','to be','V',1283840252),(29,'哪','na3','which','QPr',1283840399),(30,'国','guo2','country, nation','N',1283840423),(31,'人','ren2','people, person','N',1283840457),(32,'那','na4','that','Pr',1283840480),(33,'谁','shei2','who; whom','QPr',1283840505),(34,'老师','lao3shi1','teacher','N',1283840530),(35,'中国','Zhong1guo2','China','PN',1283840563),(36,'您','nin2','you (polite form)','Pr',1283840595),(37,'这','zhe4','this','Pr',1283840656),(38,'外语','wai4yu3','foreign language','N',1283840698),(39,'医生','yi1sheng1','doctor; physician','N',1283840917),(40,'奶奶','nai3nai0','paternal grandmother','N',1283841270),(41,'外婆','wai4po2','maternal grandmother','N',1283841307),(42,'陈老师','chen2lao3shi1','Mrs. Chen, Chinese teacher','PN',1283841374),(43,'认识','ren4shi0','to know (somebody)','V',1283934050),(44,'高兴','gao1xing4','happy; pleased','A',1283934075),(45,'可以','ke3yi3','may','OpV',1283934100),(46,'进来','jin4lai0','to come in','VC',1283934131),(47,'进','jin4','to enter','V',1283934153),(48,'来','lai2','to come','V',1283934175),(49,'请','qing3','please','V',1283934230),(50,'记者','ji4zhe3','reporter','N',1283934305),(51,'请问','qing3wen4','May I ask...?','V',1283934825),(52,'问','wen4','to ask','V',1283934847),(53,'贵姓','gui4xing4','what is your honorable surname?','IE',1283934889),(54,'姓','xing4','surname','V/N',1283934931),(55,'叫','jiao4','to be called','V',1283934952),(56,'先生','xian1sheng0','Mr.','N',1283934976),(57,'杨老师','yang2lao3shi1','Mr. Yang, Chinese teacher','PN',1283935068),(58,'语言','yu3yan2','language','N',1283935107),(59,'学院','xue2yuan4','institute; college','N',1283935141),(60,'的','de0','(a possessive or modifying particle)','Pt',1283935184),(61,'学生','xue2sheng0','student','N',1283935205),(62,'什么','shen2me0','what','QPr',1283935231),(63,'学习','xue2xi2','to learn; to study','V',1283935263),(64,'汉语','Han2yu3','Chinese (language)','N',1283935297),(65,'英国','Ying1guo2','Great Britain; England','PN',1283935342),(66,'马大为','Ma3 Da4wei2','Name of the American student in 新实用汉语课本','PN',1283935396),(67,'加拿大','Jia1na2da4','Canada','PN',1283935431),(68,'美国','Mei3guo2','America','PN',1283935465),(69,'餐厅','can1ting1','dining room','N',1284016049),(70,'在','zai4','to be (here, there); to be (in, on at)','V',1284016089),(71,'哪儿','na3r0','where','QPr',1284016147),(72,'宿舍','su4she4','dormitory','N',1284016215),(73,'女','nü3','female','A',1284016272),(74,'坐','zuo4','to sit','V',1284016317),(75,'谢谢','xie4xie0','to thank','V',1284016345),(76,'对不起','dui4bu0qi3','I am sorry','IE',1284016394),(77,'知道','zhi1dao0','to know','V',1284016447),(78,'没关系','mei2 guan1xi0','never mind; it does not matter','IE',1284016492),(79,'再见','zai4jian4','goodbye','IE',1284016556),(80,'再','zai4','again','Adv',1284016586),(81,'王小云','Wang2 Xiao3yun2','Name of the female Chinese student in 新实用汉语课本','PN',1284016675),(82,'小姐','xiao3jie3','Miss; young lady','N',1284016716),(83,'二','er4','two','Nu',1284016745),(84,'层','ceng2','story; floor','M',1284016781),(85,'零','ling2','zero','Nu',1284016817),(86,'四','si4','four','Nu',1284016839),(87,'号','hao4','number','N',1284016862),(88,'不用','bu2yong4','need not','Adv',1284016888),(89,'这儿','zhe4r0','here','Pr',1284016921),(90,'晚','wan3','late','A',1284016949),(91,'了','le0','(modal partical/aspect partical)','Pt',1284017027),(92,'宋华','Song4 Hua2','Name of the male Chinese student in 新实用汉语课本','PN',1284017091);
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

-- Dump completed on 2010-09-09  0:26:15
