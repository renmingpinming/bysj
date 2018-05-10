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
) ENGINE=InnoDB AUTO_INCREMENT=1005 DEFAULT CHARSET=utf8;

/*Data for the table `classname` */

insert  into `classname`(`id`,`name`,`tno`) values (1001,'计算机科学与技术143班',20080101),(1002,'计算机科学与技术144班',20080101),(1003,'计算机科学与技术141班',20080103),(1004,'计算机科学与技术142班',NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=1025 DEFAULT CHARSET=utf8;

/*Data for the table `comment` */

insert  into `comment`(`id`,`question_id`,`author_id`,`content`,`create_time`,`tno`,`author_name`) values (1017,1014,20140110,'检查你的连接地址，登陆账户，密码，以及账户权限','2018-05-04 10:34:25',1014,'李晓丽'),(1018,1015,20080101,'可以啊，你可以在后台拼接好了直接传给前台jsp一个字段就行，要是不在后台拼接的话，就在前台，把名字月份工资这三个字段连在一起就行了','2018-05-04 10:36:09',1015,'张丽歌'),(1019,1014,20080101,'有几种可能导致  1、mysql是否所分配的帐号允许远程连接 2、端口是否正确，默认端口3306 3、防火墙  可以用telnet先测试下数据库端口服务是否正常','2018-05-04 10:39:52',1014,'张丽歌'),(1020,1016,20080101,'腾讯CEO马老大近期表示，互联网已不再是新经济，它是主体经济不可分割的一部分，现在越来越多实体、个人、设备都连接在一起。互联网改变了媒体、零售和金融等行业，未来将改变每一个行业，传统企业即使还想不出怎么结合互联网，但一定要具备互联网思维。其实马老大老大这句话切合实意的表达出了我心中的互联网思维的概念。我所理解的互联网思维就是把传统行业搬到互联网上来做，然后加入互联网所具有的创新元素。也许现在在传统行业中还有很多暂时无法实现在互联网中复制，但在未来的几年中，伴随着互联网行业的扩展与创新，肯定能实现互联网对传统行业的大洗牌。用“互联网思维”运营产品或者产业，做强产业链上中下游产业，这样才能发挥互联网的真正作用。','2018-05-04 10:40:34',1016,'张丽歌'),(1021,1016,20140111,'我不知道','2018-05-04 10:41:40',1016,'宋云雪'),(1022,1014,20140111,'使用本地数据库客户端连接试一下，看是否能登陆，顺便，两个楼上说得对','2018-05-04 10:42:21',1014,'宋云雪'),(1023,1015,20140111,'你搜一下数据库的行转列方法，可以实现，然后再拼接就行了，反正要是在数据库里面直接完成这些操作，有点复杂，你可以行转列之后，再在后台拼接','2018-05-04 10:46:41',1015,'宋云雪'),(1024,1015,20080101,'数据库有很多函数，求和啊求平均啊还有convert时间啊，但是你说的这个拼接字段的我不确定有。 你说的需求应该属于业务需求的范围。 正确做法是你的后台返回一个统一格式的结果：例如json或者xml，然后在你的前台去解析这个结果，按照你想要的方式来展示出来即可','2018-05-04 11:10:23',1015,'张丽歌');

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `connect` */

insert  into `connect`(`conn_id`,`sid`,`cid`) values (3,20140110,1002),(10,20140110,1001),(13,20140111,1001),(14,20140109,1001),(15,20140109,1003);

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

insert  into `course`(`cid`,`cname`,`introduce`,`tno`) values (1001,'思想道德修养和法律基础','本书系高职高专“十二五”公共基础课教学改革规划教材之公共基础课系列教材之一，全书以马克思列宁主义、毛泽东思想、邓小平理论、“三个代表”和“树立社会主义荣辱观”的重要思想为指导，注重对当代大学生进行我国社会主义法律的基本理论、宪法及有关法律的基本精神与内容的教育，使他们了解作为一名大学生应该具备的思想道德与法律基础知识，以增强自身的思想道德修养、提高法律意识。',20080101),(1002,'C语言程序设计','本书是为以C语言作为程序设计入门课程的读者编写的教材，以培养初学者的编程思维、分析和解决问题的能力、程序设计基本能力为目标。',20080101),(1003,'高等数学','大学高等数学是每位大学生都应该掌握的一门学科，不管是理科生还是文科生。因为数学是一门古老而又十分重要的自然学科。高等数学建立在初等数学基础之上，结构严谨，对于学生的逻辑思维以及运算能力有较高的要求，是各理工学科的基础。学好了数学，也就为其他学科的学习打下了坚实的基础。高等数学是解决其他相关问题的良好工具，而其中函数极限和微积分又是贯穿于其中的重要部分，是学习的核心。',20080103),(1004,'大学英语','大学英语教学是高等教育的一个有机组成部分，大学英语课程是大学生的一门必修的基础课程。大学英语教学的目标以英语语言知识与应用技能、学习策略和跨文化交际为主要教学内容，以外语教学理论为指导，以计算机技术和网络为媒介，以现代化教育技术为手段，培养学生的英语综合应用能力，特别是听说能力，使他们在今后工作和社会交往中能用英语有效地进行口头和书面的信息交流，同时增强其自主学习能力，提高综合文化素养，以适应我国社会发展和国际交流的需要。',20080104),(1005,'C++程序设计','《C++程序设计》这门课将向你讲授C++程序设计有关的概念和语法，使你能够使用C++语言，以面向对象的方法编写可维护性、可扩充性好的，较大规模的程序。我们建议你在开始本课程之前已经熟悉了C语言和基本程设编写。这门课则将带你掌握C++语言中类、对象、运算符重载、继承、多态等面向对象的程序设计方法，以及模板、标准模板库STL等泛型程序设计的机制，体会和领悟面向对象程序设计方法和泛型程序设计方法的优势。',20080102),(1006,'Java大学简明教程','本书对于初学者,尤其是没有编程经验者来说,这是一本可以快速上手,真正面向应用的好教材。本书是Deitel向广大读者奉献的又一力作。全书结合Java程序设计的基本原理，采用手把手的教程式方法，逐步引导读者开发出面向实际的应用程序。从最基本的程序设计的学习开始，读者在每一教程中学到的有关Java程序设计的所有新知识和新内容，都是建立在前一教程学习的基础之上的。从而读者能够很容易地将所学到的知识运用到自己应用程序的开发当中。',NULL),(1007,'数据挖掘技术','《数据挖掘技术》可以作为高等院校信息管理、数理统计等专业有关数据挖掘教学的本科生或者研究生的专业课教材，也可以作为各类相关培训班的教材，还可以作为从事数据分析、智能产品软件开发人员的参考书及数据挖掘爱好者的自学用书。',20080103);

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
) ENGINE=InnoDB AUTO_INCREMENT=1010 DEFAULT CHARSET=utf8;

/*Data for the table `document` */

insert  into `document`(`id`,`filename`,`course_id`,`hid`) values (1004,'zhouyi.docx',1001,1003),(1005,'123.txt',1001,1003),(1006,'2014周夷.docx',1001,1003),(1007,'2014周夷.docx',1001,1004),(1008,'2014周夷.docx',1001,1002),(1009,'素材.txt',1001,1004);

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
) ENGINE=InnoDB AUTO_INCREMENT=1025 DEFAULT CHARSET=utf8;

/*Data for the table `homework` */

insert  into `homework`(`hid`,`course_id`,`title`,`content`,`create_time`) values (1002,1001,'简答题一','简述道德与法律的关系','2017-12-19 18:57:06'),(1003,1001,'简答题二','大学生应如何尽快适应大学新生活？','2017-12-19 18:57:23'),(1004,1001,'简答题三','如何认识个人理想与中国特色社会主义共同理想的关系？','2017-12-19 19:04:29'),(1007,1002,'编程题一','有1、2、3、4个数字，能组成多少个互不相同且无重复数字的三位数？都是多少？','2017-12-31 14:55:36'),(1008,1002,'编程题二','一个整数，它加上100后是一个完全平方数，再加上168又是一个完全平方数，请问该数是多少？','2018-05-08 22:04:26'),(1009,1002,'编程题三','输入三个整数x,y,z，请把这三个数由小到大输出。','2018-05-08 22:05:00'),(1010,1003,'计算题一','求函数 f (x )=x 3-6x 2+9x -4在闭区间 [0, 2]上的最大值和最小值 ','2018-05-08 22:05:57'),(1011,1003,'计算题二','求函数 f(x)=x x 2sin e+x arctanx 的导数 .','2018-05-08 22:06:08'),(1012,1003,'计算题三','已知 f (3x +2)=2x e -3x, 计算 ⎰52d ) (x x f . 23. 计算二重积分 ⎰⎰D y x y x d d 2\r\n,其中 D 是由直线 y =x , x =1以及 x 轴所围的区域 .','2018-05-08 22:06:22'),(1013,1004,'写作题一','The power of smiles微笑的力量','2018-05-08 22:06:37'),(1014,1004,'写作题二','我的大学生活 My College Life','2018-05-08 22:06:48'),(1015,1004,'写作题三','Shake it off and step up重整旗鼓向前进','2018-05-08 22:07:00'),(1016,1005,'编程题一','声明如下数组： \r\nint a[] = {1, 2, 3, 4, 5, 6, 7, 8}; \r\n先查找4的位置，将数组a复制给数组b，然后将数组a的内容反转，再查找4的位置，最后分别输出数组a和b的内容。','2018-05-08 22:07:28'),(1017,1005,'编程题二','编写完整的程序，它读入15个float值，用指针把它们存放在一个存储块里，然后输出这些值的和以及最小值。','2018-05-08 22:07:38'),(1018,1005,'编程题三','编写一个为int型变量分配100个整形量空间的程序。','2018-05-08 22:07:50'),(1019,1006,'题目一','利用if语句，根据下列函数编写一个程序，当键盘输入x值时，求出并输出y的值。y=x3x-2\r\n\r\n4x(x<=1)(1<x<10)(x>=10)','2018-05-08 22:08:02'),(1020,1006,'题目二','求出100以内的素数，其中最小的素数是2','2018-05-08 22:08:12'),(1021,1006,'题目三','编写一个JavaApplication，要求从键盘输入的10个整数存放到一维数组中，并输出其中的最大、最小以及平均值','2018-05-08 22:08:24'),(1022,1007,'题目一','指出采用FP_tree结构的优缺点。','2018-05-08 22:08:35'),(1023,1007,'题目二','指出Apriori算法的性能瓶颈','2018-05-08 22:08:48'),(1024,1007,'题目三','给出一个将关联规则应用于互联网上的例子','2018-05-08 22:09:03');

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
) ENGINE=InnoDB AUTO_INCREMENT=1017 DEFAULT CHARSET=utf8;

/*Data for the table `question` */

insert  into `question`(`id`,`title`,`content`,`create_time`,`author_id`,`tno`,`author_name`) values (1014,'java项目连接数据库报错create connection SQLException','url: jdbc:mysql://XXXXXXXXX?serverTimezone=Hongkong&useUnicode=true&characterEncoding=utf8&useSSL=false&autoReconnect=true&useServerPrepStmts=true, errorCode 0, state 08001\r\n大家帮忙看下，项目放在服务器上，启动tomcat后启不起来，谢谢大家！','2018-05-04 10:33:23',20140109,NULL,'宋政帅'),(1015,'jsp对数据库查询到的数据根据某个相同字段进行拼接并显示','比如工资表，有10个人，每个人发了12个月的工资，现查询到的数据有120条，能否在数据库里面根据人名进行月份和工资拼接？或者使用jsp来拼接并显示出来？','2018-05-04 10:35:29',20140110,NULL,'李晓丽'),(1016,'到底什么是互联网思维','要问最近互联网界最火的一个名词是什么，“互联网思维”毫无疑问是最好的答案。大到互联网界大佬，小到像我这样的小小自媒体人，都在不停的嘶吼着所谓的互联网思维，然后很多人就展开了激烈的论战。一开始这个词被包装成了高大上，被一群神棍忽悠的浑天黑地，然后又有一群人跑出来正本清源，然后告诉你这个东西不存在之类的，然后这个词又成了一文不值。真正的什么才是互联网思维，几乎没有人能给一个确切的答案，这个问题就像小学生谈“性”一样，大家都在谈，都说这个很不错，都说自己在做。其实到底“性”是什么东东，大家都不知道，只是觉得别人再谈，我也谈，这样显得很牛逼一样。今天我也跟随大佬的脚步来谈谈我理解的互联网思维，也许与大家所理解的不同。','2018-05-04 10:37:40',20080101,NULL,'张丽歌');

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
) ENGINE=InnoDB AUTO_INCREMENT=20140132 DEFAULT CHARSET=utf8;

/*Data for the table `student` */

insert  into `student`(`sid`,`sname`,`password`,`sex`,`classname`,`telephone`,`email`,`clno`) values (20140109,'宋政帅','123','男','计算机科学与技术144班','18956321115','568547856@qq.com',1002),(20140110,'李晓丽','123','女','计算机科学与技术143班','17856547852','459875632@qq.com',1001),(20140111,'宋云雪','123','女','计算机科学与技术141班','14789652145','147856951@qq.com',1003),(20140112,'陈欣然','123','女','计算机科学与技术142班','14785698745','965874521@qq.com',1004),(20140113,'张三丰','123','男','计算机科学与技术143班','12587856542','6325487452@qq.com',1001),(20140114,'张毅锋','123','男','计算机科学与技术141班','14785698746','3362446409@qq.com',1002),(20140115,'张仁','123','男','计算机科学与技术142班','14785698747','2815705482@qq.com',1003),(20140116,'华剑文','123','男','计算机科学与技术143班','14785698748','2156144402@qq.com',1004),(20140117,'魏子璐','123','女','计算机科学与技术144班','14785698749','2358830472@qq.com',1001),(20140118,'周鑫','123','男','计算机科学与技术141班','14785698750','2973525310@qq.com',1002),(20140119,'杨溢','123','女','计算机科学与技术142班','14785698751','2665823556@qq.com',1003),(20140120,'叶俊','123','男','计算机科学与技术143班','14785698752','3209128505@qq.com',1004),(20140121,'郑刘辉','123','女','计算机科学与技术144班','14785698753','3257156907@qq.com',1001),(20140122,'宋峰','123','男','计算机科学与技术141班','14785698754','2316536448@qq.com',1002),(20140123,'陈高峰','123','女','计算机科学与技术142班','14785698755','3160460176@qq.com',1003),(20140124,'雷吉','123','男','计算机科学与技术143班','14785698756','2170455351@qq.com',1004),(20140125,'沈潇','123','男','计算机科学与技术144班','14785698757','2954201483@qq.com',1001),(20140126,'朱晓华','123','女','计算机科学与技术141班','14785698758','2661934344@qq.com',1002),(20140127,'王侃','123','女','计算机科学与技术142班','14785698759','2164035280@qq.com',1003),(20140128,'陈国锋','123','女','计算机科学与技术143班','14785698760','2066524316@qq.com',1004),(20140129,'孙挺','123','男','计算机科学与技术144班','14785698761','3242994397@qq.com',1001),(20140130,'朱亦成','123','女','计算机科学与技术141班','14785698762','2161365127@qq.com',1002),(20140131,'赵佳锋','123','男','计算机科学与技术143班','14785698763','1665098312@qq.com',1003);

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

insert  into `teacher`(`tid`,`tname`,`password`,`sex`,`introduce`,`telephone`,`email`) values (20080101,'张丽歌','123','女','爱岗敬业，有才艺，有理想，与人为善，沟通潜力强。多次获镇优秀教师称号。人生格言是：爱就是教育，没有爱便没有教育。','17856987598','896654213@qq.com'),(20080102,'武卫玮','123','男','为人耿直，团结同事，关心群众，开拓进取。人生格言是：学生对教师的尊敬的唯一源泉，在于教师的德和才','17826875930','854123654@qq.com'),(20080103,'侯云超','123','男','有理想，有追求，善学习，英语水平较高。多次获镇优秀教师称号。人生格言是：教书育人是教师的天职，既有苦，也有乐。','18563214785','5632147856@qq.com'),(20080104,'冯雅晴','123','女','工作半辈子，努力每一天，从不懈怠，一心扑在教育上，从不计较名利，不愧是教师之楷模。多次获镇优秀教师称号。','14785698775','236547856@qq.com');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
