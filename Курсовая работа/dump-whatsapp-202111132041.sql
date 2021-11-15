-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: whatsapp
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `blocked_users`
--

DROP TABLE IF EXISTS `blocked_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blocked_users` (
  `id_from_users` int unsigned NOT NULL,
  `id_to_users` int unsigned NOT NULL,
  KEY `blocked_users_user_id` (`id_from_users`),
  KEY `blocked_to_users_user_id` (`id_to_users`),
  CONSTRAINT `blocked_to_users_user_id` FOREIGN KEY (`id_to_users`) REFERENCES `users` (`id`),
  CONSTRAINT `blocked_users_user_id` FOREIGN KEY (`id_from_users`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='заблокированные пользователи';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blocked_users`
--

LOCK TABLES `blocked_users` WRITE;
/*!40000 ALTER TABLE `blocked_users` DISABLE KEYS */;
INSERT INTO `blocked_users` VALUES (9,1),(1,9),(3,9);
/*!40000 ALTER TABLE `blocked_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favourites_users`
--

DROP TABLE IF EXISTS `favourites_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favourites_users` (
  `id_from_users` int unsigned NOT NULL,
  `id_to_users` int unsigned NOT NULL,
  KEY `favourites_users_user_id` (`id_from_users`),
  KEY `favourites_to_users_user_id` (`id_to_users`),
  CONSTRAINT `favourites_to_users_user_id` FOREIGN KEY (`id_to_users`) REFERENCES `users` (`id`),
  CONSTRAINT `favourites_users_user_id` FOREIGN KEY (`id_from_users`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='избранные пользователи';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favourites_users`
--

LOCK TABLES `favourites_users` WRITE;
/*!40000 ALTER TABLE `favourites_users` DISABLE KEYS */;
INSERT INTO `favourites_users` VALUES (1,2),(1,3),(1,4),(5,2),(5,3),(7,3);
/*!40000 ALTER TABLE `favourites_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_chat`
--

DROP TABLE IF EXISTS `group_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_chat` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `from_user_id` int unsigned NOT NULL COMMENT 'Ссылка на отправителя сообщения',
  `to_group_id` int unsigned NOT NULL COMMENT 'Ссылка на чат группы ',
  `body` text NOT NULL COMMENT 'Текст сообщения',
  `media_id` int unsigned DEFAULT NULL COMMENT 'ссылка на медиа',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  PRIMARY KEY (`id`),
  KEY `group_chat_media_id` (`media_id`),
  KEY `group_chat_user_id` (`from_user_id`),
  KEY `group_chat_to_group_id` (`to_group_id`),
  CONSTRAINT `group_chat_media_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `group_chat_to_group_id` FOREIGN KEY (`to_group_id`) REFERENCES `groupe` (`id`),
  CONSTRAINT `group_chat_user_id` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='список групповых чатов';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_chat`
--

LOCK TABLES `group_chat` WRITE;
/*!40000 ALTER TABLE `group_chat` DISABLE KEYS */;
INSERT INTO `group_chat` VALUES (1,1,1,'орорпо',NULL,'2021-11-13 20:25:21'),(2,2,1,'првапвр',NULL,'2021-11-13 20:25:21'),(3,3,1,'кпуып',NULL,'2021-11-13 20:25:21'),(4,1,2,'апркр',NULL,'2021-11-13 20:25:21'),(5,2,2,'апрааапопрль',NULL,'2021-11-13 20:25:21'),(6,6,2,'чвапаорап',NULL,'2021-11-13 20:25:21'),(7,1,3,'впвара',NULL,'2021-11-13 20:25:21'),(8,2,3,'одшщждш',NULL,'2021-11-13 20:25:21'),(9,5,3,'аратао',NULL,'2021-11-13 20:25:21');
/*!40000 ALTER TABLE `group_chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupe`
--

DROP TABLE IF EXISTS `groupe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groupe` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `name` varchar(255) DEFAULT NULL COMMENT 'Имя группы',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='таблица групп';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupe`
--

LOCK TABLES `groupe` WRITE;
/*!40000 ALTER TABLE `groupe` DISABLE KEYS */;
INSERT INTO `groupe` VALUES (1,'Семейный'),(2,'Любовный'),(3,'Дружеский'),(4,'Рабочий'),(5,'Рабочий 2');
/*!40000 ALTER TABLE `groupe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `filename` varchar(255) NOT NULL COMMENT 'Полный путь к файлу',
  `media_type_id` int unsigned NOT NULL COMMENT 'Ссылка на тип файла',
  `metadata` varchar(255) DEFAULT NULL COMMENT 'Метаданные файла (дополнительные параметры, переменного числа в вазисимости от типа файла)',
  `user_id` int unsigned NOT NULL COMMENT 'Ссылка на пользователя',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  PRIMARY KEY (`id`),
  KEY `media_media_types_id` (`media_type_id`),
  KEY `media_user_id` (`user_id`),
  CONSTRAINT `media_media_types_id` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`),
  CONSTRAINT `media_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Таблица медиа';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,'Класс',1,'картинка',1,'2021-11-13 20:31:38'),(2,'Атас',3,'фото',2,'2021-11-13 20:31:38'),(3,'Привет',5,'видео',3,'2021-11-13 20:31:38');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `name` varchar(255) NOT NULL COMMENT 'название типа файла',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Таблица типов медиа';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (1,'фото'),(2,'видео'),(3,'картинка'),(4,'документ'),(5,'аудио');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_chat`
--

DROP TABLE IF EXISTS `personal_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_chat` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `from_user_id` int unsigned NOT NULL COMMENT 'Ссылка на отправителя сообщения',
  `to_user_id` int unsigned NOT NULL COMMENT 'Ссылка на получателя сообщения',
  `body` text NOT NULL COMMENT 'Текст сообщения',
  `media_id` int unsigned DEFAULT NULL COMMENT 'ссылка на медиа',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  PRIMARY KEY (`id`),
  KEY `personal_chat_media_id` (`media_id`),
  KEY `messages_from_user_id` (`from_user_id`),
  KEY `messages_to_user_id` (`to_user_id`),
  CONSTRAINT `messages_from_user_id` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_to_user_id` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `personal_chat_media_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='таблица со списком личных чатов (сообщений)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_chat`
--

LOCK TABLES `personal_chat` WRITE;
/*!40000 ALTER TABLE `personal_chat` DISABLE KEYS */;
INSERT INTO `personal_chat` VALUES (1,1,2,'миачпт',1,'2021-11-13 20:32:21'),(2,1,3,'чвапар',3,'2021-11-13 20:32:21'),(3,2,3,'веео',2,'2021-11-13 20:32:21'),(4,2,5,'ыкеркыер',3,'2021-11-13 20:35:02'),(5,2,3,'керкеге',3,'2021-11-13 20:35:02');
/*!40000 ALTER TABLE `personal_chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL COMMENT 'Имя пользователя',
  `middle_name` varchar(255) DEFAULT NULL COMMENT 'отчество пользователя',
  `last_name` varchar(255) DEFAULT NULL COMMENT 'фамилия пользователя',
  `nick_name` varchar(255) DEFAULT NULL COMMENT 'ник пользователя',
  `status_id` int unsigned DEFAULT NULL COMMENT 'идентификатор статуса',
  `birthday` date NOT NULL,
  `gender` enum('M','F') NOT NULL,
  `phone` varchar(12) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `users_Status_user_id` (`status_id`),
  CONSTRAINT `users_Status_user_id` FOREIGN KEY (`status_id`) REFERENCES `users_status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='пользователи';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Юлия','Владимировна','Сотская','Juliya',1,'1984-10-31','F','555555555'),(2,'Денис','Владимирович','Тихонов','Deni',2,'1994-05-12','M','999999999'),(3,'Танечка','Тимуровна','Мусаева','Tany',1,'1993-01-25','F','888888888'),(4,'Ирина','Владимировна','Сиротенкова','Ira',3,'1988-07-15','F','444444444'),(5,'Марина','Елисеевна','Курдюкова','Mary',2,'1993-10-25','F','333333333'),(6,'Григорий','Олегович','Кантакузин','Grig',1,'1973-03-29','M','111111111'),(7,'Кира','Викторовна','Гусева','Kira',2,'2019-05-05','F','585585598'),(8,'Илья','Григорьевич','Сотсков','Ilia',1,'2019-10-06','M','132125452'),(9,'Мария','Даниловна','Воробъева','Maha',3,'1938-05-12','F','121212122'),(10,'Петр','Алексеевич','Лошкарев','Pety',2,'1944-11-01','M','132545846');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_groupe`
--

DROP TABLE IF EXISTS `users_groupe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_groupe` (
  `id_users` int unsigned DEFAULT NULL,
  `id_groupe` int unsigned DEFAULT NULL,
  KEY `users_groupe_user_id` (`id_users`),
  KEY `users_groupe_groupe_id` (`id_groupe`),
  CONSTRAINT `users_groupe_groupe_id` FOREIGN KEY (`id_groupe`) REFERENCES `groupe` (`id`),
  CONSTRAINT `users_groupe_user_id` FOREIGN KEY (`id_users`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='таблица участников групп';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_groupe`
--

LOCK TABLES `users_groupe` WRITE;
/*!40000 ALTER TABLE `users_groupe` DISABLE KEYS */;
INSERT INTO `users_groupe` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(2,1),(2,2),(2,3),(2,4),(2,5);
/*!40000 ALTER TABLE `users_groupe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_status`
--

DROP TABLE IF EXISTS `users_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_status` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `Status_text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='статус пользователя';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_status`
--

LOCK TABLES `users_status` WRITE;
/*!40000 ALTER TABLE `users_status` DISABLE KEYS */;
INSERT INTO `users_status` VALUES (1,'доступен'),(2,'занят'),(3,'на совещании'),(4,'сплю'),(5,'на занятии');
/*!40000 ALTER TABLE `users_status` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-13 20:55:35
