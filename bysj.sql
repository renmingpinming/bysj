/*
SQLyog Enterprise Trial - MySQL GUI v7.11 
MySQL - 5.5.28 : Database - bysj
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`bysj` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `bysj`;

/*Table structure for table `classname` */

DROP TABLE IF EXISTS `classname`;

CREATE TABLE `classname` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `tno` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKFF77A803BAD1FA91` (`tno`),
  CONSTRAINT `FKFF77A803BAD1FA91` FOREIGN KEY (`tno`) REFERENCES `teacher` (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=1004 DEFAULT CHARSET=utf8;

/*Data for the table `classname` */

insert  into `classname`(`id`,`name`,`tno`) values (1001,'计算机科学与技术143班',20080101),(1002,'计算机科学与技术144班',20080101),(1003,'xxxx',20080101);

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `question_id` int(12) DEFAULT NULL,
  `author_id` int(12) DEFAULT NULL,
  `content` text NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tno` int(11) DEFAULT NULL,
  `author_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK38A5EE5FBDB33EE1` (`tno`),
  CONSTRAINT `FK38A5EE5FBDB33EE1` FOREIGN KEY (`tno`) REFERENCES `question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1014 DEFAULT CHARSET=utf8;

/*Data for the table `comment` */

insert  into `comment`(`id`,`question_id`,`author_id`,`content`,`create_time`,`tno`,`author_name`) values (1001,1001,20080101,'2','2017-12-16 19:46:44',NULL,'bbb'),(1002,1001,20080101,'3','2017-12-16 19:46:44',NULL,'bbb'),(1003,NULL,NULL,'woshi','2017-12-16 19:46:44',NULL,NULL),(1004,1001,20080101,'nihao','2017-12-16 19:46:44',1001,'bbb'),(1005,1001,20080101,'2222','2017-12-16 19:59:54',1001,'bbb'),(1006,1001,20080101,'3333','2017-12-16 20:07:25',1001,'bbb'),(1007,1010,20080101,'1','2017-12-17 19:25:02',1010,'bbb'),(1008,1010,NULL,'他他他','2017-12-17 19:33:09',1010,''),(1009,1010,20080101,'sss','2017-12-17 19:42:51',1010,'bbb'),(1010,1009,NULL,'111','2017-12-17 19:51:16',1009,''),(1011,1009,20080101,'222','2017-12-17 19:51:59',1009,'bbb'),(1012,1012,20140109,'333','2017-12-18 13:48:03',1012,'周6'),(1013,1012,20140109,'xxxx','2017-12-18 13:48:15',1012,'周6');

/*Table structure for table `connect` */

DROP TABLE IF EXISTS `connect`;

CREATE TABLE `connect` (
  `conn_id` int(12) NOT NULL AUTO_INCREMENT,
  `sid` int(12) DEFAULT NULL,
  `cid` int(12) DEFAULT NULL,
  PRIMARY KEY (`conn_id`),
  KEY `sid` (`sid`),
  KEY `cid` (`cid`),
  CONSTRAINT `connect_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`),
  CONSTRAINT `connect_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `course` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `connect` */

insert  into `connect`(`conn_id`,`sid`,`cid`) values (2,20140109,1002),(3,20140110,1002),(4,20140111,1002),(7,20140109,1001),(10,20140110,1001),(11,20140111,1001),(12,20140109,1003),(13,20140109,1004),(14,20140109,1005);

/*Table structure for table `connect_qc` */

DROP TABLE IF EXISTS `connect_qc`;

CREATE TABLE `connect_qc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qid` int(11) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `qid` (`qid`),
  KEY `cid` (`cid`),
  CONSTRAINT `connect_qc_ibfk_1` FOREIGN KEY (`qid`) REFERENCES `question` (`id`),
  CONSTRAINT `connect_qc_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `comment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `connect_qc` */

/*Table structure for table `course` */

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `cid` int(12) NOT NULL AUTO_INCREMENT,
  `cname` varchar(20) NOT NULL,
  `introduce` text,
  `tno` int(11) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `FKAF42E01BBAD1FA91` (`tno`),
  CONSTRAINT `FKAF42E01BBAD1FA91` FOREIGN KEY (`tno`) REFERENCES `teacher` (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=1008 DEFAULT CHARSET=utf8;

/*Data for the table `course` */

insert  into `course`(`cid`,`cname`,`introduce`,`tno`) values (1001,'语文','这是语文课。',20080101),(1002,'aaa',NULL,NULL),(1003,'数学','这是数学课。',20080101),(1004,'英语','这是英语课。',NULL),(1005,'bbb',NULL,NULL),(1006,'ccc',NULL,NULL),(1007,'eee','',NULL);

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `dname` varchar(20) DEFAULT NULL,
  `ddesc` varchar(100) DEFAULT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=20012002 DEFAULT CHARSET=utf8;

/*Data for the table `department` */

insert  into `department`(`did`,`dname`,`ddesc`,`password`) values (20012001,'zhouyi',NULL,'123');

/*Table structure for table `document` */

DROP TABLE IF EXISTS `document`;

CREATE TABLE `document` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `filename` varchar(20) DEFAULT NULL,
  `course_id` int(12) DEFAULT NULL,
  `hid` int(12) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1006 DEFAULT CHARSET=utf8;

/*Data for the table `document` */

insert  into `document`(`id`,`filename`,`course_id`,`hid`) values (1002,'1.txt',1001,1002),(1003,'2.txt',1001,1002);

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `eid` int(11) NOT NULL AUTO_INCREMENT,
  `ename` varchar(20) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `joinDate` date DEFAULT NULL,
  `eno` varchar(20) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `dno` int(11) DEFAULT NULL,
  PRIMARY KEY (`eid`),
  KEY `FK4722E6AE26F5B0BD` (`dno`),
  CONSTRAINT `FK4722E6AE26F5B0BD` FOREIGN KEY (`dno`) REFERENCES `department` (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `employee` */

insert  into `employee`(`eid`,`ename`,`sex`,`birthday`,`joinDate`,`eno`,`username`,`password`,`dno`) values (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `homework` */

DROP TABLE IF EXISTS `homework`;

CREATE TABLE `homework` (
  `hid` int(12) NOT NULL AUTO_INCREMENT,
  `course_id` int(12) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `content` text,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`hid`)
) ENGINE=InnoDB AUTO_INCREMENT=1005 DEFAULT CHARSET=utf8;

/*Data for the table `homework` */

insert  into `homework`(`hid`,`course_id`,`title`,`content`,`create_time`) values (1002,1001,'2+2','4','2017-12-19 18:57:06'),(1003,1001,'3+3','6','2017-12-19 18:57:23'),(1004,1001,'4+4','8','2017-12-19 19:04:29');

/*Table structure for table `question` */

DROP TABLE IF EXISTS `question`;

CREATE TABLE `question` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `author_id` int(12) DEFAULT NULL,
  `tno` int(11) DEFAULT NULL,
  `author_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBA823BE6BDB33EE1` (`tno`),
  CONSTRAINT `FKBA823BE6BDB33EE1` FOREIGN KEY (`tno`) REFERENCES `question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1013 DEFAULT CHARSET=utf8;

/*Data for the table `question` */

insert  into `question`(`id`,`title`,`content`,`create_time`,`author_id`,`tno`,`author_name`) values (1001,'这题怎么做？','1+1=？','2017-12-16 19:44:44',20080101,NULL,'bbb'),(1002,'2+2','4','2017-12-16 19:44:44',20140109,NULL,'周6'),(1003,'2+3','5','2017-12-16 19:45:14',20080102,NULL,'ccc'),(1004,'4+4','8','2017-12-16 19:45:51',20080101,NULL,'bbb'),(1005,'你好','你好啊啊啊啊','2017-12-17 16:45:54',NULL,NULL,NULL),(1006,'我是xxx','你是？','2017-12-17 16:46:34',NULL,NULL,NULL),(1007,'啊啊啊','不不不','2017-12-17 16:50:52',NULL,NULL,NULL),(1008,'擦擦擦','对对对','2017-12-17 16:51:35',NULL,NULL,NULL),(1009,'呃呃呃','发发发','2017-12-17 16:56:27',20080101,NULL,'bbb'),(1010,'我我我','你你你','2017-12-17 16:57:58',20080101,NULL,'bbb'),(1011,'sss','999','2017-12-18 13:38:14',NULL,NULL,''),(1012,'ddd','kkk','2017-12-18 13:42:11',20140109,NULL,'周6');

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `sid` int(12) NOT NULL AUTO_INCREMENT,
  `sname` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `classname` varchar(50) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `clno` int(11) DEFAULT NULL,
  PRIMARY KEY (`sid`),
  KEY `FK8FFE823B625F42E7` (`clno`),
  CONSTRAINT `FK8FFE823B625F42E7` FOREIGN KEY (`clno`) REFERENCES `classname` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20140113 DEFAULT CHARSET=utf8;

/*Data for the table `student` */

insert  into `student`(`sid`,`sname`,`password`,`sex`,`classname`,`telephone`,`email`,`clno`) values (20140109,'周6','123','男',NULL,NULL,NULL,1001),(20140110,'周7','123',NULL,NULL,NULL,NULL,1001),(20140111,'周8','123',NULL,NULL,NULL,NULL,1001),(20140112,'xx','123',NULL,NULL,NULL,NULL,1003);

/*Table structure for table `teacher` */

DROP TABLE IF EXISTS `teacher`;

CREATE TABLE `teacher` (
  `tid` int(12) NOT NULL AUTO_INCREMENT,
  `tname` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `introduce` text,
  `telephone` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=20080105 DEFAULT CHARSET=utf8;

/*Data for the table `teacher` */

insert  into `teacher`(`tid`,`tname`,`password`,`sex`,`introduce`,`telephone`,`email`) values (20080101,'bbb','123','女','123456','17856987598',''),(20080102,'ccc','123',NULL,NULL,'17826875930',NULL),(20080103,'ddd','123',NULL,NULL,NULL,NULL),(20080104,'eee','123',NULL,NULL,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
