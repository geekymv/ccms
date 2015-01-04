DROP TABLE IF EXISTS `t_access_log`;
CREATE TABLE `t_access_log` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` varchar(20) NOT NULL,
  `ip` varchar(20) default NULL,
  `login_time` datetime default NULL,
  `logout_time` datetime default NULL,
  `status` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `t_access_log` DISABLE KEYS */;
LOCK TABLES `t_access_log` WRITE;
INSERT INTO `t_access_log` VALUES (1,'1','127.0.0.1','2015-01-01 16:08:47',NULL,1),(2,'1','127.0.0.1','2015-01-01 16:44:48',NULL,1),(3,'1','127.0.0.1','2015-01-01 16:46:34',NULL,1),(4,'1','127.0.0.1','2015-01-01 16:51:28',NULL,1),(5,'1','127.0.0.1','2015-01-01 22:09:49',NULL,1),(6,'1','127.0.0.1','2015-01-01 22:12:41',NULL,1),(7,'1','127.0.0.1','2015-01-01 22:19:15',NULL,1),(8,'1','127.0.0.1','2015-01-01 22:25:15',NULL,1),(9,'1','127.0.0.1','2015-01-01 22:30:51',NULL,1),(10,'1','127.0.0.1','2015-01-01 22:31:28',NULL,1),(11,'1','127.0.0.1','2015-01-01 22:33:13',NULL,1),(12,'1','127.0.0.1','2015-01-01 22:39:32',NULL,1),(13,'1','127.0.0.1','2015-01-01 22:41:22',NULL,1),(14,'1','127.0.0.1','2015-01-01 22:54:01',NULL,1),(15,'1','127.0.0.1','2015-01-01 23:04:43',NULL,1),(16,'1','127.0.0.1','2015-01-02 10:22:44',NULL,1),(17,'1','127.0.0.1','2015-01-02 10:31:17',NULL,1),(18,'1','127.0.0.1','2015-01-02 10:34:06',NULL,1),(19,'1','127.0.0.1','2015-01-02 10:34:23',NULL,1),(20,'1','127.0.0.1','2015-01-02 18:52:35',NULL,1),(21,'1','127.0.0.1','2015-01-02 18:57:02',NULL,1),(22,'1','127.0.0.1','2015-01-02 19:00:16',NULL,1),(23,'1','127.0.0.1','2015-01-02 21:50:34',NULL,1),(24,'1','127.0.0.1','2015-01-02 21:53:46',NULL,1),(25,'1','127.0.0.1','2015-01-02 21:56:50',NULL,1),(26,'1','127.0.0.1','2015-01-02 22:06:49',NULL,1),(27,'1','127.0.0.1','2015-01-02 22:40:10',NULL,1),(28,'1','127.0.0.1','2015-01-02 22:49:09',NULL,1),(29,'1','127.0.0.1','2015-01-02 22:51:39',NULL,1),(30,'1','127.0.0.1','2015-01-03 11:29:28',NULL,1),(31,'1','127.0.0.1','2015-01-03 12:11:37',NULL,1),(32,'1','127.0.0.1','2015-01-03 12:13:33',NULL,1),(33,'1','127.0.0.1','2015-01-03 12:17:03',NULL,1),(34,'1','127.0.0.1','2015-01-03 12:50:05',NULL,1),(35,'1','127.0.0.1','2015-01-03 13:03:03',NULL,1),(36,'1','127.0.0.1','2015-01-03 13:03:51',NULL,1),(37,'1','127.0.0.1','2015-01-03 13:28:06',NULL,1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `t_access_log` ENABLE KEYS */;

--
-- Table structure for table `t_activities`
--

DROP TABLE IF EXISTS `t_activities`;
CREATE TABLE `t_activities` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(60) NOT NULL,
  `col_id` int(11) default NULL,
  `publish_time` datetime default NULL,
  `date_time` varchar(30) default NULL,
  `end_date` date default NULL,
  `location` varchar(60) default NULL,
  `aim` varchar(30) default NULL,
  `content` varchar(60) default NULL,
  `activity_type` int(11) default NULL,
  `duration` int(11) default NULL,
  `act_object` varchar(30) default NULL,
  `number` int(11) default NULL,
  `contact` varchar(20) default NULL,
  `phone` varchar(20) default NULL,
  `assist` varchar(20) default NULL,
  `status` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_activities`
--


/*!40000 ALTER TABLE `t_activities` DISABLE KEYS */;
LOCK TABLES `t_activities` WRITE;
INSERT INTO `t_activities` VALUES (1,'大扫除',4,'2015-01-02 00:00:00','2015年1月3号 下午三点','2015-01-03','校内','活动目的','活动内容',1,2,'11计算机三班',30,'李老师','123','张三李四',1),(2,'123',4,'2015-01-02 00:00:00','本周日上午九点','2015-01-02','八教','活动目的','活动内容',2,2,'12生物工程',20,'张老师','123','王五',1),(3,'456',4,'2015-01-02 00:00:00','下午2点','2015-01-03','九教','活动目的','活动内容',3,3,'全校学生',30,'王老师','222','赵六',1),(4,'222',4,'2015-01-02 00:00:00','rer','2015-01-03','dgg','fsdf','fdsf',1,3,'fsdf',43,'fdsf','333','fsdf',1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `t_activities` ENABLE KEYS */;

--
-- Table structure for table `t_activity_item`
--

DROP TABLE IF EXISTS `t_activity_item`;
CREATE TABLE `t_activity_item` (
  `id` int(11) NOT NULL auto_increment,
  `act_id` int(11) default NULL,
  `stu_id` int(11) default NULL,
  `audit` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_activity_item`
--


/*!40000 ALTER TABLE `t_activity_item` DISABLE KEYS */;
LOCK TABLES `t_activity_item` WRITE;
INSERT INTO `t_activity_item` VALUES (1,1,1,1),(2,2,1,-1),(3,3,1,1),(4,4,1,1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `t_activity_item` ENABLE KEYS */;

--
-- Table structure for table `t_activity_type`
--

DROP TABLE IF EXISTS `t_activity_type`;
CREATE TABLE `t_activity_type` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_activity_type`
--


/*!40000 ALTER TABLE `t_activity_type` DISABLE KEYS */;
LOCK TABLES `t_activity_type` WRITE;
INSERT INTO `t_activity_type` VALUES (1,'劳务类'),(3,'实践类'),(2,'文体类');
UNLOCK TABLES;
/*!40000 ALTER TABLE `t_activity_type` ENABLE KEYS */;

--
-- Table structure for table `t_colleges`
--

DROP TABLE IF EXISTS `t_colleges`;
CREATE TABLE `t_colleges` (
  `id` int(11) NOT NULL auto_increment,
  `account` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `pwd` varchar(30) default NULL,
  `phone` varchar(20) default NULL,
  `contact` varchar(20) default NULL,
  `address` varchar(30) default NULL,
  `authority` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `account` (`account`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_colleges`
--


/*!40000 ALTER TABLE `t_colleges` DISABLE KEYS */;
LOCK TABLES `t_colleges` WRITE;
INSERT INTO `t_colleges` VALUES (1,'admin','勤工助学管理中心','111','222','张三','长江西路130号',1),(3,'zbxy1','植物保护学院1','1231','1234561','陶老师1','植保楼1',0),(4,'jsjxy','信息与计算机学院','111','111','张老师','经济楼401',0);
UNLOCK TABLES;
/*!40000 ALTER TABLE `t_colleges` ENABLE KEYS */;

--
-- Table structure for table `t_rank_activity_type`
--

DROP TABLE IF EXISTS `t_rank_activity_type`;
CREATE TABLE `t_rank_activity_type` (
  `id` int(11) NOT NULL auto_increment,
  `rank_id` int(11) default NULL,
  `activity_type_id` int(11) default NULL,
  `duration` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_rank_activity_type`
--


/*!40000 ALTER TABLE `t_rank_activity_type` DISABLE KEYS */;
LOCK TABLES `t_rank_activity_type` WRITE;
INSERT INTO `t_rank_activity_type` VALUES (1,1,1,30),(2,1,2,20),(3,1,3,20),(4,2,1,30),(5,2,2,20),(6,2,3,15),(7,3,1,30),(8,3,2,15),(9,3,3,15);
UNLOCK TABLES;
/*!40000 ALTER TABLE `t_rank_activity_type` ENABLE KEYS */;

--
-- Table structure for table `t_ranks`
--

DROP TABLE IF EXISTS `t_ranks`;
CREATE TABLE `t_ranks` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_ranks`
--


/*!40000 ALTER TABLE `t_ranks` DISABLE KEYS */;
LOCK TABLES `t_ranks` WRITE;
INSERT INTO `t_ranks` VALUES (3,'丙等'),(2,'乙等'),(1,'甲等');
UNLOCK TABLES;
/*!40000 ALTER TABLE `t_ranks` ENABLE KEYS */;

--
-- Table structure for table `t_specialty`
--

DROP TABLE IF EXISTS `t_specialty`;
CREATE TABLE `t_specialty` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(30) NOT NULL,
  `col_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_specialty`
--


/*!40000 ALTER TABLE `t_specialty` DISABLE KEYS */;
LOCK TABLES `t_specialty` WRITE;
INSERT INTO `t_specialty` VALUES (1,'计算机',4),(2,'网络工程',4);
UNLOCK TABLES;
/*!40000 ALTER TABLE `t_specialty` ENABLE KEYS */;

--
-- Table structure for table `t_students`
--

DROP TABLE IF EXISTS `t_students`;
CREATE TABLE `t_students` (
  `id` int(11) NOT NULL auto_increment,
  `num` int(11) NOT NULL,
  `pwd` varchar(30) NOT NULL,
  `name` varchar(20) NOT NULL,
  `gender` varchar(5) default NULL,
  `phone` varchar(20) default NULL,
  `email` varchar(30) default NULL,
  `qq` varchar(11) default NULL,
  `col_id` int(11) default NULL,
  `spec_id` int(11) default NULL,
  `introduce` varchar(60) default NULL,
  `rank_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `num` (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_students`
--


/*!40000 ALTER TABLE `t_students` DISABLE KEYS */;
LOCK TABLES `t_students` WRITE;
INSERT INTO `t_students` VALUES (1,11,'123','一号程序员','男','123','111@qq.com','123',4,1,'暂无介绍...',1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `t_students` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

