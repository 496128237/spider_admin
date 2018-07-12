/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50638
 Source Host           : localhost:3306
 Source Schema         : spider

 Target Server Type    : MySQL
 Target Server Version : 50638
 File Encoding         : 65001

 Date: 11/07/2018 19:28:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for zxcms_admin
-- ----------------------------
DROP TABLE IF EXISTS `zxcms_admin`;
CREATE TABLE `zxcms_admin` (
  `id` mediumint(6) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `encrypt` varchar(6) NOT NULL DEFAULT '',
  `lastloginip` int(10) NOT NULL DEFAULT '0',
  `lastlogintime` int(10) unsigned NOT NULL DEFAULT '0',
  `email` varchar(40) NOT NULL DEFAULT '',
  `mobile` varchar(11) NOT NULL DEFAULT '',
  `realname` varchar(50) NOT NULL DEFAULT '',
  `openid` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(2:无效,1:有效)',
  `updatetime` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zxcms_admin
-- ----------------------------
BEGIN;
INSERT INTO `zxcms_admin` VALUES (1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '', 0, 1531280864, '', '', '咸鱼', '', 1, 1531194789);
COMMIT;

-- ----------------------------
-- Table structure for zxcms_admin_group
-- ----------------------------
DROP TABLE IF EXISTS `zxcms_admin_group`;
CREATE TABLE `zxcms_admin_group` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text,
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `listorder` (`listorder`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zxcms_admin_group
-- ----------------------------
BEGIN;
INSERT INTO `zxcms_admin_group` VALUES (1, '普通管理员', '密码加密只是MD5', '', 0, 1477622552);
INSERT INTO `zxcms_admin_group` VALUES (2, '工作人员', '仅拥有日志管理权限', '18,23,27', 0, 1476067479);
INSERT INTO `zxcms_admin_group` VALUES (3, '后台演示', '只能看，不能增删改', '31,1,2,3,7,8,23,18,12,13,27', 0, 1479969527);
COMMIT;

-- ----------------------------
-- Table structure for zxcms_admin_group_access
-- ----------------------------
DROP TABLE IF EXISTS `zxcms_admin_group_access`;
CREATE TABLE `zxcms_admin_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for zxcms_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `zxcms_admin_log`;
CREATE TABLE `zxcms_admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `m` varchar(15) NOT NULL,
  `c` varchar(20) NOT NULL,
  `a` varchar(20) NOT NULL,
  `querystring` varchar(255) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL,
  `ip` int(10) NOT NULL,
  `time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=918 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zxcms_admin_log
-- ----------------------------
BEGIN;
INSERT INTO `zxcms_admin_log` VALUES (1, 'admin', 'Group', 'index', '', 4, 'test', 2130706433, 0);
INSERT INTO `zxcms_admin_log` VALUES (2, 'admin', 'Admin', 'public_edit_info', '', 4, 'test', 0, 1531194480);
INSERT INTO `zxcms_admin_log` VALUES (3, 'admin', 'Admin', 'index', '', 4, 'test', 0, 1531194562);
INSERT INTO `zxcms_admin_log` VALUES (4, 'admin', 'Admin', 'index', '', 4, 'test', 0, 1531194569);
INSERT INTO `zxcms_admin_log` VALUES (5, 'admin', 'Index', 'favicon.ico', '', 1, 'admin', 0, 1531194594);
INSERT INTO `zxcms_admin_log` VALUES (6, 'admin', 'Admin', 'index', '', 1, 'admin', 0, 1531194596);
INSERT INTO `zxcms_admin_log` VALUES (7, 'admin', 'Admin', 'favicon.ico', '', 1, 'admin', 0, 1531194596);
INSERT INTO `zxcms_admin_log` VALUES (8, 'admin', 'Admin', 'del', '?id=4', 1, 'admin', 0, 1531194604);
INSERT INTO `zxcms_admin_log` VALUES (9, 'admin', 'Admin', 'index', '', 1, 'admin', 0, 1531194606);
INSERT INTO `zxcms_admin_log` VALUES (10, 'admin', 'Admin', 'favicon.ico', '', 1, 'admin', 0, 1531194606);
INSERT INTO `zxcms_admin_log` VALUES (11, 'admin', 'Admin', 'del', '?id=3', 1, 'admin', 0, 1531194608);
INSERT INTO `zxcms_admin_log` VALUES (12, 'admin', 'Admin', 'index', '', 1, 'admin', 0, 1531194610);
INSERT INTO `zxcms_admin_log` VALUES (13, 'admin', 'Admin', 'del', '?id=2', 1, 'admin', 0, 1531194612);
INSERT INTO `zxcms_admin_log` VALUES (14, 'admin', 'Admin', 'index', '', 1, 'admin', 0, 1531194613);
INSERT INTO `zxcms_admin_log` VALUES (15, 'admin', 'Admin', 'info', '', 1, 'admin', 0, 1531194615);
INSERT INTO `zxcms_admin_log` VALUES (16, 'admin', 'Group', 'index', '', 1, 'admin', 0, 1531194624);
INSERT INTO `zxcms_admin_log` VALUES (17, 'admin', 'Group', 'favicon.ico', '', 1, 'admin', 0, 1531194624);
INSERT INTO `zxcms_admin_log` VALUES (18, 'admin', 'Group', 'info', '?id=1', 1, 'admin', 0, 1531194627);
INSERT INTO `zxcms_admin_log` VALUES (19, 'admin', 'Group', 'favicon.ico', '', 1, 'admin', 0, 1531194628);
INSERT INTO `zxcms_admin_log` VALUES (20, 'admin', 'Group', 'index', '', 1, 'admin', 0, 1531194633);
INSERT INTO `zxcms_admin_log` VALUES (21, 'admin', 'Group', 'rule', '?gid=1', 1, 'admin', 0, 1531194642);
INSERT INTO `zxcms_admin_log` VALUES (22, 'admin', 'Group', 'index', '', 1, 'admin', 0, 1531194645);
INSERT INTO `zxcms_admin_log` VALUES (23, 'admin', 'Index', 'favicon.ico', '', 1, 'admin', 0, 1531194648);
INSERT INTO `zxcms_admin_log` VALUES (24, 'admin', 'Group', 'index', '', 1, 'admin', 0, 1531194651);
INSERT INTO `zxcms_admin_log` VALUES (25, 'admin', 'Menu', 'favicon.ico', '', 1, 'admin', 0, 1531194659);
INSERT INTO `zxcms_admin_log` VALUES (26, 'admin', 'Menu', 'info', '', 1, 'admin', 0, 1531194669);
INSERT INTO `zxcms_admin_log` VALUES (27, 'admin', 'Admin', 'index', '', 1, 'admin', 0, 1531194768);
INSERT INTO `zxcms_admin_log` VALUES (28, 'admin', 'Group', 'index', '', 1, 'admin', 0, 1531194771);
INSERT INTO `zxcms_admin_log` VALUES (29, 'admin', 'Admin', 'public_edit_info', '', 1, 'admin', 0, 1531194773);
INSERT INTO `zxcms_admin_log` VALUES (30, 'admin', 'Admin', 'public_edit_info', '', 1, 'admin', 0, 1531194789);
INSERT INTO `zxcms_admin_log` VALUES (31, 'admin', 'Admin', 'public_edit_info', '', 1, 'admin', 0, 1531194790);
INSERT INTO `zxcms_admin_log` VALUES (32, 'admin', 'Admin', 'public_edit_info', '', 1, 'admin', 0, 1531194793);
INSERT INTO `zxcms_admin_log` VALUES (33, 'admin', 'Menu', 'info', '?parentid=7', 1, 'admin', 0, 1531194805);
INSERT INTO `zxcms_admin_log` VALUES (34, 'admin', 'Menu', 'favicon.ico', '', 1, 'admin', 0, 1531194806);
INSERT INTO `zxcms_admin_log` VALUES (35, 'admin', 'Log', 'favicon.ico', '', 1, 'admin', 0, 1531194949);
INSERT INTO `zxcms_admin_log` VALUES (36, 'admin', 'Menu', 'info', '?id=31', 1, 'admin', 0, 1531194959);
INSERT INTO `zxcms_admin_log` VALUES (37, 'admin', 'Menu', 'info', '', 1, 'admin', 0, 1531195031);
INSERT INTO `zxcms_admin_log` VALUES (38, 'admin', 'Menu', 'info', '?id=1', 1, 'admin', 0, 1531195048);
INSERT INTO `zxcms_admin_log` VALUES (39, 'admin', 'Menu', 'info', '?id=3', 1, 'admin', 0, 1531195055);
INSERT INTO `zxcms_admin_log` VALUES (40, 'admin', 'Menu', 'add', '', 1, 'admin', 0, 1531195070);
INSERT INTO `zxcms_admin_log` VALUES (41, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531195276);
INSERT INTO `zxcms_admin_log` VALUES (42, 'admin', 'Site', 'favicon.ico', '', 1, 'admin', 0, 1531195277);
INSERT INTO `zxcms_admin_log` VALUES (43, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531195279);
INSERT INTO `zxcms_admin_log` VALUES (44, 'admin', 'Menu', 'setlistorder', '', 1, 'admin', 0, 1531195322);
INSERT INTO `zxcms_admin_log` VALUES (45, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531195329);
INSERT INTO `zxcms_admin_log` VALUES (46, 'admin', 'Menu', 'info', '', 1, 'admin', 0, 1531195344);
INSERT INTO `zxcms_admin_log` VALUES (47, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531200970);
INSERT INTO `zxcms_admin_log` VALUES (48, 'admin', 'Site', 'info', '', 1, 'admin', 0, 1531200974);
INSERT INTO `zxcms_admin_log` VALUES (49, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531200980);
INSERT INTO `zxcms_admin_log` VALUES (50, 'admin', 'Admin', 'index', '', 1, 'admin', 0, 1531200998);
INSERT INTO `zxcms_admin_log` VALUES (51, 'admin', 'Menu', 'info', '?id=2', 1, 'admin', 0, 1531201038);
INSERT INTO `zxcms_admin_log` VALUES (52, 'admin', 'Site', 'info', '', 1, 'admin', 0, 1531201049);
INSERT INTO `zxcms_admin_log` VALUES (53, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531201054);
INSERT INTO `zxcms_admin_log` VALUES (54, 'admin', 'Site', 'info', '', 1, 'admin', 0, 1531201111);
INSERT INTO `zxcms_admin_log` VALUES (55, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531201116);
INSERT INTO `zxcms_admin_log` VALUES (56, 'admin', 'Site', 'info', '', 1, 'admin', 0, 1531201143);
INSERT INTO `zxcms_admin_log` VALUES (57, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531201146);
INSERT INTO `zxcms_admin_log` VALUES (58, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531201148);
INSERT INTO `zxcms_admin_log` VALUES (59, 'admin', 'Site', 'favicon.ico', '', 1, 'admin', 0, 1531201148);
INSERT INTO `zxcms_admin_log` VALUES (60, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531201149);
INSERT INTO `zxcms_admin_log` VALUES (61, 'admin', 'Site', 'info', '', 1, 'admin', 0, 1531201151);
INSERT INTO `zxcms_admin_log` VALUES (62, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531201154);
INSERT INTO `zxcms_admin_log` VALUES (63, 'admin', 'Admin', 'index', '', 1, 'admin', 0, 1531201185);
INSERT INTO `zxcms_admin_log` VALUES (64, 'admin', 'Admin', 'favicon.ico', '', 1, 'admin', 0, 1531201186);
INSERT INTO `zxcms_admin_log` VALUES (65, 'admin', 'Admin', 'info', '', 1, 'admin', 0, 1531201187);
INSERT INTO `zxcms_admin_log` VALUES (66, 'admin', 'Admin', 'index', '', 1, 'admin', 0, 1531201190);
INSERT INTO `zxcms_admin_log` VALUES (67, 'admin', 'Admin', 'info', '', 1, 'admin', 0, 1531201192);
INSERT INTO `zxcms_admin_log` VALUES (68, 'admin', 'Admin', 'index', '', 1, 'admin', 0, 1531201196);
INSERT INTO `zxcms_admin_log` VALUES (69, 'admin', 'Menu', 'favicon.ico', '', 1, 'admin', 0, 1531201243);
INSERT INTO `zxcms_admin_log` VALUES (70, 'admin', 'Menu', 'info', '', 1, 'admin', 0, 1531201244);
INSERT INTO `zxcms_admin_log` VALUES (71, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531202238);
INSERT INTO `zxcms_admin_log` VALUES (72, 'admin', 'Site', 'favicon.ico', '', 1, 'admin', 0, 1531202239);
INSERT INTO `zxcms_admin_log` VALUES (73, 'admin', 'Menu', 'favicon.ico', '', 1, 'admin', 0, 1531202242);
INSERT INTO `zxcms_admin_log` VALUES (74, 'admin', 'Menu', 'info', '?parentid=32', 1, 'admin', 0, 1531202263);
INSERT INTO `zxcms_admin_log` VALUES (75, 'admin', 'Menu', 'favicon.ico', '', 1, 'admin', 0, 1531202264);
INSERT INTO `zxcms_admin_log` VALUES (76, 'admin', 'Menu', 'add', '', 1, 'admin', 0, 1531202305);
INSERT INTO `zxcms_admin_log` VALUES (77, 'admin', 'Site', 'index', '?www.artmai.net', 1, 'admin', 0, 1531202312);
INSERT INTO `zxcms_admin_log` VALUES (78, 'admin', 'Site', 'index', '?www.artmai.net', 1, 'admin', 0, 1531202317);
INSERT INTO `zxcms_admin_log` VALUES (79, 'admin', 'Site', 'index', '?www.artmai.net', 1, 'admin', 0, 1531202321);
INSERT INTO `zxcms_admin_log` VALUES (80, 'admin', 'Site', 'index', '?www.artmai.net', 1, 'admin', 0, 1531202330);
INSERT INTO `zxcms_admin_log` VALUES (81, 'admin', 'Site', 'index', '?www.artmai.net', 1, 'admin', 0, 1531202332);
INSERT INTO `zxcms_admin_log` VALUES (82, 'admin', 'Menu', 'info', '?id=33', 1, 'admin', 0, 1531202452);
INSERT INTO `zxcms_admin_log` VALUES (83, 'admin', 'Menu', 'edit', '', 1, 'admin', 0, 1531202465);
INSERT INTO `zxcms_admin_log` VALUES (84, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531202469);
INSERT INTO `zxcms_admin_log` VALUES (85, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531202471);
INSERT INTO `zxcms_admin_log` VALUES (86, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531202477);
INSERT INTO `zxcms_admin_log` VALUES (87, 'admin', 'Site', 'info', '', 1, 'admin', 0, 1531202481);
INSERT INTO `zxcms_admin_log` VALUES (88, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531202485);
INSERT INTO `zxcms_admin_log` VALUES (89, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531202537);
INSERT INTO `zxcms_admin_log` VALUES (90, 'admin', 'Site', 'info', '', 1, 'admin', 0, 1531202540);
INSERT INTO `zxcms_admin_log` VALUES (91, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531202630);
INSERT INTO `zxcms_admin_log` VALUES (92, 'admin', 'Admin', 'index', '', 1, 'admin', 0, 1531202632);
INSERT INTO `zxcms_admin_log` VALUES (93, 'admin', 'Admin', 'favicon.ico', '', 1, 'admin', 0, 1531202633);
INSERT INTO `zxcms_admin_log` VALUES (94, 'admin', 'Admin', 'info', '', 1, 'admin', 0, 1531202634);
INSERT INTO `zxcms_admin_log` VALUES (95, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531202668);
INSERT INTO `zxcms_admin_log` VALUES (96, 'admin', 'Site', 'info', '', 1, 'admin', 0, 1531202669);
INSERT INTO `zxcms_admin_log` VALUES (97, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531202671);
INSERT INTO `zxcms_admin_log` VALUES (98, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531202694);
INSERT INTO `zxcms_admin_log` VALUES (99, 'admin', 'Site', 'info', '', 1, 'admin', 0, 1531202696);
INSERT INTO `zxcms_admin_log` VALUES (100, 'admin', 'Admin', 'index', '', 1, 'admin', 0, 1531202726);
INSERT INTO `zxcms_admin_log` VALUES (101, 'admin', 'Admin', 'info', '', 1, 'admin', 0, 1531202728);
INSERT INTO `zxcms_admin_log` VALUES (102, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531202910);
INSERT INTO `zxcms_admin_log` VALUES (103, 'admin', 'Admin', 'index', '', 1, 'admin', 0, 1531202915);
INSERT INTO `zxcms_admin_log` VALUES (104, 'admin', 'Admin', 'info', '', 1, 'admin', 0, 1531202917);
INSERT INTO `zxcms_admin_log` VALUES (105, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531202921);
INSERT INTO `zxcms_admin_log` VALUES (106, 'admin', 'Site', 'info', '', 1, 'admin', 0, 1531202923);
INSERT INTO `zxcms_admin_log` VALUES (107, 'admin', 'Site', 'info', '', 1, 'admin', 0, 1531202940);
INSERT INTO `zxcms_admin_log` VALUES (108, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531202958);
INSERT INTO `zxcms_admin_log` VALUES (109, 'admin', 'Menu', 'info', '?id=1', 1, 'admin', 0, 1531202970);
INSERT INTO `zxcms_admin_log` VALUES (110, 'admin', 'Menu', 'info', '?id=32', 1, 'admin', 0, 1531202980);
INSERT INTO `zxcms_admin_log` VALUES (111, 'admin', 'Menu', 'info', '?id=2', 1, 'admin', 0, 1531202989);
INSERT INTO `zxcms_admin_log` VALUES (112, 'admin', 'Menu', 'info', '?id=33', 1, 'admin', 0, 1531202999);
INSERT INTO `zxcms_admin_log` VALUES (113, 'admin', 'Menu', 'edit', '', 1, 'admin', 0, 1531203032);
INSERT INTO `zxcms_admin_log` VALUES (114, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531203037);
INSERT INTO `zxcms_admin_log` VALUES (115, 'admin', 'Site', 'info', '', 1, 'admin', 0, 1531203041);
INSERT INTO `zxcms_admin_log` VALUES (116, 'admin', 'Site', 'info', '', 1, 'admin', 0, 1531203062);
INSERT INTO `zxcms_admin_log` VALUES (117, 'admin', 'Site', 'info', '', 1, 'admin', 0, 1531203075);
INSERT INTO `zxcms_admin_log` VALUES (118, 'admin', 'Menu', 'info', '?id=33', 1, 'admin', 0, 1531203123);
INSERT INTO `zxcms_admin_log` VALUES (119, 'admin', 'Menu', 'info', '?parentid=33', 1, 'admin', 0, 1531203135);
INSERT INTO `zxcms_admin_log` VALUES (120, 'admin', 'Menu', 'add', '', 1, 'admin', 0, 1531203154);
INSERT INTO `zxcms_admin_log` VALUES (121, 'admin', 'Site', 'info', '', 1, 'admin', 0, 1531203164);
INSERT INTO `zxcms_admin_log` VALUES (122, 'admin', 'Site', 'info', '', 1, 'admin', 0, 1531203177);
INSERT INTO `zxcms_admin_log` VALUES (123, 'admin', 'Menu', 'info', '?id=34', 1, 'admin', 0, 1531203188);
INSERT INTO `zxcms_admin_log` VALUES (124, 'admin', 'Menu', 'edit', '', 1, 'admin', 0, 1531203192);
INSERT INTO `zxcms_admin_log` VALUES (125, 'admin', 'Site', 'info', '', 1, 'admin', 0, 1531203195);
INSERT INTO `zxcms_admin_log` VALUES (126, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531203198);
INSERT INTO `zxcms_admin_log` VALUES (127, 'admin', 'Site', 'info', '', 1, 'admin', 0, 1531203203);
INSERT INTO `zxcms_admin_log` VALUES (128, 'admin', 'Site', 'info', '', 1, 'admin', 0, 1531203397);
INSERT INTO `zxcms_admin_log` VALUES (129, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531203403);
INSERT INTO `zxcms_admin_log` VALUES (130, 'admin', 'Site', 'info', '', 1, 'admin', 0, 1531203405);
INSERT INTO `zxcms_admin_log` VALUES (131, 'admin', 'Site', 'info', '', 1, 'admin', 0, 1531203462);
INSERT INTO `zxcms_admin_log` VALUES (132, 'admin', 'Admin', 'index', '', 1, 'admin', 0, 1531203466);
INSERT INTO `zxcms_admin_log` VALUES (133, 'admin', 'Admin', 'info', '', 1, 'admin', 0, 1531203467);
INSERT INTO `zxcms_admin_log` VALUES (134, 'admin', 'Site', 'info', '', 1, 'admin', 0, 1531203494);
INSERT INTO `zxcms_admin_log` VALUES (135, 'admin', 'Site', 'info', '', 1, 'admin', 0, 1531203597);
INSERT INTO `zxcms_admin_log` VALUES (136, 'admin', 'Site', 'info', '', 1, 'admin', 0, 1531203602);
INSERT INTO `zxcms_admin_log` VALUES (137, 'admin', 'Site', 'favicon.ico', '', 1, 'admin', 0, 1531203603);
INSERT INTO `zxcms_admin_log` VALUES (138, 'admin', 'Site', 'info', '', 1, 'admin', 0, 1531204497);
INSERT INTO `zxcms_admin_log` VALUES (139, 'admin', 'Site', 'add', '', 1, 'admin', 0, 1531204575);
INSERT INTO `zxcms_admin_log` VALUES (140, 'admin', 'Site', 'add', '', 1, 'admin', 0, 1531204599);
INSERT INTO `zxcms_admin_log` VALUES (141, 'admin', 'Site', 'info', '', 1, 'admin', 0, 1531205428);
INSERT INTO `zxcms_admin_log` VALUES (142, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531205436);
INSERT INTO `zxcms_admin_log` VALUES (143, 'admin', 'Site', 'info', '', 1, 'admin', 0, 1531205438);
INSERT INTO `zxcms_admin_log` VALUES (144, 'admin', 'Site', 'info', '', 1, 'admin', 0, 1531205445);
INSERT INTO `zxcms_admin_log` VALUES (145, 'admin', 'Site', 'info', '', 1, 'admin', 0, 1531205855);
INSERT INTO `zxcms_admin_log` VALUES (146, 'admin', 'Site', 'add', '', 1, 'admin', 0, 1531205970);
INSERT INTO `zxcms_admin_log` VALUES (147, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531205972);
INSERT INTO `zxcms_admin_log` VALUES (148, 'admin', 'Site', 'favicon.ico', '', 1, 'admin', 0, 1531205972);
INSERT INTO `zxcms_admin_log` VALUES (149, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531205973);
INSERT INTO `zxcms_admin_log` VALUES (150, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531206153);
INSERT INTO `zxcms_admin_log` VALUES (151, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531206473);
INSERT INTO `zxcms_admin_log` VALUES (152, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531206489);
INSERT INTO `zxcms_admin_log` VALUES (153, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531206514);
INSERT INTO `zxcms_admin_log` VALUES (154, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531206551);
INSERT INTO `zxcms_admin_log` VALUES (155, 'admin', 'Site', 'favicon.ico', '', 1, 'admin', 0, 1531206551);
INSERT INTO `zxcms_admin_log` VALUES (156, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531206559);
INSERT INTO `zxcms_admin_log` VALUES (157, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531206631);
INSERT INTO `zxcms_admin_log` VALUES (158, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531206662);
INSERT INTO `zxcms_admin_log` VALUES (159, 'admin', 'Site', 'favicon.ico', '', 1, 'admin', 0, 1531206663);
INSERT INTO `zxcms_admin_log` VALUES (160, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531206682);
INSERT INTO `zxcms_admin_log` VALUES (161, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531206684);
INSERT INTO `zxcms_admin_log` VALUES (162, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531206703);
INSERT INTO `zxcms_admin_log` VALUES (163, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531206721);
INSERT INTO `zxcms_admin_log` VALUES (164, 'admin', 'Site', 'www.artmai.net', '', 1, 'admin', 0, 1531206723);
INSERT INTO `zxcms_admin_log` VALUES (165, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531206788);
INSERT INTO `zxcms_admin_log` VALUES (166, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531206812);
INSERT INTO `zxcms_admin_log` VALUES (167, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531206877);
INSERT INTO `zxcms_admin_log` VALUES (168, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531206899);
INSERT INTO `zxcms_admin_log` VALUES (169, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531206916);
INSERT INTO `zxcms_admin_log` VALUES (170, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531206968);
INSERT INTO `zxcms_admin_log` VALUES (171, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531206987);
INSERT INTO `zxcms_admin_log` VALUES (172, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531207055);
INSERT INTO `zxcms_admin_log` VALUES (173, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531207116);
INSERT INTO `zxcms_admin_log` VALUES (174, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531207136);
INSERT INTO `zxcms_admin_log` VALUES (175, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531207153);
INSERT INTO `zxcms_admin_log` VALUES (176, 'admin', 'Site', 'info', '?id=1', 1, 'admin', 0, 1531207164);
INSERT INTO `zxcms_admin_log` VALUES (177, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531207167);
INSERT INTO `zxcms_admin_log` VALUES (178, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531207179);
INSERT INTO `zxcms_admin_log` VALUES (179, 'admin', 'Site', 'del', '?id=1', 1, 'admin', 0, 1531207192);
INSERT INTO `zxcms_admin_log` VALUES (180, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531207194);
INSERT INTO `zxcms_admin_log` VALUES (181, 'admin', 'Site', 'info', '?id=1', 1, 'admin', 0, 1531207226);
INSERT INTO `zxcms_admin_log` VALUES (182, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531207230);
INSERT INTO `zxcms_admin_log` VALUES (183, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531207336);
INSERT INTO `zxcms_admin_log` VALUES (184, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531207341);
INSERT INTO `zxcms_admin_log` VALUES (185, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531207350);
INSERT INTO `zxcms_admin_log` VALUES (186, 'admin', 'Site', 'favicon.ico', '', 1, 'admin', 0, 1531207351);
INSERT INTO `zxcms_admin_log` VALUES (187, 'admin', 'Site', 'info', '', 1, 'admin', 0, 1531207382);
INSERT INTO `zxcms_admin_log` VALUES (188, 'admin', 'Site', 'add', '', 1, 'admin', 0, 1531207427);
INSERT INTO `zxcms_admin_log` VALUES (189, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531207431);
INSERT INTO `zxcms_admin_log` VALUES (190, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531207431);
INSERT INTO `zxcms_admin_log` VALUES (191, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531207439);
INSERT INTO `zxcms_admin_log` VALUES (192, 'admin', 'Site', 'index', '?page=2', 1, 'admin', 0, 1531207448);
INSERT INTO `zxcms_admin_log` VALUES (193, 'admin', 'Site', 'index', '?page=1', 1, 'admin', 0, 1531207451);
INSERT INTO `zxcms_admin_log` VALUES (194, 'admin', 'Site', 'index', '?page=2', 1, 'admin', 0, 1531207461);
INSERT INTO `zxcms_admin_log` VALUES (195, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531207465);
INSERT INTO `zxcms_admin_log` VALUES (196, 'admin', 'Site', 'info', '?id=1', 1, 'admin', 0, 1531207477);
INSERT INTO `zxcms_admin_log` VALUES (197, 'admin', 'Site', 'info', '?id=1', 1, 'admin', 0, 1531207630);
INSERT INTO `zxcms_admin_log` VALUES (198, 'admin', 'Site', 'edit', '', 1, 'admin', 0, 1531207640);
INSERT INTO `zxcms_admin_log` VALUES (199, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531207691);
INSERT INTO `zxcms_admin_log` VALUES (200, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531207693);
INSERT INTO `zxcms_admin_log` VALUES (201, 'admin', 'Site', 'info', '', 1, 'admin', 0, 1531207695);
INSERT INTO `zxcms_admin_log` VALUES (202, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531207700);
INSERT INTO `zxcms_admin_log` VALUES (203, 'admin', 'Site', 'info', '?id=1', 1, 'admin', 0, 1531207702);
INSERT INTO `zxcms_admin_log` VALUES (204, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531207705);
INSERT INTO `zxcms_admin_log` VALUES (205, 'admin', 'Site', 'info', '?id=2', 1, 'admin', 0, 1531207706);
INSERT INTO `zxcms_admin_log` VALUES (206, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531207710);
INSERT INTO `zxcms_admin_log` VALUES (207, 'admin', 'Site', 'info', '?id=1', 1, 'admin', 0, 1531207948);
INSERT INTO `zxcms_admin_log` VALUES (208, 'admin', 'Site', 'edit', '', 1, 'admin', 0, 1531207954);
INSERT INTO `zxcms_admin_log` VALUES (209, 'admin', 'Site', 'edit', '', 1, 'admin', 0, 1531207981);
INSERT INTO `zxcms_admin_log` VALUES (210, 'admin', 'Site', 'edit', '', 1, 'admin', 0, 1531208037);
INSERT INTO `zxcms_admin_log` VALUES (211, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531208051);
INSERT INTO `zxcms_admin_log` VALUES (212, 'admin', 'Site', 'info', '?id=1', 1, 'admin', 0, 1531208055);
INSERT INTO `zxcms_admin_log` VALUES (213, 'admin', 'Site', 'edit', '', 1, 'admin', 0, 1531208059);
INSERT INTO `zxcms_admin_log` VALUES (214, 'admin', 'Site', 'edit', '', 1, 'admin', 0, 1531208086);
INSERT INTO `zxcms_admin_log` VALUES (215, 'admin', 'Site', 'edit', '', 1, 'admin', 0, 1531208251);
INSERT INTO `zxcms_admin_log` VALUES (216, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531208282);
INSERT INTO `zxcms_admin_log` VALUES (217, 'admin', 'Site', 'info', '?id=1', 1, 'admin', 0, 1531208285);
INSERT INTO `zxcms_admin_log` VALUES (218, 'admin', 'Site', 'edit', '', 1, 'admin', 0, 1531208290);
INSERT INTO `zxcms_admin_log` VALUES (219, 'admin', 'Site', 'info', '?id=1', 1, 'admin', 0, 1531208293);
INSERT INTO `zxcms_admin_log` VALUES (220, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531208297);
INSERT INTO `zxcms_admin_log` VALUES (221, 'admin', 'Site', 'info', '?id=1', 1, 'admin', 0, 1531208316);
INSERT INTO `zxcms_admin_log` VALUES (222, 'admin', 'Site', 'edit', '', 1, 'admin', 0, 1531208321);
INSERT INTO `zxcms_admin_log` VALUES (223, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531208323);
INSERT INTO `zxcms_admin_log` VALUES (224, 'admin', 'Site', 'del', '?id=2', 1, 'admin', 0, 1531208359);
INSERT INTO `zxcms_admin_log` VALUES (225, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531208450);
INSERT INTO `zxcms_admin_log` VALUES (226, 'admin', 'Site', 'del', '?id=2', 1, 'admin', 0, 1531208454);
INSERT INTO `zxcms_admin_log` VALUES (227, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531208458);
INSERT INTO `zxcms_admin_log` VALUES (228, 'admin', 'Site', 'info', '?id=1', 1, 'admin', 0, 1531208499);
INSERT INTO `zxcms_admin_log` VALUES (229, 'admin', 'Site', 'edit', '', 1, 'admin', 0, 1531208516);
INSERT INTO `zxcms_admin_log` VALUES (230, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531208519);
INSERT INTO `zxcms_admin_log` VALUES (231, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531208557);
INSERT INTO `zxcms_admin_log` VALUES (232, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531208596);
INSERT INTO `zxcms_admin_log` VALUES (233, 'admin', 'Menu', 'favicon.ico', '', 1, 'admin', 0, 1531208602);
INSERT INTO `zxcms_admin_log` VALUES (234, 'admin', 'Admin', 'index', '', 1, 'admin', 0, 1531208605);
INSERT INTO `zxcms_admin_log` VALUES (235, 'admin', 'Admin', 'favicon.ico', '', 1, 'admin', 0, 1531208606);
INSERT INTO `zxcms_admin_log` VALUES (236, 'admin', 'Menu', 'info', '?parentid=33', 1, 'admin', 0, 1531208627);
INSERT INTO `zxcms_admin_log` VALUES (237, 'admin', 'Menu', 'favicon.ico', '', 1, 'admin', 0, 1531208628);
INSERT INTO `zxcms_admin_log` VALUES (238, 'admin', 'Menu', 'add', '', 1, 'admin', 0, 1531208643);
INSERT INTO `zxcms_admin_log` VALUES (239, 'admin', 'Menu', 'info', '?parentid=33', 1, 'admin', 0, 1531208656);
INSERT INTO `zxcms_admin_log` VALUES (240, 'admin', 'Menu', 'add', '', 1, 'admin', 0, 1531208669);
INSERT INTO `zxcms_admin_log` VALUES (241, 'admin', 'Menu', 'info', '?parentid=33', 1, 'admin', 0, 1531208673);
INSERT INTO `zxcms_admin_log` VALUES (242, 'admin', 'Menu', 'add', '', 1, 'admin', 0, 1531208687);
INSERT INTO `zxcms_admin_log` VALUES (243, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531208718);
INSERT INTO `zxcms_admin_log` VALUES (244, 'admin', 'Menu', 'info', '?parentid=33', 1, 'admin', 0, 1531208777);
INSERT INTO `zxcms_admin_log` VALUES (245, 'admin', 'Menu', 'add', '', 1, 'admin', 0, 1531208799);
INSERT INTO `zxcms_admin_log` VALUES (246, 'admin', 'Site', 'spider', '', 1, 'admin', 0, 1531208805);
INSERT INTO `zxcms_admin_log` VALUES (247, 'admin', 'Site', 'spider', '', 1, 'admin', 0, 1531208822);
INSERT INTO `zxcms_admin_log` VALUES (248, 'admin', 'Menu', 'info', '?id=38', 1, 'admin', 0, 1531208849);
INSERT INTO `zxcms_admin_log` VALUES (249, 'admin', 'Menu', 'edit', '', 1, 'admin', 0, 1531208852);
INSERT INTO `zxcms_admin_log` VALUES (250, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531208856);
INSERT INTO `zxcms_admin_log` VALUES (251, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531208960);
INSERT INTO `zxcms_admin_log` VALUES (252, 'admin', 'Site', 'spider', '?id=1', 1, 'admin', 0, 1531208963);
INSERT INTO `zxcms_admin_log` VALUES (253, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531208989);
INSERT INTO `zxcms_admin_log` VALUES (254, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531208991);
INSERT INTO `zxcms_admin_log` VALUES (255, 'admin', 'Site', 'spider', '?id=1', 1, 'admin', 0, 1531208993);
INSERT INTO `zxcms_admin_log` VALUES (256, 'admin', 'Menu', 'info', '?parentid=38', 1, 'admin', 0, 1531209073);
INSERT INTO `zxcms_admin_log` VALUES (257, 'admin', 'Menu', 'info', '?id=38', 1, 'admin', 0, 1531209085);
INSERT INTO `zxcms_admin_log` VALUES (258, 'admin', 'Menu', 'del', '?id=38', 1, 'admin', 0, 1531209111);
INSERT INTO `zxcms_admin_log` VALUES (259, 'admin', 'Menu', 'info', '', 1, 'admin', 0, 1531209120);
INSERT INTO `zxcms_admin_log` VALUES (260, 'admin', 'Menu', 'add', '', 1, 'admin', 0, 1531209141);
INSERT INTO `zxcms_admin_log` VALUES (261, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531209258);
INSERT INTO `zxcms_admin_log` VALUES (262, 'admin', 'Site', 'spider', '?id=1', 1, 'admin', 0, 1531209259);
INSERT INTO `zxcms_admin_log` VALUES (263, 'admin', 'Site', 'spider', '?id=1', 1, 'admin', 0, 1531209267);
INSERT INTO `zxcms_admin_log` VALUES (264, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531209326);
INSERT INTO `zxcms_admin_log` VALUES (265, 'admin', 'Spider', 'index', '?id=1', 1, 'admin', 0, 1531209328);
INSERT INTO `zxcms_admin_log` VALUES (266, 'admin', 'Spider', 'index', '?id=1', 1, 'admin', 0, 1531209368);
INSERT INTO `zxcms_admin_log` VALUES (267, 'admin', 'Spider', 'index', '?id=1', 1, 'admin', 0, 1531209453);
INSERT INTO `zxcms_admin_log` VALUES (268, 'admin', 'Spider', 'index', '?id=1', 1, 'admin', 0, 1531209519);
INSERT INTO `zxcms_admin_log` VALUES (269, 'admin', 'Spider', 'index', '?id=1', 1, 'admin', 0, 1531209544);
INSERT INTO `zxcms_admin_log` VALUES (270, 'admin', 'Spider', 'index', '?id=1', 1, 'admin', 0, 1531209546);
INSERT INTO `zxcms_admin_log` VALUES (271, 'admin', 'Spider', 'index', '?id=1', 1, 'admin', 0, 1531209568);
INSERT INTO `zxcms_admin_log` VALUES (272, 'admin', 'Spider', 'index', '?id=1', 1, 'admin', 0, 1531209571);
INSERT INTO `zxcms_admin_log` VALUES (273, 'admin', 'Spider', 'index', '?id=1', 1, 'admin', 0, 1531209601);
INSERT INTO `zxcms_admin_log` VALUES (274, 'admin', 'Spider', 'index', '?id=1', 1, 'admin', 0, 1531209618);
INSERT INTO `zxcms_admin_log` VALUES (275, 'admin', 'Spider', 'index', '?id=1', 1, 'admin', 0, 1531209652);
INSERT INTO `zxcms_admin_log` VALUES (276, 'admin', 'Spider', 'favicon.ico', '', 1, 'admin', 0, 1531209653);
INSERT INTO `zxcms_admin_log` VALUES (277, 'admin', 'Spider', 'index', '?id=1', 1, 'admin', 0, 1531209724);
INSERT INTO `zxcms_admin_log` VALUES (278, 'admin', 'Spider', 'index', '', 1, 'admin', 0, 1531209735);
INSERT INTO `zxcms_admin_log` VALUES (279, 'admin', 'Spider', 'index', '?id=1', 1, 'admin', 0, 1531209739);
INSERT INTO `zxcms_admin_log` VALUES (280, 'admin', 'Spider', 'index', '', 1, 'admin', 0, 1531209741);
INSERT INTO `zxcms_admin_log` VALUES (281, 'admin', 'Spider', 'index', '?id=1', 1, 'admin', 0, 1531209749);
INSERT INTO `zxcms_admin_log` VALUES (282, 'admin', 'Menu', 'info', '?parentid=39', 1, 'admin', 0, 1531209795);
INSERT INTO `zxcms_admin_log` VALUES (283, 'admin', 'Menu', 'info', '?parentid=39', 1, 'admin', 0, 1531209845);
INSERT INTO `zxcms_admin_log` VALUES (284, 'admin', 'Menu', 'add', '', 1, 'admin', 0, 1531209868);
INSERT INTO `zxcms_admin_log` VALUES (285, 'admin', 'Spider', 'index', '?id=1', 1, 'admin', 0, 1531209873);
INSERT INTO `zxcms_admin_log` VALUES (286, 'admin', 'Spider', 'index', '?id=1', 1, 'admin', 0, 1531209877);
INSERT INTO `zxcms_admin_log` VALUES (287, 'admin', 'Spider', 'index', '', 1, 'admin', 0, 1531209895);
INSERT INTO `zxcms_admin_log` VALUES (288, 'admin', 'Spider', 'favicon.ico', '', 1, 'admin', 0, 1531209896);
INSERT INTO `zxcms_admin_log` VALUES (289, 'admin', 'Menu', 'info', '?parentid=40', 1, 'admin', 0, 1531209930);
INSERT INTO `zxcms_admin_log` VALUES (290, 'admin', 'Menu', 'info', '?id=40', 1, 'admin', 0, 1531209952);
INSERT INTO `zxcms_admin_log` VALUES (291, 'admin', 'Menu', 'edit', '', 1, 'admin', 0, 1531209963);
INSERT INTO `zxcms_admin_log` VALUES (292, 'admin', 'Spider', 'index', '?id=1', 1, 'admin', 0, 1531209966);
INSERT INTO `zxcms_admin_log` VALUES (293, 'admin', 'Menu', 'info', '?id=40', 1, 'admin', 0, 1531210045);
INSERT INTO `zxcms_admin_log` VALUES (294, 'admin', 'Menu', 'edit', '', 1, 'admin', 0, 1531210047);
INSERT INTO `zxcms_admin_log` VALUES (295, 'admin', 'Spider', 'index', '?id=1', 1, 'admin', 0, 1531210049);
INSERT INTO `zxcms_admin_log` VALUES (296, 'admin', 'Spider', 'index', '?id=1', 1, 'admin', 0, 1531210050);
INSERT INTO `zxcms_admin_log` VALUES (297, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531210058);
INSERT INTO `zxcms_admin_log` VALUES (298, 'admin', 'Spider', 'index', '?id=1', 1, 'admin', 0, 1531210060);
INSERT INTO `zxcms_admin_log` VALUES (299, 'admin', 'Spider', 'index', '?id=1', 1, 'admin', 0, 1531210085);
INSERT INTO `zxcms_admin_log` VALUES (300, 'admin', 'Menu', 'info', '?id=40', 1, 'admin', 0, 1531210143);
INSERT INTO `zxcms_admin_log` VALUES (301, 'admin', 'Menu', 'edit', '', 1, 'admin', 0, 1531210168);
INSERT INTO `zxcms_admin_log` VALUES (302, 'admin', 'Spider', 'index', '?id=1', 1, 'admin', 0, 1531210180);
INSERT INTO `zxcms_admin_log` VALUES (303, 'admin', 'Menu', 'info', '?id=40', 1, 'admin', 0, 1531210200);
INSERT INTO `zxcms_admin_log` VALUES (304, 'admin', 'Menu', 'info', '?parentid=40', 1, 'admin', 0, 1531210210);
INSERT INTO `zxcms_admin_log` VALUES (305, 'admin', 'Menu', 'add', '', 1, 'admin', 0, 1531210239);
INSERT INTO `zxcms_admin_log` VALUES (306, 'admin', 'Spider', 'index', '?id=1', 1, 'admin', 0, 1531210241);
INSERT INTO `zxcms_admin_log` VALUES (307, 'admin', 'Spider', 'index', '?id=1', 1, 'admin', 0, 1531210245);
INSERT INTO `zxcms_admin_log` VALUES (308, 'admin', 'Spider', 'index', '', 1, 'admin', 0, 1531210249);
INSERT INTO `zxcms_admin_log` VALUES (309, 'admin', 'Spider', 'index', '', 1, 'admin', 0, 1531210251);
INSERT INTO `zxcms_admin_log` VALUES (310, 'admin', 'Menu', 'info', '?id=40', 1, 'admin', 0, 1531210256);
INSERT INTO `zxcms_admin_log` VALUES (311, 'admin', 'Menu', 'edit', '', 1, 'admin', 0, 1531210259);
INSERT INTO `zxcms_admin_log` VALUES (312, 'admin', 'Spider', 'index', '', 1, 'admin', 0, 1531210266);
INSERT INTO `zxcms_admin_log` VALUES (313, 'admin', 'Spider', 'info', '', 1, 'admin', 0, 1531210270);
INSERT INTO `zxcms_admin_log` VALUES (314, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531210276);
INSERT INTO `zxcms_admin_log` VALUES (315, 'admin', 'Spider', 'info', '', 1, 'admin', 0, 1531210283);
INSERT INTO `zxcms_admin_log` VALUES (316, 'admin', 'Spider', 'info', '', 1, 'admin', 0, 1531210312);
INSERT INTO `zxcms_admin_log` VALUES (317, 'admin', 'Spider', 'info', '', 1, 'admin', 0, 1531210326);
INSERT INTO `zxcms_admin_log` VALUES (318, 'admin', 'Spider', 'index', '?id=1', 1, 'admin', 0, 1531210336);
INSERT INTO `zxcms_admin_log` VALUES (319, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531210341);
INSERT INTO `zxcms_admin_log` VALUES (320, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531210342);
INSERT INTO `zxcms_admin_log` VALUES (321, 'admin', 'Menu', 'info', '?parentid=39', 1, 'admin', 0, 1531210391);
INSERT INTO `zxcms_admin_log` VALUES (322, 'admin', 'Menu', 'info', '?id=39', 1, 'admin', 0, 1531210396);
INSERT INTO `zxcms_admin_log` VALUES (323, 'admin', 'Menu', 'edit', '', 1, 'admin', 0, 1531210402);
INSERT INTO `zxcms_admin_log` VALUES (324, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531210405);
INSERT INTO `zxcms_admin_log` VALUES (325, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531210410);
INSERT INTO `zxcms_admin_log` VALUES (326, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531210421);
INSERT INTO `zxcms_admin_log` VALUES (327, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531210422);
INSERT INTO `zxcms_admin_log` VALUES (328, 'admin', 'Spider', 'index', '', 1, 'admin', 0, 1531210431);
INSERT INTO `zxcms_admin_log` VALUES (329, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531210445);
INSERT INTO `zxcms_admin_log` VALUES (330, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531211528);
INSERT INTO `zxcms_admin_log` VALUES (331, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531211538);
INSERT INTO `zxcms_admin_log` VALUES (332, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531211635);
INSERT INTO `zxcms_admin_log` VALUES (333, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531211677);
INSERT INTO `zxcms_admin_log` VALUES (334, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531211740);
INSERT INTO `zxcms_admin_log` VALUES (335, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531211785);
INSERT INTO `zxcms_admin_log` VALUES (336, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531211812);
INSERT INTO `zxcms_admin_log` VALUES (337, 'admin', 'Spider', 'info', '?id=', 1, 'admin', 0, 1531211879);
INSERT INTO `zxcms_admin_log` VALUES (338, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531211881);
INSERT INTO `zxcms_admin_log` VALUES (339, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531211887);
INSERT INTO `zxcms_admin_log` VALUES (340, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531211917);
INSERT INTO `zxcms_admin_log` VALUES (341, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531212061);
INSERT INTO `zxcms_admin_log` VALUES (342, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531212075);
INSERT INTO `zxcms_admin_log` VALUES (343, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531212351);
INSERT INTO `zxcms_admin_log` VALUES (344, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531212365);
INSERT INTO `zxcms_admin_log` VALUES (345, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531212381);
INSERT INTO `zxcms_admin_log` VALUES (346, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531212757);
INSERT INTO `zxcms_admin_log` VALUES (347, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531213048);
INSERT INTO `zxcms_admin_log` VALUES (348, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531213063);
INSERT INTO `zxcms_admin_log` VALUES (349, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531213077);
INSERT INTO `zxcms_admin_log` VALUES (350, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531213207);
INSERT INTO `zxcms_admin_log` VALUES (351, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531213223);
INSERT INTO `zxcms_admin_log` VALUES (352, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531213404);
INSERT INTO `zxcms_admin_log` VALUES (353, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531213470);
INSERT INTO `zxcms_admin_log` VALUES (354, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531213487);
INSERT INTO `zxcms_admin_log` VALUES (355, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531213514);
INSERT INTO `zxcms_admin_log` VALUES (356, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531213526);
INSERT INTO `zxcms_admin_log` VALUES (357, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531213528);
INSERT INTO `zxcms_admin_log` VALUES (358, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531213639);
INSERT INTO `zxcms_admin_log` VALUES (359, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531213753);
INSERT INTO `zxcms_admin_log` VALUES (360, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531213933);
INSERT INTO `zxcms_admin_log` VALUES (361, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531214076);
INSERT INTO `zxcms_admin_log` VALUES (362, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531214109);
INSERT INTO `zxcms_admin_log` VALUES (363, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531214162);
INSERT INTO `zxcms_admin_log` VALUES (364, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531214256);
INSERT INTO `zxcms_admin_log` VALUES (365, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531214269);
INSERT INTO `zxcms_admin_log` VALUES (366, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531214300);
INSERT INTO `zxcms_admin_log` VALUES (367, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531214415);
INSERT INTO `zxcms_admin_log` VALUES (368, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531214694);
INSERT INTO `zxcms_admin_log` VALUES (369, 'admin', 'Spider', 'favicon.ico', '', 1, 'admin', 0, 1531214695);
INSERT INTO `zxcms_admin_log` VALUES (370, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531214707);
INSERT INTO `zxcms_admin_log` VALUES (371, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531214786);
INSERT INTO `zxcms_admin_log` VALUES (372, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531214797);
INSERT INTO `zxcms_admin_log` VALUES (373, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531214808);
INSERT INTO `zxcms_admin_log` VALUES (374, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531214875);
INSERT INTO `zxcms_admin_log` VALUES (375, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531214980);
INSERT INTO `zxcms_admin_log` VALUES (376, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531215028);
INSERT INTO `zxcms_admin_log` VALUES (377, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531215041);
INSERT INTO `zxcms_admin_log` VALUES (378, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531215947);
INSERT INTO `zxcms_admin_log` VALUES (379, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531215958);
INSERT INTO `zxcms_admin_log` VALUES (380, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531215976);
INSERT INTO `zxcms_admin_log` VALUES (381, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531216068);
INSERT INTO `zxcms_admin_log` VALUES (382, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531216087);
INSERT INTO `zxcms_admin_log` VALUES (383, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531216100);
INSERT INTO `zxcms_admin_log` VALUES (384, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531216233);
INSERT INTO `zxcms_admin_log` VALUES (385, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531216245);
INSERT INTO `zxcms_admin_log` VALUES (386, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531216340);
INSERT INTO `zxcms_admin_log` VALUES (387, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531216369);
INSERT INTO `zxcms_admin_log` VALUES (388, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531216383);
INSERT INTO `zxcms_admin_log` VALUES (389, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531216388);
INSERT INTO `zxcms_admin_log` VALUES (390, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531216401);
INSERT INTO `zxcms_admin_log` VALUES (391, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531216463);
INSERT INTO `zxcms_admin_log` VALUES (392, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531216494);
INSERT INTO `zxcms_admin_log` VALUES (393, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531216650);
INSERT INTO `zxcms_admin_log` VALUES (394, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531216886);
INSERT INTO `zxcms_admin_log` VALUES (395, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531216899);
INSERT INTO `zxcms_admin_log` VALUES (396, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531216964);
INSERT INTO `zxcms_admin_log` VALUES (397, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531216992);
INSERT INTO `zxcms_admin_log` VALUES (398, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531217080);
INSERT INTO `zxcms_admin_log` VALUES (399, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531217089);
INSERT INTO `zxcms_admin_log` VALUES (400, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531217148);
INSERT INTO `zxcms_admin_log` VALUES (401, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531217411);
INSERT INTO `zxcms_admin_log` VALUES (402, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531217424);
INSERT INTO `zxcms_admin_log` VALUES (403, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531217429);
INSERT INTO `zxcms_admin_log` VALUES (404, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531217439);
INSERT INTO `zxcms_admin_log` VALUES (405, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531217479);
INSERT INTO `zxcms_admin_log` VALUES (406, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531217543);
INSERT INTO `zxcms_admin_log` VALUES (407, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531217550);
INSERT INTO `zxcms_admin_log` VALUES (408, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531217560);
INSERT INTO `zxcms_admin_log` VALUES (409, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531217584);
INSERT INTO `zxcms_admin_log` VALUES (410, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531217597);
INSERT INTO `zxcms_admin_log` VALUES (411, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531217654);
INSERT INTO `zxcms_admin_log` VALUES (412, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531217688);
INSERT INTO `zxcms_admin_log` VALUES (413, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531217714);
INSERT INTO `zxcms_admin_log` VALUES (414, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531217729);
INSERT INTO `zxcms_admin_log` VALUES (415, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531217739);
INSERT INTO `zxcms_admin_log` VALUES (416, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531217743);
INSERT INTO `zxcms_admin_log` VALUES (417, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531217792);
INSERT INTO `zxcms_admin_log` VALUES (418, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531217805);
INSERT INTO `zxcms_admin_log` VALUES (419, 'admin', 'Index', 'favicon.ico', '', 1, 'admin', 0, 1531272868);
INSERT INTO `zxcms_admin_log` VALUES (420, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531272875);
INSERT INTO `zxcms_admin_log` VALUES (421, 'admin', 'Site', 'favicon.ico', '', 1, 'admin', 0, 1531272876);
INSERT INTO `zxcms_admin_log` VALUES (422, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531272877);
INSERT INTO `zxcms_admin_log` VALUES (423, 'admin', 'Spider', 'favicon.ico', '', 1, 'admin', 0, 1531272877);
INSERT INTO `zxcms_admin_log` VALUES (424, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531272888);
INSERT INTO `zxcms_admin_log` VALUES (425, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531272941);
INSERT INTO `zxcms_admin_log` VALUES (426, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531272978);
INSERT INTO `zxcms_admin_log` VALUES (427, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531272994);
INSERT INTO `zxcms_admin_log` VALUES (428, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531273004);
INSERT INTO `zxcms_admin_log` VALUES (429, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531273016);
INSERT INTO `zxcms_admin_log` VALUES (430, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531273122);
INSERT INTO `zxcms_admin_log` VALUES (431, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531273168);
INSERT INTO `zxcms_admin_log` VALUES (432, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531273290);
INSERT INTO `zxcms_admin_log` VALUES (433, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531273370);
INSERT INTO `zxcms_admin_log` VALUES (434, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531273389);
INSERT INTO `zxcms_admin_log` VALUES (435, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531273438);
INSERT INTO `zxcms_admin_log` VALUES (436, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531273468);
INSERT INTO `zxcms_admin_log` VALUES (437, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531273526);
INSERT INTO `zxcms_admin_log` VALUES (438, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531273536);
INSERT INTO `zxcms_admin_log` VALUES (439, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531273593);
INSERT INTO `zxcms_admin_log` VALUES (440, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531273596);
INSERT INTO `zxcms_admin_log` VALUES (441, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531273604);
INSERT INTO `zxcms_admin_log` VALUES (442, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531273647);
INSERT INTO `zxcms_admin_log` VALUES (443, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531273692);
INSERT INTO `zxcms_admin_log` VALUES (444, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531273735);
INSERT INTO `zxcms_admin_log` VALUES (445, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531273850);
INSERT INTO `zxcms_admin_log` VALUES (446, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531273858);
INSERT INTO `zxcms_admin_log` VALUES (447, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531273938);
INSERT INTO `zxcms_admin_log` VALUES (448, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531273956);
INSERT INTO `zxcms_admin_log` VALUES (449, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531273985);
INSERT INTO `zxcms_admin_log` VALUES (450, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531273997);
INSERT INTO `zxcms_admin_log` VALUES (451, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531274039);
INSERT INTO `zxcms_admin_log` VALUES (452, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531274066);
INSERT INTO `zxcms_admin_log` VALUES (453, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531274087);
INSERT INTO `zxcms_admin_log` VALUES (454, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531274098);
INSERT INTO `zxcms_admin_log` VALUES (455, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531274137);
INSERT INTO `zxcms_admin_log` VALUES (456, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531274151);
INSERT INTO `zxcms_admin_log` VALUES (457, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531274196);
INSERT INTO `zxcms_admin_log` VALUES (458, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531274272);
INSERT INTO `zxcms_admin_log` VALUES (459, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531274294);
INSERT INTO `zxcms_admin_log` VALUES (460, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531274305);
INSERT INTO `zxcms_admin_log` VALUES (461, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531274374);
INSERT INTO `zxcms_admin_log` VALUES (462, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531274392);
INSERT INTO `zxcms_admin_log` VALUES (463, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531274402);
INSERT INTO `zxcms_admin_log` VALUES (464, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531274418);
INSERT INTO `zxcms_admin_log` VALUES (465, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531274463);
INSERT INTO `zxcms_admin_log` VALUES (466, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531274478);
INSERT INTO `zxcms_admin_log` VALUES (467, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531274498);
INSERT INTO `zxcms_admin_log` VALUES (468, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531274594);
INSERT INTO `zxcms_admin_log` VALUES (469, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531274607);
INSERT INTO `zxcms_admin_log` VALUES (470, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531274615);
INSERT INTO `zxcms_admin_log` VALUES (471, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531274621);
INSERT INTO `zxcms_admin_log` VALUES (472, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531274631);
INSERT INTO `zxcms_admin_log` VALUES (473, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531274668);
INSERT INTO `zxcms_admin_log` VALUES (474, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531274680);
INSERT INTO `zxcms_admin_log` VALUES (475, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531274691);
INSERT INTO `zxcms_admin_log` VALUES (476, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531274696);
INSERT INTO `zxcms_admin_log` VALUES (477, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531274724);
INSERT INTO `zxcms_admin_log` VALUES (478, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531274756);
INSERT INTO `zxcms_admin_log` VALUES (479, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531274764);
INSERT INTO `zxcms_admin_log` VALUES (480, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531274830);
INSERT INTO `zxcms_admin_log` VALUES (481, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531274900);
INSERT INTO `zxcms_admin_log` VALUES (482, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531275249);
INSERT INTO `zxcms_admin_log` VALUES (483, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531275257);
INSERT INTO `zxcms_admin_log` VALUES (484, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531275298);
INSERT INTO `zxcms_admin_log` VALUES (485, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531275320);
INSERT INTO `zxcms_admin_log` VALUES (486, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531275346);
INSERT INTO `zxcms_admin_log` VALUES (487, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531275493);
INSERT INTO `zxcms_admin_log` VALUES (488, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531275500);
INSERT INTO `zxcms_admin_log` VALUES (489, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531275512);
INSERT INTO `zxcms_admin_log` VALUES (490, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531275525);
INSERT INTO `zxcms_admin_log` VALUES (491, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531275556);
INSERT INTO `zxcms_admin_log` VALUES (492, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531275582);
INSERT INTO `zxcms_admin_log` VALUES (493, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531275603);
INSERT INTO `zxcms_admin_log` VALUES (494, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531275770);
INSERT INTO `zxcms_admin_log` VALUES (495, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531275778);
INSERT INTO `zxcms_admin_log` VALUES (496, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531276001);
INSERT INTO `zxcms_admin_log` VALUES (497, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531276043);
INSERT INTO `zxcms_admin_log` VALUES (498, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531276051);
INSERT INTO `zxcms_admin_log` VALUES (499, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531276062);
INSERT INTO `zxcms_admin_log` VALUES (500, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531276084);
INSERT INTO `zxcms_admin_log` VALUES (501, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531276096);
INSERT INTO `zxcms_admin_log` VALUES (502, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531276110);
INSERT INTO `zxcms_admin_log` VALUES (503, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531276132);
INSERT INTO `zxcms_admin_log` VALUES (504, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531276139);
INSERT INTO `zxcms_admin_log` VALUES (505, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531276151);
INSERT INTO `zxcms_admin_log` VALUES (506, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531276191);
INSERT INTO `zxcms_admin_log` VALUES (507, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531276209);
INSERT INTO `zxcms_admin_log` VALUES (508, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531276304);
INSERT INTO `zxcms_admin_log` VALUES (509, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531276313);
INSERT INTO `zxcms_admin_log` VALUES (510, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531276324);
INSERT INTO `zxcms_admin_log` VALUES (511, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531276358);
INSERT INTO `zxcms_admin_log` VALUES (512, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531276749);
INSERT INTO `zxcms_admin_log` VALUES (513, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531276761);
INSERT INTO `zxcms_admin_log` VALUES (514, 'admin', 'Spider', 'favicon.ico', '', 1, 'admin', 0, 1531276762);
INSERT INTO `zxcms_admin_log` VALUES (515, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531276771);
INSERT INTO `zxcms_admin_log` VALUES (516, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531276896);
INSERT INTO `zxcms_admin_log` VALUES (517, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531276912);
INSERT INTO `zxcms_admin_log` VALUES (518, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531276924);
INSERT INTO `zxcms_admin_log` VALUES (519, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531276983);
INSERT INTO `zxcms_admin_log` VALUES (520, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531276987);
INSERT INTO `zxcms_admin_log` VALUES (521, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531276993);
INSERT INTO `zxcms_admin_log` VALUES (522, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531277018);
INSERT INTO `zxcms_admin_log` VALUES (523, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531277032);
INSERT INTO `zxcms_admin_log` VALUES (524, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531277040);
INSERT INTO `zxcms_admin_log` VALUES (525, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531277079);
INSERT INTO `zxcms_admin_log` VALUES (526, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531277083);
INSERT INTO `zxcms_admin_log` VALUES (527, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531277091);
INSERT INTO `zxcms_admin_log` VALUES (528, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531277166);
INSERT INTO `zxcms_admin_log` VALUES (529, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531277204);
INSERT INTO `zxcms_admin_log` VALUES (530, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531277633);
INSERT INTO `zxcms_admin_log` VALUES (531, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531277688);
INSERT INTO `zxcms_admin_log` VALUES (532, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531277728);
INSERT INTO `zxcms_admin_log` VALUES (533, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531277735);
INSERT INTO `zxcms_admin_log` VALUES (534, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531277742);
INSERT INTO `zxcms_admin_log` VALUES (535, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531277751);
INSERT INTO `zxcms_admin_log` VALUES (536, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531277758);
INSERT INTO `zxcms_admin_log` VALUES (537, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531277896);
INSERT INTO `zxcms_admin_log` VALUES (538, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531278255);
INSERT INTO `zxcms_admin_log` VALUES (539, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531278274);
INSERT INTO `zxcms_admin_log` VALUES (540, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531278295);
INSERT INTO `zxcms_admin_log` VALUES (541, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531278304);
INSERT INTO `zxcms_admin_log` VALUES (542, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531278318);
INSERT INTO `zxcms_admin_log` VALUES (543, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531278329);
INSERT INTO `zxcms_admin_log` VALUES (544, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531278393);
INSERT INTO `zxcms_admin_log` VALUES (545, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531278415);
INSERT INTO `zxcms_admin_log` VALUES (546, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531278457);
INSERT INTO `zxcms_admin_log` VALUES (547, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531278579);
INSERT INTO `zxcms_admin_log` VALUES (548, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531279815);
INSERT INTO `zxcms_admin_log` VALUES (549, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531279841);
INSERT INTO `zxcms_admin_log` VALUES (550, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531279872);
INSERT INTO `zxcms_admin_log` VALUES (551, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531279888);
INSERT INTO `zxcms_admin_log` VALUES (552, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531280245);
INSERT INTO `zxcms_admin_log` VALUES (553, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531280259);
INSERT INTO `zxcms_admin_log` VALUES (554, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531280276);
INSERT INTO `zxcms_admin_log` VALUES (555, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531280294);
INSERT INTO `zxcms_admin_log` VALUES (556, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531280400);
INSERT INTO `zxcms_admin_log` VALUES (557, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531280418);
INSERT INTO `zxcms_admin_log` VALUES (558, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531280421);
INSERT INTO `zxcms_admin_log` VALUES (559, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531280426);
INSERT INTO `zxcms_admin_log` VALUES (560, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531280444);
INSERT INTO `zxcms_admin_log` VALUES (561, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531280450);
INSERT INTO `zxcms_admin_log` VALUES (562, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531280453);
INSERT INTO `zxcms_admin_log` VALUES (563, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531280456);
INSERT INTO `zxcms_admin_log` VALUES (564, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531280479);
INSERT INTO `zxcms_admin_log` VALUES (565, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531280487);
INSERT INTO `zxcms_admin_log` VALUES (566, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531280541);
INSERT INTO `zxcms_admin_log` VALUES (567, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531280547);
INSERT INTO `zxcms_admin_log` VALUES (568, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531280557);
INSERT INTO `zxcms_admin_log` VALUES (569, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531280567);
INSERT INTO `zxcms_admin_log` VALUES (570, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531280599);
INSERT INTO `zxcms_admin_log` VALUES (571, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531280610);
INSERT INTO `zxcms_admin_log` VALUES (572, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531280728);
INSERT INTO `zxcms_admin_log` VALUES (573, 'admin', 'Index', 'favicon.ico', '', 1, 'admin', 0, 1531280870);
INSERT INTO `zxcms_admin_log` VALUES (574, 'admin', 'Index', 'favicon.ico', '', 1, 'admin', 0, 1531280870);
INSERT INTO `zxcms_admin_log` VALUES (575, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531280874);
INSERT INTO `zxcms_admin_log` VALUES (576, 'admin', 'Site', 'favicon.ico', '', 1, 'admin', 0, 1531280876);
INSERT INTO `zxcms_admin_log` VALUES (577, 'admin', 'Site', 'favicon.ico', '', 1, 'admin', 0, 1531280876);
INSERT INTO `zxcms_admin_log` VALUES (578, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531280877);
INSERT INTO `zxcms_admin_log` VALUES (579, 'admin', 'Spider', 'favicon.ico', '', 1, 'admin', 0, 1531280879);
INSERT INTO `zxcms_admin_log` VALUES (580, 'admin', 'Spider', 'favicon.ico', '', 1, 'admin', 0, 1531280880);
INSERT INTO `zxcms_admin_log` VALUES (581, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531280885);
INSERT INTO `zxcms_admin_log` VALUES (582, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531280896);
INSERT INTO `zxcms_admin_log` VALUES (583, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531280955);
INSERT INTO `zxcms_admin_log` VALUES (584, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531280993);
INSERT INTO `zxcms_admin_log` VALUES (585, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531281001);
INSERT INTO `zxcms_admin_log` VALUES (586, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531281019);
INSERT INTO `zxcms_admin_log` VALUES (587, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531281031);
INSERT INTO `zxcms_admin_log` VALUES (588, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531281062);
INSERT INTO `zxcms_admin_log` VALUES (589, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531281079);
INSERT INTO `zxcms_admin_log` VALUES (590, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531281100);
INSERT INTO `zxcms_admin_log` VALUES (591, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531281114);
INSERT INTO `zxcms_admin_log` VALUES (592, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531281128);
INSERT INTO `zxcms_admin_log` VALUES (593, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531281202);
INSERT INTO `zxcms_admin_log` VALUES (594, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531281212);
INSERT INTO `zxcms_admin_log` VALUES (595, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531281234);
INSERT INTO `zxcms_admin_log` VALUES (596, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531281310);
INSERT INTO `zxcms_admin_log` VALUES (597, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531281322);
INSERT INTO `zxcms_admin_log` VALUES (598, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531281364);
INSERT INTO `zxcms_admin_log` VALUES (599, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531281447);
INSERT INTO `zxcms_admin_log` VALUES (600, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531281482);
INSERT INTO `zxcms_admin_log` VALUES (601, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531281504);
INSERT INTO `zxcms_admin_log` VALUES (602, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531281521);
INSERT INTO `zxcms_admin_log` VALUES (603, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531281551);
INSERT INTO `zxcms_admin_log` VALUES (604, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531281670);
INSERT INTO `zxcms_admin_log` VALUES (605, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531281695);
INSERT INTO `zxcms_admin_log` VALUES (606, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531281846);
INSERT INTO `zxcms_admin_log` VALUES (607, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531281873);
INSERT INTO `zxcms_admin_log` VALUES (608, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531281912);
INSERT INTO `zxcms_admin_log` VALUES (609, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531281920);
INSERT INTO `zxcms_admin_log` VALUES (610, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531281961);
INSERT INTO `zxcms_admin_log` VALUES (611, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531282007);
INSERT INTO `zxcms_admin_log` VALUES (612, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531282309);
INSERT INTO `zxcms_admin_log` VALUES (613, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531282316);
INSERT INTO `zxcms_admin_log` VALUES (614, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531282353);
INSERT INTO `zxcms_admin_log` VALUES (615, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531282386);
INSERT INTO `zxcms_admin_log` VALUES (616, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531282410);
INSERT INTO `zxcms_admin_log` VALUES (617, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531282427);
INSERT INTO `zxcms_admin_log` VALUES (618, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531282454);
INSERT INTO `zxcms_admin_log` VALUES (619, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531282478);
INSERT INTO `zxcms_admin_log` VALUES (620, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531282530);
INSERT INTO `zxcms_admin_log` VALUES (621, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531282555);
INSERT INTO `zxcms_admin_log` VALUES (622, 'admin', 'Menu', 'favicon.ico', '', 1, 'admin', 0, 1531287294);
INSERT INTO `zxcms_admin_log` VALUES (623, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531287296);
INSERT INTO `zxcms_admin_log` VALUES (624, 'admin', 'Site', 'favicon.ico', '', 1, 'admin', 0, 1531287297);
INSERT INTO `zxcms_admin_log` VALUES (625, 'admin', 'Site', 'info', '?id=1', 1, 'admin', 0, 1531287303);
INSERT INTO `zxcms_admin_log` VALUES (626, 'admin', 'Site', 'favicon.ico', '', 1, 'admin', 0, 1531287304);
INSERT INTO `zxcms_admin_log` VALUES (627, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531287307);
INSERT INTO `zxcms_admin_log` VALUES (628, 'admin', 'Menu', 'info', '', 1, 'admin', 0, 1531287366);
INSERT INTO `zxcms_admin_log` VALUES (629, 'admin', 'Menu', 'add', '', 1, 'admin', 0, 1531287589);
INSERT INTO `zxcms_admin_log` VALUES (630, 'admin', 'Menu', 'favicon.ico', '', 1, 'admin', 0, 1531287593);
INSERT INTO `zxcms_admin_log` VALUES (631, 'admin', 'Menu', 'info', '?parentid=42', 1, 'admin', 0, 1531287608);
INSERT INTO `zxcms_admin_log` VALUES (632, 'admin', 'Menu', 'add', '', 1, 'admin', 0, 1531287635);
INSERT INTO `zxcms_admin_log` VALUES (633, 'admin', 'Menu', 'info', '?id=43', 1, 'admin', 0, 1531287653);
INSERT INTO `zxcms_admin_log` VALUES (634, 'admin', 'Menu', 'edit', '', 1, 'admin', 0, 1531287661);
INSERT INTO `zxcms_admin_log` VALUES (635, 'admin', 'Menu', 'info', '?parentid=43', 1, 'admin', 0, 1531287731);
INSERT INTO `zxcms_admin_log` VALUES (636, 'admin', 'Menu', 'add', '', 1, 'admin', 0, 1531287748);
INSERT INTO `zxcms_admin_log` VALUES (637, 'admin', 'Menu', 'info', '?parentid=43', 1, 'admin', 0, 1531287755);
INSERT INTO `zxcms_admin_log` VALUES (638, 'admin', 'Menu', 'add', '', 1, 'admin', 0, 1531287772);
INSERT INTO `zxcms_admin_log` VALUES (639, 'admin', 'Menu', 'info', '?parentid=43', 1, 'admin', 0, 1531287777);
INSERT INTO `zxcms_admin_log` VALUES (640, 'admin', 'Menu', 'add', '', 1, 'admin', 0, 1531287795);
INSERT INTO `zxcms_admin_log` VALUES (641, 'admin', 'Menu', 'info', '?parentid=43', 1, 'admin', 0, 1531287801);
INSERT INTO `zxcms_admin_log` VALUES (642, 'admin', 'Menu', 'add', '', 1, 'admin', 0, 1531287820);
INSERT INTO `zxcms_admin_log` VALUES (643, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531287853);
INSERT INTO `zxcms_admin_log` VALUES (644, 'admin', 'Menu', 'info', '?id=35', 1, 'admin', 0, 1531287878);
INSERT INTO `zxcms_admin_log` VALUES (645, 'admin', 'Menu', 'info', '?id=44', 1, 'admin', 0, 1531287902);
INSERT INTO `zxcms_admin_log` VALUES (646, 'admin', 'Menu', 'edit', '', 1, 'admin', 0, 1531287905);
INSERT INTO `zxcms_admin_log` VALUES (647, 'admin', 'Menu', 'info', '?id=45', 1, 'admin', 0, 1531287909);
INSERT INTO `zxcms_admin_log` VALUES (648, 'admin', 'Menu', 'edit', '', 1, 'admin', 0, 1531287911);
INSERT INTO `zxcms_admin_log` VALUES (649, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531287933);
INSERT INTO `zxcms_admin_log` VALUES (650, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531287939);
INSERT INTO `zxcms_admin_log` VALUES (651, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531288440);
INSERT INTO `zxcms_admin_log` VALUES (652, 'admin', 'Regulation', 'favicon.ico', '', 1, 'admin', 0, 1531288441);
INSERT INTO `zxcms_admin_log` VALUES (653, 'admin', 'Regulation', 'info', '', 1, 'admin', 0, 1531288444);
INSERT INTO `zxcms_admin_log` VALUES (654, 'admin', 'Regulation', 'info', '', 1, 'admin', 0, 1531288609);
INSERT INTO `zxcms_admin_log` VALUES (655, 'admin', 'Regulation', 'add', '', 1, 'admin', 0, 1531288763);
INSERT INTO `zxcms_admin_log` VALUES (656, 'admin', 'Regulation', 'add', '', 1, 'admin', 0, 1531288926);
INSERT INTO `zxcms_admin_log` VALUES (657, 'admin', 'Regulation', 'add', '', 1, 'admin', 0, 1531288965);
INSERT INTO `zxcms_admin_log` VALUES (658, 'admin', 'Regulation', 'add', '', 1, 'admin', 0, 1531289072);
INSERT INTO `zxcms_admin_log` VALUES (659, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531289074);
INSERT INTO `zxcms_admin_log` VALUES (660, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531289087);
INSERT INTO `zxcms_admin_log` VALUES (661, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531289101);
INSERT INTO `zxcms_admin_log` VALUES (662, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531289165);
INSERT INTO `zxcms_admin_log` VALUES (663, 'admin', 'Regulation', 'info', '?id=1', 1, 'admin', 0, 1531289167);
INSERT INTO `zxcms_admin_log` VALUES (664, 'admin', 'Regulation', 'favicon.ico', '', 1, 'admin', 0, 1531289168);
INSERT INTO `zxcms_admin_log` VALUES (665, 'admin', 'Regulation', 'info', '?id=1', 1, 'admin', 0, 1531289384);
INSERT INTO `zxcms_admin_log` VALUES (666, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531289396);
INSERT INTO `zxcms_admin_log` VALUES (667, 'admin', 'Regulation', 'info', '', 1, 'admin', 0, 1531289398);
INSERT INTO `zxcms_admin_log` VALUES (668, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531289402);
INSERT INTO `zxcms_admin_log` VALUES (669, 'admin', 'Regulation', 'info', '?id=1', 1, 'admin', 0, 1531289403);
INSERT INTO `zxcms_admin_log` VALUES (670, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531289406);
INSERT INTO `zxcms_admin_log` VALUES (671, 'admin', 'Regulation', 'info', '', 1, 'admin', 0, 1531289413);
INSERT INTO `zxcms_admin_log` VALUES (672, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531289417);
INSERT INTO `zxcms_admin_log` VALUES (673, 'admin', 'Regulation', 'info', '?id=1', 1, 'admin', 0, 1531289418);
INSERT INTO `zxcms_admin_log` VALUES (674, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531289421);
INSERT INTO `zxcms_admin_log` VALUES (675, 'admin', 'Regulation', 'info', '?id=1', 1, 'admin', 0, 1531289437);
INSERT INTO `zxcms_admin_log` VALUES (676, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531289506);
INSERT INTO `zxcms_admin_log` VALUES (677, 'admin', 'Regulation', 'info', '?id=1', 1, 'admin', 0, 1531289507);
INSERT INTO `zxcms_admin_log` VALUES (678, 'admin', 'Regulation', 'edit', '', 1, 'admin', 0, 1531289509);
INSERT INTO `zxcms_admin_log` VALUES (679, 'admin', 'Regulation', 'info', '?id=1', 1, 'admin', 0, 1531289511);
INSERT INTO `zxcms_admin_log` VALUES (680, 'admin', 'Regulation', 'info', '?id=1', 1, 'admin', 0, 1531289524);
INSERT INTO `zxcms_admin_log` VALUES (681, 'admin', 'Regulation', 'edit', '', 1, 'admin', 0, 1531289525);
INSERT INTO `zxcms_admin_log` VALUES (682, 'admin', 'Regulation', 'info', '?id=1', 1, 'admin', 0, 1531289527);
INSERT INTO `zxcms_admin_log` VALUES (683, 'admin', 'Regulation', 'edit', '', 1, 'admin', 0, 1531289545);
INSERT INTO `zxcms_admin_log` VALUES (684, 'admin', 'Regulation', 'info', '?id=1', 1, 'admin', 0, 1531289552);
INSERT INTO `zxcms_admin_log` VALUES (685, 'admin', 'Regulation', 'edit', '', 1, 'admin', 0, 1531289558);
INSERT INTO `zxcms_admin_log` VALUES (686, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531289560);
INSERT INTO `zxcms_admin_log` VALUES (687, 'admin', 'Regulation', 'info', '?id=1', 1, 'admin', 0, 1531289561);
INSERT INTO `zxcms_admin_log` VALUES (688, 'admin', 'Regulation', 'edit', '', 1, 'admin', 0, 1531289565);
INSERT INTO `zxcms_admin_log` VALUES (689, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531289567);
INSERT INTO `zxcms_admin_log` VALUES (690, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531289695);
INSERT INTO `zxcms_admin_log` VALUES (691, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531289813);
INSERT INTO `zxcms_admin_log` VALUES (692, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531289885);
INSERT INTO `zxcms_admin_log` VALUES (693, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531289909);
INSERT INTO `zxcms_admin_log` VALUES (694, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531290031);
INSERT INTO `zxcms_admin_log` VALUES (695, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531290032);
INSERT INTO `zxcms_admin_log` VALUES (696, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531290086);
INSERT INTO `zxcms_admin_log` VALUES (697, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531290124);
INSERT INTO `zxcms_admin_log` VALUES (698, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531290126);
INSERT INTO `zxcms_admin_log` VALUES (699, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531290127);
INSERT INTO `zxcms_admin_log` VALUES (700, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531290133);
INSERT INTO `zxcms_admin_log` VALUES (701, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531290135);
INSERT INTO `zxcms_admin_log` VALUES (702, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531290250);
INSERT INTO `zxcms_admin_log` VALUES (703, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531290253);
INSERT INTO `zxcms_admin_log` VALUES (704, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531290373);
INSERT INTO `zxcms_admin_log` VALUES (705, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531290378);
INSERT INTO `zxcms_admin_log` VALUES (706, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531290406);
INSERT INTO `zxcms_admin_log` VALUES (707, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531290413);
INSERT INTO `zxcms_admin_log` VALUES (708, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531290475);
INSERT INTO `zxcms_admin_log` VALUES (709, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531290511);
INSERT INTO `zxcms_admin_log` VALUES (710, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531290522);
INSERT INTO `zxcms_admin_log` VALUES (711, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531290538);
INSERT INTO `zxcms_admin_log` VALUES (712, 'admin', 'Regulation', 'info', '?id=1', 1, 'admin', 0, 1531290540);
INSERT INTO `zxcms_admin_log` VALUES (713, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531290552);
INSERT INTO `zxcms_admin_log` VALUES (714, 'admin', 'Regulation', 'info', '?id=1', 1, 'admin', 0, 1531290554);
INSERT INTO `zxcms_admin_log` VALUES (715, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531290563);
INSERT INTO `zxcms_admin_log` VALUES (716, 'admin', 'Regulation', 'info', '', 1, 'admin', 0, 1531290574);
INSERT INTO `zxcms_admin_log` VALUES (717, 'admin', 'Regulation', 'add', '', 1, 'admin', 0, 1531290669);
INSERT INTO `zxcms_admin_log` VALUES (718, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531290671);
INSERT INTO `zxcms_admin_log` VALUES (719, 'admin', 'Regulation', 'info', '?id=2', 1, 'admin', 0, 1531290672);
INSERT INTO `zxcms_admin_log` VALUES (720, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531290675);
INSERT INTO `zxcms_admin_log` VALUES (721, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531290677);
INSERT INTO `zxcms_admin_log` VALUES (722, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531290680);
INSERT INTO `zxcms_admin_log` VALUES (723, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531290688);
INSERT INTO `zxcms_admin_log` VALUES (724, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531290773);
INSERT INTO `zxcms_admin_log` VALUES (725, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531291032);
INSERT INTO `zxcms_admin_log` VALUES (726, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531291061);
INSERT INTO `zxcms_admin_log` VALUES (727, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531291079);
INSERT INTO `zxcms_admin_log` VALUES (728, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531291095);
INSERT INTO `zxcms_admin_log` VALUES (729, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531291126);
INSERT INTO `zxcms_admin_log` VALUES (730, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531291131);
INSERT INTO `zxcms_admin_log` VALUES (731, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531291152);
INSERT INTO `zxcms_admin_log` VALUES (732, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531291156);
INSERT INTO `zxcms_admin_log` VALUES (733, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531291162);
INSERT INTO `zxcms_admin_log` VALUES (734, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531291341);
INSERT INTO `zxcms_admin_log` VALUES (735, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531291367);
INSERT INTO `zxcms_admin_log` VALUES (736, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531291388);
INSERT INTO `zxcms_admin_log` VALUES (737, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531291630);
INSERT INTO `zxcms_admin_log` VALUES (738, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531291669);
INSERT INTO `zxcms_admin_log` VALUES (739, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531291678);
INSERT INTO `zxcms_admin_log` VALUES (740, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531291705);
INSERT INTO `zxcms_admin_log` VALUES (741, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531291752);
INSERT INTO `zxcms_admin_log` VALUES (742, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531291754);
INSERT INTO `zxcms_admin_log` VALUES (743, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531291882);
INSERT INTO `zxcms_admin_log` VALUES (744, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531291996);
INSERT INTO `zxcms_admin_log` VALUES (745, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531292024);
INSERT INTO `zxcms_admin_log` VALUES (746, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531292026);
INSERT INTO `zxcms_admin_log` VALUES (747, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531292071);
INSERT INTO `zxcms_admin_log` VALUES (748, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531292126);
INSERT INTO `zxcms_admin_log` VALUES (749, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531292174);
INSERT INTO `zxcms_admin_log` VALUES (750, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531292181);
INSERT INTO `zxcms_admin_log` VALUES (751, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531292190);
INSERT INTO `zxcms_admin_log` VALUES (752, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531292192);
INSERT INTO `zxcms_admin_log` VALUES (753, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531292195);
INSERT INTO `zxcms_admin_log` VALUES (754, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531292203);
INSERT INTO `zxcms_admin_log` VALUES (755, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531292666);
INSERT INTO `zxcms_admin_log` VALUES (756, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531292671);
INSERT INTO `zxcms_admin_log` VALUES (757, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531292680);
INSERT INTO `zxcms_admin_log` VALUES (758, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531292750);
INSERT INTO `zxcms_admin_log` VALUES (759, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531292903);
INSERT INTO `zxcms_admin_log` VALUES (760, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531293066);
INSERT INTO `zxcms_admin_log` VALUES (761, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531293246);
INSERT INTO `zxcms_admin_log` VALUES (762, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531293275);
INSERT INTO `zxcms_admin_log` VALUES (763, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531293448);
INSERT INTO `zxcms_admin_log` VALUES (764, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531295662);
INSERT INTO `zxcms_admin_log` VALUES (765, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531295962);
INSERT INTO `zxcms_admin_log` VALUES (766, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531295975);
INSERT INTO `zxcms_admin_log` VALUES (767, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531295987);
INSERT INTO `zxcms_admin_log` VALUES (768, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531296005);
INSERT INTO `zxcms_admin_log` VALUES (769, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531296093);
INSERT INTO `zxcms_admin_log` VALUES (770, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531296287);
INSERT INTO `zxcms_admin_log` VALUES (771, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531296402);
INSERT INTO `zxcms_admin_log` VALUES (772, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531296744);
INSERT INTO `zxcms_admin_log` VALUES (773, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531296784);
INSERT INTO `zxcms_admin_log` VALUES (774, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531297585);
INSERT INTO `zxcms_admin_log` VALUES (775, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531297608);
INSERT INTO `zxcms_admin_log` VALUES (776, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531297658);
INSERT INTO `zxcms_admin_log` VALUES (777, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531297787);
INSERT INTO `zxcms_admin_log` VALUES (778, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531298754);
INSERT INTO `zxcms_admin_log` VALUES (779, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531298903);
INSERT INTO `zxcms_admin_log` VALUES (780, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531298981);
INSERT INTO `zxcms_admin_log` VALUES (781, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531299005);
INSERT INTO `zxcms_admin_log` VALUES (782, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531299046);
INSERT INTO `zxcms_admin_log` VALUES (783, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531299169);
INSERT INTO `zxcms_admin_log` VALUES (784, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531299255);
INSERT INTO `zxcms_admin_log` VALUES (785, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531299320);
INSERT INTO `zxcms_admin_log` VALUES (786, 'admin', 'Spider', 'index', '', 1, 'admin', 0, 1531299328);
INSERT INTO `zxcms_admin_log` VALUES (787, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531299344);
INSERT INTO `zxcms_admin_log` VALUES (788, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531299414);
INSERT INTO `zxcms_admin_log` VALUES (789, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531299430);
INSERT INTO `zxcms_admin_log` VALUES (790, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531299434);
INSERT INTO `zxcms_admin_log` VALUES (791, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531300425);
INSERT INTO `zxcms_admin_log` VALUES (792, 'admin', 'Regulation', 'info', '?id=1', 1, 'admin', 0, 1531300428);
INSERT INTO `zxcms_admin_log` VALUES (793, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531300440);
INSERT INTO `zxcms_admin_log` VALUES (794, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531300485);
INSERT INTO `zxcms_admin_log` VALUES (795, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531300515);
INSERT INTO `zxcms_admin_log` VALUES (796, 'admin', 'Site', 'info', '', 1, 'admin', 0, 1531300517);
INSERT INTO `zxcms_admin_log` VALUES (797, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531300526);
INSERT INTO `zxcms_admin_log` VALUES (798, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531300532);
INSERT INTO `zxcms_admin_log` VALUES (799, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531300623);
INSERT INTO `zxcms_admin_log` VALUES (800, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531300629);
INSERT INTO `zxcms_admin_log` VALUES (801, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531300672);
INSERT INTO `zxcms_admin_log` VALUES (802, 'admin', 'Site', 'info', '?id=1', 1, 'admin', 0, 1531300673);
INSERT INTO `zxcms_admin_log` VALUES (803, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531300690);
INSERT INTO `zxcms_admin_log` VALUES (804, 'admin', 'Regulation', 'info', '?id=2', 1, 'admin', 0, 1531300695);
INSERT INTO `zxcms_admin_log` VALUES (805, 'admin', 'Admin', 'index', '', 1, 'admin', 0, 1531300838);
INSERT INTO `zxcms_admin_log` VALUES (806, 'admin', 'Admin', 'favicon.ico', '', 1, 'admin', 0, 1531300839);
INSERT INTO `zxcms_admin_log` VALUES (807, 'admin', 'Group', 'index', '', 1, 'admin', 0, 1531300841);
INSERT INTO `zxcms_admin_log` VALUES (808, 'admin', 'Group', 'favicon.ico', '', 1, 'admin', 0, 1531300842);
INSERT INTO `zxcms_admin_log` VALUES (809, 'admin', 'Admin', 'public_edit_info', '', 1, 'admin', 0, 1531300845);
INSERT INTO `zxcms_admin_log` VALUES (810, 'admin', 'Admin', 'index', '', 1, 'admin', 0, 1531300851);
INSERT INTO `zxcms_admin_log` VALUES (811, 'admin', 'Group', 'index', '', 1, 'admin', 0, 1531300854);
INSERT INTO `zxcms_admin_log` VALUES (812, 'admin', 'Group', 'info', '?id=1', 1, 'admin', 0, 1531300857);
INSERT INTO `zxcms_admin_log` VALUES (813, 'admin', 'Group', 'favicon.ico', '', 1, 'admin', 0, 1531300858);
INSERT INTO `zxcms_admin_log` VALUES (814, 'admin', 'Group', 'index', '', 1, 'admin', 0, 1531300859);
INSERT INTO `zxcms_admin_log` VALUES (815, 'admin', 'Group', 'rule', '?gid=2', 1, 'admin', 0, 1531300862);
INSERT INTO `zxcms_admin_log` VALUES (816, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531300871);
INSERT INTO `zxcms_admin_log` VALUES (817, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531300877);
INSERT INTO `zxcms_admin_log` VALUES (818, 'admin', 'Regulation', 'info', '?id=1', 1, 'admin', 0, 1531300880);
INSERT INTO `zxcms_admin_log` VALUES (819, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531301947);
INSERT INTO `zxcms_admin_log` VALUES (820, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531301953);
INSERT INTO `zxcms_admin_log` VALUES (821, 'admin', 'Site', 'info', '?id=1', 1, 'admin', 0, 1531301955);
INSERT INTO `zxcms_admin_log` VALUES (822, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531301961);
INSERT INTO `zxcms_admin_log` VALUES (823, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531302180);
INSERT INTO `zxcms_admin_log` VALUES (824, 'admin', 'Spider', 'index', '', 1, 'admin', 0, 1531302198);
INSERT INTO `zxcms_admin_log` VALUES (825, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531302203);
INSERT INTO `zxcms_admin_log` VALUES (826, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531302211);
INSERT INTO `zxcms_admin_log` VALUES (827, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531302213);
INSERT INTO `zxcms_admin_log` VALUES (828, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531302246);
INSERT INTO `zxcms_admin_log` VALUES (829, 'admin', 'Spider', 'site', '', 1, 'admin', 0, 1531302247);
INSERT INTO `zxcms_admin_log` VALUES (830, 'admin', 'Spider', 'site', '', 1, 'admin', 0, 1531302342);
INSERT INTO `zxcms_admin_log` VALUES (831, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531302345);
INSERT INTO `zxcms_admin_log` VALUES (832, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531302346);
INSERT INTO `zxcms_admin_log` VALUES (833, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531302358);
INSERT INTO `zxcms_admin_log` VALUES (834, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531302386);
INSERT INTO `zxcms_admin_log` VALUES (835, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531302387);
INSERT INTO `zxcms_admin_log` VALUES (836, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531302389);
INSERT INTO `zxcms_admin_log` VALUES (837, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531302771);
INSERT INTO `zxcms_admin_log` VALUES (838, 'admin', 'Regulation', 'info', '?id=2', 1, 'admin', 0, 1531302777);
INSERT INTO `zxcms_admin_log` VALUES (839, 'admin', 'Regulation', 'edit', '', 1, 'admin', 0, 1531302799);
INSERT INTO `zxcms_admin_log` VALUES (840, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531302802);
INSERT INTO `zxcms_admin_log` VALUES (841, 'admin', 'Regulation', 'info', '?id=1', 1, 'admin', 0, 1531302833);
INSERT INTO `zxcms_admin_log` VALUES (842, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531302836);
INSERT INTO `zxcms_admin_log` VALUES (843, 'admin', 'Regulation', 'info', '?id=2', 1, 'admin', 0, 1531302838);
INSERT INTO `zxcms_admin_log` VALUES (844, 'admin', 'Regulation', 'edit', '', 1, 'admin', 0, 1531302938);
INSERT INTO `zxcms_admin_log` VALUES (845, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531302942);
INSERT INTO `zxcms_admin_log` VALUES (846, 'admin', 'Regulation', 'info', '?id=2', 1, 'admin', 0, 1531302970);
INSERT INTO `zxcms_admin_log` VALUES (847, 'admin', 'Regulation', 'edit', '', 1, 'admin', 0, 1531302992);
INSERT INTO `zxcms_admin_log` VALUES (848, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531302995);
INSERT INTO `zxcms_admin_log` VALUES (849, 'admin', 'Regulation', 'info', '?id=2', 1, 'admin', 0, 1531303008);
INSERT INTO `zxcms_admin_log` VALUES (850, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531303025);
INSERT INTO `zxcms_admin_log` VALUES (851, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531303028);
INSERT INTO `zxcms_admin_log` VALUES (852, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531303041);
INSERT INTO `zxcms_admin_log` VALUES (853, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531303051);
INSERT INTO `zxcms_admin_log` VALUES (854, 'admin', 'Regulation', 'info', '?id=2', 1, 'admin', 0, 1531303053);
INSERT INTO `zxcms_admin_log` VALUES (855, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531303333);
INSERT INTO `zxcms_admin_log` VALUES (856, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531303353);
INSERT INTO `zxcms_admin_log` VALUES (857, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531303400);
INSERT INTO `zxcms_admin_log` VALUES (858, 'admin', 'Regulation', 'edit', '', 1, 'admin', 0, 1531303475);
INSERT INTO `zxcms_admin_log` VALUES (859, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531303479);
INSERT INTO `zxcms_admin_log` VALUES (860, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531303480);
INSERT INTO `zxcms_admin_log` VALUES (861, 'admin', 'Regulation', 'info', '?id=2', 1, 'admin', 0, 1531303485);
INSERT INTO `zxcms_admin_log` VALUES (862, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531303548);
INSERT INTO `zxcms_admin_log` VALUES (863, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531303580);
INSERT INTO `zxcms_admin_log` VALUES (864, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531303598);
INSERT INTO `zxcms_admin_log` VALUES (865, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531303605);
INSERT INTO `zxcms_admin_log` VALUES (866, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531303613);
INSERT INTO `zxcms_admin_log` VALUES (867, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531303622);
INSERT INTO `zxcms_admin_log` VALUES (868, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531303635);
INSERT INTO `zxcms_admin_log` VALUES (869, 'admin', 'Regulation', 'edit', '', 1, 'admin', 0, 1531303651);
INSERT INTO `zxcms_admin_log` VALUES (870, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531303655);
INSERT INTO `zxcms_admin_log` VALUES (871, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531303663);
INSERT INTO `zxcms_admin_log` VALUES (872, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531303713);
INSERT INTO `zxcms_admin_log` VALUES (873, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531303731);
INSERT INTO `zxcms_admin_log` VALUES (874, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531303778);
INSERT INTO `zxcms_admin_log` VALUES (875, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531303787);
INSERT INTO `zxcms_admin_log` VALUES (876, 'admin', 'Regulation', 'info', '?id=2', 1, 'admin', 0, 1531303797);
INSERT INTO `zxcms_admin_log` VALUES (877, 'admin', 'Regulation', 'edit', '', 1, 'admin', 0, 1531303802);
INSERT INTO `zxcms_admin_log` VALUES (878, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531303805);
INSERT INTO `zxcms_admin_log` VALUES (879, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531303824);
INSERT INTO `zxcms_admin_log` VALUES (880, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531303875);
INSERT INTO `zxcms_admin_log` VALUES (881, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531303880);
INSERT INTO `zxcms_admin_log` VALUES (882, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531303955);
INSERT INTO `zxcms_admin_log` VALUES (883, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531303965);
INSERT INTO `zxcms_admin_log` VALUES (884, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531304003);
INSERT INTO `zxcms_admin_log` VALUES (885, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531304004);
INSERT INTO `zxcms_admin_log` VALUES (886, 'admin', 'Regulation', 'info', '?id=2', 1, 'admin', 0, 1531304006);
INSERT INTO `zxcms_admin_log` VALUES (887, 'admin', 'Regulation', 'edit', '', 1, 'admin', 0, 1531304022);
INSERT INTO `zxcms_admin_log` VALUES (888, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531304026);
INSERT INTO `zxcms_admin_log` VALUES (889, 'admin', 'Regulation', 'index', '', 1, 'admin', 0, 1531304026);
INSERT INTO `zxcms_admin_log` VALUES (890, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531304038);
INSERT INTO `zxcms_admin_log` VALUES (891, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531304045);
INSERT INTO `zxcms_admin_log` VALUES (892, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531304106);
INSERT INTO `zxcms_admin_log` VALUES (893, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531304121);
INSERT INTO `zxcms_admin_log` VALUES (894, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531304243);
INSERT INTO `zxcms_admin_log` VALUES (895, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531304259);
INSERT INTO `zxcms_admin_log` VALUES (896, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531304269);
INSERT INTO `zxcms_admin_log` VALUES (897, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531304273);
INSERT INTO `zxcms_admin_log` VALUES (898, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531304289);
INSERT INTO `zxcms_admin_log` VALUES (899, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531304324);
INSERT INTO `zxcms_admin_log` VALUES (900, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531304332);
INSERT INTO `zxcms_admin_log` VALUES (901, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531304351);
INSERT INTO `zxcms_admin_log` VALUES (902, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531304354);
INSERT INTO `zxcms_admin_log` VALUES (903, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531304362);
INSERT INTO `zxcms_admin_log` VALUES (904, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531304384);
INSERT INTO `zxcms_admin_log` VALUES (905, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531304539);
INSERT INTO `zxcms_admin_log` VALUES (906, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531304552);
INSERT INTO `zxcms_admin_log` VALUES (907, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531304556);
INSERT INTO `zxcms_admin_log` VALUES (908, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531304624);
INSERT INTO `zxcms_admin_log` VALUES (909, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531304637);
INSERT INTO `zxcms_admin_log` VALUES (910, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531305064);
INSERT INTO `zxcms_admin_log` VALUES (911, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531305084);
INSERT INTO `zxcms_admin_log` VALUES (912, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531305089);
INSERT INTO `zxcms_admin_log` VALUES (913, 'admin', 'Spider', 'info', '?id=1', 1, 'admin', 0, 1531305140);
INSERT INTO `zxcms_admin_log` VALUES (914, 'admin', 'Spider', 'edit', '', 1, 'admin', 0, 1531305149);
INSERT INTO `zxcms_admin_log` VALUES (915, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531305153);
INSERT INTO `zxcms_admin_log` VALUES (916, 'admin', 'Regulation', 'info', '', 1, 'admin', 0, 1531305230);
INSERT INTO `zxcms_admin_log` VALUES (917, 'admin', 'Site', 'index', '', 1, 'admin', 0, 1531308416);
COMMIT;

-- ----------------------------
-- Table structure for zxcms_app
-- ----------------------------
DROP TABLE IF EXISTS `zxcms_app`;
CREATE TABLE `zxcms_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(100) NOT NULL DEFAULT '',
  `price` decimal(10,0) NOT NULL DEFAULT '0',
  `icon` varchar(100) NOT NULL DEFAULT '' COMMENT '图标',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '数量',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1软件，2游戏，3付费',
  `add_time` datetime NOT NULL COMMENT '添加时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `user_id` int(11) NOT NULL COMMENT '发布人ID',
  `position` smallint(5) NOT NULL DEFAULT '0' COMMENT '位置',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '标记说明',
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL COMMENT '开始时间',
  `s_time` time DEFAULT NULL,
  `date_total` int(11) DEFAULT NULL,
  `time_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '时间类型：1全天，2时间段',
  PRIMARY KEY (`id`),
  KEY `nums` (`total`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for zxcms_config
-- ----------------------------
DROP TABLE IF EXISTS `zxcms_config`;
CREATE TABLE `zxcms_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for zxcms_menu
-- ----------------------------
DROP TABLE IF EXISTS `zxcms_menu`;
CREATE TABLE `zxcms_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(40) NOT NULL DEFAULT '',
  `parentid` smallint(6) DEFAULT '0',
  `icon` varchar(20) NOT NULL DEFAULT '',
  `c` varchar(20) DEFAULT NULL,
  `a` varchar(20) DEFAULT NULL,
  `data` varchar(50) NOT NULL DEFAULT '',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '999',
  `display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示(1:显示,2:不显示)',
  `updatetime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `listorder` (`listorder`),
  KEY `parentid` (`parentid`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zxcms_menu
-- ----------------------------
BEGIN;
INSERT INTO `zxcms_menu` VALUES (1, '管理设置', 0, 'fa-users', 'Admin', 'admin', '', '', '', 1, 1, 1531195322);
INSERT INTO `zxcms_menu` VALUES (2, '管理员管理', 1, '', 'Admin', 'index', '', '', '', 0, 1, 1531195322);
INSERT INTO `zxcms_menu` VALUES (3, '详情', 2, '', 'Admin', 'info', '', '', '', 0, 2, 1531195322);
INSERT INTO `zxcms_menu` VALUES (4, '添加', 2, '', 'Admin', 'add', '', '', '', 0, 2, 1531195322);
INSERT INTO `zxcms_menu` VALUES (5, '修改', 2, '', 'Admin', 'edit', '', '', '', 0, 2, 1531195322);
INSERT INTO `zxcms_menu` VALUES (6, '删除', 2, '', 'Admin', 'del', '', '', '', 0, 2, 1531195322);
INSERT INTO `zxcms_menu` VALUES (7, '分组管理', 1, '', 'Group', 'index', '', '', '', 0, 1, 1531195322);
INSERT INTO `zxcms_menu` VALUES (8, '详情', 7, '', 'Group', 'info', '', '', '', 0, 2, 1531195322);
INSERT INTO `zxcms_menu` VALUES (9, '添加', 7, '', 'Group', 'add', '', '', '', 0, 2, 1531195322);
INSERT INTO `zxcms_menu` VALUES (10, '修改', 7, '', 'Group', 'edit', '', '', '', 0, 2, 1531195322);
INSERT INTO `zxcms_menu` VALUES (11, '删除', 7, '', 'Group', 'del', '', '', '', 0, 2, 1531195322);
INSERT INTO `zxcms_menu` VALUES (12, '菜单管理', 18, '', 'Menu', 'index', '', '', '', 0, 1, 1531195322);
INSERT INTO `zxcms_menu` VALUES (13, '查看', 12, '', 'Menu', 'info', '', '', '', 0, 2, 1531195322);
INSERT INTO `zxcms_menu` VALUES (14, '添加', 12, '', 'Menu', 'add', '', '', '', 0, 2, 1531195322);
INSERT INTO `zxcms_menu` VALUES (15, '修改', 12, '', 'Menu', 'edit', '', '', '', 0, 2, 1531195322);
INSERT INTO `zxcms_menu` VALUES (16, '删除', 12, '', 'Menu', 'del', '', '', '', 0, 2, 1531195322);
INSERT INTO `zxcms_menu` VALUES (18, '系统设置', 0, 'fa-cogs', 'Menu', 'index', '', '', '', 2, 1, 1531195322);
INSERT INTO `zxcms_menu` VALUES (22, '权限设置', 2, '', 'Group', 'rule', '', '', '', 999, 2, 1531195322);
INSERT INTO `zxcms_menu` VALUES (23, '个人设置', 1, '', 'Admin', 'public_edit_info', '', '', '', 999, 1, 1531195322);
INSERT INTO `zxcms_menu` VALUES (27, '日志管理', 18, '', 'Log', 'index', '', '', '', 999, 1, 1531195322);
INSERT INTO `zxcms_menu` VALUES (31, '系统首页', 0, 'fa-bank', 'Index', 'index', '', '', '', 0, 1, 1531195322);
INSERT INTO `zxcms_menu` VALUES (32, '站点管理', 0, '', 'Site', 'index', '', '', '', 2, 1, 1531195322);
INSERT INTO `zxcms_menu` VALUES (33, '站点列表', 32, '', 'Site', 'index', '', '', '', 999, 1, 1531203032);
INSERT INTO `zxcms_menu` VALUES (34, '查看', 33, '', 'Site', 'info', '', '', '', 999, 2, 1531203192);
INSERT INTO `zxcms_menu` VALUES (35, '添加', 33, '', 'Site', 'add', '', '', '', 999, 2, NULL);
INSERT INTO `zxcms_menu` VALUES (36, '修改', 33, '', 'Site', 'edit', '', '', '', 999, 2, NULL);
INSERT INTO `zxcms_menu` VALUES (37, '删除', 33, '', 'Site', 'del', '', '', '', 999, 2, NULL);
INSERT INTO `zxcms_menu` VALUES (39, '站点抓取', 0, '', 'Spider', 'index', '', '', '', 999, 2, 1531210403);
INSERT INTO `zxcms_menu` VALUES (40, '站点抓取规则管理', 39, '', 'Spider', 'index', '', '', '', 999, 1, 1531210259);
INSERT INTO `zxcms_menu` VALUES (41, '查看', 40, '', 'Spider', 'info', '', '', '', 999, 1, NULL);
INSERT INTO `zxcms_menu` VALUES (42, '抓取规则管理', 0, '', 'Regulation', 'index', '', '', '', 999, 1, NULL);
INSERT INTO `zxcms_menu` VALUES (43, '规则列表', 42, '', 'Regulation', 'index', '', '', '', 999, 1, 1531287661);
INSERT INTO `zxcms_menu` VALUES (44, '查看', 43, '', 'Regulation', 'info', '', '', '', 999, 2, 1531287905);
INSERT INTO `zxcms_menu` VALUES (45, '添加', 43, '', 'Regulation', 'add', '', '', '', 999, 2, 1531287911);
INSERT INTO `zxcms_menu` VALUES (46, '修改', 43, '', 'Regulation', 'edit', '', '', '', 999, 2, NULL);
INSERT INTO `zxcms_menu` VALUES (47, '删除', 43, '', 'Regulation', 'del', '', '', '', 999, 2, NULL);
COMMIT;

-- ----------------------------
-- Table structure for zxcms_regulation
-- ----------------------------
DROP TABLE IF EXISTS `zxcms_regulation`;
CREATE TABLE `zxcms_regulation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(255) NOT NULL COMMENT '抓取规则名称',
  `tip` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '提示',
  `reg_list` text NOT NULL COMMENT '匹配列表规则',
  `reg_title` text NOT NULL COMMENT '匹配title规则',
  `reg_dec` text NOT NULL COMMENT '匹配dec规则',
  `reg_content` text NOT NULL COMMENT '匹配content规则',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='抓取规则表';

-- ----------------------------
-- Records of zxcms_regulation
-- ----------------------------
BEGIN;
INSERT INTO `zxcms_regulation` VALUES (1, '雅昌艺术网', '抓取雅昌艺术网新闻规则', '/https:\\/\\/news\\.artron\\.net:443\\/[0-9]{8}\\/[a-z]{1}[0-9]{7}\\.html/', '/<h1 class=\"title\">(.*)<\\/h1>/', '/<div class=\"intro\">\\s+ <p class=\"sub\">\\s+<strong>.*<\\/strong>(.*)\\s+<\\/p>\\s+<\\/div>/isU', '/<div class=\"detail newsContentDetail\">\\s+(.*)\\s+<\\/div>/isU');
INSERT INTO `zxcms_regulation` VALUES (2, '华夏收藏网', 'http://news.cang.com/', '/http:\\/\\/news\\.cang\\.com\\/infos\\/[0-9]+\\/[0-9]+\\.html/', '/<h1>(.*)<\\/h1>/', '/<div class=\"intro\">\\s+ <p class=\"sub\">\\s+<strong>.*<\\/strong>(.*)\\s+<\\/p>\\s+<\\/div>/isU', '/<dd id=\"main_content\">\\s+(.*)\\s+<\\/dd>/isU');
COMMIT;

-- ----------------------------
-- Table structure for zxcms_site
-- ----------------------------
DROP TABLE IF EXISTS `zxcms_site`;
CREATE TABLE `zxcms_site` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(255) DEFAULT NULL COMMENT '站点名称',
  `link` varchar(255) DEFAULT NULL COMMENT '站点地址',
  `tip` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '提示',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '999' COMMENT '列表排序',
  `updatetime` int(11) DEFAULT NULL COMMENT '修改时间',
  `display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示(1:显示,2:不显示)',
  `sql_ip` varchar(255) DEFAULT NULL COMMENT '数据库ip',
  `sql_user` varchar(255) DEFAULT NULL COMMENT '数据库用户名',
  `sql_pass` varchar(255) DEFAULT NULL COMMENT '数据库密码',
  `sql_database` varchar(255) DEFAULT NULL COMMENT '数据库表名',
  `sql_table` varchar(255) DEFAULT NULL COMMENT '入库表',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='站点表';

-- ----------------------------
-- Records of zxcms_site
-- ----------------------------
BEGIN;
INSERT INTO `zxcms_site` VALUES (1, '盛世文藏网', 'http://www.artmai.net', '新闻采集', 999, 1531208516, 1, '127.0.0.1', 'root', 'root', 'www.artmai.net', 'cc_infolist');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
