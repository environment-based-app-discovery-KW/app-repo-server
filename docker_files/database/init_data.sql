/*
Navicat MySQL Data Transfer

Source Server         : @localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : app-repo-server

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-05-20 16:42:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2018_04_06_123333_create_web_apps_table', '1');
INSERT INTO `migrations` VALUES ('2', '2018_04_06_123452_create_web_app_versions_table', '1');
INSERT INTO `migrations` VALUES ('3', '2018_04_06_123554_create_web_app_dependencies_table', '1');
INSERT INTO `migrations` VALUES ('4', '2018_04_06_123824_create_web_app_has_web_app_dependencies_table', '1');
INSERT INTO `migrations` VALUES ('5', '2018_04_06_124339_create_web_app_deployment_locations_table', '1');
INSERT INTO `migrations` VALUES ('6', '2018_04_13_155233_create_pinned_web_apps_table', '1');
INSERT INTO `migrations` VALUES ('7', '2018_05_12_144013_add_launch_params_json_to_pinned_web_apps', '2');
INSERT INTO `migrations` VALUES ('8', '2018_05_13_005500_add_display_name_to_deployments', '3');

-- ----------------------------
-- Table structure for pinned_web_apps
-- ----------------------------
DROP TABLE IF EXISTS `pinned_web_apps`;
CREATE TABLE `pinned_web_apps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `web_app_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `launch_params_json` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of pinned_web_apps
-- ----------------------------
INSERT INTO `pinned_web_apps` VALUES ('3', '8', '0', null, null, '', '诗词鉴赏随堂测');
INSERT INTO `pinned_web_apps` VALUES ('4', '7', '0', null, null, '', '志愿者活动报名');
INSERT INTO `pinned_web_apps` VALUES ('5', '6', '0', null, null, '', '会议安排表');

-- ----------------------------
-- Table structure for web_apps
-- ----------------------------
DROP TABLE IF EXISTS `web_apps`;
CREATE TABLE `web_apps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `developer_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of web_apps
-- ----------------------------
INSERT INTO `web_apps` VALUES ('3', 'auth-test', '', '0', '2018-05-09 05:07:18', '2018-05-09 05:07:18');
INSERT INTO `web_apps` VALUES ('4', 'car-park', '', '0', '2018-05-12 08:09:50', '2018-05-12 08:09:50');
INSERT INTO `web_apps` VALUES ('5', 'menu', '', '0', '2018-05-12 16:39:25', '2018-05-12 16:39:25');
INSERT INTO `web_apps` VALUES ('6', 'schedule', '', '0', '2018-05-12 16:47:32', '2018-05-12 16:47:32');
INSERT INTO `web_apps` VALUES ('7', 'signup', '', '0', '2018-05-12 16:47:38', '2018-05-12 16:47:38');
INSERT INTO `web_apps` VALUES ('8', 'exam', '', '0', '2018-05-19 02:23:43', '2018-05-19 02:23:43');

-- ----------------------------
-- Table structure for web_app_dependencies
-- ----------------------------
DROP TABLE IF EXISTS `web_app_dependencies`;
CREATE TABLE `web_app_dependencies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dependency_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `dependency_version` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `dependency_name_version` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_bundle_hash` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of web_app_dependencies
-- ----------------------------
INSERT INTO `web_app_dependencies` VALUES ('1', 'lodash', '4.17.5', 'lodash_4.17.5', '881c3dc1884198c9757f6f4b0720e73e40dc876637805ab5c70f6e8df9bb7508', '2018-04-14 12:17:59', '2018-04-14 12:17:59');
INSERT INTO `web_app_dependencies` VALUES ('2', 'react', '16.3.2', 'react_16.3.2', '7439169fc114ae42281521d8f1ddf9644347b159f1faf8f0b4879689ada8b6e5', '2018-05-09 15:57:59', '2018-05-09 15:57:59');
INSERT INTO `web_app_dependencies` VALUES ('3', 'react-dom', '16.3.2', 'react-dom_16.3.2', 'c433b8c6364135bacdb0e120f3b377d063acbb14c35bbcaa6a2c1ba2b5698b37', '2018-05-09 15:57:59', '2018-05-09 15:57:59');
INSERT INTO `web_app_dependencies` VALUES ('4', 'react-syntax-highlighter', '7.0.4', 'react-syntax-highlighter_7.0.4', '71f6c36ecbe48a8f1f00ed49d3901ffe4a75164315041d9189f14dbd3501eb71', '2018-05-10 00:26:31', '2018-05-10 00:26:31');
INSERT INTO `web_app_dependencies` VALUES ('5', 'axios', '0.18.0', 'axios_0.18.0', '6536240c773f7cefdcffb76491f07c4962677955b323623b85c4e573e55cbb0d', '2018-05-12 08:26:16', '2018-05-12 08:26:16');

-- ----------------------------
-- Table structure for web_app_deployment_locations
-- ----------------------------
DROP TABLE IF EXISTS `web_app_deployment_locations`;
CREATE TABLE `web_app_deployment_locations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `web_app_id` int(11) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `radius_m` double NOT NULL,
  `launch_params_json` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `display_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of web_app_deployment_locations
-- ----------------------------
INSERT INTO `web_app_deployment_locations` VALUES ('3', '3', '31.267401', '121.522179', '200', '', null, null, '用户授权测试程序');
INSERT INTO `web_app_deployment_locations` VALUES ('4', '4', '31.267401', '121.522129', '1000', '{\"carParkName\":\"AAA商场停车场\"}', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'AAA商场停车场');
INSERT INTO `web_app_deployment_locations` VALUES ('5', '5', '31.267431', '121.522179', '200', '', null, null, 'ABC快餐店点单');

-- ----------------------------
-- Table structure for web_app_has_web_app_dependencies
-- ----------------------------
DROP TABLE IF EXISTS `web_app_has_web_app_dependencies`;
CREATE TABLE `web_app_has_web_app_dependencies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `web_app_version_id` int(11) NOT NULL,
  `web_app_dependency_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of web_app_has_web_app_dependencies
-- ----------------------------
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('1', '1', '1', '2018-04-14 12:17:59', '2018-04-14 12:17:59');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('2', '2', '1', '2018-04-14 12:17:59', '2018-04-14 12:17:59');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('3', '3', '1', '2018-05-09 05:07:18', '2018-05-09 05:07:18');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('5', '4', '1', '2018-05-09 13:57:48', '2018-05-09 13:57:48');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('6', '5', '1', '2018-05-09 13:58:01', '2018-05-09 13:58:01');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('7', '6', '1', '2018-05-09 15:57:59', '2018-05-09 15:57:59');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('8', '6', '2', '2018-05-09 15:57:59', '2018-05-09 15:57:59');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('9', '6', '3', '2018-05-09 15:57:59', '2018-05-09 15:57:59');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('10', '7', '1', '2018-05-09 16:08:20', '2018-05-09 16:08:20');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('11', '7', '2', '2018-05-09 16:08:20', '2018-05-09 16:08:20');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('12', '7', '3', '2018-05-09 16:08:20', '2018-05-09 16:08:20');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('16', '8', '1', '2018-05-09 16:14:46', '2018-05-09 16:14:46');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('17', '8', '2', '2018-05-09 16:14:46', '2018-05-09 16:14:46');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('18', '8', '3', '2018-05-09 16:14:46', '2018-05-09 16:14:46');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('19', '9', '1', '2018-05-09 16:15:21', '2018-05-09 16:15:21');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('20', '9', '2', '2018-05-09 16:15:21', '2018-05-09 16:15:21');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('21', '9', '3', '2018-05-09 16:15:21', '2018-05-09 16:15:21');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('22', '10', '1', '2018-05-09 16:29:05', '2018-05-09 16:29:05');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('23', '10', '2', '2018-05-09 16:29:05', '2018-05-09 16:29:05');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('24', '10', '3', '2018-05-09 16:29:05', '2018-05-09 16:29:05');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('28', '11', '1', '2018-05-09 16:31:50', '2018-05-09 16:31:50');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('29', '11', '2', '2018-05-09 16:31:50', '2018-05-09 16:31:50');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('30', '11', '3', '2018-05-09 16:31:50', '2018-05-09 16:31:50');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('31', '12', '1', '2018-05-09 16:31:57', '2018-05-09 16:31:57');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('32', '12', '2', '2018-05-09 16:31:57', '2018-05-09 16:31:57');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('33', '12', '3', '2018-05-09 16:31:57', '2018-05-09 16:31:57');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('34', '13', '1', '2018-05-09 16:37:14', '2018-05-09 16:37:14');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('35', '13', '2', '2018-05-09 16:37:14', '2018-05-09 16:37:14');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('36', '13', '3', '2018-05-09 16:37:14', '2018-05-09 16:37:14');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('37', '14', '1', '2018-05-09 16:58:25', '2018-05-09 16:58:25');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('38', '14', '2', '2018-05-09 16:58:25', '2018-05-09 16:58:25');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('39', '14', '3', '2018-05-09 16:58:25', '2018-05-09 16:58:25');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('40', '15', '1', '2018-05-09 17:03:00', '2018-05-09 17:03:00');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('41', '15', '2', '2018-05-09 17:03:00', '2018-05-09 17:03:00');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('42', '15', '3', '2018-05-09 17:03:00', '2018-05-09 17:03:00');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('43', '16', '1', '2018-05-09 17:04:14', '2018-05-09 17:04:14');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('44', '16', '2', '2018-05-09 17:04:14', '2018-05-09 17:04:14');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('45', '16', '3', '2018-05-09 17:04:14', '2018-05-09 17:04:14');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('46', '17', '1', '2018-05-09 17:06:03', '2018-05-09 17:06:03');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('47', '17', '2', '2018-05-09 17:06:03', '2018-05-09 17:06:03');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('48', '17', '3', '2018-05-09 17:06:03', '2018-05-09 17:06:03');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('49', '18', '1', '2018-05-10 00:26:31', '2018-05-10 00:26:31');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('50', '18', '2', '2018-05-10 00:26:31', '2018-05-10 00:26:31');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('51', '18', '3', '2018-05-10 00:26:31', '2018-05-10 00:26:31');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('52', '18', '4', '2018-05-10 00:26:31', '2018-05-10 00:26:31');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('53', '19', '1', '2018-05-10 00:34:29', '2018-05-10 00:34:29');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('54', '19', '2', '2018-05-10 00:34:29', '2018-05-10 00:34:29');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('55', '19', '3', '2018-05-10 00:34:29', '2018-05-10 00:34:29');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('56', '19', '4', '2018-05-10 00:34:29', '2018-05-10 00:34:29');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('57', '20', '1', '2018-05-10 00:37:58', '2018-05-10 00:37:58');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('58', '20', '2', '2018-05-10 00:37:58', '2018-05-10 00:37:58');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('59', '20', '3', '2018-05-10 00:37:58', '2018-05-10 00:37:58');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('60', '20', '4', '2018-05-10 00:37:58', '2018-05-10 00:37:58');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('61', '21', '1', '2018-05-11 11:52:06', '2018-05-11 11:52:06');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('62', '21', '2', '2018-05-11 11:52:06', '2018-05-11 11:52:06');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('63', '21', '3', '2018-05-11 11:52:06', '2018-05-11 11:52:06');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('64', '21', '4', '2018-05-11 11:52:06', '2018-05-11 11:52:06');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('65', '22', '1', '2018-05-11 12:02:57', '2018-05-11 12:02:57');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('66', '22', '2', '2018-05-11 12:02:57', '2018-05-11 12:02:57');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('67', '22', '3', '2018-05-11 12:02:57', '2018-05-11 12:02:57');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('68', '22', '4', '2018-05-11 12:02:57', '2018-05-11 12:02:57');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('69', '23', '1', '2018-05-11 12:27:17', '2018-05-11 12:27:17');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('70', '23', '2', '2018-05-11 12:27:17', '2018-05-11 12:27:17');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('71', '23', '3', '2018-05-11 12:27:17', '2018-05-11 12:27:17');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('72', '23', '4', '2018-05-11 12:27:17', '2018-05-11 12:27:17');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('73', '24', '1', '2018-05-12 08:09:50', '2018-05-12 08:09:50');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('74', '24', '2', '2018-05-12 08:09:50', '2018-05-12 08:09:50');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('75', '24', '3', '2018-05-12 08:09:50', '2018-05-12 08:09:50');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('76', '25', '5', '2018-05-12 08:26:16', '2018-05-12 08:26:16');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('77', '25', '1', '2018-05-12 08:26:16', '2018-05-12 08:26:16');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('78', '25', '2', '2018-05-12 08:26:16', '2018-05-12 08:26:16');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('79', '25', '3', '2018-05-12 08:26:16', '2018-05-12 08:26:16');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('80', '26', '5', '2018-05-12 08:51:11', '2018-05-12 08:51:11');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('81', '26', '1', '2018-05-12 08:51:11', '2018-05-12 08:51:11');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('82', '26', '2', '2018-05-12 08:51:11', '2018-05-12 08:51:11');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('83', '26', '3', '2018-05-12 08:51:11', '2018-05-12 08:51:11');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('84', '27', '5', '2018-05-12 09:24:37', '2018-05-12 09:24:37');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('85', '27', '1', '2018-05-12 09:24:37', '2018-05-12 09:24:37');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('86', '27', '2', '2018-05-12 09:24:37', '2018-05-12 09:24:37');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('87', '27', '3', '2018-05-12 09:24:37', '2018-05-12 09:24:37');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('88', '28', '5', '2018-05-12 16:39:25', '2018-05-12 16:39:25');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('89', '28', '1', '2018-05-12 16:39:25', '2018-05-12 16:39:25');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('90', '28', '2', '2018-05-12 16:39:25', '2018-05-12 16:39:25');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('91', '28', '3', '2018-05-12 16:39:25', '2018-05-12 16:39:25');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('92', '29', '5', '2018-05-12 16:47:32', '2018-05-12 16:47:32');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('93', '29', '1', '2018-05-12 16:47:32', '2018-05-12 16:47:32');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('94', '29', '2', '2018-05-12 16:47:32', '2018-05-12 16:47:32');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('95', '29', '3', '2018-05-12 16:47:32', '2018-05-12 16:47:32');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('96', '30', '5', '2018-05-12 16:47:38', '2018-05-12 16:47:38');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('97', '30', '1', '2018-05-12 16:47:38', '2018-05-12 16:47:38');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('98', '30', '2', '2018-05-12 16:47:38', '2018-05-12 16:47:38');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('99', '30', '3', '2018-05-12 16:47:38', '2018-05-12 16:47:38');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('104', '32', '5', '2018-05-15 05:21:00', '2018-05-15 05:21:00');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('105', '32', '1', '2018-05-15 05:21:00', '2018-05-15 05:21:00');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('106', '32', '2', '2018-05-15 05:21:00', '2018-05-15 05:21:00');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('107', '32', '3', '2018-05-15 05:21:00', '2018-05-15 05:21:00');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('108', '33', '5', '2018-05-15 05:21:07', '2018-05-15 05:21:07');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('109', '33', '1', '2018-05-15 05:21:07', '2018-05-15 05:21:07');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('110', '33', '2', '2018-05-15 05:21:07', '2018-05-15 05:21:07');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('111', '33', '3', '2018-05-15 05:21:07', '2018-05-15 05:21:07');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('112', '31', '5', '2018-05-15 05:21:14', '2018-05-15 05:21:14');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('113', '31', '1', '2018-05-15 05:21:14', '2018-05-15 05:21:14');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('114', '31', '2', '2018-05-15 05:21:14', '2018-05-15 05:21:14');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('115', '31', '3', '2018-05-15 05:21:14', '2018-05-15 05:21:14');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('116', '34', '5', '2018-05-19 02:22:22', '2018-05-19 02:22:22');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('117', '34', '1', '2018-05-19 02:22:22', '2018-05-19 02:22:22');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('118', '34', '2', '2018-05-19 02:22:22', '2018-05-19 02:22:22');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('119', '34', '3', '2018-05-19 02:22:22', '2018-05-19 02:22:22');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('120', '35', '5', '2018-05-19 02:23:43', '2018-05-19 02:23:43');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('121', '35', '1', '2018-05-19 02:23:43', '2018-05-19 02:23:43');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('122', '35', '2', '2018-05-19 02:23:43', '2018-05-19 02:23:43');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('123', '35', '3', '2018-05-19 02:23:43', '2018-05-19 02:23:43');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('124', '36', '5', '2018-05-19 02:23:55', '2018-05-19 02:23:55');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('125', '36', '1', '2018-05-19 02:23:55', '2018-05-19 02:23:55');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('126', '36', '2', '2018-05-19 02:23:55', '2018-05-19 02:23:55');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('127', '36', '3', '2018-05-19 02:23:55', '2018-05-19 02:23:55');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('128', '37', '5', '2018-05-19 02:24:07', '2018-05-19 02:24:07');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('129', '37', '1', '2018-05-19 02:24:07', '2018-05-19 02:24:07');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('130', '37', '2', '2018-05-19 02:24:07', '2018-05-19 02:24:07');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('131', '37', '3', '2018-05-19 02:24:07', '2018-05-19 02:24:07');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('132', '38', '5', '2018-05-19 02:24:17', '2018-05-19 02:24:17');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('133', '38', '1', '2018-05-19 02:24:17', '2018-05-19 02:24:17');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('134', '38', '2', '2018-05-19 02:24:17', '2018-05-19 02:24:17');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('135', '38', '3', '2018-05-19 02:24:17', '2018-05-19 02:24:17');

-- ----------------------------
-- Table structure for web_app_versions
-- ----------------------------
DROP TABLE IF EXISTS `web_app_versions`;
CREATE TABLE `web_app_versions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `web_app_id` int(11) NOT NULL,
  `version` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_bundle_hash` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of web_app_versions
-- ----------------------------
INSERT INTO `web_app_versions` VALUES ('1', '1', '1.0.0', '', 'a2fe71cbca6d582c88dfd4303e4f3563456e331cc01bb678a8d99e9e955d20d0', '2018-04-14 12:17:59', '2018-04-14 12:17:59');
INSERT INTO `web_app_versions` VALUES ('2', '2', '1.0.0', '', 'a2fe71cbca6d582c88dfd4303e4f3563456e331cc01bb678a8d99e9e955d20d0', '2018-04-14 12:17:59', '2018-04-14 12:17:59');
INSERT INTO `web_app_versions` VALUES ('23', '3', '1.0.20', 'http://7xn0vy.dl1.z0.glb.clouddn.com/app-discovery-auth-test-logo.gif', '8af40fdc07cfd8930802fbf51c39380e6af6724faa1a286f23d91c5fbfd16681', '2018-05-11 12:27:17', '2018-05-11 12:27:17');
INSERT INTO `web_app_versions` VALUES ('27', '4', '1.0.3', 'http://7xn0vy.dl1.z0.glb.clouddn.com/app-discovery-car-park-logo_1.gif', '7c3af7dc5132c50f36f42f98ccdd41f9746fc1ac72b0df9417023d2a580e6f33', '2018-05-12 09:24:37', '2018-05-12 09:24:37');
INSERT INTO `web_app_versions` VALUES ('28', '5', '1.0.0', 'http://7xn0vy.dl1.z0.glb.clouddn.com/app-discovery-menu-logo.gif', 'bf93b5e40aca6b9c6fa31e3f183309a24855d265e212cb07efb6fc560a7512d7', '2018-05-12 16:39:25', '2018-05-12 16:39:25');
INSERT INTO `web_app_versions` VALUES ('29', '6', '1.0.0', 'http://7xn0vy.dl1.z0.glb.clouddn.com/app-discovery-schedule-logo.gif', 'bf93b5e40aca6b9c6fa31e3f183309a24855d265e212cb07efb6fc560a7512d7', '2018-05-12 16:47:32', '2018-05-12 16:47:32');
INSERT INTO `web_app_versions` VALUES ('30', '7', '1.0.0', 'http://7xn0vy.dl1.z0.glb.clouddn.com/app-discovery-signup-logo.gif', 'bf93b5e40aca6b9c6fa31e3f183309a24855d265e212cb07efb6fc560a7512d7', '2018-05-12 16:47:38', '2018-05-12 16:47:38');
INSERT INTO `web_app_versions` VALUES ('31', '7', '1.0.2', 'http://7xn0vy.dl1.z0.glb.clouddn.com/app-discovery-signup-logo.gif', '328b66a2ae29e92c7326f2eec0d30414911c3c1f4616be1233cd3ae6bfcdd7f0', '2018-05-15 05:20:53', '2018-05-15 05:20:53');
INSERT INTO `web_app_versions` VALUES ('32', '6', '1.0.1', 'http://7xn0vy.dl1.z0.glb.clouddn.com/app-discovery-schedule-logo.gif', 'b5079a795037e9ff10cde7eacc0adb61977a2c3c1a5ab9f71c84f928e20a64b4', '2018-05-15 05:21:00', '2018-05-15 05:21:00');
INSERT INTO `web_app_versions` VALUES ('33', '5', '1.0.1', 'http://7xn0vy.dl1.z0.glb.clouddn.com/app-discovery-menu-logo.gif', 'e2a1253a20ba38bab18977d81469c40a741fed894e8b56d2db46e3752ec4f295', '2018-05-15 05:21:07', '2018-05-15 05:21:07');
INSERT INTO `web_app_versions` VALUES ('34', '4', '1.0.4', 'http://7xn0vy.dl1.z0.glb.clouddn.com/app-discovery-car-park-logo_1.gif', 'ae86d81f91e43239088712c506bc2ded203218dd7cc245823d620f30ecee339d', '2018-05-19 02:22:22', '2018-05-19 02:22:22');
INSERT INTO `web_app_versions` VALUES ('35', '8', '1.0.3', 'http://7xn0vy.dl1.z0.glb.clouddn.com/app-discovery-exam-logo.gif', '18247186e5114f33ae878a58b4001f263d5125351b2545ee31c74c4a2c0d95bf', '2018-05-19 02:23:43', '2018-05-19 02:23:43');
INSERT INTO `web_app_versions` VALUES ('36', '5', '1.0.2', 'http://7xn0vy.dl1.z0.glb.clouddn.com/app-discovery-menu-logo.gif', '1c3fb1ddade7ba57c79b9d0aedb71571cd07b4b20ccdff7655a0dff3531dbccc', '2018-05-19 02:23:55', '2018-05-19 02:23:55');
INSERT INTO `web_app_versions` VALUES ('37', '6', '1.0.2', 'http://7xn0vy.dl1.z0.glb.clouddn.com/app-discovery-schedule-logo.gif', 'a644763a266e0bdf16f23905138ebfaae6c3d3ddb9c568668df5bdc6e81b687b', '2018-05-19 02:24:07', '2018-05-19 02:24:07');
INSERT INTO `web_app_versions` VALUES ('38', '7', '1.0.3', 'http://7xn0vy.dl1.z0.glb.clouddn.com/app-discovery-signup-logo.gif', 'cc407192220986c334b41e2093ce3d470ec4d39b16c33e9e36431e88e224346d', '2018-05-19 02:24:17', '2018-05-19 02:24:17');
