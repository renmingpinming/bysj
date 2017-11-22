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
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=utf8;

/*Data for the table `classname` */

insert  into `classname`(`id`,`name`,`tno`) values (1001,'计算机科学与技术143班',NULL);

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `question_id` int(12) DEFAULT NULL,
  `author_id` int(12) DEFAULT NULL,
  `content` text NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `tno` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK38A5EE5FBDB33EE1` (`tno`),
  CONSTRAINT `FK38A5EE5FBDB33EE1` FOREIGN KEY (`tno`) REFERENCES `question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1005 DEFAULT CHARSET=utf8;

/*Data for the table `comment` */

insert  into `comment`(`id`,`question_id`,`author_id`,`content`,`create_time`,`tno`) values (1001,1001,NULL,'2',NULL,NULL),(1002,1001,NULL,'3',NULL,NULL),(1003,NULL,NULL,'woshi',NULL,NULL),(1004,NULL,NULL,'nihao',NULL,1001);

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `connect` */

insert  into `connect`(`conn_id`,`sid`,`cid`) values (1,20140101,1001),(2,20140109,1002),(3,20140110,1002),(4,20140111,1002),(5,20140112,1002),(6,20140113,1002),(7,20140109,1001),(8,20140115,1001),(9,20140115,1002),(10,20140110,1001),(11,20140111,1001),(12,20140112,1001),(13,20140113,1001);

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
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8;

/*Data for the table `course` */

insert  into `course`(`cid`,`cname`,`introduce`,`tno`) values (1001,'语文','这是语文课。',20080101),(1002,'aaa',NULL,20080101);

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `dname` varchar(20) DEFAULT NULL,
  `ddesc` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `department` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `employee` */

/*Table structure for table `question` */

DROP TABLE IF EXISTS `question`;

CREATE TABLE `question` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `author_id` int(12) DEFAULT NULL,
  `tno` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBA823BE6BDB33EE1` (`tno`),
  CONSTRAINT `FKBA823BE6BDB33EE1` FOREIGN KEY (`tno`) REFERENCES `question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=utf8;

/*Data for the table `question` */

insert  into `question`(`id`,`title`,`content`,`create_time`,`author_id`,`tno`) values (1001,'这题怎么做？','1+1=？',NULL,NULL,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=20140116 DEFAULT CHARSET=utf8;

/*Data for the table `student` */

insert  into `student`(`sid`,`sname`,`password`,`sex`,`classname`,`telephone`,`email`,`clno`) values (20140101,'abcd','123',NULL,NULL,NULL,NULL,NULL),(20140109,'周6','123',NULL,NULL,NULL,NULL,NULL),(20140110,'周7','123',NULL,NULL,NULL,NULL,NULL),(20140111,'周8','123',NULL,NULL,NULL,NULL,NULL),(20140112,'周9','123',NULL,NULL,NULL,NULL,NULL),(20140113,'周10','123',NULL,NULL,NULL,NULL,NULL),(20140115,'周11','123',NULL,NULL,NULL,NULL,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=20080103 DEFAULT CHARSET=utf8;

/*Data for the table `teacher` */

insert  into `teacher`(`tid`,`tname`,`password`,`sex`,`introduce`,`telephone`,`email`) values (20080101,'bbb','123',NULL,NULL,NULL,NULL),(20080102,'ccc','123',NULL,NULL,'17826875930',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
