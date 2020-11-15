/*
 Navicat MySQL Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : localhost:3306
 Source Schema         : userInfo

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 13/11/2020 01:39:38
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
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of actor
-- ----------------------------
BEGIN;
INSERT INTO `actor` VALUES (1, 'Alex Gibney', 'M', '1990-01-01');
INSERT INTO `actor` VALUES (2, 'Amy Adams', 'M', '1990-01-02');
INSERT INTO `actor` VALUES (3, 'Andrew Garfield', 'M', '1990-01-03');
INSERT INTO `actor` VALUES (4, 'Andrew Stanton', 'M', '1990-01-04');
INSERT INTO `actor` VALUES (5, 'Armie Hammer', 'M', '1990-01-05');
INSERT INTO `actor` VALUES (6, 'Barry Sonnenfeld', 'M', '1990-01-06');
INSERT INTO `actor` VALUES (7, 'Ben Affleck', 'M', '1990-01-07');
INSERT INTO `actor` VALUES (8, 'Ben Barnes', 'M', '1990-01-08');
INSERT INTO `actor` VALUES (9, 'Brandon Routh', 'M', '1990-01-09');
INSERT INTO `actor` VALUES (10, 'Brenda Vaccaro', 'M', '1990-01-10');
INSERT INTO `actor` VALUES (11, 'Bryan Singer', 'M', '1990-01-11');
INSERT INTO `actor` VALUES (12, 'Byron Howard', 'M', '1990-01-12');
INSERT INTO `actor` VALUES (13, 'Cate Blanchett', 'M', '1990-01-13');
INSERT INTO `actor` VALUES (14, 'Chris Evans', 'M', '1990-01-14');
INSERT INTO `actor` VALUES (15, 'Chris Hemsworth', 'M', '1990-01-15');
INSERT INTO `actor` VALUES (16, 'Christian Bale', 'M', '1990-01-16');
INSERT INTO `actor` VALUES (17, 'Christoph Waltz', 'M', '1990-01-17');
INSERT INTO `actor` VALUES (18, 'Christopher Nolan', 'M', '1990-01-18');
INSERT INTO `actor` VALUES (19, 'Daniel Craig', 'M', '1990-01-19');
INSERT INTO `actor` VALUES (20, 'Daniel Radcliffe', 'M', '1990-01-20');
INSERT INTO `actor` VALUES (21, 'Dave Legeno', 'M', '1990-01-21');
INSERT INTO `actor` VALUES (22, 'David Yates', 'M', '1990-01-22');
INSERT INTO `actor` VALUES (23, 'Denis Leary', 'M', '1990-01-23');
INSERT INTO `actor` VALUES (24, 'Diane Lane', 'M', '1990-01-24');
INSERT INTO `actor` VALUES (25, 'Donna Murphy', 'M', '1990-01-25');
INSERT INTO `actor` VALUES (26, 'Dyan Cannon', 'M', '1990-01-26');
INSERT INTO `actor` VALUES (27, 'Elarica Johnson', 'M', '1990-01-27');
INSERT INTO `actor` VALUES (28, 'Emma Stone', 'M', '1990-01-28');
INSERT INTO `actor` VALUES (29, 'Eugene Jarecki', 'M', '1990-01-29');
INSERT INTO `actor` VALUES (30, 'Gary Oldman', 'M', '1990-01-30');
INSERT INTO `actor` VALUES (31, 'Geoffrey Rush', 'M', '1990-01-31');
INSERT INTO `actor` VALUES (32, 'Georgie Henley', 'M', '1990-02-01');
INSERT INTO `actor` VALUES (33, 'Gore Verbinski', 'M', '1990-02-02');
INSERT INTO `actor` VALUES (34, 'Heidi Ewing', 'M', '1990-02-03');
INSERT INTO `actor` VALUES (35, 'Henry Cavill', 'M', '1990-02-04');
INSERT INTO `actor` VALUES (36, 'Ian McKellen', 'M', '1990-02-05');
INSERT INTO `actor` VALUES (37, 'Ian McShane', 'M', '1990-02-06');
INSERT INTO `actor` VALUES (38, 'Jack Davenport', 'M', '1990-02-07');
INSERT INTO `actor` VALUES (39, 'Jacques Penot', 'M', '1990-02-08');
INSERT INTO `actor` VALUES (40, 'Jacques Perrin', 'M', '1990-02-09');
INSERT INTO `actor` VALUES (41, 'James Cameron', 'M', '1990-02-10');
INSERT INTO `actor` VALUES (42, 'James Franco', 'M', '1990-02-11');
INSERT INTO `actor` VALUES (43, 'James Marsden', 'M', '1990-02-12');
INSERT INTO `actor` VALUES (44, 'James Ransone', 'M', '1990-02-13');
INSERT INTO `actor` VALUES (45, 'Jean-Philippe Écoffey', 'M', '1990-02-14');
INSERT INTO `actor` VALUES (46, 'Jemaine Clement', 'M', '1990-02-15');
INSERT INTO `actor` VALUES (47, 'Jesse Eisenberg', 'M', '1990-02-16');
INSERT INTO `actor` VALUES (48, 'Johnny Depp', 'M', '1990-02-17');
INSERT INTO `actor` VALUES (49, 'Joseph Bologna', 'M', '1990-02-18');
INSERT INTO `actor` VALUES (50, 'Joseph Gordon-Levitt', 'M', '1990-02-19');
INSERT INTO `actor` VALUES (51, 'Josh Brolin', 'M', '1990-02-20');
INSERT INTO `actor` VALUES (52, 'Joss Whedon', 'M', '1990-02-21');
INSERT INTO `actor` VALUES (53, 'Judi Dench', 'M', '1990-02-22');
INSERT INTO `actor` VALUES (54, 'Kate Bosworth', 'M', '1990-02-23');
INSERT INTO `actor` VALUES (55, 'Keira Knightley', 'M', '1990-02-24');
INSERT INTO `actor` VALUES (56, 'Ken Stott', 'M', '1990-02-25');
INSERT INTO `actor` VALUES (57, 'Kevin Spacey', 'M', '1990-02-26');
INSERT INTO `actor` VALUES (58, 'Kirsten Dunst', 'M', '1990-02-27');
INSERT INTO `actor` VALUES (59, 'Léa Seydoux', 'M', '1990-02-28');
INSERT INTO `actor` VALUES (60, 'Len Cariou', 'M', '1990-03-01');
INSERT INTO `actor` VALUES (61, 'Leon Ford', 'M', '1990-03-02');
INSERT INTO `actor` VALUES (62, 'Lynn Collins', 'M', '1990-03-03');
INSERT INTO `actor` VALUES (63, 'Maeve Dermody', 'M', '1990-03-04');
INSERT INTO `actor` VALUES (64, 'Mandy Moore', 'M', '1990-03-05');
INSERT INTO `actor` VALUES (65, 'Marc de Jonge', 'M', '1990-03-06');
INSERT INTO `actor` VALUES (66, 'Marc Forster', 'M', '1990-03-07');
INSERT INTO `actor` VALUES (67, 'Marc Webb', 'M', '1990-03-08');
INSERT INTO `actor` VALUES (68, 'Mark Ruffalo', 'M', '1990-03-09');
INSERT INTO `actor` VALUES (69, 'Martin Freeman', 'M', '1990-03-10');
INSERT INTO `actor` VALUES (70, 'Mathieu Amalric', 'M', '1990-03-11');
INSERT INTO `actor` VALUES (71, 'Max von Sydow', 'M', '1990-03-12');
INSERT INTO `actor` VALUES (72, 'Melvin Van Peebles', 'M', '1990-03-13');
INSERT INTO `actor` VALUES (73, 'Michael Gambon', 'M', '1990-03-14');
INSERT INTO `actor` VALUES (74, 'Michael Polish', 'M', '1990-03-15');
INSERT INTO `actor` VALUES (75, 'Michael Shannon', 'M', '1990-03-16');
INSERT INTO `actor` VALUES (76, 'Morgan Spurlock', 'M', '1990-03-17');
INSERT INTO `actor` VALUES (77, 'N/A', 'M', '1990-03-18');
INSERT INTO `actor` VALUES (78, 'Nathan Greno', 'M', '1990-03-19');
INSERT INTO `actor` VALUES (79, 'Olga Kurylenko', 'M', '1990-03-20');
INSERT INTO `actor` VALUES (80, 'Olivia Rose Keegan', 'M', '1990-03-21');
INSERT INTO `actor` VALUES (81, 'Orlando Bloom', 'M', '1990-03-22');
INSERT INTO `actor` VALUES (82, 'Patrick Brammall', 'M', '1990-03-23');
INSERT INTO `actor` VALUES (83, 'Penélope Cruz', 'M', '1990-03-24');
INSERT INTO `actor` VALUES (84, 'Peter Jackson', 'M', '1990-03-25');
INSERT INTO `actor` VALUES (85, 'Rachel Grady', 'M', '1990-03-26');
INSERT INTO `actor` VALUES (86, 'Ralph Fiennes', 'M', '1990-03-27');
INSERT INTO `actor` VALUES (87, 'Rhys Ifans', 'M', '1990-03-28');
INSERT INTO `actor` VALUES (88, 'Richard Armitage', 'M', '1990-03-29');
INSERT INTO `actor` VALUES (89, 'Ridley Scott', 'M', '1990-03-30');
INSERT INTO `actor` VALUES (90, 'Rob Marshall', 'M', '1990-03-31');
INSERT INTO `actor` VALUES (91, 'Robert Downey Jr', 'M', '1990-04-01');
INSERT INTO `actor` VALUES (92, 'Ron Perlman', 'M', '1990-04-02');
INSERT INTO `actor` VALUES (93, 'Russell Crowe', 'M', '1990-04-03');
INSERT INTO `actor` VALUES (94, 'Ryan Kwanten', 'M', '1990-04-04');
INSERT INTO `actor` VALUES (95, 'Sam Mendes', 'M', '1990-04-05');
INSERT INTO `actor` VALUES (96, 'Sam Raimi', 'M', '1990-04-06');
INSERT INTO `actor` VALUES (97, 'Sam Worthington', 'M', '1990-04-07');
INSERT INTO `actor` VALUES (98, 'Samantha Morton', 'M', '1990-04-08');
INSERT INTO `actor` VALUES (99, 'Seth Gordon', 'M', '1990-04-09');
INSERT INTO `actor` VALUES (100, 'Shashawnee Hall', 'M', '1990-04-10');
INSERT INTO `actor` VALUES (101, 'Sigourney Weaver', 'M', '1990-04-11');
INSERT INTO `actor` VALUES (102, 'Skandar Keynes', 'M', '1990-04-12');
INSERT INTO `actor` VALUES (103, 'Stephen Lang', 'M', '1990-04-13');
INSERT INTO `actor` VALUES (104, 'Susan Seidelman', 'M', '1990-04-14');
INSERT INTO `actor` VALUES (105, 'Taylor Kitsch', 'M', '1990-04-15');
INSERT INTO `actor` VALUES (106, 'Tempestt Bledsoe', 'M', '1990-04-16');
INSERT INTO `actor` VALUES (107, 'Thomas Haden Church', 'M', '1990-04-17');
INSERT INTO `actor` VALUES (108, 'Tobey Maguire', 'M', '1990-04-18');
INSERT INTO `actor` VALUES (109, 'Toby Schmitz', 'M', '1990-04-19');
INSERT INTO `actor` VALUES (110, 'Tom Hardy', 'M', '1990-04-20');
INSERT INTO `actor` VALUES (111, 'Tom Wilkinson', 'M', '1990-04-21');
INSERT INTO `actor` VALUES (112, 'Tommy Lee Jones', 'M', '1990-04-22');
INSERT INTO `actor` VALUES (113, 'Wes Bentley', 'M', '1990-04-23');
INSERT INTO `actor` VALUES (114, 'Will Smith', 'M', '1990-04-24');
INSERT INTO `actor` VALUES (115, 'Willem Dafoe', 'M', '1990-04-25');
INSERT INTO `actor` VALUES (116, 'William Fichtner', 'M', '1990-04-26');
INSERT INTO `actor` VALUES (117, 'William Hurt', 'M', '1990-04-27');
INSERT INTO `actor` VALUES (118, 'William Moseley', 'M', '1990-04-28');
INSERT INTO `actor` VALUES (119, 'Zachary Levi', 'M', '1990-04-29');
INSERT INTO `actor` VALUES (120, 'Zack Snyder', 'M', '1990-04-30');
INSERT INTO `actor` VALUES (121, 'Zoe Saldana', 'M', '1990-05-01');
COMMIT;

-- ----------------------------
-- Table structure for messageboard
-- ----------------------------
DROP TABLE IF EXISTS `messageboard`;
CREATE TABLE `messageboard` (
  `messageboard_id` int NOT NULL AUTO_INCREMENT,
  `message` text,
  `user_give_id` int DEFAULT NULL,
  `user_get_id` int DEFAULT NULL,
  PRIMARY KEY (`messageboard_id`),
  KEY `user_give_id` (`user_give_id`),
  KEY `user_get_id` (`user_get_id`),
  CONSTRAINT `messageboard_ibfk_1` FOREIGN KEY (`user_give_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `messageboard_ibfk_2` FOREIGN KEY (`user_get_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of messageboard
-- ----------------------------
BEGIN;
INSERT INTO `messageboard` VALUES (2, 'love', 2, 1);
INSERT INTO `messageboard` VALUES (3, 'love you', 3, 1);
INSERT INTO `messageboard` VALUES (4, 'love you too', 4, 1);
INSERT INTO `messageboard` VALUES (5, 'lwho are you', 2, 3);
INSERT INTO `messageboard` VALUES (6, 'what\'s your real name', 2, 4);
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
  `rate_number` int NOT NULL DEFAULT '1',
  `homepage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'N/A' COMMENT 'movie_homepage',
  `overview` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`movie_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of movie
-- ----------------------------
BEGIN;
INSERT INTO `movie` VALUES (1, 'Avatar', '2009/12/10', 'https://m.media-amazon.com/images/M/MV5BMTYwOTEwNjAzMl5BMl5BanBnXkFtZTcwODc5MTUwMw@@._V1_SX300.jpg', 3.4, 18, 'http://www.avatarmovie.com/', 'In the 22nd century, a paraplegic Marine is dispatched to the moon Pandora on a unique mission, but becomes torn between following orders and protecting an alien civilization.');
INSERT INTO `movie` VALUES (2, 'Pirates of the Caribbean: At World\'s End', '2007/5/19', 'https://m.media-amazon.com/images/M/MV5BMjIyNjkxNzEyMl5BMl5BanBnXkFtZTYwMjc3MDE3._V1_SX300.jpg', 3.5, 11, 'http://disney.go.com/disneypictures/pirates/', 'Captain Barbossa, long believed to be dead, has come back to life and is headed to the edge of the Earth with Will Turner and Elizabeth Swann. But nothing is quite as it seems.');
INSERT INTO `movie` VALUES (3, 'Spectre', '2015/10/26', 'https://m.media-amazon.com/images/M/MV5BOWQ1MDE1NzgtNTQ4OC00ZjliLTllZDAtN2IyOTVmMTc5YjUxXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg', 3.1, 11, 'http://www.sonypictures.com/movies/spectre/', 'A cryptic message from Bond past sends him on a trail to uncover a sinister organization. While M battles political forces to keep the secret service alive, Bond peels back the layers of deceit to reveal the terrible truth behind SPECTRE.');
INSERT INTO `movie` VALUES (4, 'The Dark Knight Rises', '2012/7/16', 'https://m.media-amazon.com/images/M/MV5BMTk4ODQzNDY3Ml5BMl5BanBnXkFtZTcwODA0NTM4Nw@@._V1_SX300.jpg', 3.8, 10, 'http://www.thedarkknightrises.com/', 'Following the death of District Attorney Harvey Dent, Batman assumes responsibility for Dent\'s crimes to protect the late attorney\'s reputation and is subsequently hunted by the Gotham City Police Department. Eight years later, Batman encounters the mysterious Selina Kyle and the villainous Bane, a new terrorist leader who overwhelms Gotham\'s finest. The Dark Knight resurfaces to protect a city that has branded him an enemy.');
INSERT INTO `movie` VALUES (5, 'Spider-Man 3', '2007/5/1', 'https://m.media-amazon.com/images/M/MV5BYTk3MDljOWQtNGI2My00OTEzLTlhYjQtOTQ4ODM2MzUwY2IwXkEyXkFqcGdeQXVyNTIzOTk5ODM@._V1_SX300.jpg', 3.0, 10, 'http://www.sonypictures.com/movies/spider-man3/', 'The seemingly invincible Spider-Man goes up against an all-new crop of villain 鈥 including the shape-shifting Sandman. While Spider-Man鈥檚 superpowers are altered by an alien organism, his alter ego, Peter Parker, deals with nemesis Eddie Brock and also gets caught up in a love triangle.');
INSERT INTO `movie` VALUES (6, 'Close Range', '2015/12/11', 'https://m.media-amazon.com/images/M/MV5BMjA5MzYzODk2Nl5BMl5BanBnXkFtZTgwNDM4MTY3NjE@._V1_SX300.jpg', 2.5, 10, 'https://www.facebook.com/closerangemovie/', 'A rogue soldier turned outlaw is thrust into a relentless fight with a corrupt sheriff, his obedient deputies, and a dangerous drug cartel in order to protect his sister and her young daughter.');
INSERT INTO `movie` VALUES (7, 'Boynton Beach Club', '2005/8/5', 'https://m.media-amazon.com/images/M/MV5BMTkwMDY5MTE5NF5BMl5BanBnXkFtZTcwOTc5NTUzMQ@@._V1_SX300.jpg', 3.4, 10, '', 'A handful of men and women of a certain age pick up the pieces of their lives and look for new love after the loss of their mates in this comedy drama from writer-director Susan Seidelman.');
INSERT INTO `movie` VALUES (8, 'Amnesiac', '2015/8/14', 'https://m.media-amazon.com/images/M/MV5BODU3YjM3ZjgtZTJjZC00NDUyLTljZjctZDQ4NjkxOGJiMTE5XkEyXkFqcGdeQXVyMTIxMzA5MDI@._V1_SX300.jpg', 2.0, 10, '', 'The story of a man who wakes up in bed suffering from memory loss after being in an accident, only to begin to suspect that his wife may not be his real wife and that a web of lies and deceit deepen inside the house where he soon finds himself a prisoner.');
INSERT INTO `movie` VALUES (9, 'Freakonomics', '2010/10/1', 'https://m.media-amazon.com/images/M/MV5BMTEwNjExNDc5MDReQTJeQWpwZ15BbWU3MDU5MTU3NzM@._V1_SX300.jpg', 3.3, 10, 'http://www.magpictures.com/freakonomics/', 'Some of the world\'s most innovative documentary filmmakers will explore the hidden side of everything.');
INSERT INTO `movie` VALUES (10, 'High Tension', '2003/6/18', 'https://m.media-amazon.com/images/M/MV5BYWVkYTU0ZDItODZmMC00NzY5LTkxZTctNmJiYmJlZmFiODU3XkEyXkFqcGdeQXVyNzkzOTg4MDM@._V1_SX300.jpg', 3.3, 10, '', 'Alexia travels with her friend Marie to spend a couple of days with her family in their farm in the country. They arrive late and they are welcomed by Alexia\'s father. Late in the night, a sadistic and sick killer breaks into the farmhouse, slaughters Alexia\'s family--including their dog--and kidnaps Alexia. Marie hides from the criminal and tries to help the hysterical and frightened Alexia, chase the maniac, and disclose his identity in the end.');
INSERT INTO `movie` VALUES (11, 'Griff the Invisible', '2011/8/19', 'https://m.media-amazon.com/images/M/MV5BMjA2OTA2MDA3OV5BMl5BanBnXkFtZTcwODQ2NTQxNw@@._V1_SX300.jpg', 3.0, 10, '', 'Griff, office worker by day, superhero by night, has his world turned upside down when he meets Melody, a beautiful young scientist who shares his passion for the impossible.');
INSERT INTO `movie` VALUES (12, 'John Carter', '2012/3/7', 'https://m.media-amazon.com/images/M/MV5BMDEwZmIzNjYtNjUwNS00MzgzLWJiOGYtZWMxZGQ5NDcxZjUwXkEyXkFqcGdeQXVyNTIzOTk5ODM@._V1_SX300.jpg', 3.0, 10, 'http://movies.disney.com/john-carter', 'John Carter is a war-weary, former military captain who\'s inexplicably transported to the mysterious and exotic planet of Barsoom (Mars) and reluctantly becomes embroiled in an epic conflict. It\'s a world on the brink of collapse, and Carter rediscovers his humanity when he realizes the survival of Barsoom and its people rests in his hands.');
INSERT INTO `movie` VALUES (14, 'Tangled', '2010/11/24', 'https://m.media-amazon.com/images/M/MV5BMTAxNDYxMjg0MjNeQTJeQWpwZ15BbWU3MDcyNTk2OTM@._V1_SX300.jpg', 3.7, 10, 'http://disney.go.com/disneypictures/tangled/', 'When the kingdom\'s most wanted-and most charming-bandit Flynn Rider hides out in a mysterious tower, he\'s taken hostage by Rapunzel, a beautiful and feisty tower-bound teen with 70 feet of magical, golden hair. Flynn\'s curious captor, who\'s looking for her ticket out of the tower where she\'s been locked away for years, strikes a deal with the handsome thief and the unlikely duo sets off on an action-packed escapade, complete with a super-cop horse, an over-protective chameleon and a gruff gang of pub thugs.');
INSERT INTO `movie` VALUES (15, 'Avengers: Age of Ultron', '2015/4/22', 'https://m.media-amazon.com/images/M/MV5BMTM4OGJmNWMtOTM4Ni00NTE3LTg3MDItZmQxYjc4N2JhNmUxXkEyXkFqcGdeQXVyNTgzMDMzMTg@._V1_SX300.jpg', 3.6, 10, 'http://marvel.com/movies/movie/193/avengers_age_of_ultron', 'When Tony Stark tries to jumpstart a dormant peacekeeping program, things go awry and Earth__ Mightiest Heroes are put to the ultimate test as the fate of the planet hangs in the balance. As the villainous Ultron emerges, it is up to The Avengers to stop him from enacting his terrible plans, and soon uneasy alliances and unexpected action pave the way for an epic and unique global adventure.');
INSERT INTO `movie` VALUES (16, 'Harry Potter and the Half-Blood Prince', '2009/7/7', 'https://m.media-amazon.com/images/M/MV5BNzU3NDg4NTAyNV5BMl5BanBnXkFtZTcwOTg2ODg1Mg@@._V1_SX300.jpg', 3.7, 10, 'http://harrypotter.warnerbros.com/harrypotterandthehalf-bloodprince/dvd/index.html', 'As Harry begins his sixth year at Hogwarts, he discovers an old book marked as \'Property of the Half-Blood Prince\', and begins to learn more about Lord Voldemort\'s dark past.');
INSERT INTO `movie` VALUES (17, 'Batman v Superman: Dawn of Justice', '2016/3/23', 'https://m.media-amazon.com/images/M/MV5BYThjYzcyYzItNTVjNy00NDk0LTgwMWQtYjMwNmNlNWJhMzMyXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg', 2.8, 10, 'http://www.batmanvsupermandawnofjustice.com/', 'Fearing the actions of a god-like Super Hero left unchecked, Gotham City__ own formidable, forceful vigilante takes on Metropolis__ most revered, modern-day savior, while the world wrestles with what sort of hero it really needs. And with Batman and Superman at war with one another, a new threat quickly arises, putting mankind in greater danger than it__ ever known before.');
INSERT INTO `movie` VALUES (18, 'Superman Returns', '2006/6/28', 'https://m.media-amazon.com/images/M/MV5BNzY2ZDQ2MTctYzlhOC00MWJhLTgxMmItMDgzNDQwMDdhOWI2XkEyXkFqcGdeQXVyNjc1NTYyMjg@._V1_SX300.jpg', 2.7, 10, 'http://www.superman.com', 'Superman returns to discover his 5-year absence has allowed Lex Luthor to walk free, and that those he was closest too felt abandoned and have moved on. Luthor plots his ultimate revenge that could see millions killed and change the face of the planet forever, as well as ridding himself of the Man of Steel.');
INSERT INTO `movie` VALUES (19, 'Quantum of Solace', '2008/10/30', 'https://m.media-amazon.com/images/M/MV5BMjZiYTUzMzktZWI5Yy00Mzk4LWFlMDgtYjRmNWU0Mzc0MzNiXkEyXkFqcGdeQXVyMjUzOTY1NTc@._V1_SX300.jpg', 3.0, 10, 'http://www.mgm.com/view/movie/234/Quantum-of-Solace/', 'Quantum of Solace continues the adventures of James Bond after Casino Royale. Betrayed by Vesper, the woman he loved, 007 fights the urge to make his latest mission personal. Pursuing his determination to uncover the truth, Bond and M interrogate Mr. White, who reveals that the organization that blackmailed Vesper is far more complex and dangerous than anyone had imagined.');
INSERT INTO `movie` VALUES (20, 'Pirates of the Caribbean: Dead Man\'s Chest', '2006/6/20', 'https://m.media-amazon.com/images/M/MV5BMTcwODc1MTMxM15BMl5BanBnXkFtZTYwMDg1NzY3._V1_SX300.jpg', 3.5, 10, 'http://disney.go.com/disneypictures/pirates/', 'Captain Jack Sparrow works his way out of a blood debt with the ghostly Davey Jones, he also attempts to avoid eternal damnation.');
INSERT INTO `movie` VALUES (21, 'The Lone Ranger', '2013/7/3', 'https://m.media-amazon.com/images/M/MV5BZjFiMTc2MTAtZDA0My00OGRmLTk5M2ItNTlmYTUwZmU2YmRiXkEyXkFqcGdeQXVyNTIzOTk5ODM@._V1_SX300.jpg', 3.0, 10, 'http://disney.go.com/the-lone-ranger/', 'The Texas Rangers chase down a gang of outlaws led by Butch Cavendish, but the gang ambushes the Rangers, seemingly killing them all. One survivor is found, however, by an American Indian named Tonto, who nurses him back to health. The Ranger, donning a mask and riding a white stallion named Silver, teams up with Tonto to bring the unscrupulous gang and others of that ilk to justice.');
INSERT INTO `movie` VALUES (22, 'Man of Steel', '2013/6/12', 'https://m.media-amazon.com/images/M/MV5BMTk5ODk1NDkxMF5BMl5BanBnXkFtZTcwNTA5OTY0OQ@@._V1_SX300.jpg', 3.2, 10, 'http://www.manofsteel.com/', 'A young boy learns that he has extraordinary powers and is not of this earth. As a young man, he journeys to discover where he came from and what he was sent here to do. But the hero in him must emerge if he is to save the world from annihilation and become the symbol of hope for all mankind.');
INSERT INTO `movie` VALUES (23, 'The Chronicles of Narnia: Prince Caspian', '2008/5/15', 'https://m.media-amazon.com/images/M/MV5BMTIwOTA4NTE4Ml5BMl5BanBnXkFtZTcwOTI2NTg1MQ@@._V1_SX300.jpg', 3.1, 10, '', 'One year after their incredible adventures in the Lion, the Witch and the Wardrobe, Peter, Edmund, Lucy and Susan Pevensie return to Narnia to aid a young prince whose life has been threatened by the evil King Miraz. Now, with the help of a colorful cast of new characters, including Trufflehunter the badger and Nikabrik the dwarf, the Pevensie clan embarks on an incredible quest to ensure that Narnia is returned to its rightful heir.');
INSERT INTO `movie` VALUES (24, 'The Avengers', '2012/4/25', 'https://m.media-amazon.com/images/M/MV5BNDYxNjQyMjAtNTdiOS00NGYwLWFmNTAtNThmYjU5ZGI2YTI1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg', 3.7, 10, 'http://marvel.com/avengers_movie/', 'When an unexpected enemy emerges and threatens global safety and security, Nick Fury, director of the international peacekeeping agency known as S.H.I.E.L.D., finds himself in need of a team to pull the world back from the brink of disaster. Spanning the globe, a daring recruitment effort begins!');
INSERT INTO `movie` VALUES (25, 'Pirates of the Caribbean: On Stranger Tides', '2011/5/14', 'https://m.media-amazon.com/images/M/MV5BMjE5MjkwODI3Nl5BMl5BanBnXkFtZTcwNjcwMDk4NA@@._V1_SX300.jpg', 3.2, 10, 'http://disney.go.com/pirates/index-on-stranger-tides.html#/video/', 'Captain Jack Sparrow crosses paths with a woman from his past, and he\'s not sure if it\'s love -- or if she\'s a ruthless con artist who\'s using him to find the fabled Fountain of Youth. When she forces him aboard the Queen Anne\'s Revenge, the ship of the formidable pirate Blackbeard, Jack finds himself on an unexpected adventure in which he doesn\'t know who to fear more: Blackbeard or the woman from his past.');
INSERT INTO `movie` VALUES (26, 'Men in Black 3', '2012/5/23', 'https://m.media-amazon.com/images/M/MV5BMTU2NTYxODcwMF5BMl5BanBnXkFtZTcwNDk1NDY0Nw@@._V1_SX300.jpg', 3.1, 10, 'http://www.sonypictures.com/movies/meninblack3/', 'Agents J (Will Smith) and K (Tommy Lee Jones) are back...in time. J has seen some inexplicable things in his 15 years with the Men in Black, but nothing, not even aliens, perplexes him as much as his wry, reticent partner. But when K\'s life and the fate of the planet are put at stake, Agent J will have to travel back in time to put things right. J discovers that there are secrets to the universe that K never told him - secrets that will reveal themselves as he teams up with the young Agent K (Josh Brolin) to save his partner, the agency, and the future of humankind.');
INSERT INTO `movie` VALUES (27, 'The Hobbit: The Battle of the Five Armies', '2014/12/10', 'https://m.media-amazon.com/images/M/MV5BMTYzNDE3OTQ3MF5BMl5BanBnXkFtZTgwODczMTg4MjE@._V1_SX300.jpg', 3.5, 10, 'http://www.thehobbit.com/', 'Immediately after the events of The Desolation of Smaug, Bilbo and the dwarves try to defend Erebor\'s mountain of treasure from others who claim it: the men of the ruined Laketown and the elves of Mirkwood. Meanwhile an army of Orcs led by Azog the Defiler is marching on Erebor, fueled by the rise of the dark lord Sauron. Dwarves, elves and men must unite, and the hope for Middle-Earth falls into Bilbo\'s hands.');
INSERT INTO `movie` VALUES (28, 'The Amazing Spider-Man', '2012/6/27', 'https://m.media-amazon.com/images/M/MV5BMjMyOTM4MDMxNV5BMl5BanBnXkFtZTcwNjIyNzExOA@@._V1_SX300.jpg', 3.2, 10, 'http://www.theamazingspiderman.com', 'Peter Parker is an outcast high schooler abandoned by his parents as a boy, leaving him to be raised by his Uncle Ben and Aunt May. Like most teenagers, Peter is trying to figure out who he is and how he got to be the person he is today. As Peter discovers a mysterious briefcase that belonged to his father, he begins a quest to understand his parents\' disappearance _ leading him directly to Oscorp and the lab of Dr. Curt Connors, his father\'s former partner. As Spider-Man is set on a collision course with Connors\' alter ego, The Lizard, Peter will make life-altering choices to use his powers and shape his destiny to become a hero.');
INSERT INTO `movie` VALUES (29, 'Robin Hood', '2010/5/12', 'https://m.media-amazon.com/images/M/MV5BMTM5NzcwMzEwOF5BMl5BanBnXkFtZTcwNjg5MTgwMw@@._V1_SX300.jpg', 3.1, 10, 'http://www.robinhoodthemovie.com/', 'When soldier Robin happens upon the dying Robert of Loxley, he promises to return the man\'s sword to his family in Nottingham. There, he assumes Robert\'s identity; romances his widow, Marion; and draws the ire of the town\'s sheriff and King John\'s henchman, Godfrey.');
INSERT INTO `movie` VALUES (30, 'The Hobbit: The Desolation of Smaug', '2013/12/11', 'https://m.media-amazon.com/images/M/MV5BMzU0NDY0NDEzNV5BMl5BanBnXkFtZTgwOTIxNDU1MDE@._V1_SX300.jpg', 3.8, 10, 'http://www.thehobbit.com/', 'The Dwarves, Bilbo and Gandalf have successfully escaped the Misty Mountains, and Bilbo has gained the One Ring. They all continue their journey to get their gold back from the Dragon, Smaug.');
COMMIT;

-- ----------------------------
-- Table structure for movie_actor
-- ----------------------------
DROP TABLE IF EXISTS `movie_actor`;
CREATE TABLE `movie_actor` (
  `movie_id` int NOT NULL,
  `actor_id` int NOT NULL,
  `table_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`table_id`) USING BTREE,
  KEY `actor_id` (`actor_id`),
  KEY `movie_actor_ibfk_1` (`movie_id`),
  CONSTRAINT `movie_actor_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `movie_actor_ibfk_2` FOREIGN KEY (`actor_id`) REFERENCES `actor` (`actor_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of movie_actor
-- ----------------------------
BEGIN;
INSERT INTO `movie_actor` VALUES (1, 36, 1);
INSERT INTO `movie_actor` VALUES (1, 69, 2);
INSERT INTO `movie_actor` VALUES (1, 88, 3);
INSERT INTO `movie_actor` VALUES (1, 56, 4);
INSERT INTO `movie_actor` VALUES (2, 97, 5);
INSERT INTO `movie_actor` VALUES (2, 121, 6);
INSERT INTO `movie_actor` VALUES (2, 101, 7);
INSERT INTO `movie_actor` VALUES (2, 103, 8);
INSERT INTO `movie_actor` VALUES (3, 19, 9);
INSERT INTO `movie_actor` VALUES (3, 17, 10);
INSERT INTO `movie_actor` VALUES (3, 59, 11);
INSERT INTO `movie_actor` VALUES (3, 86, 12);
INSERT INTO `movie_actor` VALUES (4, 13, 13);
INSERT INTO `movie_actor` VALUES (4, 30, 14);
INSERT INTO `movie_actor` VALUES (4, 110, 15);
INSERT INTO `movie_actor` VALUES (4, 50, 16);
INSERT INTO `movie_actor` VALUES (5, 108, 17);
INSERT INTO `movie_actor` VALUES (5, 58, 18);
INSERT INTO `movie_actor` VALUES (5, 42, 19);
INSERT INTO `movie_actor` VALUES (5, 107, 20);
INSERT INTO `movie_actor` VALUES (6, 108, 21);
INSERT INTO `movie_actor` VALUES (6, 58, 22);
INSERT INTO `movie_actor` VALUES (6, 42, 23);
INSERT INTO `movie_actor` VALUES (6, 107, 24);
INSERT INTO `movie_actor` VALUES (7, 10, 25);
INSERT INTO `movie_actor` VALUES (7, 26, 26);
INSERT INTO `movie_actor` VALUES (7, 60, 27);
INSERT INTO `movie_actor` VALUES (7, 49, 28);
INSERT INTO `movie_actor` VALUES (8, 54, 29);
INSERT INTO `movie_actor` VALUES (8, 113, 30);
INSERT INTO `movie_actor` VALUES (8, 80, 31);
INSERT INTO `movie_actor` VALUES (8, 100, 32);
INSERT INTO `movie_actor` VALUES (9, 44, 33);
INSERT INTO `movie_actor` VALUES (9, 106, 34);
INSERT INTO `movie_actor` VALUES (9, 76, 35);
INSERT INTO `movie_actor` VALUES (9, 72, 36);
INSERT INTO `movie_actor` VALUES (10, 45, 37);
INSERT INTO `movie_actor` VALUES (10, 40, 38);
INSERT INTO `movie_actor` VALUES (10, 39, 39);
INSERT INTO `movie_actor` VALUES (10, 65, 40);
INSERT INTO `movie_actor` VALUES (11, 94, 41);
INSERT INTO `movie_actor` VALUES (11, 82, 42);
INSERT INTO `movie_actor` VALUES (11, 63, 43);
INSERT INTO `movie_actor` VALUES (11, 109, 44);
INSERT INTO `movie_actor` VALUES (12, 105, 45);
INSERT INTO `movie_actor` VALUES (12, 62, 46);
INSERT INTO `movie_actor` VALUES (12, 98, 47);
INSERT INTO `movie_actor` VALUES (12, 115, 48);
INSERT INTO `movie_actor` VALUES (14, 64, 49);
INSERT INTO `movie_actor` VALUES (14, 119, 50);
INSERT INTO `movie_actor` VALUES (14, 25, 51);
INSERT INTO `movie_actor` VALUES (14, 92, 52);
INSERT INTO `movie_actor` VALUES (15, 91, 53);
INSERT INTO `movie_actor` VALUES (15, 15, 54);
INSERT INTO `movie_actor` VALUES (15, 14, 55);
INSERT INTO `movie_actor` VALUES (15, 68, 56);
INSERT INTO `movie_actor` VALUES (16, 20, 57);
INSERT INTO `movie_actor` VALUES (16, 73, 58);
INSERT INTO `movie_actor` VALUES (16, 21, 59);
INSERT INTO `movie_actor` VALUES (16, 27, 60);
INSERT INTO `movie_actor` VALUES (17, 7, 61);
INSERT INTO `movie_actor` VALUES (17, 35, 62);
INSERT INTO `movie_actor` VALUES (17, 2, 63);
INSERT INTO `movie_actor` VALUES (17, 43, 64);
INSERT INTO `movie_actor` VALUES (18, 9, 65);
INSERT INTO `movie_actor` VALUES (18, 54, 66);
INSERT INTO `movie_actor` VALUES (18, 57, 67);
INSERT INTO `movie_actor` VALUES (18, 43, 68);
INSERT INTO `movie_actor` VALUES (19, 19, 69);
INSERT INTO `movie_actor` VALUES (19, 79, 70);
INSERT INTO `movie_actor` VALUES (19, 70, 71);
INSERT INTO `movie_actor` VALUES (19, 53, 72);
INSERT INTO `movie_actor` VALUES (20, 48, 73);
INSERT INTO `movie_actor` VALUES (20, 81, 74);
INSERT INTO `movie_actor` VALUES (20, 55, 75);
INSERT INTO `movie_actor` VALUES (20, 38, 76);
INSERT INTO `movie_actor` VALUES (21, 48, 77);
INSERT INTO `movie_actor` VALUES (21, 5, 78);
INSERT INTO `movie_actor` VALUES (21, 116, 79);
INSERT INTO `movie_actor` VALUES (21, 111, 80);
INSERT INTO `movie_actor` VALUES (22, 35, 81);
INSERT INTO `movie_actor` VALUES (22, 75, 82);
INSERT INTO `movie_actor` VALUES (22, 2, 83);
INSERT INTO `movie_actor` VALUES (22, 24, 84);
INSERT INTO `movie_actor` VALUES (23, 8, 85);
INSERT INTO `movie_actor` VALUES (23, 32, 86);
INSERT INTO `movie_actor` VALUES (23, 102, 87);
INSERT INTO `movie_actor` VALUES (23, 118, 88);
INSERT INTO `movie_actor` VALUES (24, 91, 89);
INSERT INTO `movie_actor` VALUES (24, 14, 90);
INSERT INTO `movie_actor` VALUES (24, 68, 91);
INSERT INTO `movie_actor` VALUES (24, 15, 92);
INSERT INTO `movie_actor` VALUES (25, 48, 93);
INSERT INTO `movie_actor` VALUES (25, 83, 94);
INSERT INTO `movie_actor` VALUES (25, 31, 95);
INSERT INTO `movie_actor` VALUES (25, 37, 96);
INSERT INTO `movie_actor` VALUES (26, 114, 97);
INSERT INTO `movie_actor` VALUES (26, 112, 98);
INSERT INTO `movie_actor` VALUES (26, 51, 99);
INSERT INTO `movie_actor` VALUES (26, 46, 100);
INSERT INTO `movie_actor` VALUES (27, 36, 101);
INSERT INTO `movie_actor` VALUES (27, 69, 102);
INSERT INTO `movie_actor` VALUES (27, 88, 103);
INSERT INTO `movie_actor` VALUES (27, 56, 104);
INSERT INTO `movie_actor` VALUES (28, 3, 105);
INSERT INTO `movie_actor` VALUES (28, 28, 106);
INSERT INTO `movie_actor` VALUES (28, 87, 107);
INSERT INTO `movie_actor` VALUES (28, 24, 108);
INSERT INTO `movie_actor` VALUES (29, 93, 109);
INSERT INTO `movie_actor` VALUES (29, 13, 110);
INSERT INTO `movie_actor` VALUES (29, 71, 111);
INSERT INTO `movie_actor` VALUES (29, 117, 112);
INSERT INTO `movie_actor` VALUES (30, 36, 113);
INSERT INTO `movie_actor` VALUES (30, 69, 114);
INSERT INTO `movie_actor` VALUES (30, 88, 115);
INSERT INTO `movie_actor` VALUES (30, 56, 116);
COMMIT;

-- ----------------------------
-- Table structure for movie_director
-- ----------------------------
DROP TABLE IF EXISTS `movie_director`;
CREATE TABLE `movie_director` (
  `movie_id` int NOT NULL,
  `director_id` int NOT NULL,
  `table_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`table_id`) USING BTREE,
  KEY `director_id` (`director_id`),
  KEY `movie_director_ibfk_1` (`movie_id`),
  CONSTRAINT `movie_director_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `movie_director_ibfk_2` FOREIGN KEY (`director_id`) REFERENCES `actor` (`actor_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of movie_director
-- ----------------------------
BEGIN;
INSERT INTO `movie_director` VALUES (1, 84, 1);
INSERT INTO `movie_director` VALUES (2, 41, 2);
INSERT INTO `movie_director` VALUES (3, 95, 3);
INSERT INTO `movie_director` VALUES (4, 18, 4);
INSERT INTO `movie_director` VALUES (5, 96, 5);
INSERT INTO `movie_director` VALUES (6, 96, 6);
INSERT INTO `movie_director` VALUES (7, 104, 7);
INSERT INTO `movie_director` VALUES (8, 74, 8);
INSERT INTO `movie_director` VALUES (9, 1, 9);
INSERT INTO `movie_director` VALUES (9, 34, 10);
INSERT INTO `movie_director` VALUES (9, 99, 11);
INSERT INTO `movie_director` VALUES (9, 29, 12);
INSERT INTO `movie_director` VALUES (9, 76, 13);
INSERT INTO `movie_director` VALUES (10, 77, 14);
INSERT INTO `movie_director` VALUES (11, 61, 15);
INSERT INTO `movie_director` VALUES (12, 4, 16);
INSERT INTO `movie_director` VALUES (14, 12, 17);
INSERT INTO `movie_director` VALUES (14, 78, 18);
INSERT INTO `movie_director` VALUES (15, 52, 19);
INSERT INTO `movie_director` VALUES (16, 22, 20);
INSERT INTO `movie_director` VALUES (17, 120, 21);
INSERT INTO `movie_director` VALUES (18, 11, 22);
INSERT INTO `movie_director` VALUES (19, 66, 23);
INSERT INTO `movie_director` VALUES (20, 33, 24);
INSERT INTO `movie_director` VALUES (21, 33, 25);
INSERT INTO `movie_director` VALUES (22, 120, 26);
INSERT INTO `movie_director` VALUES (23, 4, 27);
INSERT INTO `movie_director` VALUES (24, 52, 28);
INSERT INTO `movie_director` VALUES (25, 90, 29);
INSERT INTO `movie_director` VALUES (26, 6, 30);
INSERT INTO `movie_director` VALUES (27, 85, 31);
INSERT INTO `movie_director` VALUES (28, 67, 32);
INSERT INTO `movie_director` VALUES (29, 89, 33);
INSERT INTO `movie_director` VALUES (30, 84, 34);
COMMIT;

-- ----------------------------
-- Table structure for movie_releaseTme
-- ----------------------------
DROP TABLE IF EXISTS `movie_releaseTme`;
CREATE TABLE `movie_releaseTme` (
  `releaseTime_id` int NOT NULL,
  `movie_id` int NOT NULL,
  `table_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`table_id`) USING BTREE,
  KEY `movie_id` (`movie_id`),
  KEY `movie_releasetme_ibfk_1` (`releaseTime_id`),
  CONSTRAINT `movie_releasetme_ibfk_1` FOREIGN KEY (`releaseTime_id`) REFERENCES `releaseTime` (`releaseTime_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `movie_releasetme_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for movie_review
-- ----------------------------
DROP TABLE IF EXISTS `movie_review`;
CREATE TABLE `movie_review` (
  `movie_id` int NOT NULL,
  `review_id` int NOT NULL,
  `table_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`table_id`) USING BTREE,
  KEY `review_id` (`review_id`),
  KEY `movie_review_ibfk_1` (`movie_id`),
  CONSTRAINT `movie_review_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `movie_review_ibfk_2` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of movie_review
-- ----------------------------
BEGIN;
INSERT INTO `movie_review` VALUES (1, 23, 7);
INSERT INTO `movie_review` VALUES (1, 25, 9);
INSERT INTO `movie_review` VALUES (1, 26, 10);
INSERT INTO `movie_review` VALUES (1, 27, 11);
INSERT INTO `movie_review` VALUES (1, 28, 12);
INSERT INTO `movie_review` VALUES (1, 29, 13);
INSERT INTO `movie_review` VALUES (1, 30, 14);
INSERT INTO `movie_review` VALUES (1, 31, 15);
INSERT INTO `movie_review` VALUES (2, 32, 16);
INSERT INTO `movie_review` VALUES (3, 33, 17);
COMMIT;

-- ----------------------------
-- Table structure for movie_type
-- ----------------------------
DROP TABLE IF EXISTS `movie_type`;
CREATE TABLE `movie_type` (
  `table_id` int NOT NULL AUTO_INCREMENT,
  `movie_id` int NOT NULL,
  `type_id` int NOT NULL,
  PRIMARY KEY (`table_id`) USING BTREE,
  KEY `type_id` (`type_id`),
  KEY `movie_type_ibfk_1` (`movie_id`),
  CONSTRAINT `movie_type_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `movie_type_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=826 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of movie_type
-- ----------------------------
BEGIN;
INSERT INTO `movie_type` VALUES (739, 1, 1);
INSERT INTO `movie_type` VALUES (740, 1, 2);
INSERT INTO `movie_type` VALUES (741, 1, 3);
INSERT INTO `movie_type` VALUES (742, 1, 4);
INSERT INTO `movie_type` VALUES (743, 2, 1);
INSERT INTO `movie_type` VALUES (744, 2, 2);
INSERT INTO `movie_type` VALUES (745, 2, 3);
INSERT INTO `movie_type` VALUES (746, 3, 1);
INSERT INTO `movie_type` VALUES (747, 3, 2);
INSERT INTO `movie_type` VALUES (748, 3, 5);
INSERT INTO `movie_type` VALUES (749, 4, 1);
INSERT INTO `movie_type` VALUES (750, 4, 5);
INSERT INTO `movie_type` VALUES (751, 4, 6);
INSERT INTO `movie_type` VALUES (752, 4, 7);
INSERT INTO `movie_type` VALUES (753, 5, 1);
INSERT INTO `movie_type` VALUES (754, 5, 2);
INSERT INTO `movie_type` VALUES (755, 5, 3);
INSERT INTO `movie_type` VALUES (756, 6, 1);
INSERT INTO `movie_type` VALUES (757, 6, 5);
INSERT INTO `movie_type` VALUES (758, 7, 6);
INSERT INTO `movie_type` VALUES (759, 7, 11);
INSERT INTO `movie_type` VALUES (760, 7, 12);
INSERT INTO `movie_type` VALUES (761, 8, 6);
INSERT INTO `movie_type` VALUES (762, 8, 7);
INSERT INTO `movie_type` VALUES (763, 8, 13);
INSERT INTO `movie_type` VALUES (764, 8, 14);
INSERT INTO `movie_type` VALUES (765, 9, 15);
INSERT INTO `movie_type` VALUES (766, 10, 7);
INSERT INTO `movie_type` VALUES (767, 10, 13);
INSERT INTO `movie_type` VALUES (768, 10, 14);
INSERT INTO `movie_type` VALUES (769, 11, 6);
INSERT INTO `movie_type` VALUES (770, 11, 11);
INSERT INTO `movie_type` VALUES (771, 11, 12);
INSERT INTO `movie_type` VALUES (772, 12, 1);
INSERT INTO `movie_type` VALUES (773, 12, 2);
INSERT INTO `movie_type` VALUES (774, 12, 3);
INSERT INTO `movie_type` VALUES (775, 14, 8);
INSERT INTO `movie_type` VALUES (776, 14, 9);
INSERT INTO `movie_type` VALUES (777, 15, 1);
INSERT INTO `movie_type` VALUES (778, 15, 2);
INSERT INTO `movie_type` VALUES (779, 15, 4);
INSERT INTO `movie_type` VALUES (780, 16, 2);
INSERT INTO `movie_type` VALUES (781, 16, 3);
INSERT INTO `movie_type` VALUES (782, 16, 9);
INSERT INTO `movie_type` VALUES (783, 17, 1);
INSERT INTO `movie_type` VALUES (784, 17, 2);
INSERT INTO `movie_type` VALUES (785, 17, 3);
INSERT INTO `movie_type` VALUES (786, 18, 1);
INSERT INTO `movie_type` VALUES (787, 18, 2);
INSERT INTO `movie_type` VALUES (788, 18, 3);
INSERT INTO `movie_type` VALUES (789, 18, 4);
INSERT INTO `movie_type` VALUES (790, 19, 1);
INSERT INTO `movie_type` VALUES (791, 19, 2);
INSERT INTO `movie_type` VALUES (792, 19, 5);
INSERT INTO `movie_type` VALUES (793, 19, 7);
INSERT INTO `movie_type` VALUES (794, 20, 1);
INSERT INTO `movie_type` VALUES (795, 20, 2);
INSERT INTO `movie_type` VALUES (796, 20, 3);
INSERT INTO `movie_type` VALUES (797, 21, 1);
INSERT INTO `movie_type` VALUES (798, 21, 2);
INSERT INTO `movie_type` VALUES (799, 21, 10);
INSERT INTO `movie_type` VALUES (800, 22, 1);
INSERT INTO `movie_type` VALUES (801, 22, 2);
INSERT INTO `movie_type` VALUES (802, 22, 3);
INSERT INTO `movie_type` VALUES (803, 22, 4);
INSERT INTO `movie_type` VALUES (804, 23, 2);
INSERT INTO `movie_type` VALUES (805, 23, 3);
INSERT INTO `movie_type` VALUES (806, 23, 9);
INSERT INTO `movie_type` VALUES (807, 24, 1);
INSERT INTO `movie_type` VALUES (808, 24, 2);
INSERT INTO `movie_type` VALUES (809, 24, 4);
INSERT INTO `movie_type` VALUES (810, 25, 1);
INSERT INTO `movie_type` VALUES (811, 25, 2);
INSERT INTO `movie_type` VALUES (812, 25, 3);
INSERT INTO `movie_type` VALUES (813, 26, 1);
INSERT INTO `movie_type` VALUES (814, 26, 4);
INSERT INTO `movie_type` VALUES (815, 26, 11);
INSERT INTO `movie_type` VALUES (816, 27, 1);
INSERT INTO `movie_type` VALUES (817, 27, 2);
INSERT INTO `movie_type` VALUES (818, 27, 3);
INSERT INTO `movie_type` VALUES (819, 28, 1);
INSERT INTO `movie_type` VALUES (820, 28, 2);
INSERT INTO `movie_type` VALUES (821, 28, 3);
INSERT INTO `movie_type` VALUES (822, 29, 1);
INSERT INTO `movie_type` VALUES (823, 29, 2);
INSERT INTO `movie_type` VALUES (824, 30, 2);
INSERT INTO `movie_type` VALUES (825, 30, 3);
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
-- Table structure for review
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `rate` float(2,1) NOT NULL DEFAULT '0.0',
  `review` text,
  PRIMARY KEY (`review_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of review
-- ----------------------------
BEGIN;
INSERT INTO `review` VALUES (23, 3.0, 'not good');
INSERT INTO `review` VALUES (25, 8.0, 'good');
INSERT INTO `review` VALUES (26, 8.0, 'good');
INSERT INTO `review` VALUES (27, 8.0, 'good');
INSERT INTO `review` VALUES (28, 8.0, 'good');
INSERT INTO `review` VALUES (29, 8.0, 'good');
INSERT INTO `review` VALUES (30, 5.0, 'not good');
INSERT INTO `review` VALUES (31, 2.0, 'not good');
INSERT INTO `review` VALUES (32, 3.3, 'dsfasdfsaf');
INSERT INTO `review` VALUES (33, 3.0, '44f4ff4f');
COMMIT;

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'N/A',
  PRIMARY KEY (`type_id`),
  KEY `type_id` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of type
-- ----------------------------
BEGIN;
INSERT INTO `type` VALUES (1, 'Action');
INSERT INTO `type` VALUES (2, 'Adventure');
INSERT INTO `type` VALUES (3, 'Fantasy');
INSERT INTO `type` VALUES (4, 'Science Fiction');
INSERT INTO `type` VALUES (5, 'Crime');
INSERT INTO `type` VALUES (6, 'Drama');
INSERT INTO `type` VALUES (7, 'Thriller');
INSERT INTO `type` VALUES (8, 'Animation');
INSERT INTO `type` VALUES (9, 'Family');
INSERT INTO `type` VALUES (10, 'Western');
INSERT INTO `type` VALUES (11, 'Comedy');
INSERT INTO `type` VALUES (12, 'Romance');
INSERT INTO `type` VALUES (13, 'Horro');
INSERT INTO `type` VALUES (14, 'mystery');
INSERT INTO `type` VALUES (15, 'Documentary');
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
INSERT INTO `user` VALUES (2, '123', 'F', 14, '2233', '0000@11.co m');
INSERT INTO `user` VALUES (3, '1234', 'M', 18, '123', '123@123');
INSERT INTO `user` VALUES (4, 'asdf', 'M', 25, 'asdf', '359931108@qq.com');
COMMIT;

-- ----------------------------
-- Table structure for user_banlist
-- ----------------------------
DROP TABLE IF EXISTS `user_banlist`;
CREATE TABLE `user_banlist` (
  `user_id` int NOT NULL,
  `user_baned_id` int DEFAULT NULL,
  `table_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`table_id`) USING BTREE,
  KEY `user_baned_id` (`user_baned_id`),
  KEY `user_banlist_ibfk_2` (`user_id`),
  CONSTRAINT `user_banlist_ibfk_1` FOREIGN KEY (`user_baned_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_banlist_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_banlist
-- ----------------------------
BEGIN;
INSERT INTO `user_banlist` VALUES (1, 3, 5);
INSERT INTO `user_banlist` VALUES (2, 1, 6);
COMMIT;

-- ----------------------------
-- Table structure for user_followlist
-- ----------------------------
DROP TABLE IF EXISTS `user_followlist`;
CREATE TABLE `user_followlist` (
  `user_id` int DEFAULT NULL,
  `follow_id` int DEFAULT NULL,
  `table_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`table_id`),
  KEY `user_id` (`user_id`),
  KEY `follow_id` (`follow_id`),
  CONSTRAINT `user_followlist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_followlist_ibfk_2` FOREIGN KEY (`follow_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_followlist
-- ----------------------------
BEGIN;
INSERT INTO `user_followlist` VALUES (1, 3, 2);
INSERT INTO `user_followlist` VALUES (1, 4, 3);
COMMIT;

-- ----------------------------
-- Table structure for user_review
-- ----------------------------
DROP TABLE IF EXISTS `user_review`;
CREATE TABLE `user_review` (
  `user_id` int NOT NULL,
  `review_id` int NOT NULL,
  `table_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`table_id`) USING BTREE,
  KEY `review_id` (`review_id`),
  KEY `user_review_ibfk_1` (`user_id`),
  CONSTRAINT `user_review_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_review_ibfk_2` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_review
-- ----------------------------
BEGIN;
INSERT INTO `user_review` VALUES (3, 23, 10);
INSERT INTO `user_review` VALUES (3, 25, 12);
INSERT INTO `user_review` VALUES (3, 26, 13);
INSERT INTO `user_review` VALUES (3, 27, 14);
INSERT INTO `user_review` VALUES (3, 28, 15);
INSERT INTO `user_review` VALUES (3, 29, 16);
INSERT INTO `user_review` VALUES (1, 30, 17);
INSERT INTO `user_review` VALUES (1, 31, 18);
INSERT INTO `user_review` VALUES (1, 32, 19);
INSERT INTO `user_review` VALUES (1, 33, 20);
COMMIT;

-- ----------------------------
-- Table structure for user_wishlist
-- ----------------------------
DROP TABLE IF EXISTS `user_wishlist`;
CREATE TABLE `user_wishlist` (
  `user_id` int NOT NULL,
  `wishList` int DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_wishlist_ibfk_1` (`wishList`),
  KEY `user_wishlist_ibfk_2` (`user_id`),
  CONSTRAINT `user_wishlist_ibfk_1` FOREIGN KEY (`wishList`) REFERENCES `movie` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_wishlist_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_wishlist
-- ----------------------------
BEGIN;
INSERT INTO `user_wishlist` VALUES (1, 1, 1);
INSERT INTO `user_wishlist` VALUES (1, 2, 2);
INSERT INTO `user_wishlist` VALUES (1, 3, 3);
INSERT INTO `user_wishlist` VALUES (2, 3, 4);
INSERT INTO `user_wishlist` VALUES (1, 2, 5);
INSERT INTO `user_wishlist` VALUES (1, 2, 6);
INSERT INTO `user_wishlist` VALUES (1, 2, 7);
INSERT INTO `user_wishlist` VALUES (1, 2, 8);
INSERT INTO `user_wishlist` VALUES (1, 2, 9);
INSERT INTO `user_wishlist` VALUES (1, 2, 10);
INSERT INTO `user_wishlist` VALUES (1, 2, 11);
INSERT INTO `user_wishlist` VALUES (1, 2, 12);
INSERT INTO `user_wishlist` VALUES (1, 2, 13);
INSERT INTO `user_wishlist` VALUES (1, 2, 14);
INSERT INTO `user_wishlist` VALUES (1, 2, 15);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
