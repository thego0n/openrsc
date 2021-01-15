-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.43-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO,MYSQL323' */;



DROP TABLE IF EXISTS `bank`;
CREATE TABLE `bank` (
  `user` varchar(255) NOT NULL DEFAULT '0',
  `owner` varchar(255) NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `amount` int(10) unsigned NOT NULL DEFAULT '1',
  `slot` int(5) unsigned NOT NULL DEFAULT '0',
  KEY `user` (`user`)
) TYPE=MyISAM;



DROP TABLE IF EXISTS `curstats`;
CREATE TABLE `curstats` (
  `old_user` varchar(255) NOT NULL DEFAULT '0',
  `cur_attack` int(5) unsigned NOT NULL DEFAULT '1',
  `cur_defense` int(5) unsigned NOT NULL DEFAULT '1',
  `cur_strength` int(5) unsigned NOT NULL DEFAULT '1',
  `cur_hits` int(5) unsigned NOT NULL DEFAULT '10',
  `cur_ranged` int(5) unsigned NOT NULL DEFAULT '1',
  `cur_prayer` int(5) unsigned NOT NULL DEFAULT '1',
  `cur_magic` int(5) unsigned NOT NULL DEFAULT '1',
  `cur_cooking` int(5) unsigned NOT NULL DEFAULT '1',
  `cur_woodcut` int(5) unsigned NOT NULL DEFAULT '1',
  `cur_fletching` int(5) unsigned NOT NULL DEFAULT '1',
  `cur_fishing` int(5) unsigned NOT NULL DEFAULT '1',
  `cur_firemaking` int(5) unsigned NOT NULL DEFAULT '1',
  `cur_crafting` int(5) unsigned NOT NULL DEFAULT '1',
  `cur_smithing` int(5) unsigned NOT NULL DEFAULT '1',
  `cur_mining` int(5) unsigned NOT NULL DEFAULT '1',
  `cur_herblaw` int(5) unsigned NOT NULL DEFAULT '1',
  `cur_agility` int(5) unsigned NOT NULL DEFAULT '1',
  `cur_thieving` int(5) unsigned NOT NULL DEFAULT '1',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user` (`user`)
) TYPE=MyISAM AUTO_INCREMENT=65474;



DROP TABLE IF EXISTS `experience`;
CREATE TABLE `experience` (
  `user` varchar(255) NOT NULL DEFAULT '0',
  `old_user` varchar(255) NOT NULL DEFAULT '0',
  `exp_attack` int(10) unsigned NOT NULL DEFAULT '0',
  `exp_defense` int(10) unsigned NOT NULL DEFAULT '0',
  `exp_strength` int(10) unsigned NOT NULL DEFAULT '0',
  `exp_hits` int(10) unsigned NOT NULL DEFAULT '1200',
  `exp_ranged` int(10) unsigned NOT NULL DEFAULT '0',
  `exp_prayer` int(10) unsigned NOT NULL DEFAULT '0',
  `exp_magic` int(10) unsigned NOT NULL DEFAULT '0',
  `exp_cooking` int(10) unsigned NOT NULL DEFAULT '0',
  `exp_woodcut` int(10) unsigned NOT NULL DEFAULT '0',
  `exp_fletching` int(10) unsigned NOT NULL DEFAULT '0',
  `exp_fishing` int(10) unsigned NOT NULL DEFAULT '0',
  `exp_firemaking` int(10) unsigned NOT NULL DEFAULT '0',
  `exp_crafting` int(10) unsigned NOT NULL DEFAULT '0',
  `exp_smithing` int(10) unsigned NOT NULL DEFAULT '0',
  `exp_mining` int(10) unsigned NOT NULL DEFAULT '0',
  `exp_herblaw` int(10) unsigned NOT NULL DEFAULT '0',
  `exp_agility` int(10) unsigned NOT NULL DEFAULT '0',
  `exp_thieving` int(10) unsigned NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `exp_total_cron` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user` (`user`)
) TYPE=MyISAM AUTO_INCREMENT=27407807;



DROP TABLE IF EXISTS `friends`;
CREATE TABLE `friends` (
  `user` varchar(255) NOT NULL,
  `friend` varchar(255) NOT NULL
) TYPE=MyISAM;


DROP TABLE IF EXISTS `invitems`;
CREATE TABLE `invitems` (
  `user` varchar(255) NOT NULL DEFAULT '0',
  `old_user` varchar(255) NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL,
  `amount` int(10) unsigned NOT NULL DEFAULT '1',
  `wielded` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `slot` int(5) unsigned NOT NULL,
  KEY `user` (`user`)
) TYPE=MyISAM;


DROP TABLE IF EXISTS `kills`;
CREATE TABLE `kills` (
  `user` varchar(255) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `killed` varchar(45) NOT NULL,
  PRIMARY KEY (`user`)
) TYPE=MyISAM;



DROP TABLE IF EXISTS `logins`;
CREATE TABLE `logins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(45) NOT NULL,
  `time` int(5) unsigned NOT NULL,
  `ip` varchar(15) NOT NULL DEFAULT '0.0.0.0',
  PRIMARY KEY (`id`)
) TYPE=MyISAM AUTO_INCREMENT=20706 ROW_FORMAT=DYNAMIC;



DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `news` varchar(255) NOT NULL,
  PRIMARY KEY (`news`)
) TYPE=MyISAM;

/*!40000 ALTER TABLE `news` DISABLE KEYS */;
SET AUTOCOMMIT=0;
INSERT INTO `news` VALUES  ('Welcome to Open_RSCD_v4!');
COMMIT;
/*!40000 ALTER TABLE `news` ENABLE KEYS */;


DROP TABLE IF EXISTS `online`;
CREATE TABLE `online` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `x` varchar(45) NOT NULL,
  `y` varchar(45) NOT NULL,
  `world` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) TYPE=MyISAM ROW_FORMAT=DYNAMIC COMMENT='InnoDB free: 9216 kB';


DROP TABLE IF EXISTS `players`;
CREATE TABLE `players` (
  `user` varchar(255) NOT NULL DEFAULT '0',
  `username` varchar(255) NOT NULL DEFAULT '0',
  `group_id` int(10) DEFAULT '0',
  `owner` int(5) unsigned NOT NULL DEFAULT '0',
  `owner_username` varchar(255) DEFAULT '0',
  `sub_expires` int(5) unsigned DEFAULT '0',
  `combat` int(10) DEFAULT '3',
  `skill_total` int(10) DEFAULT '3',
  `x` int(5) unsigned DEFAULT '216',
  `y` int(5) unsigned DEFAULT '450',
  `fatigue` int(10) DEFAULT '0',
  `combatstyle` tinyint(1) DEFAULT '0',
  `block_chat` tinyint(1) unsigned DEFAULT '0',
  `block_private` tinyint(1) unsigned DEFAULT '0',
  `block_trade` tinyint(1) unsigned DEFAULT '0',
  `block_duel` tinyint(1) unsigned DEFAULT '0',
  `cameraauto` tinyint(1) unsigned DEFAULT '0',
  `onemouse` tinyint(1) unsigned DEFAULT '0',
  `soundoff` tinyint(1) unsigned DEFAULT '0',
  `showroof` tinyint(1) DEFAULT '0',
  `autoscreenshot` tinyint(1) DEFAULT '0',
  `combatwindow` tinyint(1) DEFAULT '0',
  `haircolour` int(5) unsigned DEFAULT '2',
  `topcolour` int(5) unsigned DEFAULT '8',
  `trousercolour` int(5) unsigned DEFAULT '14',
  `skincolour` int(5) unsigned DEFAULT '0',
  `headsprite` int(5) unsigned DEFAULT '1',
  `bodysprite` int(5) unsigned DEFAULT '2',
  `male` tinyint(1) unsigned DEFAULT '1',
  `skulled` int(10) unsigned DEFAULT '0',
  `pass` varchar(255) NOT NULL,
  `creation_date` int(10) unsigned NOT NULL DEFAULT '0',
  `creation_ip` varchar(15) NOT NULL DEFAULT '0.0.0.0',
  `login_date` int(10) unsigned DEFAULT '0',
  `login_ip` varchar(15) DEFAULT '0.0.0.0',
  `playermod` tinyint(1) unsigned DEFAULT '0',
  `loggedin` tinyint(1) DEFAULT '0',
  `banned` tinyint(1) DEFAULT '0',
  `muted` tinyint(1) DEFAULT '0',
  `deaths` int(10) DEFAULT '0',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `online` tinyint(1) unsigned zerofill DEFAULT '0',
  `world` int(10) DEFAULT '1',
  `qp` int(10) NOT NULL DEFAULT '0',
  `kills` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE KEY` (`username`),
  KEY `group_id` (`group_id`),
  KEY `pass` (`pass`),
  KEY `loggedin` (`loggedin`),
  KEY `creation_ip` (`creation_ip`)
) TYPE=MyISAM AUTO_INCREMENT=65434 ROW_FORMAT=DYNAMIC COMMENT='InnoDB free: 9216 kB';


DROP TABLE IF EXISTS `quests`;
CREATE TABLE `quests` (
  `quest_id` int(10) NOT NULL DEFAULT '0',
  `stage` int(10) NOT NULL DEFAULT '0',
  `user` varchar(255) DEFAULT NULL
) TYPE=MyISAM;



DROP TABLE IF EXISTS `reports`;
CREATE TABLE `reports` (
  `from` varchar(255) NOT NULL,
  `about` varchar(255) NOT NULL,
  `time` int(10) unsigned NOT NULL,
  `reason` int(5) unsigned NOT NULL,
  `x` int(5) unsigned NOT NULL,
  `y` int(5) unsigned NOT NULL,
  `status` varchar(255) NOT NULL,
  `id` int(255) unsigned NOT NULL,
  `zapped` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) TYPE=MyISAM;



DROP TABLE IF EXISTS `traps`;
CREATE TABLE `traps` (
  `user` varchar(255) NOT NULL DEFAULT '',
  `ip` varchar(15) NOT NULL DEFAULT '0.0.0.0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `details` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`user`)
) TYPE=MyISAM;



DROP TABLE IF EXISTS `worlds`;
CREATE TABLE `worlds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `location` varchar(45) NOT NULL,
  `ip` varchar(45) NOT NULL,
  `port` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) TYPE=MyISAM AUTO_INCREMENT=2 ROW_FORMAT=DYNAMIC;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
