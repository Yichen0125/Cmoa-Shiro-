/*
SQLyog Ultimate v11.26 (32 bit)
MySQL - 5.5.28 : Database - testshiro
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`testshiro` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `testshiro`;

/*Table structure for table `authorities` */

DROP TABLE IF EXISTS `authorities`;

CREATE TABLE `authorities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `display_name` varchar(200) DEFAULT NULL,
  `permissions` varchar(200) DEFAULT NULL,
  `parent_authority_id` int(20) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

/*Data for the table `authorities` */

insert  into `authorities`(`id`,`name`,`display_name`,`permissions`,`parent_authority_id`,`url`) values (1,'','营销管理','',NULL,'/'),(2,'ddgl','订单管理','',1,'/yx/order/list'),(3,'khgl','客户管理','',1,'/yx/customer/list'),(4,'yxhd','营销活动','',1,'/yx/yxhd/list'),(5,'yxkh','营销考核','',1,'/yx/customer/list'),(6,'htgl','合同管理','',1,'/yx/htgl/list'),(7,'yxxz','营销小组','',1,'/yx/yxxz/list'),(8,'','项目管理','',NULL,'/'),(9,'xmgl','项目管理','',8,'/xm/project/list'),(10,'ddgl','调度管理','',8,'/xm/ddgl/list'),(11,'xmxz','项目协作','',8,'/xm/project/xmxz'),(12,'yygl','译员管理','',8,'/xm/yygl/list'),(13,'','财务管理','',NULL,'/'),(14,'xmht','项目合同','',13,'/cw/project_ht/list'),(15,'xmqd','项目清单','',13,'/cw/project_qd/list'),(16,'jsqd','结算清单','',13,'/cw/jsqd/list'),(17,'xmfp','项目发票','',13,'/cw/project_fp/list'),(18,'xmsk','项目收款','',13,'/cw/project_sk/list'),(19,'','数据分析','',NULL,'/'),(20,'hyfx','行业分析','',19,'/sjfx/industry/fx'),(21,'khfx','客户分析','',19,'/sjfx/customer/fx'),(22,'yzfx','语种分析','',19,'/sjfx/language/fx'),(23,'ykfx','语库分析','',19,'/sjfx/languag_d/fx'),(24,'','数据仓库','',NULL,'/'),(25,'jlk','句料库','',24,'/sjck/jlk/list'),(26,'syk','术语库','',24,'/sjck/syk/list'),(27,'ppcf','匹配重复','',24,'/sjck/data/pp'),(28,'cggl','成果管理','',24,'/sjck/cg/list'),(29,'yggl','原稿管理','',24,'/sjck/yg/list'),(30,'','个人办公','',NULL,'/'),(31,'rcap','日程安排','',30,'/grbg/rcap/list'),(32,'dbsx','待办事项','',30,'/grbg/dbsx/list'),(33,'gzrz','工作日志','',30,'/grbg/gzrz/list'),(34,'gzbq','工作便签','',30,'/grbg/gzbq/list'),(35,'xxtx','消息提醒','',30,'/grbg/xxtx/list'),(36,'grsz','个人设置','',30,'/grbg/grsz/setup'),(37,'','知识库管理','',NULL,'/'),(38,'grwd','个人文档','',37,'/zskgl/grwd/list'),(39,'gxwd','共享文档','',37,'/zskgl/gxwd/list'),(40,'gswj','公司文件','',37,'/zskgl/gswj/list'),(41,'gszx','公司资讯','',37,'/zskgl/gszx/list'),(42,'','系统设置','',NULL,'/'),(43,'xgmm','修改密码','',42,'/system/setpw'),(44,'zzjg','组织机构','',42,'/system/group'),(45,'gwqx','岗位权限','',42,'/system/auth'),(46,'lcsz','流程设置','',42,'/system/lc'),(47,'sjgl','数据管理','',42,'/system/sjgl/list'),(48,'','运营管理','',NULL,'/'),(49,'yxsq','运营申请','',48,'/yy/yysq/list'),(50,'gswz','公司物资','',48,'/yy/gswz/list'),(51,'hysgl','会议室管理','',48,'/yy/hysgl/list'),(52,'','服务管理','',NULL,'/'),(53,'tzgl','通知管理','',52,'/fw/tzgl/list'),(54,'jstx','即时通讯','',52,'/fw/jstx'),(55,'rwgl','任务管理','',52,'/fw/rwgl/list'),(56,'txgl','提醒管理','',52,'/fw/txgl/list'),(57,'rzgl','日志管理','',52,'/fw/rzgl/list'),(58,'pjgl','评价管理','',52,'/fw/pjgl/list'),(59,'cxgl','查询管理','',52,'/fw/cxgl'),(60,'','统计管理','',NULL,'/'),(61,'khtj','客户统计','',60,'/tj/khtj'),(62,'xmtj','项目统计','',60,'/tj/xmtj'),(63,'xmqd','项目清单','',60,'/tj/xmqd'),(64,'','人事管理','',NULL,'/'),(65,'zpfp','招聘分配','',64,'/rs/zpfp/list'),(66,'pxgl','培训管理','',64,'/rs/pxgl/list'),(67,'ygjx','员工绩效','',64,'/rs/ygjx/list'),(68,'xzfl','薪资福利','',64,'/rs/xzfl/list'),(69,'ldgx','劳动关系','',64,'/rs/ldgx/list'),(70,'rlzy','人力资源','',64,'/rs/rlzy/list');

/*Table structure for table `role_authority` */

DROP TABLE IF EXISTS `role_authority`;

CREATE TABLE `role_authority` (
  `role_id` int(11) DEFAULT NULL,
  `authority_id` int(11) DEFAULT NULL,
  KEY `role_id` (`role_id`),
  KEY `authority_id` (`authority_id`),
  CONSTRAINT `role_authority_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `role_authority_ibfk_2` FOREIGN KEY (`authority_id`) REFERENCES `authorities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `role_authority` */

insert  into `role_authority`(`role_id`,`authority_id`) values (1,1),(1,15),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,16),(1,17),(1,18),(1,19),(1,20),(1,21),(1,22),(1,23),(1,24),(1,25),(1,26),(1,27),(1,28),(1,29),(1,30),(1,31),(1,32),(1,33),(1,34),(1,35),(1,36),(1,37),(1,38),(1,39),(1,2),(1,40),(1,41),(1,42),(1,43),(1,44),(1,45),(1,46),(1,47),(1,48),(1,49),(1,50),(1,51),(1,52),(1,53),(1,54),(1,55),(1,56),(1,57),(1,58),(1,59),(1,60),(1,61),(1,62),(1,63),(1,64),(1,65),(1,66),(1,67),(1,68),(1,69),(1,70);

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `enabled` int(20) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `roles` */

insert  into `roles`(`id`,`description`,`enabled`,`name`) values (1,'',1,'管理员'),(2,'',1,'测试'),(3,'测试时使用, 上线需删除',1,'测试管理员');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `enabled` int(11) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `salt` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`id`,`enabled`,`name`,`password`,`role_id`,`salt`) values (1,1,'admin','352c24f6d3d455608ca3d4b64a45fb4c',1,'e2b87e6eced06509'),(2,1,'admin2','f7e480709b119c14621301576eb572ee009a47ce',2,'db314a8d91bd6f83'),(3,1,'test','9bba13aaeb55b59ce72f9f6aad672e2c32544630',3,'ceadfd47cdaa814c');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
