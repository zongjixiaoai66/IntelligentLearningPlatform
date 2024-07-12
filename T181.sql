/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb3 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE IF EXISTS `t181`;
CREATE DATABASE IF NOT EXISTS `t181` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `t181`;

DROP TABLE IF EXISTS `config`;
CREATE TABLE IF NOT EXISTS `config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='配置文件';

DELETE FROM `config`;
INSERT INTO `config` (`id`, `name`, `value`) VALUES
	(1, '轮播图1', 'http://localhost:8080/zhinengxuexipingtai/upload/config1.jpg'),
	(2, '轮播图2', 'http://localhost:8080/zhinengxuexipingtai/upload/config2.jpg'),
	(3, '轮播图3', 'http://localhost:8080/zhinengxuexipingtai/upload/config3.jpg');

DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE IF NOT EXISTS `dictionary` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` int DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字  Search111 ',
  `super_id` int DEFAULT NULL COMMENT '父字段id',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 COMMENT='字典表';

DELETE FROM `dictionary`;
INSERT INTO `dictionary` (`id`, `dic_code`, `dic_name`, `code_index`, `index_name`, `super_id`, `beizhu`, `create_time`) VALUES
	(1, 'kecheng_types', '课程类型', 1, '课程类型1', NULL, NULL, '2022-03-07 07:48:03'),
	(2, 'kecheng_types', '课程类型', 2, '课程类型2', NULL, NULL, '2022-03-07 07:48:03'),
	(3, 'kecheng_types', '课程类型', 3, '课程类型3', NULL, NULL, '2022-03-07 07:48:03'),
	(4, 'sex_types', '性别', 1, '男', NULL, NULL, '2022-03-07 07:48:03'),
	(5, 'sex_types', '性别', 2, '女', NULL, NULL, '2022-03-07 07:48:03'),
	(6, 'forum_state_types', '帖子状态', 1, '发帖', NULL, NULL, '2022-03-07 07:48:03'),
	(7, 'forum_state_types', '帖子状态', 2, '回帖', NULL, NULL, '2022-03-07 07:48:03'),
	(8, 'news_types', '公告类型', 1, '公告类型1', NULL, NULL, '2022-03-07 07:48:03'),
	(9, 'news_types', '公告类型', 2, '公告类型2', NULL, NULL, '2022-03-07 07:48:03'),
	(10, 'news_types', '公告类型', 3, '公告类型3', NULL, NULL, '2022-03-07 07:48:03'),
	(11, 'examquestion_types', '试题类型', 1, '单选题', NULL, NULL, '2022-03-07 07:48:04'),
	(12, 'examquestion_types', '试题类型', 2, '多选题', NULL, NULL, '2022-03-07 07:48:04'),
	(13, 'examquestion_types', '试题类型', 3, '判断题', NULL, NULL, '2022-03-07 07:48:04'),
	(14, 'examquestion_types', '试题类型', 4, '填空题', NULL, NULL, '2022-03-07 07:48:04'),
	(15, 'exampaper_types', '试卷状态', 1, '启用', NULL, NULL, '2022-03-07 07:48:04'),
	(16, 'exampaper_types', '试卷状态', 2, '禁用', NULL, NULL, '2022-03-07 07:48:04');

DROP TABLE IF EXISTS `exampaper`;
CREATE TABLE IF NOT EXISTS `exampaper` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `exampaper_name` varchar(200) NOT NULL COMMENT '试卷名称 Search111',
  `exampaper_date` int NOT NULL COMMENT '考试时长(分钟)',
  `exampaper_myscore` int NOT NULL DEFAULT '0' COMMENT '试卷总分数',
  `exampaper_types` int NOT NULL DEFAULT '0' COMMENT '试卷状态 Search111',
  `exampaper_delete` int DEFAULT '0' COMMENT '逻辑删除（0代表未删除 1代表已删除）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间 show2 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='试卷表';

DELETE FROM `exampaper`;
INSERT INTO `exampaper` (`id`, `exampaper_name`, `exampaper_date`, `exampaper_myscore`, `exampaper_types`, `exampaper_delete`, `create_time`) VALUES
	(1, '简单数学题', 60, 100, 1, 1, '2022-03-01 03:12:25');

DROP TABLE IF EXISTS `examquestion`;
CREATE TABLE IF NOT EXISTS `examquestion` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `exampaper_id` int NOT NULL COMMENT '所属试卷id（外键）',
  `examquestion_name` varchar(200) NOT NULL COMMENT '试题名称 Search111',
  `examquestion_options` longtext COMMENT '选项，json字符串',
  `examquestion_score` int DEFAULT '0' COMMENT '分值 Search111',
  `examquestion_answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `examquestion_analysis` longtext COMMENT '答案解析',
  `examquestion_types` int DEFAULT '0' COMMENT '试题类型',
  `examquestion_sequence` int DEFAULT '100' COMMENT '试题排序，值越大排越前面',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COMMENT='试题表';

DELETE FROM `examquestion`;
INSERT INTO `examquestion` (`id`, `exampaper_id`, `examquestion_name`, `examquestion_options`, `examquestion_score`, `examquestion_answer`, `examquestion_analysis`, `examquestion_types`, `examquestion_sequence`, `create_time`) VALUES
	(1, 1, '1+1', '[{"text":"1","code":"A"},{"text":"2","code":"B"},{"text":"3","code":"C"},{"text":"4","code":"D"}]', 30, 'B', '1+1=2', 1, 1, '2022-03-04 03:13:10'),
	(2, 1, '2+2', '[{"text":"2","code":"A"},{"text":"4","code":"B"},{"text":"6","code":"C"},{"text":"2+2-2+2","code":"D"}]', 30, 'B,D', '2+2=4', 2, 2, '2022-03-04 03:14:01'),
	(3, 1, '3+3=6', '[{"text":"A.对","code":"A"},{"text":"B.错","code":"B"}]', 30, 'A', '无解析', 3, 3, '2022-03-04 03:14:30'),
	(4, 1, '4+4', '[]', 10, '8', '4+4=8', 4, 4, '2022-03-04 03:15:00');

DROP TABLE IF EXISTS `examrecord`;
CREATE TABLE IF NOT EXISTS `examrecord` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `examrecord_uuid_number` varchar(200) DEFAULT NULL COMMENT '考试编号',
  `yonghu_id` int NOT NULL COMMENT '考试用户',
  `exampaper_id` int NOT NULL COMMENT '所属试卷id（外键）',
  `total_score` int DEFAULT NULL COMMENT '所得总分',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '考试时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='考试记录表';

DELETE FROM `examrecord`;
INSERT INTO `examrecord` (`id`, `examrecord_uuid_number`, `yonghu_id`, `exampaper_id`, `total_score`, `insert_time`, `create_time`) VALUES
	(1, '1646641780114', 1, 1, 90, '2022-03-07 08:29:40', '2022-03-07 08:29:40'),
	(2, '1646641858736', 1, 1, 0, '2022-03-07 08:30:59', '2022-03-07 08:30:59'),
	(3, '1715671845027', 1, 1, 70, '2024-05-14 07:30:45', '2024-05-14 07:30:45');

DROP TABLE IF EXISTS `examredetails`;
CREATE TABLE IF NOT EXISTS `examredetails` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `examredetails_uuid_number` varchar(200) DEFAULT NULL COMMENT '试卷编号',
  `yonghu_id` int NOT NULL COMMENT '用户id',
  `examquestion_id` int NOT NULL COMMENT '试题id（外键）',
  `examredetails_myanswer` varchar(200) DEFAULT NULL COMMENT '考生答案',
  `examredetails_myscore` int NOT NULL DEFAULT '0' COMMENT '试题得分',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COMMENT='答题详情表';

DELETE FROM `examredetails`;
INSERT INTO `examredetails` (`id`, `examredetails_uuid_number`, `yonghu_id`, `examquestion_id`, `examredetails_myanswer`, `examredetails_myscore`, `create_time`) VALUES
	(1, '1646641780114', 1, 4, '001', 0, '2022-03-07 08:29:45'),
	(2, '1646641780114', 1, 3, 'A', 30, '2022-03-07 08:29:48'),
	(3, '1646641780114', 1, 2, 'B,D', 30, '2022-03-07 08:29:52'),
	(4, '1646641780114', 1, 1, 'B', 30, '2022-03-07 08:29:55'),
	(5, '1646641858736', 1, 1, '未作答', 0, '2022-03-07 08:31:00'),
	(6, '1646641858736', 1, 2, '未作答', 0, '2022-03-07 08:31:00'),
	(7, '1646641858736', 1, 3, '未作答', 0, '2022-03-07 08:31:00'),
	(8, '1646641858736', 1, 4, '未作答', 0, '2022-03-07 08:31:00'),
	(9, '1715671845027', 1, 4, '8', 10, '2024-05-14 07:30:47'),
	(10, '1715671845027', 1, 3, 'A', 30, '2024-05-14 07:30:51'),
	(11, '1715671845027', 1, 2, 'B', 0, '2024-05-14 07:30:54'),
	(12, '1715671845027', 1, 1, 'B', 30, '2024-05-14 07:30:57');

DROP TABLE IF EXISTS `examrewrongquestion`;
CREATE TABLE IF NOT EXISTS `examrewrongquestion` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `yonghu_id` int NOT NULL COMMENT '用户id',
  `exampaper_id` int NOT NULL COMMENT '试卷（外键）',
  `examquestion_id` int NOT NULL COMMENT '试题id（外键）',
  `examredetails_myanswer` varchar(200) DEFAULT NULL COMMENT '考生作答',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间 show3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COMMENT='错题表';

DELETE FROM `examrewrongquestion`;
INSERT INTO `examrewrongquestion` (`id`, `yonghu_id`, `exampaper_id`, `examquestion_id`, `examredetails_myanswer`, `insert_time`, `create_time`) VALUES
	(1, 1, 1, 4, '001', '2022-03-07 08:29:45', '2022-03-07 08:29:45'),
	(2, 1, 1, 1, '未作答', '2022-03-07 08:31:00', '2022-03-07 08:31:00'),
	(3, 1, 1, 2, '未作答', '2022-03-07 08:31:00', '2022-03-07 08:31:00'),
	(4, 1, 1, 3, '未作答', '2022-03-07 08:31:00', '2022-03-07 08:31:00'),
	(5, 1, 1, 4, '未作答', '2022-03-07 08:31:00', '2022-03-07 08:31:00'),
	(6, 1, 1, 2, 'B', '2024-05-14 07:30:54', '2024-05-14 07:30:54');

DROP TABLE IF EXISTS `forum`;
CREATE TABLE IF NOT EXISTS `forum` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `forum_name` varchar(200) DEFAULT NULL COMMENT '帖子标题  Search111 ',
  `yonghu_id` int DEFAULT NULL COMMENT '学生',
  `jiaoshi_id` int DEFAULT NULL COMMENT '教师',
  `users_id` int DEFAULT NULL COMMENT '管理员',
  `forum_content` text COMMENT '发布内容',
  `super_ids` int DEFAULT NULL COMMENT '父id',
  `forum_state_types` int DEFAULT NULL COMMENT '帖子状态',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '发帖时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COMMENT='论坛';

DELETE FROM `forum`;
INSERT INTO `forum` (`id`, `forum_name`, `yonghu_id`, `jiaoshi_id`, `users_id`, `forum_content`, `super_ids`, `forum_state_types`, `insert_time`, `update_time`, `create_time`) VALUES
	(1, '帖子标题1', 3, NULL, NULL, '发布内容1', NULL, 1, '2022-03-07 07:48:13', '2022-03-07 07:48:13', '2022-03-07 07:48:13'),
	(2, '帖子标题2', 3, NULL, NULL, '发布内容2', NULL, 1, '2022-03-07 07:48:13', '2022-03-07 07:48:13', '2022-03-07 07:48:13'),
	(3, '帖子标题3', 2, NULL, NULL, '发布内容3', NULL, 1, '2022-03-07 07:48:13', '2022-03-07 07:48:13', '2022-03-07 07:48:13'),
	(4, '帖子标题4', 1, NULL, NULL, '发布内容4', NULL, 1, '2022-03-07 07:48:13', '2022-03-07 07:48:13', '2022-03-07 07:48:13'),
	(5, '帖子标题5', 3, NULL, NULL, '发布内容5', NULL, 1, '2022-03-07 07:48:13', '2022-03-07 07:48:13', '2022-03-07 07:48:13'),
	(6, '学生发布帖子', 1, NULL, NULL, '帖子内容111·1', NULL, 1, '2022-03-07 08:29:03', NULL, '2022-03-07 08:29:03'),
	(7, NULL, NULL, NULL, 1, '管理回复', 6, 2, '2022-03-07 08:34:30', NULL, '2022-03-07 08:34:30');

DROP TABLE IF EXISTS `jiaoshi`;
CREATE TABLE IF NOT EXISTS `jiaoshi` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `jiaoshi_name` varchar(200) DEFAULT NULL COMMENT '教师姓名 Search111 ',
  `jiaoshi_photo` varchar(255) DEFAULT NULL COMMENT '图片',
  `sex_types` int DEFAULT NULL COMMENT '性别 Search111 ',
  `jiaoshi_phone` varchar(200) DEFAULT NULL COMMENT '联系方式',
  `jiaoshi_email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `jiaoshi_delete` int DEFAULT '1' COMMENT '假删',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COMMENT='教师';

DELETE FROM `jiaoshi`;
INSERT INTO `jiaoshi` (`id`, `username`, `password`, `jiaoshi_name`, `jiaoshi_photo`, `sex_types`, `jiaoshi_phone`, `jiaoshi_email`, `jiaoshi_delete`, `create_time`) VALUES
	(1, '教师1', '123456', '教师姓名1', 'http://localhost:8080/zhinengxuexipingtai/upload/jiaoshi1.jpg', 1, '17703786901', '1@qq.com', 1, '2022-03-07 07:48:13'),
	(2, '教师2', '123456', '教师姓名2', 'http://localhost:8080/zhinengxuexipingtai/upload/jiaoshi2.jpg', 2, '17703786902', '2@qq.com', 1, '2022-03-07 07:48:13'),
	(3, '教师3', '123456', '教师姓名3', 'http://localhost:8080/zhinengxuexipingtai/upload/jiaoshi3.jpg', 2, '17703786903', '3@qq.com', 1, '2022-03-07 07:48:13'),
	(4, '教师4', '123456', '教师姓名4', 'http://localhost:8080/zhinengxuexipingtai/upload/jiaoshi4.jpg', 1, '17703786904', '4@qq.com', 1, '2022-03-07 07:48:13'),
	(5, '教师5', '123456', '教师姓名5', 'http://localhost:8080/zhinengxuexipingtai/upload/jiaoshi5.jpg', 2, '17703786905', '5@qq.com', 1, '2022-03-07 07:48:13');

DROP TABLE IF EXISTS `kecheng`;
CREATE TABLE IF NOT EXISTS `kecheng` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `kecheng_name` varchar(200) DEFAULT NULL COMMENT '课程标题 Search111 ',
  `kecheng_types` int DEFAULT NULL COMMENT '课程类型 Search111',
  `kecheng_photo` varchar(200) DEFAULT NULL COMMENT '课程图片 ',
  `kecheng_video` varchar(200) DEFAULT NULL COMMENT '课程视频 ',
  `kecheng_file` varchar(200) DEFAULT NULL COMMENT '文档下载',
  `jiaoshi_id` int DEFAULT NULL COMMENT '课程教师',
  `kecheng_content` text COMMENT '课程详情',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '发布时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show1 show2 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COMMENT='课程信息';

DELETE FROM `kecheng`;
INSERT INTO `kecheng` (`id`, `kecheng_name`, `kecheng_types`, `kecheng_photo`, `kecheng_video`, `kecheng_file`, `jiaoshi_id`, `kecheng_content`, `insert_time`, `create_time`) VALUES
	(1, '课程标题1', 1, 'http://localhost:8080/zhinengxuexipingtai/upload/kecheng1.jpg', 'http://localhost:8080/zhinengxuexipingtai/upload/video.mp4', 'http://localhost:8080/zhinengxuexipingtai/upload/file.rar', 1, '课程详情1', '2022-03-07 07:48:13', '2022-03-07 07:48:13'),
	(2, '课程标题2', 2, 'http://localhost:8080/zhinengxuexipingtai/upload/kecheng2.jpg', 'http://localhost:8080/zhinengxuexipingtai/upload/video.mp4', 'http://localhost:8080/zhinengxuexipingtai/upload/file.rar', 2, '课程详情2', '2022-03-07 07:48:13', '2022-03-07 07:48:13'),
	(3, '课程标题3', 2, 'http://localhost:8080/zhinengxuexipingtai/upload/kecheng3.jpg', 'http://localhost:8080/zhinengxuexipingtai/upload/video.mp4', 'http://localhost:8080/zhinengxuexipingtai/upload/file.rar', 3, '课程详情3', '2022-03-07 07:48:13', '2022-03-07 07:48:13'),
	(4, '课程标题4', 3, 'http://localhost:8080/zhinengxuexipingtai/upload/kecheng4.jpg', 'http://localhost:8080/zhinengxuexipingtai/upload/video.mp4', 'http://localhost:8080/zhinengxuexipingtai/upload/file.rar', 4, '课程详情4', '2022-03-07 07:48:13', '2022-03-07 07:48:13'),
	(5, '课程标题5', 1, 'http://localhost:8080/zhinengxuexipingtai/upload/kecheng5.jpg', 'http://localhost:8080/zhinengxuexipingtai/upload/video.mp4', 'http://localhost:8080/zhinengxuexipingtai/upload/file.rar', 5, '课程详情5', '2022-03-07 07:48:13', '2022-03-07 07:48:13');

DROP TABLE IF EXISTS `kecheng_liuyan`;
CREATE TABLE IF NOT EXISTS `kecheng_liuyan` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `kecheng_id` int DEFAULT NULL COMMENT '课程信息',
  `yonghu_id` int DEFAULT NULL COMMENT '用户',
  `kecheng_liuyan_text` text COMMENT '留言内容',
  `reply_text` text COMMENT '回复内容',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '留言时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '回复时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COMMENT='作业记录留言';

DELETE FROM `kecheng_liuyan`;
INSERT INTO `kecheng_liuyan` (`id`, `kecheng_id`, `yonghu_id`, `kecheng_liuyan_text`, `reply_text`, `insert_time`, `update_time`, `create_time`) VALUES
	(1, 1, 1, '留言内容1', '回复信息1', '2022-03-07 07:48:13', '2022-03-07 07:48:13', '2022-03-07 07:48:13'),
	(2, 2, 2, '留言内容2', '回复信息2', '2022-03-07 07:48:13', '2022-03-07 07:48:13', '2022-03-07 07:48:13'),
	(3, 3, 1, '留言内容3', '回复信息3', '2022-03-07 07:48:13', '2022-03-07 07:48:13', '2022-03-07 07:48:13'),
	(4, 4, 1, '留言内容4', '回复信息4', '2022-03-07 07:48:13', '2022-03-07 07:48:13', '2022-03-07 07:48:13'),
	(5, 5, 3, '留言内容5', '回复信息5', '2022-03-07 07:48:13', '2022-03-07 07:48:13', '2022-03-07 07:48:13'),
	(6, 4, 1, '学生留言', NULL, '2022-03-07 08:29:28', NULL, '2022-03-07 08:29:28');

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `news_name` varchar(200) DEFAULT NULL COMMENT '公告标题  Search111 ',
  `news_types` int DEFAULT NULL COMMENT '公告类型  Search111 ',
  `news_photo` varchar(200) DEFAULT NULL COMMENT '公告图片',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '公告时间',
  `news_content` text COMMENT '公告详情',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show1 show2 nameShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COMMENT='公告信息';

DELETE FROM `news`;
INSERT INTO `news` (`id`, `news_name`, `news_types`, `news_photo`, `insert_time`, `news_content`, `create_time`) VALUES
	(1, '公告标题1', 3, 'http://localhost:8080/zhinengxuexipingtai/upload/news1.jpg', '2022-03-07 07:48:13', '公告详情1', '2022-03-07 07:48:13'),
	(2, '公告标题2', 3, 'http://localhost:8080/zhinengxuexipingtai/upload/news2.jpg', '2022-03-07 07:48:13', '公告详情2', '2022-03-07 07:48:13'),
	(3, '公告标题3', 1, 'http://localhost:8080/zhinengxuexipingtai/upload/news3.jpg', '2022-03-07 07:48:13', '公告详情3', '2022-03-07 07:48:13'),
	(4, '公告标题4', 3, 'http://localhost:8080/zhinengxuexipingtai/upload/news4.jpg', '2022-03-07 07:48:13', '公告详情4', '2022-03-07 07:48:13'),
	(5, '公告标题5', 1, 'http://localhost:8080/zhinengxuexipingtai/upload/news5.jpg', '2022-03-07 07:48:13', '公告详情5', '2022-03-07 07:48:13');

DROP TABLE IF EXISTS `token`;
CREATE TABLE IF NOT EXISTS `token` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='token表';

DELETE FROM `token`;
INSERT INTO `token` (`id`, `userid`, `username`, `tablename`, `role`, `token`, `addtime`, `expiratedtime`) VALUES
	(1, 1, 'a1', 'yonghu', '学生', '6tlqspg2emo6btrnl7rylb7q01ggmjm9', '2022-03-07 08:02:12', '2024-05-14 08:30:37'),
	(2, 1, 'admin', 'users', '管理员', 'boxuopqeoxip815e6a83hgrbo32y2te0', '2022-03-07 08:04:22', '2024-05-14 08:28:56'),
	(3, 1, 'a1', 'jiaoshi', '教师', 'j2q1crfyiuxi25c79dnqlfuq24bqwmj8', '2022-03-07 08:32:26', '2022-03-07 09:32:27');

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='用户表';

DELETE FROM `users`;
INSERT INTO `users` (`id`, `username`, `password`, `role`, `addtime`) VALUES
	(1, 'admin', '123456', '管理员', '2022-04-30 16:00:00');

DROP TABLE IF EXISTS `yonghu`;
CREATE TABLE IF NOT EXISTS `yonghu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `yonghu_name` varchar(200) DEFAULT NULL COMMENT '学生姓名 Search111 ',
  `yonghu_photo` varchar(255) DEFAULT NULL COMMENT '头像',
  `sex_types` int DEFAULT NULL COMMENT '性别 Search111 ',
  `yonghu_phone` varchar(200) DEFAULT NULL COMMENT '联系方式',
  `yonghu_id_number` varchar(200) DEFAULT NULL COMMENT '学生身份证号 ',
  `yonghu_email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `yonghu_delete` int DEFAULT '1' COMMENT '假删',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='学生';

DELETE FROM `yonghu`;
INSERT INTO `yonghu` (`id`, `username`, `password`, `yonghu_name`, `yonghu_photo`, `sex_types`, `yonghu_phone`, `yonghu_id_number`, `yonghu_email`, `yonghu_delete`, `create_time`) VALUES
	(1, '学生1', '123456', '学生姓名1', 'http://localhost:8080/zhinengxuexipingtai/upload/yonghu1.jpg', 2, '17703786901', '410224199610232001', '1@qq.com', 1, '2022-03-07 07:48:13'),
	(2, '学生2', '123456', '学生姓名2', 'http://localhost:8080/zhinengxuexipingtai/upload/yonghu2.jpg', 1, '17703786902', '410224199610232002', '2@qq.com', 1, '2022-03-07 07:48:13'),
	(3, '学生3', '123456', '学生姓名3', 'http://localhost:8080/zhinengxuexipingtai/upload/yonghu3.jpg', 1, '17703786903', '410224199610232003', '3@qq.com', 1, '2022-03-07 07:48:13');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
