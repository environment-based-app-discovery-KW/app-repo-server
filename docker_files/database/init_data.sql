/*
Navicat MySQL Data Transfer

Source Server         : @localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : app-repo-server

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-05-22 00:21:01
*/

USE `app-repo-server`;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of pinned_web_apps
-- ----------------------------
INSERT INTO `pinned_web_apps` VALUES ('1', '2', '0', null, null, '', '诗词鉴赏随堂测');
INSERT INTO `pinned_web_apps` VALUES ('2', '5', '0', null, null, '', '志愿者活动报名');
INSERT INTO `pinned_web_apps` VALUES ('3', '4', '0', null, null, '', '会议安排表');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of web_apps
-- ----------------------------
INSERT INTO `web_apps` VALUES ('1', 'car-park', '', '0', '2018-05-21 16:10:53', '2018-05-21 16:10:53');
INSERT INTO `web_apps` VALUES ('2', 'exam', '', '0', '2018-05-21 16:11:04', '2018-05-21 16:11:04');
INSERT INTO `web_apps` VALUES ('3', 'menu', '', '0', '2018-05-21 16:11:39', '2018-05-21 16:11:39');
INSERT INTO `web_apps` VALUES ('4', 'schedule', '', '0', '2018-05-21 16:11:55', '2018-05-21 16:11:55');
INSERT INTO `web_apps` VALUES ('5', 'signup', '', '0', '2018-05-21 16:12:04', '2018-05-21 16:12:04');
INSERT INTO `web_apps` VALUES ('6', 'auth-test', '', '0', '2018-05-21 16:12:51', '2018-05-21 16:12:51');

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
INSERT INTO `web_app_dependencies` VALUES ('1', 'axios', '0.18.0', 'axios_0.18.0', '6536240c773f7cefdcffb76491f07c4962677955b323623b85c4e573e55cbb0d', '2018-05-21 16:10:53', '2018-05-21 16:10:53');
INSERT INTO `web_app_dependencies` VALUES ('2', 'lodash', '4.17.5', 'lodash_4.17.5', 'ba1baa7ec7eb21bff9d8baa2c40f569ad3da4db84c0ef7f640d37e649f86b796', '2018-05-21 16:10:53', '2018-05-21 16:10:53');
INSERT INTO `web_app_dependencies` VALUES ('3', 'react', '16.3.2', 'react_16.3.2', 'ca3c8360e7cf853cd9e266fcd057c6a0e1a2f7fe88482a11c95c22dc20783b80', '2018-05-21 16:10:53', '2018-05-21 16:10:53');
INSERT INTO `web_app_dependencies` VALUES ('4', 'react-dom', '16.3.2', 'react-dom_16.3.2', '10ae51d1e83afc01e78e0dbb912e712ff63abbd2bdc039a71b92339638247b7f', '2018-05-21 16:10:53', '2018-05-21 16:10:53');
INSERT INTO `web_app_dependencies` VALUES ('5', 'react-syntax-highlighter', '7.0.4', 'react-syntax-highlighter_7.0.4', '71f6c36ecbe48a8f1f00ed49d3901ffe4a75164315041d9189f14dbd3501eb71', '2018-05-21 16:12:51', '2018-05-21 16:12:51');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of web_app_deployment_locations
-- ----------------------------
INSERT INTO `web_app_deployment_locations` VALUES ('1', '6', '31.267401', '121.522179', '200', '{}', '2018-05-22 00:15:56', '2018-05-22 00:15:56', '用户授权测试程序');
INSERT INTO `web_app_deployment_locations` VALUES ('2', '1', '31.267401', '121.522129', '1000', '{\"carParkName\":\"AAA商场停车场\"}\r\n', '2018-05-22 00:15:56', '2018-05-22 00:15:56', 'AAA商场停车场');
INSERT INTO `web_app_deployment_locations` VALUES ('3', '3', '31.267431', '121.522179', '200', '{\"name\":\"ABC快餐店\"}', '2018-05-22 00:15:56', '2018-05-22 00:15:56', 'ABC快餐店点单');

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of web_app_has_web_app_dependencies
-- ----------------------------
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('1', '1', '1', '2018-05-21 16:10:53', '2018-05-21 16:10:53');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('2', '1', '2', '2018-05-21 16:10:53', '2018-05-21 16:10:53');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('3', '1', '3', '2018-05-21 16:10:53', '2018-05-21 16:10:53');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('4', '1', '4', '2018-05-21 16:10:53', '2018-05-21 16:10:53');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('5', '2', '1', '2018-05-21 16:11:04', '2018-05-21 16:11:04');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('6', '2', '2', '2018-05-21 16:11:04', '2018-05-21 16:11:04');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('7', '2', '3', '2018-05-21 16:11:04', '2018-05-21 16:11:04');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('8', '2', '4', '2018-05-21 16:11:04', '2018-05-21 16:11:04');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('9', '3', '1', '2018-05-21 16:11:39', '2018-05-21 16:11:39');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('10', '3', '2', '2018-05-21 16:11:39', '2018-05-21 16:11:39');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('11', '3', '3', '2018-05-21 16:11:39', '2018-05-21 16:11:39');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('12', '3', '4', '2018-05-21 16:11:39', '2018-05-21 16:11:39');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('13', '4', '1', '2018-05-21 16:11:55', '2018-05-21 16:11:55');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('14', '4', '2', '2018-05-21 16:11:55', '2018-05-21 16:11:55');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('15', '4', '3', '2018-05-21 16:11:55', '2018-05-21 16:11:55');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('16', '4', '4', '2018-05-21 16:11:55', '2018-05-21 16:11:55');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('17', '5', '1', '2018-05-21 16:12:04', '2018-05-21 16:12:04');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('18', '5', '2', '2018-05-21 16:12:04', '2018-05-21 16:12:04');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('19', '5', '3', '2018-05-21 16:12:04', '2018-05-21 16:12:04');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('20', '5', '4', '2018-05-21 16:12:04', '2018-05-21 16:12:04');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('21', '6', '2', '2018-05-21 16:12:51', '2018-05-21 16:12:51');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('22', '6', '3', '2018-05-21 16:12:51', '2018-05-21 16:12:51');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('23', '6', '4', '2018-05-21 16:12:51', '2018-05-21 16:12:51');
INSERT INTO `web_app_has_web_app_dependencies` VALUES ('24', '6', '5', '2018-05-21 16:12:51', '2018-05-21 16:12:51');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of web_app_versions
-- ----------------------------
INSERT INTO `web_app_versions` VALUES ('1', '1', '1.0.5', 'http://7xn0vy.dl1.z0.glb.clouddn.com/app-discovery-car-park-logo_1.gif', '0b5db206f373c685cc254fb832ee0e012c9f51f1972cdb53bb376e994b4a4a37', '2018-05-21 16:10:53', '2018-05-21 16:10:53');
INSERT INTO `web_app_versions` VALUES ('2', '2', '1.0.4', 'http://7xn0vy.dl1.z0.glb.clouddn.com/app-discovery-exam-logo.gif', 'a2706575fb0b8911b8988ae3650bf1c260b32f435adb2e0a7e5f9638e5c1414d', '2018-05-21 16:11:04', '2018-05-21 16:11:04');
INSERT INTO `web_app_versions` VALUES ('3', '3', '1.0.3', 'http://7xn0vy.dl1.z0.glb.clouddn.com/app-discovery-menu-logo.gif', 'b82dec2a32dbec4ab773f374d8c9c44ec0e9ab2f3f5398e0c858673ee3b71141', '2018-05-21 16:11:39', '2018-05-21 16:11:39');
INSERT INTO `web_app_versions` VALUES ('4', '4', '1.0.3', 'http://7xn0vy.dl1.z0.glb.clouddn.com/app-discovery-schedule-logo.gif', '42d0ea42682ef3f32805831f1e88dbf725b8c312ddad515e0898900e52efefa0', '2018-05-21 16:11:55', '2018-05-21 16:11:55');
INSERT INTO `web_app_versions` VALUES ('5', '5', '1.0.4', 'http://7xn0vy.dl1.z0.glb.clouddn.com/app-discovery-signup-logo.gif', 'df3a7b3bd21488d2c8067a987e56db67dc2899051e9e6107ddf85b76804d19d1', '2018-05-21 16:12:04', '2018-05-21 16:12:04');
INSERT INTO `web_app_versions` VALUES ('6', '6', '1.0.20', 'http://7xn0vy.dl1.z0.glb.clouddn.com/app-discovery-auth-test-logo.gif', '2dc64e519f4994269c76d5b1aa414f688674d4be8a90dd31fc7207a6f938ac22', '2018-05-21 16:12:51', '2018-05-21 16:12:51');
