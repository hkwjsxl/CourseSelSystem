/*
 Navicat Premium Data Transfer

 Source Server         : MySQL5.+
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : course_select_system

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 20/12/2022 17:56:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 4, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 4, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can view content type', 4, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (17, 'Can add session', 5, 'add_session');
INSERT INTO `auth_permission` VALUES (18, 'Can change session', 5, 'change_session');
INSERT INTO `auth_permission` VALUES (19, 'Can delete session', 5, 'delete_session');
INSERT INTO `auth_permission` VALUES (20, 'Can view session', 5, 'view_session');
INSERT INTO `auth_permission` VALUES (21, 'Can add classes', 6, 'add_classes');
INSERT INTO `auth_permission` VALUES (22, 'Can change classes', 6, 'change_classes');
INSERT INTO `auth_permission` VALUES (23, 'Can delete classes', 6, 'delete_classes');
INSERT INTO `auth_permission` VALUES (24, 'Can view classes', 6, 'view_classes');
INSERT INTO `auth_permission` VALUES (25, 'Can add course', 7, 'add_course');
INSERT INTO `auth_permission` VALUES (26, 'Can change course', 7, 'change_course');
INSERT INTO `auth_permission` VALUES (27, 'Can delete course', 7, 'delete_course');
INSERT INTO `auth_permission` VALUES (28, 'Can view course', 7, 'view_course');
INSERT INTO `auth_permission` VALUES (29, 'Can add student', 8, 'add_student');
INSERT INTO `auth_permission` VALUES (30, 'Can change student', 8, 'change_student');
INSERT INTO `auth_permission` VALUES (31, 'Can delete student', 8, 'delete_student');
INSERT INTO `auth_permission` VALUES (32, 'Can view student', 8, 'view_student');
INSERT INTO `auth_permission` VALUES (33, 'Can add student detail', 9, 'add_studentdetail');
INSERT INTO `auth_permission` VALUES (34, 'Can change student detail', 9, 'change_studentdetail');
INSERT INTO `auth_permission` VALUES (35, 'Can delete student detail', 9, 'delete_studentdetail');
INSERT INTO `auth_permission` VALUES (36, 'Can view student detail', 9, 'view_studentdetail');
INSERT INTO `auth_permission` VALUES (37, 'Can add teacher', 10, 'add_teacher');
INSERT INTO `auth_permission` VALUES (38, 'Can change teacher', 10, 'change_teacher');
INSERT INTO `auth_permission` VALUES (39, 'Can delete teacher', 10, 'delete_teacher');
INSERT INTO `auth_permission` VALUES (40, 'Can view teacher', 10, 'view_teacher');
INSERT INTO `auth_permission` VALUES (41, 'Can add student2 course', 11, 'add_student2course');
INSERT INTO `auth_permission` VALUES (42, 'Can change student2 course', 11, 'change_student2course');
INSERT INTO `auth_permission` VALUES (43, 'Can delete student2 course', 11, 'delete_student2course');
INSERT INTO `auth_permission` VALUES (44, 'Can view student2 course', 11, 'view_student2course');
INSERT INTO `auth_permission` VALUES (45, 'Can add user info', 12, 'add_userinfo');
INSERT INTO `auth_permission` VALUES (46, 'Can change user info', 12, 'change_userinfo');
INSERT INTO `auth_permission` VALUES (47, 'Can delete user info', 12, 'delete_userinfo');
INSERT INTO `auth_permission` VALUES (48, 'Can view user info', 12, 'view_userinfo');

-- ----------------------------
-- Table structure for db_classes
-- ----------------------------
DROP TABLE IF EXISTS `db_classes`;
CREATE TABLE `db_classes`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of db_classes
-- ----------------------------
INSERT INTO `db_classes` VALUES (1, 'luffy1班');
INSERT INTO `db_classes` VALUES (2, 'luffy2班');

-- ----------------------------
-- Table structure for db_course
-- ----------------------------
DROP TABLE IF EXISTS `db_course`;
CREATE TABLE `db_course`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `credit` smallint(6) NOT NULL,
  `course_open_time` date NOT NULL,
  `teacher_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `db_course_teacher_id_5dadecdc_fk_db_teacher_id`(`teacher_id`) USING BTREE,
  CONSTRAINT `db_course_teacher_id_5dadecdc_fk_db_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `db_teacher` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of db_course
-- ----------------------------
INSERT INTO `db_course` VALUES (1, 'Python全栈', 3, '2022-12-19', 1);
INSERT INTO `db_course` VALUES (2, 'linux运维', 2, '2022-12-19', 2);
INSERT INTO `db_course` VALUES (3, '网络安全', 2, '2022-12-19', 3);
INSERT INTO `db_course` VALUES (4, 'Java', 3, '2022-12-19', 1);

-- ----------------------------
-- Table structure for db_student
-- ----------------------------
DROP TABLE IF EXISTS `db_student`;
CREATE TABLE `db_student`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `age` smallint(6) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `classes_id` bigint(20) NULL DEFAULT NULL,
  `student_detail_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `student_detail_id`(`student_detail_id`) USING BTREE,
  INDEX `db_student_classes_id_765880da_fk_db_classes_id`(`classes_id`) USING BTREE,
  CONSTRAINT `db_student_classes_id_765880da_fk_db_classes_id` FOREIGN KEY (`classes_id`) REFERENCES `db_classes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `db_student_student_detail_id_d3c3065c_fk_db_student_detail_id` FOREIGN KEY (`student_detail_id`) REFERENCES `db_student_detail` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of db_student
-- ----------------------------
INSERT INTO `db_student` VALUES (1, 'hkw', 18, '2022-12-18 18:15:34.209093', 1, 1);
INSERT INTO `db_student` VALUES (3, 'jon', 20, '2022-12-18 19:05:02.901906', 2, 2);
INSERT INTO `db_student` VALUES (13, 'alvin', 22, '2022-12-19 11:44:22.588077', 2, 3);
INSERT INTO `db_student` VALUES (14, 'json111', 20, '2022-12-19 17:53:55.323242', 1, NULL);
INSERT INTO `db_student` VALUES (31, 't1', 18, '2022-12-20 17:45:51.019163', 1, NULL);
INSERT INTO `db_student` VALUES (32, 't2', 18, '2022-12-20 17:50:25.635151', 2, NULL);
INSERT INTO `db_student` VALUES (33, 't3', 17, '2022-12-20 17:50:35.861249', 2, NULL);

-- ----------------------------
-- Table structure for db_student2course
-- ----------------------------
DROP TABLE IF EXISTS `db_student2course`;
CREATE TABLE `db_student2course`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `choice_course_time` datetime(6) NOT NULL,
  `course_id` bigint(20) NOT NULL,
  `student_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `db_student2course_course_id_87989972_fk_db_course_id`(`course_id`) USING BTREE,
  INDEX `db_student2course_student_id_851e1fb3_fk_db_student_id`(`student_id`) USING BTREE,
  CONSTRAINT `db_student2course_course_id_87989972_fk_db_course_id` FOREIGN KEY (`course_id`) REFERENCES `db_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `db_student2course_student_id_851e1fb3_fk_db_student_id` FOREIGN KEY (`student_id`) REFERENCES `db_student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of db_student2course
-- ----------------------------
INSERT INTO `db_student2course` VALUES (22, '2022-12-19 16:06:35.000000', 1, 1);
INSERT INTO `db_student2course` VALUES (23, '2022-12-19 16:07:06.000000', 2, 1);
INSERT INTO `db_student2course` VALUES (24, '2022-12-19 16:07:11.000000', 1, 13);
INSERT INTO `db_student2course` VALUES (25, '2022-12-19 16:07:12.000000', 1, 3);
INSERT INTO `db_student2course` VALUES (26, '2022-12-19 16:07:13.000000', 2, 3);
INSERT INTO `db_student2course` VALUES (27, '2022-12-19 16:36:53.000000', 3, 13);
INSERT INTO `db_student2course` VALUES (28, '2022-12-19 16:37:08.000000', 4, 1);
INSERT INTO `db_student2course` VALUES (41, '2022-12-19 19:58:57.297310', 1, 14);
INSERT INTO `db_student2course` VALUES (42, '2022-12-19 19:58:57.297310', 2, 14);
INSERT INTO `db_student2course` VALUES (43, '2022-12-19 19:58:57.297310', 3, 14);
INSERT INTO `db_student2course` VALUES (44, '2022-12-19 19:58:57.297310', 4, 14);
INSERT INTO `db_student2course` VALUES (58, '2022-12-20 17:45:51.019163', 1, 31);
INSERT INTO `db_student2course` VALUES (59, '2022-12-20 17:50:25.636147', 2, 32);
INSERT INTO `db_student2course` VALUES (60, '2022-12-20 17:50:25.636147', 3, 32);
INSERT INTO `db_student2course` VALUES (63, '2022-12-20 17:50:40.649033', 2, 33);
INSERT INTO `db_student2course` VALUES (64, '2022-12-20 17:50:40.649033', 3, 33);

-- ----------------------------
-- Table structure for db_student_detail
-- ----------------------------
DROP TABLE IF EXISTS `db_student_detail`;
CREATE TABLE `db_student_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gender` smallint(6) NOT NULL,
  `addr` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of db_student_detail
-- ----------------------------
INSERT INTO `db_student_detail` VALUES (1, 1, '河北', NULL);
INSERT INTO `db_student_detail` VALUES (2, 1, '北京', NULL);
INSERT INTO `db_student_detail` VALUES (3, 2, '上海', NULL);

-- ----------------------------
-- Table structure for db_teacher
-- ----------------------------
DROP TABLE IF EXISTS `db_teacher`;
CREATE TABLE `db_teacher`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of db_teacher
-- ----------------------------
INSERT INTO `db_teacher` VALUES (1, 'alex', '18533538888');
INSERT INTO `db_teacher` VALUES (2, 'egon', '18533537777');
INSERT INTO `db_teacher` VALUES (3, 'jason', '18533539999');

-- ----------------------------
-- Table structure for db_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `db_userinfo`;
CREATE TABLE `db_userinfo`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `student_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  UNIQUE INDEX `student_id`(`student_id`) USING BTREE,
  CONSTRAINT `db_userinfo_student_id_4d4993f0_fk_db_student_id` FOREIGN KEY (`student_id`) REFERENCES `db_student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of db_userinfo
-- ----------------------------
INSERT INTO `db_userinfo` VALUES (1, 'pbkdf2_sha256$260000$L4gqveXldaDSZCxJcGh9AI$OVjIzSR0CrcB1JVqwiJOettM9MbV/rNUKltBJes8XJ0=', '2022-12-20 17:36:23.257412', 0, 'hkw', '', '', 'hkwJsxl@gmail.com', 0, 1, '2022-12-18 18:15:34.210114', 'user_dir_path/hkw/avatars/乔治.jpg', 1);
INSERT INTO `db_userinfo` VALUES (3, 'pbkdf2_sha256$260000$zgBGqqcct0O6kTPGx0qPbv$OywtmbitGAEb6c2+L4YGTi7H3Q4s3+gZtboEDmdZrBg=', '2022-12-20 17:33:52.526896', 0, 'jon', '', '', 'jon@test.com', 0, 1, '2022-12-18 19:05:02.903901', 'user_dir_path/jon/avatars/索隆.jpg', 3);
INSERT INTO `db_userinfo` VALUES (5, 'pbkdf2_sha256$260000$tpROzuAHJ6iEd6PNPswQF1$cgprseIgqSYYTpO0AOt5UnwMCH6RuhO8ABhTO5thn+4=', '2022-12-19 16:50:16.013398', 0, 'alvin', '', '', 'alvin@test.com', 0, 1, '2022-12-19 11:44:22.589074', 'user_dir_path/alvin/avatars/路飞_YoKrSMi.jpg', 13);

-- ----------------------------
-- Table structure for db_userinfo_groups
-- ----------------------------
DROP TABLE IF EXISTS `db_userinfo_groups`;
CREATE TABLE `db_userinfo_groups`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userinfo_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `db_userinfo_groups_userinfo_id_group_id_6f0dec0b_uniq`(`userinfo_id`, `group_id`) USING BTREE,
  INDEX `db_userinfo_groups_group_id_8acfcf88_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `db_userinfo_groups_group_id_8acfcf88_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `db_userinfo_groups_userinfo_id_d8bd5cf1_fk_db_userinfo_id` FOREIGN KEY (`userinfo_id`) REFERENCES `db_userinfo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of db_userinfo_groups
-- ----------------------------

-- ----------------------------
-- Table structure for db_userinfo_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `db_userinfo_user_permissions`;
CREATE TABLE `db_userinfo_user_permissions`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userinfo_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `db_userinfo_user_permiss_userinfo_id_permission_i_3764f70e_uniq`(`userinfo_id`, `permission_id`) USING BTREE,
  INDEX `db_userinfo_user_per_permission_id_d9c62b5b_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `db_userinfo_user_per_permission_id_d9c62b5b_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `db_userinfo_user_per_userinfo_id_9da0cced_fk_db_userin` FOREIGN KEY (`userinfo_id`) REFERENCES `db_userinfo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of db_userinfo_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_db_userinfo_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_db_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `db_userinfo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (5, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (6, 'student', 'classes');
INSERT INTO `django_content_type` VALUES (7, 'student', 'course');
INSERT INTO `django_content_type` VALUES (8, 'student', 'student');
INSERT INTO `django_content_type` VALUES (11, 'student', 'student2course');
INSERT INTO `django_content_type` VALUES (9, 'student', 'studentdetail');
INSERT INTO `django_content_type` VALUES (10, 'student', 'teacher');
INSERT INTO `django_content_type` VALUES (12, 'student', 'userinfo');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2022-12-18 18:15:12.503010');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2022-12-18 18:15:12.539912');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2022-12-18 18:15:12.633660');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2022-12-18 18:15:12.651611');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0003_alter_user_email_max_length', '2022-12-18 18:15:12.656599');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0004_alter_user_username_opts', '2022-12-18 18:15:12.660588');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0005_alter_user_last_login_null', '2022-12-18 18:15:12.665574');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0006_require_contenttypes_0002', '2022-12-18 18:15:12.666572');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2022-12-18 18:15:12.670561');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0008_alter_user_username_max_length', '2022-12-18 18:15:12.674550');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2022-12-18 18:15:12.679540');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0010_alter_group_name_max_length', '2022-12-18 18:15:12.686518');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0011_update_proxy_permissions', '2022-12-18 18:15:12.691505');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0012_alter_user_first_name_max_length', '2022-12-18 18:15:12.695496');
INSERT INTO `django_migrations` VALUES (15, 'student', '0001_initial', '2022-12-18 18:15:12.985724');
INSERT INTO `django_migrations` VALUES (16, 'admin', '0001_initial', '2022-12-18 18:15:13.033738');
INSERT INTO `django_migrations` VALUES (17, 'admin', '0002_logentry_remove_auto_add', '2022-12-18 18:15:13.041581');
INSERT INTO `django_migrations` VALUES (18, 'admin', '0003_logentry_add_action_flag_choices', '2022-12-18 18:15:13.048563');
INSERT INTO `django_migrations` VALUES (19, 'sessions', '0001_initial', '2022-12-18 18:15:13.063523');
INSERT INTO `django_migrations` VALUES (20, 'student', '0002_alter_course_teacher', '2022-12-19 21:44:07.770980');
INSERT INTO `django_migrations` VALUES (21, 'student', '0003_alter_course_course_open_time', '2022-12-19 21:56:05.938132');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
