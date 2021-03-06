/*
 Navicat Premium Data Transfer

 Source Server         : Localhost
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:9347
 Source Schema         : vaipixel

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 14/10/2019 15:21:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_category
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `category_name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_photo
-- ----------------------------
DROP TABLE IF EXISTS `t_photo`;
CREATE TABLE `t_photo` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `work_id` bigint(20) unsigned NOT NULL,
  `camera_make` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '相机厂商',
  `camera_model` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '相机型号',
  `lens` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '镜头',
  `focal_length` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '焦距',
  `aperture` varchar(32) DEFAULT NULL COMMENT '光圈',
  `iso` varchar(32) DEFAULT NULL COMMENT 'ISO',
  `shutter` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '快门时间',
  `color` varchar(32) DEFAULT NULL COMMENT '图片主色调',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `photo_work` (`work_id`),
  CONSTRAINT `photo_work` FOREIGN KEY (`work_id`) REFERENCES `t_work` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_relation_work_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_relation_work_tag`;
CREATE TABLE `t_relation_work_tag` (
  `tag_id` int(20) unsigned NOT NULL,
  `work_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`tag_id`,`work_id`) USING BTREE,
  KEY `relation_tag` (`tag_id`),
  KEY `relation_work` (`work_id`),
  CONSTRAINT `relation_tag` FOREIGN KEY (`tag_id`) REFERENCES `t_tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `relation_work` FOREIGN KEY (`work_id`) REFERENCES `t_work` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_tag`;
CREATE TABLE `t_tag` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `tag_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(20) unsigned NOT NULL COMMENT '主键 ',
  `user_name` varchar(32) NOT NULL COMMENT 'UserName',
  `nick_name` varchar(32) NOT NULL COMMENT '昵称',
  `email` varchar(32) DEFAULT NULL COMMENT 'email',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `avatar_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `join_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `last_seen_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_name` (`user_name`,`email`,`nick_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_video
-- ----------------------------
DROP TABLE IF EXISTS `t_video`;
CREATE TABLE `t_video` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `work_id` bigint(20) unsigned NOT NULL,
  `device_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '拍摄设备名称',
  `play_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `video_work` (`work_id`),
  CONSTRAINT `video_work` FOREIGN KEY (`work_id`) REFERENCES `t_work` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_work
-- ----------------------------
DROP TABLE IF EXISTS `t_work`;
CREATE TABLE `t_work` (
  `id` bigint(20) unsigned NOT NULL COMMENT 'workId and 主键',
  `title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '作品标题',
  `description` varchar(255) DEFAULT '' COMMENT '作品描述',
  `created_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `updated_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `width` int(11) DEFAULT '0' COMMENT '海报宽度',
  `height` int(11) DEFAULT NULL COMMENT '海报高度',
  `type` varchar(32) NOT NULL COMMENT '作品类型',
  `large_url` varchar(255) DEFAULT NULL,
  `medium_url` varchar(255) DEFAULT NULL,
  `small_url` varchar(255) DEFAULT NULL,
  `thumb_url` varchar(255) DEFAULT NULL,
  `category_id` int(20) unsigned DEFAULT NULL COMMENT '分类id',
  `author_id` int(20) unsigned NOT NULL COMMENT '作者id',
  `like_count` int(20) NOT NULL DEFAULT '0' COMMENT '点赞数量',
  `page_view` int(20) NOT NULL DEFAULT '0',
  `user_view` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `work_user` (`author_id`),
  KEY `work_category` (`category_id`),
  CONSTRAINT `work_category` FOREIGN KEY (`category_id`) REFERENCES `t_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `work_user` FOREIGN KEY (`author_id`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
