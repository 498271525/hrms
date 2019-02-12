/*
SQLyog Ultimate v8.32 
MySQL - 8.0.12 : Database - hrms
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`hrms` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `hrms`;

/*Table structure for table `dept` */

DROP TABLE IF EXISTS `dept`;

CREATE TABLE `dept` (
  `dept_id` int(10) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `dept_leader` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `dept` */

insert  into `dept`(`dept_id`,`dept_name`,`dept_leader`) values (1,'无','无'),(2,'技术部','篠之之束'),(3,'后勤部','十六夜咲夜'),(4,'客服部','五河琴里'),(5,'攻略部','五更琉璃'),(6,'人偶部','爱丽丝●玛格特罗依德'),(7,'战斗部','结城明日奈');

/*Table structure for table `emp` */

DROP TABLE IF EXISTS `emp`;

CREATE TABLE `emp` (
  `emp_id` int(10) NOT NULL AUTO_INCREMENT,
  `emp_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `emp_email` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `emp_gender` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `emp` */

insert  into `emp`(`emp_id`,`emp_name`,`emp_email`,`emp_gender`) values (1,'爱丽丝●玛格特罗依德','Alice_Margatroid@lwx.com','女'),(2,'篠之之束','Shinonono_Tabane@lwx.com','女'),(3,'十六夜咲夜','Izayoi_Sakuya@lwx.com','女'),(4,'五河琴里','Itsuka_Kotori@lwx.com','女'),(5,'结城明日奈','Yuuki_Asuna@lwx.com','女'),(6,'五更琉璃','Gokou_Ruri@lwx.com','女'),(7,'亚丝娜','Yuuki_Asuna2@lwx.com','女');

/*Table structure for table `emp_dept` */

DROP TABLE IF EXISTS `emp_dept`;

CREATE TABLE `emp_dept` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `emp_id` int(10) NOT NULL,
  `dept_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `emp_dept` */

insert  into `emp_dept`(`id`,`emp_id`,`dept_id`) values (1,1,6),(2,2,2),(3,3,3),(4,4,4),(5,5,7),(6,6,5),(7,7,7);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`) values (1,'lwx','123');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
