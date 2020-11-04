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
INSERT INTO `movie` VALUES (12, 'John Carter', '2012/3/7', 'https://m.media-amazon.com/images/M/MV5BMDEwZmIzNjYtNjUwNS00MzgzLWJiOGYtZWMxZGQ5NDcxZjUwXkEyXkFqcGdeQXVyNTIzOTk5ODM@._V1_SX300.jpg', 6.1, 0, 'http://movies.disney.com/john-carter', 'John Carter is a war-weary, former military captain who\'s inexplicably transported to the mysterious and exotic planet of Barsoom (Mars) and reluctantly becomes embroiled in an epic conflict. It\'s a world on the brink of collapse, and Carter rediscovers his humanity when he realizes the survival of Barsoom and its people rests in his hands.');
INSERT INTO `movie` VALUES (14, 'Tangled', '2010/11/24', 'https://m.media-amazon.com/images/M/MV5BMTAxNDYxMjg0MjNeQTJeQWpwZ15BbWU3MDcyNTk2OTM@._V1_SX300.jpg', 7.4, 0, 'http://disney.go.com/disneypictures/tangled/', 'When the kingdom\'s most wanted-and most charming-bandit Flynn Rider hides out in a mysterious tower, he\'s taken hostage by Rapunzel, a beautiful and feisty tower-bound teen with 70 feet of magical, golden hair. Flynn\'s curious captor, who\'s looking for her ticket out of the tower where she\'s been locked away for years, strikes a deal with the handsome thief and the unlikely duo sets off on an action-packed escapade, complete with a super-cop horse, an over-protective chameleon and a gruff gang of pub thugs.');
INSERT INTO `movie` VALUES (15, 'Avengers: Age of Ultron', '2015/4/22', 'https://m.media-amazon.com/images/M/MV5BMTM4OGJmNWMtOTM4Ni00NTE3LTg3MDItZmQxYjc4N2JhNmUxXkEyXkFqcGdeQXVyNTgzMDMzMTg@._V1_SX300.jpg', 7.3, 0, 'http://marvel.com/movies/movie/193/avengers_age_of_ultron', 'When Tony Stark tries to jumpstart a dormant peacekeeping program, things go awry and Earth__ Mightiest Heroes are put to the ultimate test as the fate of the planet hangs in the balance. As the villainous Ultron emerges, it is up to The Avengers to stop him from enacting his terrible plans, and soon uneasy alliances and unexpected action pave the way for an epic and unique global adventure.');
INSERT INTO `movie` VALUES (16, 'Harry Potter and the Half-Blood Prince', '2009/7/7', 'https://m.media-amazon.com/images/M/MV5BNzU3NDg4NTAyNV5BMl5BanBnXkFtZTcwOTg2ODg1Mg@@._V1_SX300.jpg', 7.4, 0, 'http://harrypotter.warnerbros.com/harrypotterandthehalf-bloodprince/dvd/index.html', 'As Harry begins his sixth year at Hogwarts, he discovers an old book marked as \'Property of the Half-Blood Prince\', and begins to learn more about Lord Voldemort\'s dark past.');
INSERT INTO `movie` VALUES (17, 'Batman v Superman: Dawn of Justice', '2016/3/23', 'https://m.media-amazon.com/images/M/MV5BYThjYzcyYzItNTVjNy00NDk0LTgwMWQtYjMwNmNlNWJhMzMyXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg', 5.7, 0, 'http://www.batmanvsupermandawnofjustice.com/', 'Fearing the actions of a god-like Super Hero left unchecked, Gotham City__ own formidable, forceful vigilante takes on Metropolis__ most revered, modern-day savior, while the world wrestles with what sort of hero it really needs. And with Batman and Superman at war with one another, a new threat quickly arises, putting mankind in greater danger than it__ ever known before.');
INSERT INTO `movie` VALUES (18, 'Superman Returns', '2006/6/28', 'https://m.media-amazon.com/images/M/MV5BNzY2ZDQ2MTctYzlhOC00MWJhLTgxMmItMDgzNDQwMDdhOWI2XkEyXkFqcGdeQXVyNjc1NTYyMjg@._V1_SX300.jpg', 5.4, 0, 'http://www.superman.com', 'Superman returns to discover his 5-year absence has allowed Lex Luthor to walk free, and that those he was closest too felt abandoned and have moved on. Luthor plots his ultimate revenge that could see millions killed and change the face of the planet forever, as well as ridding himself of the Man of Steel.');
INSERT INTO `movie` VALUES (19, 'Quantum of Solace', '2008/10/30', 'https://m.media-amazon.com/images/M/MV5BMjZiYTUzMzktZWI5Yy00Mzk4LWFlMDgtYjRmNWU0Mzc0MzNiXkEyXkFqcGdeQXVyMjUzOTY1NTc@._V1_SX300.jpg', 6.1, 0, 'http://www.mgm.com/view/movie/234/Quantum-of-Solace/', 'Quantum of Solace continues the adventures of James Bond after Casino Royale. Betrayed by Vesper, the woman he loved, 007 fights the urge to make his latest mission personal. Pursuing his determination to uncover the truth, Bond and M interrogate Mr. White, who reveals that the organization that blackmailed Vesper is far more complex and dangerous than anyone had imagined.');
INSERT INTO `movie` VALUES (20, 'Pirates of the Caribbean: Dead Man\'s Chest', '2006/6/20', 'https://m.media-amazon.com/images/M/MV5BMTcwODc1MTMxM15BMl5BanBnXkFtZTYwMDg1NzY3._V1_SX300.jpg', 7.0, 0, 'http://disney.go.com/disneypictures/pirates/', 'Captain Jack Sparrow works his way out of a blood debt with the ghostly Davey Jones, he also attempts to avoid eternal damnation.');
INSERT INTO `movie` VALUES (21, 'The Lone Ranger', '2013/7/3', 'https://m.media-amazon.com/images/M/MV5BZjFiMTc2MTAtZDA0My00OGRmLTk5M2ItNTlmYTUwZmU2YmRiXkEyXkFqcGdeQXVyNTIzOTk5ODM@._V1_SX300.jpg', 5.9, 0, 'http://disney.go.com/the-lone-ranger/', 'The Texas Rangers chase down a gang of outlaws led by Butch Cavendish, but the gang ambushes the Rangers, seemingly killing them all. One survivor is found, however, by an American Indian named Tonto, who nurses him back to health. The Ranger, donning a mask and riding a white stallion named Silver, teams up with Tonto to bring the unscrupulous gang and others of that ilk to justice.');
INSERT INTO `movie` VALUES (22, 'Man of Steel', '2013/6/12', 'https://m.media-amazon.com/images/M/MV5BMTk5ODk1NDkxMF5BMl5BanBnXkFtZTcwNTA5OTY0OQ@@._V1_SX300.jpg', 6.5, 0, 'http://www.manofsteel.com/', 'A young boy learns that he has extraordinary powers and is not of this earth. As a young man, he journeys to discover where he came from and what he was sent here to do. But the hero in him must emerge if he is to save the world from annihilation and become the symbol of hope for all mankind.');
INSERT INTO `movie` VALUES (23, 'The Chronicles of Narnia: Prince Caspian', '2008/5/15', 'https://m.media-amazon.com/images/M/MV5BMTIwOTA4NTE4Ml5BMl5BanBnXkFtZTcwOTI2NTg1MQ@@._V1_SX300.jpg', 6.3, 0, '', 'One year after their incredible adventures in the Lion, the Witch and the Wardrobe, Peter, Edmund, Lucy and Susan Pevensie return to Narnia to aid a young prince whose life has been threatened by the evil King Miraz. Now, with the help of a colorful cast of new characters, including Trufflehunter the badger and Nikabrik the dwarf, the Pevensie clan embarks on an incredible quest to ensure that Narnia is returned to its rightful heir.');
INSERT INTO `movie` VALUES (24, 'The Avengers', '2012/4/25', 'https://m.media-amazon.com/images/M/MV5BNDYxNjQyMjAtNTdiOS00NGYwLWFmNTAtNThmYjU5ZGI2YTI1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg', 7.4, 0, 'http://marvel.com/avengers_movie/', 'When an unexpected enemy emerges and threatens global safety and security, Nick Fury, director of the international peacekeeping agency known as S.H.I.E.L.D., finds himself in need of a team to pull the world back from the brink of disaster. Spanning the globe, a daring recruitment effort begins!');
INSERT INTO `movie` VALUES (25, 'Pirates of the Caribbean: On Stranger Tides', '2011/5/14', 'https://m.media-amazon.com/images/M/MV5BMjE5MjkwODI3Nl5BMl5BanBnXkFtZTcwNjcwMDk4NA@@._V1_SX300.jpg', 6.4, 0, 'http://disney.go.com/pirates/index-on-stranger-tides.html#/video/', 'Captain Jack Sparrow crosses paths with a woman from his past, and he\'s not sure if it\'s love -- or if she\'s a ruthless con artist who\'s using him to find the fabled Fountain of Youth. When she forces him aboard the Queen Anne\'s Revenge, the ship of the formidable pirate Blackbeard, Jack finds himself on an unexpected adventure in which he doesn\'t know who to fear more: Blackbeard or the woman from his past.');
INSERT INTO `movie` VALUES (26, 'Men in Black 3', '2012/5/23', 'https://m.media-amazon.com/images/M/MV5BMTU2NTYxODcwMF5BMl5BanBnXkFtZTcwNDk1NDY0Nw@@._V1_SX300.jpg', 6.2, 0, 'http://www.sonypictures.com/movies/meninblack3/', 'Agents J (Will Smith) and K (Tommy Lee Jones) are back...in time. J has seen some inexplicable things in his 15 years with the Men in Black, but nothing, not even aliens, perplexes him as much as his wry, reticent partner. But when K\'s life and the fate of the planet are put at stake, Agent J will have to travel back in time to put things right. J discovers that there are secrets to the universe that K never told him - secrets that will reveal themselves as he teams up with the young Agent K (Josh Brolin) to save his partner, the agency, and the future of humankind.');
INSERT INTO `movie` VALUES (27, 'The Hobbit: The Battle of the Five Armies', '2014/12/10', 'https://m.media-amazon.com/images/M/MV5BMTYzNDE3OTQ3MF5BMl5BanBnXkFtZTgwODczMTg4MjE@._V1_SX300.jpg', 7.1, 0, 'http://www.thehobbit.com/', 'Immediately after the events of The Desolation of Smaug, Bilbo and the dwarves try to defend Erebor\'s mountain of treasure from others who claim it: the men of the ruined Laketown and the elves of Mirkwood. Meanwhile an army of Orcs led by Azog the Defiler is marching on Erebor, fueled by the rise of the dark lord Sauron. Dwarves, elves and men must unite, and the hope for Middle-Earth falls into Bilbo\'s hands.');
INSERT INTO `movie` VALUES (28, 'The Amazing Spider-Man', '2012/6/27', 'https://m.media-amazon.com/images/M/MV5BMjMyOTM4MDMxNV5BMl5BanBnXkFtZTcwNjIyNzExOA@@._V1_SX300.jpg', 6.5, 0, 'http://www.theamazingspiderman.com', 'Peter Parker is an outcast high schooler abandoned by his parents as a boy, leaving him to be raised by his Uncle Ben and Aunt May. Like most teenagers, Peter is trying to figure out who he is and how he got to be the person he is today. As Peter discovers a mysterious briefcase that belonged to his father, he begins a quest to understand his parents\' disappearance _ leading him directly to Oscorp and the lab of Dr. Curt Connors, his father\'s former partner. As Spider-Man is set on a collision course with Connors\' alter ego, The Lizard, Peter will make life-altering choices to use his powers and shape his destiny to become a hero.');
INSERT INTO `movie` VALUES (29, 'Robin Hood', '2010/5/12', 'https://m.media-amazon.com/images/M/MV5BMTM5NzcwMzEwOF5BMl5BanBnXkFtZTcwNjg5MTgwMw@@._V1_SX300.jpg', 6.2, 0, 'http://www.robinhoodthemovie.com/', 'When soldier Robin happens upon the dying Robert of Loxley, he promises to return the man\'s sword to his family in Nottingham. There, he assumes Robert\'s identity; romances his widow, Marion; and draws the ire of the town\'s sheriff and King John\'s henchman, Godfrey.');
INSERT INTO `movie` VALUES (30, 'The Hobbit: The Desolation of Smaug', '2013/12/11', 'https://m.media-amazon.com/images/M/MV5BMzU0NDY0NDEzNV5BMl5BanBnXkFtZTgwOTIxNDU1MDE@._V1_SX300.jpg', 7.6, 0, 'http://www.thehobbit.com/', 'The Dwarves, Bilbo and Gandalf have successfully escaped the Misty Mountains, and Bilbo has gained the One Ring. They all continue their journey to get their gold back from the Dragon, Smaug.');
INSERT INTO `movie` VALUES (31, 'The Golden Compass', '2007/12/4', 'https://m.media-amazon.com/images/M/MV5BMTM2NDkxMjQxMV5BMl5BanBnXkFtZTYwNTMxMDM4._V1_SX300.jpg', 5.8, 0, 'http://www.goldencompassmovie.com/index_german.html', 'After overhearing a shocking secret, precocious orphan Lyra Belacqua trades her carefree existence roaming the halls of Jordan College for an otherworldly adventure in the far North, unaware that it\'s part of her destiny.');
INSERT INTO `movie` VALUES (32, 'King Kong', '2005/12/14', 'https://m.media-amazon.com/images/M/MV5BMjYxYmRlZWYtMzAwNC00MDA1LWJjNTItOTBjMzlhNGMzYzk3XkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg', 6.6, 0, '', 'In 1933 New York, an overly ambitious movie producer coerces his cast and hired ship crew to travel to mysterious Skull Island, where they encounter Kong, a giant ape who is immediately smitten with the leading lady.');
INSERT INTO `movie` VALUES (33, 'Titanic', '1997/11/18', 'https://m.media-amazon.com/images/M/MV5BMDdmZGU3NDQtY2E5My00ZTliLWIzOTUtMTY4ZGI1YjdiNjk3XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_SX300.jpg', 7.5, 0, 'http://www.titanicmovie.com', '84 years later, a 101-year-old woman named Rose DeWitt Bukater tells the story to her granddaughter Lizzy Calvert, Brock Lovett, Lewis Bodine, Bobby Buell and Anatoly Mikailavich on the Keldysh about her life set in April 10th 1912, on a ship called Titanic when young Rose boards the departing ship with the upper-class passengers and her mother, Ruth DeWitt Bukater, and her fiancé, Caledon Hockley. Meanwhile, a drifter and artist named Jack Dawson and his best friend Fabrizio De Rossi win third-class tickets to the ship in a game. And she explains the whole story from departure until the death of Titanic on its first and last voyage April 15th, 1912 at 2:20 in the morning.');
INSERT INTO `movie` VALUES (34, 'Captain America: Civil War', '2016/4/27', 'https://m.media-amazon.com/images/M/MV5BMDdmZGU3NDQtY2E5My00ZTliLWIzOTUtMTY4ZGI1YjdiNjk3XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_SX300.jpg', 7.1, 0, 'http://marvel.com/captainamericapremiere', 'Following the events of Age of Ultron, the collective governments of the world pass an act designed to regulate all superhuman activity. This polarizes opinion amongst the Avengers, causing two factions to side with Iron Man or Captain America, which causes an epic battle between former allies.');
INSERT INTO `movie` VALUES (35, 'Battleship', '2012/4/11', 'https://m.media-amazon.com/images/M/MV5BMjI5NTM5MDA2N15BMl5BanBnXkFtZTcwNjkwMzQxNw@@._V1_SX300.jpg', 5.5, 0, '', 'When mankind beams a radio signal into space, a reply comes from __lanet G_, in the form of several alien crafts that splash down in the waters off Hawaii. Lieutenant Alex Hopper is a weapons officer assigned to the USS John Paul Jones, part of an international naval coalition which becomes the world\'s last hope for survival as they engage the hostile alien force of unimaginable strength. While taking on the invaders, Hopper must also try to live up to the potential his brother, and his fiancée\'s father, Admiral Shane, expect of him.');
INSERT INTO `movie` VALUES (36, 'Jurassic World', '2015/6/9', 'https://m.media-amazon.com/images/M/MV5BNzQ3OTY4NjAtNzM5OS00N2ZhLWJlOWUtYzYwZjNmOWRiMzcyXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg', 6.5, 0, 'http://www.jurassicworld.com/', 'Twenty-two years after the events of Jurassic Park, Isla Nublar now features a fully functioning dinosaur theme park, Jurassic World, as originally envisioned by John Hammond.');
INSERT INTO `movie` VALUES (37, 'Skyfall', '2012/10/25', 'https://m.media-amazon.com/images/M/MV5BMWZiNjE2OWItMTkwNy00ZWQzLWI0NTgtMWE0NjNiYTljN2Q1XkEyXkFqcGdeQXVyNzAwMjYxMzA@._V1_SX300.jpg', 6.9, 0, 'http://www.skyfall-movie.com', 'When Bond\'s latest assignment goes gravely wrong and agents around the world are exposed, MI6 is attacked forcing M to relocate the agency. These events cause her authority and position to be challenged by Gareth Mallory, the new Chairman of the Intelligence and Security Committee. With MI6 now compromised from both inside and out, M is left with one ally she can trust: Bond. 007 takes to the shadows - aided only by field agent, Eve - following a trail to the mysterious Silva, whose lethal and hidden motives have yet to reveal themselves.');
INSERT INTO `movie` VALUES (38, 'Spider-Man 2', '2004/6/25', 'https://m.media-amazon.com/images/M/MV5BMzY2ODk4NmUtOTVmNi00ZTdkLTlmOWYtMmE2OWVhNTU2OTVkXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg', 6.7, 0, 'http://www.sonypictures.com/movies/spider-man2/', 'Peter Parker is going through a major identity crisis. Burned out from being Spider-Man, he decides to shelve his superhero alter ego, which leaves the city suffering in the wake of carnage left by the evil Doc Ock. In the meantime, Parker still can\'t act on his feelings for Mary Jane Watson, a girl he\'s loved since childhood.');
INSERT INTO `movie` VALUES (39, 'Iron Man 3', '2013/4/18', 'https://m.media-amazon.com/images/M/MV5BMjE5MzcyNjk1M15BMl5BanBnXkFtZTcwMjQ4MjcxOQ@@._V1_SX300.jpg', 6.8, 0, 'http://marvel.com/ironman3', 'When Tony Stark\'s world is torn apart by a formidable terrorist called the Mandarin, he starts an odyssey of rebuilding and retribution.');
INSERT INTO `movie` VALUES (40, 'Alice in Wonderland', '2010/3/3', 'https://m.media-amazon.com/images/M/MV5BMTMwNjAxMTc0Nl5BMl5BanBnXkFtZTcwODc3ODk5Mg@@._V1_SX300.jpg', 6.4, 0, 'http://disney.go.com/wonderland/', 'Alice, an unpretentious and individual 19-year-old, is betrothed to a dunce of an English nobleman. At her engagement party, she escapes the crowd to consider whether to go through with the marriage and falls down a hole in the garden after spotting an unusual rabbit. Arriving in a strange and surreal place called \'Underland,\' she finds herself in a world that resembles the nightmares she had as a child, filled with talking animals, villainous queens and knights, and frumious bandersnatches. Alice realizes that she is there for a reason _ to conquer the horrific Jabberwocky and restore the rightful queen to her throne.');
INSERT INTO `movie` VALUES (41, 'X-Men: The Last Stand', '2006/5/24', 'https://m.media-amazon.com/images/M/MV5BNDBhNDJiMWEtOTg4Yi00NTYzLWEzOGMtMjNmNjAxNTBlMzY3XkEyXkFqcGdeQXVyNTIzOTk5ODM@._V1_SX300.jpg', 6.3, 0, '', 'When a cure is found to treat mutations, lines are drawn amongst the X-Men and The Brotherhood, a band of powerful mutants organized under Xavier\'s former ally, Magneto.');
INSERT INTO `movie` VALUES (42, 'Monsters University', '2013/6/20', 'https://m.media-amazon.com/images/M/MV5BMTUyODgwMDU3M15BMl5BanBnXkFtZTcwOTM4MjcxOQ@@._V1_SX300.jpg', 7.0, 0, '', 'A look at the relationship between Mike and Sulley during their days at Monsters University _ when they weren\'t necessarily the best of friends.');
INSERT INTO `movie` VALUES (43, 'Transformers: Revenge of the Fallen', '2009/6/19', 'https://m.media-amazon.com/images/M/MV5BNjk4OTczOTk0NF5BMl5BanBnXkFtZTcwNjQ0NzMzMw@@._V1_SX300.jpg', 6.0, 0, 'http://www.transformersmovie.com/', 'Sam Witwicky leaves the Autobots behind for a normal life. But when his mind is filled with cryptic symbols, the Decepticons target him and he is dragged back into the Transformers\' war.');
INSERT INTO `movie` VALUES (44, 'Transformers: Age of Extinction', '2014/6/25', 'https://m.media-amazon.com/images/M/MV5BMjEwNTg1MTA5Nl5BMl5BanBnXkFtZTgwOTg2OTM4MTE@._V1_SX300.jpg', 5.8, 0, 'http://www.transformersmovie.com', 'As humanity picks up the pieces, following the conclusion of \"Transformers: Dark of the Moon,\" Autobots and Decepticons have all but vanished from the face of the planet. However, a group of powerful, ingenious businessman and scientists attempt to learn from past Transformer incursions and push the boundaries of technology beyond what they can control - all while an ancient, powerful Transformer menace sets Earth in his cross-hairs.');
INSERT INTO `movie` VALUES (45, 'Oz: The Great and Powerful', '2013/3/7', 'https://m.media-amazon.com/images/M/MV5BMjMyMzQ1ODM1MF5BMl5BanBnXkFtZTcwMjE2MTQxOQ@@._V1_SX300.jpg', 5.7, 0, 'http://www.ozthegreatandpowerfulmovie.com', 'Oscar Diggs, a small-time circus illusionist and con-artist, is whisked from Kansas to the Land of Oz where the inhabitants assume he\'s the great wizard of prophecy, there to save Oz from the clutches of evil.');
INSERT INTO `movie` VALUES (46, 'The Amazing Spider-Man 2', '2014/4/16', 'https://m.media-amazon.com/images/M/MV5BOTA5NDYxNTg0OV5BMl5BanBnXkFtZTgwODE5NzU1MTE@._V1_SX300.jpg', 6.5, 0, 'http://www.theamazingspiderman.com', 'For Peter Parker, life is busy. Between taking out the bad guys as Spider-Man and spending time with the person he loves, Gwen Stacy, high school graduation cannot come quickly enough. Peter has not forgotten about the promise he made to Gwen__ father to protect her by staying away, but that is a promise he cannot keep. Things will change for Peter when a new villain, Electro, emerges, an old friend, Harry Osborn, returns, and Peter uncovers new clues about his past.');
INSERT INTO `movie` VALUES (47, 'TRON: Legacy', '2010/12/10', 'https://m.media-amazon.com/images/M/MV5BMTk4NTk4MTk1OF5BMl5BanBnXkFtZTcwNTE2MDIwNA@@._V1_SX300.jpg', 6.3, 0, 'http://disney.go.com/tron/', 'Sam Flynn, the tech-savvy and daring son of Kevin Flynn, investigates his father\'s disappearance and is pulled into The Grid. With the help of a mysterious program named Quorra, Sam quests to stop evil dictator Clu from crossing into the real world.');
INSERT INTO `movie` VALUES (48, 'Cars 2', '2011/6/11', 'https://m.media-amazon.com/images/M/MV5BMTUzNTc3MTU3M15BMl5BanBnXkFtZTcwMzIxNTc3NA@@._V1_SX300.jpg', 5.8, 0, 'http://www.disney.go.com/cars/', 'Star race car Lightning McQueen and his pal Mater head overseas to compete in the World Grand Prix race. But the road to the championship becomes rocky as Mater gets caught up in an intriguing adventure of his own: international espionage.');
INSERT INTO `movie` VALUES (49, 'Green Lantern', '2011/6/16', 'https://m.media-amazon.com/images/M/MV5BMTMyMTg3OTM5Ml5BMl5BanBnXkFtZTcwNzczMjEyNQ@@._V1_SX300.jpg', 5.1, 0, 'http://greenlanternmovie.warnerbros.com/', 'For centuries, a small but powerful force of warriors called the Green Lantern Corps has sworn to keep intergalactic order. Each Green Lantern wears a ring that grants him superpowers. But when a new enemy called Parallax threatens to destroy the balance of power in the Universe, their fate and the fate of Earth lie in the hands of the first human ever recruited.');
INSERT INTO `movie` VALUES (50, 'Toy Story 3', '2010/6/16', 'https://m.media-amazon.com/images/M/MV5BMTgxOTY4Mjc0MF5BMl5BanBnXkFtZTcwNTA4MDQyMw@@._V1_SX300.jpg', 7.6, 0, 'http://disney.go.com/toystory/', 'Woody, Buzz, and the rest of Andy\'s toys haven\'t been played with in years. With Andy about to go to college, the gang find themselves accidentally left at a nefarious day care center. The toys must band together to escape and return home to Andy.');
INSERT INTO `movie` VALUES (51, 'Terminator Salvation', '2009/5/20', 'https://m.media-amazon.com/images/M/MV5BMTgxOTY4Mjc0MF5BMl5BanBnXkFtZTcwNTA4MDQyMw@@._V1_SX300.jpg', 5.9, 0, 'https://www.warnerbros.com/terminator-salvation', 'All grown up in post-apocalyptic 2018, John Connor must lead the resistance of humans against the increasingly dominating militaristic robots. But when Marcus Wright appears, his existence confuses the mission as Connor tries to determine whether Wright has come from the future or the past -- and whether he\'s friend or foe.');
INSERT INTO `movie` VALUES (52, 'Furious 7', '2015/4/1', 'https://m.media-amazon.com/images/M/MV5BMTQxOTA2NDUzOV5BMl5BanBnXkFtZTgwNzY2MTMxMzE@._V1_SX300.jpg', 7.3, 0, 'http://www.furious7.com/', 'Deckard Shaw seeks revenge against Dominic Toretto and his family for his comatose brother.');
INSERT INTO `movie` VALUES (53, 'World War Z', '2013/6/20', 'https://m.media-amazon.com/images/M/MV5BNDQ4YzFmNzktMmM5ZC00MDZjLTk1OTktNDE2ODE4YjM2MjJjXkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_SX300.jpg', 6.7, 0, 'http://www.worldwarzmovie.com', 'Life for former United Nations investigator Gerry Lane and his family seems content. Suddenly, the world is plagued by a mysterious infection turning whole human populations into rampaging mindless zombies. After barely escaping the chaos, Lane is persuaded to go on a mission to investigate this disease. What follows is a perilous trek around the world where Lane must brave horrific dangers and long odds to find answers before human civilization falls.');
INSERT INTO `movie` VALUES (54, 'X-Men: Days of Future Past', '2014/5/15', 'https://m.media-amazon.com/images/M/MV5BZGIzNWYzN2YtMjcwYS00YjQ3LWI2NjMtOTNiYTUyYjE2MGNkXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg', 7.5, 0, 'http://www.x-menmovies.com/', 'The ultimate X-Men ensemble fights a war for the survival of the species across two time periods as they join forces with their younger selves in an epic battle that must change the past _ to save our future.');
INSERT INTO `movie` VALUES (55, 'Star Trek Into Darkness', '2013/5/5', 'https://m.media-amazon.com/images/M/MV5BMTk2NzczOTgxNF5BMl5BanBnXkFtZTcwODQ5ODczOQ@@._V1_SX300.jpg', 7.4, 0, '', 'When the crew of the Enterprise is called back home, they find an unstoppable force of terror from within their own organization has detonated the fleet and everything it stands for, leaving our world in a state of crisis.  With a personal score to settle, Captain Kirk leads a manhunt to a war-zone world to capture a one man weapon of mass destruction. As our heroes are propelled into an epic chess game of life and death, love will be challenged, friendships will be torn apart, and sacrifices must be made for the only family Kirk has left: his crew.');
INSERT INTO `movie` VALUES (56, 'Jack the Giant Slayer', '2013/2/27', 'https://m.media-amazon.com/images/M/MV5BMjE1NDMxMjI0OV5BMl5BanBnXkFtZTcwMjQyMDExOQ@@._V1_SX300.jpg', 5.5, 0, 'http://jackthegiantkiller.warnerbros.com', 'The story of an ancient war that is reignited when a young farmhand unwittingly opens a gateway between our world and a fearsome race of giants. Unleashed on the Earth for the first time in centuries, the giants strive to reclaim the land they once lost, forcing the young man, Jack into the battle of his life to stop them. Fighting for a kingdom, its people, and the love of a brave princess, he comes face to face with the unstoppable warriors he thought only existed in legend__nd gets the chance to become a legend himself.');
INSERT INTO `movie` VALUES (57, 'The Great Gatsby', '2013/5/10', 'https://m.media-amazon.com/images/M/MV5BMTkxNTk1ODcxNl5BMl5BanBnXkFtZTcwMDI1OTMzOQ@@._V1_SX300.jpg', 7.3, 0, '', 'An adaptation of F. Scott Fitzgerald\'s Long Island-set novel, where Midwesterner Nick Carraway is lured into the lavish world of his neighbor, Jay Gatsby. Soon enough, however, Carraway will see through the cracks of Gatsby\'s nouveau riche existence, where obsession, madness, and tragedy await.');
INSERT INTO `movie` VALUES (58, 'Prince of Persia: The Sands of Time', '2010/5/19', 'https://m.media-amazon.com/images/M/MV5BMTMwNDg0NzcyMV5BMl5BanBnXkFtZTcwNjg4MjQyMw@@._V1_SX300.jpg', 6.2, 0, 'http://disney.go.com/disneypictures/princeofpersia', 'A rogue prince reluctantly joins forces with a mysterious princess and together, they race against dark forces to safeguard an ancient dagger capable of releasing the Sands of Time _ gift from the gods that can reverse time and allow its possessor to rule the world.');
INSERT INTO `movie` VALUES (59, 'Pacific Rim', '2013/7/11', 'https://m.media-amazon.com/images/M/MV5BMTY3MTI5NjQ4Nl5BMl5BanBnXkFtZTcwOTU1OTU0OQ@@._V1_SX300.jpg', 6.7, 0, 'http://www.pacificrimmovie.com/', 'When legions of monstrous creatures, known as Kaiju, started rising from the sea, a war began that would take millions of lives and consume humanity\'s resources for years on end. To combat the giant Kaiju, a special type of weapon was devised: massive robots, called Jaegers, which are controlled simultaneously by two pilots whose minds are locked in a neural bridge. But even the Jaegers are proving nearly defenseless in the face of the relentless Kaiju. On the verge of defeat, the forces defending mankind have no choice but to turn to two unlikely heroes__ washed-up former pilot (Charlie Hunnam) and an untested trainee (Rinko Kikuchi)__ho are teamed to drive a legendary but seemingly obsolete Jaeger from the past. Together, they stand as mankind\'s last hope against the mounting apocalypse.');
INSERT INTO `movie` VALUES (60, 'Transformers: Dark of the Moon', '2011/6/28', 'https://m.media-amazon.com/images/M/MV5BMTkwOTY0MTc1NV5BMl5BanBnXkFtZTcwMDQwNjA2NQ@@._V1_SX300.jpg', 6.1, 0, 'http://www.transformersmovie.com/', 'Sam Witwicky takes his first tenuous steps into adulthood while remaining a reluctant human ally of Autobot-leader Optimus Prime. The film centers around the space race between the USSR and the USA, suggesting there was a hidden Transformers role in it all that remains one of the planet\'s most dangerous secrets.');
INSERT INTO `movie` VALUES (61, 'Indiana Jones and the Kingdom of the Crystal Skull', '2008/5/21', 'https://m.media-amazon.com/images/M/MV5BZDIzNzM5MDUtZmI5MC00NGQ5LWFlNzEtYzE3ODIxNDI3ZmNhXkEyXkFqcGdeQXVyNjQ4ODE4MzQ@._V1_SX300.jpg', 5.7, 0, 'http://www.indianajones.com/site/index.html', 'Set during the Cold War, the Soviets _ led by sword-wielding Irina Spalko _ are in search of a crystal skull which has supernatural powers related to a mystical Lost City of Gold. After being captured and then escaping from them, Indy is coerced to head to Peru at the behest of a young man whose friend _ and Indy\'s colleague _ Professor Oxley has been captured for his knowledge of the skull\'s whereabouts.');
INSERT INTO `movie` VALUES (62, 'The Good Dinosaur', '2015/11/14', 'https://m.media-amazon.com/images/M/MV5BMTc5MTg2NjQ4MV5BMl5BanBnXkFtZTgwNzcxOTY5NjE@._V1_SX300.jpg', 6.6, 0, 'http://movies.disney.com/the-good-dinosaur', 'An epic journey into the world of dinosaurs where an Apatosaurus named Arlo makes an unlikely human friend.');
INSERT INTO `movie` VALUES (63, 'Brave', '2012/6/21', 'https://m.media-amazon.com/images/M/MV5BMzgwODk3ODA1NF5BMl5BanBnXkFtZTcwNjU3NjQ0Nw@@._V1_SX300.jpg', 6.7, 0, 'http://disney.go.com/brave/#/home', 'Brave is set in the mystical Scottish Highlands, where Mérida is the princess of a kingdom ruled by King Fergus and Queen Elinor. An unruly daughter and an accomplished archer, Mérida one day defies a sacred custom of the land and inadvertently brings turmoil to the kingdom. In an attempt to set things right, Mérida seeks out an eccentric old Wise Woman and is granted an ill-fated wish. Also figuring into Mérida__ quest _ and serving as comic relief _ are the kingdom__ three lords: the enormous Lord MacGuffin, the surly Lord Macintosh, and the disagreeable Lord Dingwall.');
INSERT INTO `movie` VALUES (64, 'Star Trek Beyond', '2016/7/7', 'https://m.media-amazon.com/images/M/MV5BZDRiOGE5ZTctOWIxOS00MWQwLThlMDYtNWIwMDQwNzBjZDY1XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg', 6.6, 0, 'http://www.startrekmovie.com/', 'The USS Enterprise crew explores the furthest reaches of uncharted space, where they encounter a mysterious new enemy who puts them and everything the Federation stands for to the test.');
INSERT INTO `movie` VALUES (65, 'WALL·E', '2008/6/22', 'https://m.media-amazon.com/images/M/MV5BMjExMTg5OTU0NF5BMl5BanBnXkFtZTcwMjMxMzMzMw@@._V1_SX300.jpg', 7.8, 0, 'http://disney.go.com/disneypictures/wall-e/', 'WALL·E is the last robot left on an Earth that has been overrun with garbage and all humans have fled to outer space. For 700 years he has continued to try and clean up the mess, but has developed some rather interesting human-like qualities. When a ship arrives with a sleek new type of robot, WALL·E thinks he\'s finally found a friend and stows away on the ship when it leaves.');
INSERT INTO `movie` VALUES (66, 'Rush Hour 3', '2007/8/8', 'https://m.media-amazon.com/images/M/MV5BMTA0Nzg5NjQ0MDBeQTJeQWpwZ15BbWU3MDE4Mzg5NDE@._V1_SX300.jpg', 6.1, 0, '', 'After an attempted assassination on Ambassador Han, Inspector Lee and Detective Carter are back in action as they head to Paris to protect a French woman with knowledge of the Triads\' secret leaders. Lee also holds secret meetings with a United Nations authority, but his personal struggles with a Chinese criminal mastermind named Kenji, which reveals that it\'s Lee\'s long-lost...brother.');
INSERT INTO `movie` VALUES (67, '2012', '2009/10/10', 'https://m.media-amazon.com/images/M/MV5BMTY0MjEyODQzMF5BMl5BanBnXkFtZTcwMTczMjQ4Mg@@._V1_SX300.jpg', 5.6, 0, 'http://www.sonypictures.com/movies/2012', 'Dr. Adrian Helmsley, part of a worldwide geophysical team investigating the effect on the earth of radiation from unprecedented solar storms, learns that the earth\'s core is heating up. He warns U.S. President Thomas Wilson that the crust of the earth is becoming unstable and that without proper preparations for saving a fraction of the world\'s population, the entire race is doomed. Meanwhile, writer Jackson Curtis stumbles on the same information. While the world\'s leaders race to build \"arks\" to escape the impending cataclysm, Curtis struggles to find a way to save his family. Meanwhile, volcanic eruptions and earthquakes of unprecedented strength wreak havoc around the world.');
INSERT INTO `movie` VALUES (68, 'A Christmas Carol', '2009/11/4', 'https://m.media-amazon.com/images/M/MV5BMTM1MTI5ODU4MV5BMl5BanBnXkFtZTcwNTYyNTU4Mg@@._V1_SX300.jpg', 6.6, 0, 'http://disney.go.com/disneypictures/achristmascarol/?cmp=dcom_VAN_WDSHE_ACC_van_dcomcc__Extl', 'Miser Ebenezer Scrooge is awakened on Christmas Eve by spirits who reveal to him his own miserable existence, what opportunities he wasted in his youth, his current cruelties, and the dire fate that awaits him if he does not change his ways. Scrooge is faced with his own story of growing bitterness and meanness, and must decide what his own future will hold: death or redemption.');
INSERT INTO `movie` VALUES (69, 'Jupiter Ascending', '2015/2/4', 'https://m.media-amazon.com/images/M/MV5BMTQyNzk2MjA2NF5BMl5BanBnXkFtZTgwMjEwNzk3MjE@._V1_SX300.jpg', 5.2, 0, 'http://www.jupiterascending.com', 'In a universe where human genetic material is the most precious commodity, an impoverished young Earth woman becomes the key to strategic maneuvers and internal strife within a powerful dynasty_');
INSERT INTO `movie` VALUES (70, 'The Legend of Tarzan', '2016/6/29', 'https://m.media-amazon.com/images/M/MV5BMzY3OTI0OTcyMF5BMl5BanBnXkFtZTgwNjkxNTAwOTE@._V1_SX300.jpg', 5.5, 0, 'http://legendoftarzan.com', 'Tarzan, having acclimated to life in London, is called back to his former home in the jungle to investigate the activities at a mining encampment.');
INSERT INTO `movie` VALUES (71, 'The Chronicles of Narnia: The Lion, the Witch and the Wardrobe', '2005/12/7', 'https://m.media-amazon.com/images/M/MV5BMTc0NTUwMTU5OV5BMl5BanBnXkFtZTcwNjAwNzQzMw@@._V1_SX300.jpg', 6.7, 0, '', 'Siblings Lucy, Edmund, Susan and Peter step through a magical wardrobe and find the land of Narnia. There, the they discover a charming, once peaceful kingdom that has been plunged into eternal winter by the evil White Witch, Jadis. Aided by the wise and magnificent lion, Aslan, the children lead Narnia into a spectacular, climactic battle to be free of the Witch\'s glacial powers forever.');
INSERT INTO `movie` VALUES (72, 'X-Men: Apocalypse', '2016/5/18', 'https://m.media-amazon.com/images/M/MV5BMjU1ODM1MzYxN15BMl5BanBnXkFtZTgwOTA4NDE2ODE@._V1_SX300.jpg', 6.4, 0, 'http://www.foxmovies.com/movies/x-men-apocalypse', 'After the re-emergence of the world\'s first mutant, world-destroyer Apocalypse, the X-Men must unite to defeat his extinction level plan.');
INSERT INTO `movie` VALUES (73, 'The Dark Knight', '2008/7/16', 'https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_SX300.jpg', 8.2, 0, 'http://thedarkknight.warnerbros.com/dvdsite/', 'Batman raises the stakes in his war on crime. With the help of Lt. Jim Gordon and District Attorney Harvey Dent, Batman sets out to dismantle the remaining criminal organizations that plague the streets. The partnership proves to be effective, but they soon find themselves prey to a reign of chaos unleashed by a rising criminal mastermind known to the terrified citizens of Gotham as the Joker.');
INSERT INTO `movie` VALUES (74, 'Up', '2009/5/13', 'https://m.media-amazon.com/images/M/MV5BMTk3NDE2NzI4NF5BMl5BanBnXkFtZTgwNzE1MzEyMTE@._V1_SX300.jpg', 7.7, 0, 'http://disney.go.com/disneypictures/up/', 'Carl Fredricksen spent his entire life dreaming of exploring the globe and experiencing life to its fullest. But at age 78, life seems to have passed him by, until a twist of fate (and a persistent 8-year old Wilderness Explorer named Russell) gives him a new lease on life.');
INSERT INTO `movie` VALUES (75, 'Monsters vs Aliens', '2009/3/19', 'https://m.media-amazon.com/images/M/MV5BMjQ5YjI4MTgtMDdiYi00ZTNlLTkwZTQtMjA3NDhiOWVjZjQ2XkEyXkFqcGdeQXVyNDgyODgxNjE@._V1_SX300.jpg', 6.0, 0, 'http://www.monstersvsaliens.com/', 'When Susan Murphy is unwittingly clobbered by a meteor full of outer space gunk on her wedding day, she mysteriously grows to 49-feet-11-inches. The military jumps into action and captures Susan, secreting her away to a covert government compound. She is renamed Ginormica and placed in confinement with a ragtag group of Monsters...');
INSERT INTO `movie` VALUES (76, 'Iron Man', '2008/4/30', 'https://m.media-amazon.com/images/M/MV5BMTczNTI2ODUwOF5BMl5BanBnXkFtZTcwMTU0NTIzMw@@._V1_SX300.jpg', 7.4, 0, 'http://www.ironmanmovie.com/', 'After being held captive in an Afghan cave, billionaire engineer Tony Stark creates a unique weaponized suit of armor to fight evil.');
INSERT INTO `movie` VALUES (77, 'Hugo', '2011/11/22', 'https://m.media-amazon.com/images/M/MV5BMjAzNzk5MzgyNF5BMl5BanBnXkFtZTcwOTE4NDU5Ng@@._V1_SX300.jpg', 7.0, 0, 'http://www.hugomovie.com/', 'Hugo is an orphan boy living in the walls of a train station in 1930s Paris. He learned to fix clocks and other gadgets from his father and uncle which he puts to use keeping the train station clocks running. The only thing that he has left that connects him to his dead father is an automaton (mechanical man) that doesn\'t work without a special key which Hugo needs to find to unlock the secret he believes it contains. On his adventures, he meets with a shopkeeper, George Melies, who works in the train station and his adventure-seeking god-daughter. Hugo finds that they have a surprising connection to his father and the automaton, and he discovers it unlocks some memories the old man has buried inside regarding his past.');
INSERT INTO `movie` VALUES (78, 'Wild Wild West', '1999/6/29', 'https://m.media-amazon.com/images/M/MV5BYmYyMTc4YjItMGNhNC00OWQwLWJhMWUtNTdjZDgxMDI5MjE2L2ltYWdlXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg', 5.1, 0, '', 'Legless Southern inventor Dr. Arliss Loveless plans to rekindle the Civil War by assassinating President U.S. Grant. Only two men can stop him: gunfighter James West and master-of-disguise and inventor Artemus Gordon. The two must team up to thwart Loveless\' plans.');
INSERT INTO `movie` VALUES (79, 'The Mummy: Tomb of the Dragon Emperor', '2008/7/1', 'https://m.media-amazon.com/images/M/MV5BMTU4NDIzMDY1OV5BMl5BanBnXkFtZTcwNjQxMzk3MQ@@._V1_SX300.jpg', 5.2, 0, 'http://www.themummy.com/', 'Archaeologist Rick O\'Connell travels to China, pitting him against an emperor from the 2,000-year-old Han dynasty who\'s returned from the dead to pursue a quest for world domination. This time, O\'Connell enlists the help of his wife and son to quash the so-called \'Dragon Emperor\' and his abuse of supernatural power.');
INSERT INTO `movie` VALUES (80, 'Suicide Squad', '2016/8/2', 'https://m.media-amazon.com/images/M/MV5BMjM1OTMxNzUyM15BMl5BanBnXkFtZTgwNjYzMTIzOTE@._V1_SX300.jpg', 5.9, 0, 'http://www.suicidesquad.com/', 'From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences.');
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
