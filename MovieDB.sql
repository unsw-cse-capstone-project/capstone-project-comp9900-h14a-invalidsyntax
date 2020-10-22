/*
 Navicat Premium Data Transfer

 Source Server         : spring-boot-test
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : localhost:3306
 Source Schema         : login

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 22/10/2020 14:30:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for actor
-- ----------------------------
DROP TABLE IF EXISTS `actor`;
CREATE TABLE `actor` (
  `actor_id` int NOT NULL AUTO_INCREMENT,
  `name` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'N/A',
  `gender` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'N/A',
  `birthday` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'N/A',
  PRIMARY KEY (`actor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of actor
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for movie
-- ----------------------------
DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie` (
  `movie_id` int NOT NULL AUTO_INCREMENT COMMENT 'movie_id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'N/A' COMMENT 'movie_title',
  `release_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'N/A' COMMENT 'release_date',
  `poster` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'N/A' COMMENT 'movie_poster',
  `rate` float(2,1) NOT NULL DEFAULT '0.0' COMMENT 'movie_rating',
  `rate_number` int NOT NULL DEFAULT '0',
  `homepage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'N/A' COMMENT 'movie_homepage',
  `overview` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`movie_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of movie
-- ----------------------------
BEGIN;
INSERT INTO `movie` VALUES (1, 'Avatar', '2009/12/10', 'https://m.media-amazon.com/images/M/MV5BMTYwOTEwNjAzMl5BMl5BanBnXkFtZTcwODc5MTUwMw@@._V1_SX300.jpg', 7.2, 0, 'http://www.avatarmovie.com/', 'In the 22nd century, a paraplegic Marine is dispatched to the moon Pandora on a unique mission, but becomes torn between following orders and protecting an alien civilization.');
INSERT INTO `movie` VALUES (2, 'Pirates of the Caribbean: At World\'s End', '2007/5/19', 'https://m.media-amazon.com/images/M/MV5BMjIyNjkxNzEyMl5BMl5BanBnXkFtZTYwMjc3MDE3._V1_SX300.jpg', 6.9, 0, 'http://disney.go.com/disneypictures/pirates/', 'Captain Barbossa, long believed to be dead, has come back to life and is headed to the edge of the Earth with Will Turner and Elizabeth Swann. But nothing is quite as it seems.');
INSERT INTO `movie` VALUES (3, 'Spectre', '2015/10/26', 'https://m.media-amazon.com/images/M/MV5BOWQ1MDE1NzgtNTQ4OC00ZjliLTllZDAtN2IyOTVmMTc5YjUxXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg', 6.3, 0, 'http://www.sonypictures.com/movies/spectre/', 'A cryptic message from Bond past sends him on a trail to uncover a sinister organization. While M battles political forces to keep the secret service alive, Bond peels back the layers of deceit to reveal the terrible truth behind SPECTRE.');
INSERT INTO `movie` VALUES (4, 'The Dark Knight Rises', '2012/7/16', 'https://m.media-amazon.com/images/M/MV5BMTk4ODQzNDY3Ml5BMl5BanBnXkFtZTcwODA0NTM4Nw@@._V1_SX300.jpg', 7.6, 0, 'http://www.thedarkknightrises.com/', 'Following the death of District Attorney Harvey Dent, Batman assumes responsibility for Dent\'s crimes to protect the late attorney\'s reputation and is subsequently hunted by the Gotham City Police Department. Eight years later, Batman encounters the mysterious Selina Kyle and the villainous Bane, a new terrorist leader who overwhelms Gotham\'s finest. The Dark Knight resurfaces to protect a city that has branded him an enemy.');
INSERT INTO `movie` VALUES (5, 'Spider-Man 3', '2007/5/1', 'https://m.media-amazon.com/images/M/MV5BYTk3MDljOWQtNGI2My00OTEzLTlhYjQtOTQ4ODM2MzUwY2IwXkEyXkFqcGdeQXVyNTIzOTk5ODM@._V1_SX300.jpg', 5.9, 0, 'http://www.sonypictures.com/movies/spider-man3/', 'The seemingly invincible Spider-Man goes up against an all-new crop of villain 鈥 including the shape-shifting Sandman. While Spider-Man鈥檚 superpowers are altered by an alien organism, his alter ego, Peter Parker, deals with nemesis Eddie Brock and also gets caught up in a love triangle.');
COMMIT;

-- ----------------------------
-- Table structure for movie_actor
-- ----------------------------
DROP TABLE IF EXISTS `movie_actor`;
CREATE TABLE `movie_actor` (
  `movie_id` int NOT NULL,
  `actor_id` int NOT NULL,
  PRIMARY KEY (`movie_id`,`actor_id`),
  KEY `actor_id` (`actor_id`),
  CONSTRAINT `movie_actor_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`),
  CONSTRAINT `movie_actor_ibfk_2` FOREIGN KEY (`actor_id`) REFERENCES `actor` (`actor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of movie_actor
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for movie_director
-- ----------------------------
DROP TABLE IF EXISTS `movie_director`;
CREATE TABLE `movie_director` (
  `movie_id` int NOT NULL,
  `director_id` int NOT NULL,
  PRIMARY KEY (`movie_id`,`director_id`),
  KEY `director_id` (`director_id`),
  CONSTRAINT `movie_director_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`),
  CONSTRAINT `movie_director_ibfk_2` FOREIGN KEY (`director_id`) REFERENCES `actor` (`actor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of movie_director
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for movie_releaseTme
-- ----------------------------
DROP TABLE IF EXISTS `movie_releaseTme`;
CREATE TABLE `movie_releaseTme` (
  `releaseTime_id` int NOT NULL,
  `movie_id` int NOT NULL,
  PRIMARY KEY (`releaseTime_id`,`movie_id`),
  KEY `movie_id` (`movie_id`),
  CONSTRAINT `movie_releasetme_ibfk_1` FOREIGN KEY (`releaseTime_id`) REFERENCES `releaseTime` (`releaseTime_id`),
  CONSTRAINT `movie_releasetme_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of movie_releaseTme
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for movie_review
-- ----------------------------
DROP TABLE IF EXISTS `movie_review`;
CREATE TABLE `movie_review` (
  `movie_id` int NOT NULL,
  `review_id` int NOT NULL,
  PRIMARY KEY (`movie_id`,`review_id`),
  KEY `review_id` (`review_id`),
  CONSTRAINT `movie_review_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`),
  CONSTRAINT `movie_review_ibfk_2` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of movie_review
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for movie_type
-- ----------------------------
DROP TABLE IF EXISTS `movie_type`;
CREATE TABLE `movie_type` (
  `movie_id` int NOT NULL,
  `type_id` int NOT NULL,
  PRIMARY KEY (`movie_id`,`type_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `movie_type_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`),
  CONSTRAINT `movie_type_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `type` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of movie_type
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for releaseTime
-- ----------------------------
DROP TABLE IF EXISTS `releaseTime`;
CREATE TABLE `releaseTime` (
  `releaseTime_id` int NOT NULL AUTO_INCREMENT,
  `time_area` int NOT NULL DEFAULT '0',
  KEY `releaseTime_id` (`releaseTime_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of releaseTime
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for review
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `rate` float(2,1) NOT NULL DEFAULT '0.0',
  `review` text,
  PRIMARY KEY (`review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of review
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'N/A',
  PRIMARY KEY (`type_id`),
  KEY `type_id` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of type
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'N/A' COMMENT 'name',
  `gender` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'N/A',
  `age` int NOT NULL DEFAULT '0',
  `password` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'N/A' COMMENT 'password',
  `email` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'N/A' COMMENT 'email',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (1, 'admin', 'N/A', 0, 'admin', '');
INSERT INTO `user` VALUES (2, '123', 'M', 20, '123', '123@163.com');
INSERT INTO `user` VALUES (3, '1234', 'M', 18, '123', '123@123');
INSERT INTO `user` VALUES (4, 'asdf', 'M', 25, 'asdf', '359931108@qq.com');
COMMIT;

-- ----------------------------
-- Table structure for user_banlist
-- ----------------------------
DROP TABLE IF EXISTS `user_banlist`;
CREATE TABLE `user_banlist` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_baned_id` int DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  KEY `user_baned_id` (`user_baned_id`),
  CONSTRAINT `user_banlist_ibfk_1` FOREIGN KEY (`user_baned_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `user_banlist_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_banlist
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for user_review
-- ----------------------------
DROP TABLE IF EXISTS `user_review`;
CREATE TABLE `user_review` (
  `user_id` int NOT NULL,
  `review_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`review_id`),
  KEY `review_id` (`review_id`),
  CONSTRAINT `user_review_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `user_review_ibfk_2` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_review
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for user_wishlist
-- ----------------------------
DROP TABLE IF EXISTS `user_wishlist`;
CREATE TABLE `user_wishlist` (
  `user_id` int NOT NULL,
  `wishList` int DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_wishlist_ibfk_1` (`wishList`),
  CONSTRAINT `user_wishlist_ibfk_1` FOREIGN KEY (`wishList`) REFERENCES `movie` (`movie_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_wishlist_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_wishlist
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
