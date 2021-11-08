-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: localhost    Database: santander_adonis
-- ------------------------------------------------------
-- Server version	8.0.26-0ubuntu0.20.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adonis_schema`
--

DROP TABLE IF EXISTS `adonis_schema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adonis_schema` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `batch` int NOT NULL,
  `migration_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adonis_schema`
--

LOCK TABLES `adonis_schema` WRITE;
/*!40000 ALTER TABLE `adonis_schema` DISABLE KEYS */;
INSERT INTO `adonis_schema` VALUES (1,'database/migrations/1635975522070_roles',1,'2021-11-03 22:18:05'),(3,'database/migrations/1635975509127_users',2,'2021-11-03 22:20:20'),(4,'database/migrations/1635975728969_api_tokens',2,'2021-11-03 22:20:20'),(6,'database/migrations/1635983974533_meetings',3,'2021-11-04 00:03:11'),(7,'database/migrations/1635986298356_meeting_user',4,'2021-11-04 00:39:19'),(8,'database/migrations/1636079706681_add_admin_id_meetings',5,'2021-11-05 02:36:23');
/*!40000 ALTER TABLE `adonis_schema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_tokens`
--

DROP TABLE IF EXISTS `api_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_tokens` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_tokens_token_unique` (`token`),
  KEY `api_tokens_user_id_foreign` (`user_id`),
  CONSTRAINT `api_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_tokens`
--

LOCK TABLES `api_tokens` WRITE;
/*!40000 ALTER TABLE `api_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_user`
--

DROP TABLE IF EXISTS `meeting_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meeting_user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `meeting_id` int unsigned DEFAULT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `meeting_user_meeting_id_foreign` (`meeting_id`),
  KEY `meeting_user_user_id_foreign` (`user_id`),
  CONSTRAINT `meeting_user_meeting_id_foreign` FOREIGN KEY (`meeting_id`) REFERENCES `meetings` (`id`) ON DELETE CASCADE,
  CONSTRAINT `meeting_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_user`
--

LOCK TABLES `meeting_user` WRITE;
/*!40000 ALTER TABLE `meeting_user` DISABLE KEYS */;
INSERT INTO `meeting_user` VALUES (13,1,1,'2021-11-06 23:36:04','2021-11-06 23:36:04'),(14,1,1,'2021-11-08 01:50:17','2021-11-08 01:50:17'),(15,1,1,'2021-11-08 01:51:48','2021-11-08 01:51:48'),(16,1,1,'2021-11-08 02:02:08','2021-11-08 02:02:08'),(17,1,1,'2021-11-08 02:02:13','2021-11-08 02:02:13'),(18,1,1,'2021-11-08 02:02:17','2021-11-08 02:02:17'),(19,1,1,'2021-11-08 02:02:31','2021-11-08 02:02:31'),(20,1,1,'2021-11-08 02:02:42','2021-11-08 02:02:42'),(21,1,1,'2021-11-08 02:04:27','2021-11-08 02:04:27'),(22,1,1,'2021-11-08 02:04:29','2021-11-08 02:04:29'),(23,1,1,'2021-11-08 02:04:59','2021-11-08 02:04:59'),(24,1,1,'2021-11-08 02:05:00','2021-11-08 02:05:00'),(25,1,1,'2021-11-08 02:05:18','2021-11-08 02:05:18'),(26,1,1,'2021-11-08 02:05:20','2021-11-08 02:05:20'),(27,1,1,'2021-11-08 02:05:59','2021-11-08 02:05:59'),(28,1,1,'2021-11-08 02:06:00','2021-11-08 02:06:00'),(29,2,1,'2021-11-08 02:07:23','2021-11-08 02:07:23'),(36,4,1,'2021-11-08 02:11:36','2021-11-08 02:11:36');
/*!40000 ALTER TABLE `meeting_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings`
--

DROP TABLE IF EXISTS `meetings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meetings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `place` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `admin_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meetings_admin_id_foreign` (`admin_id`),
  CONSTRAINT `meetings_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings`
--

LOCK TABLES `meetings` WRITE;
/*!40000 ALTER TABLE `meetings` DISABLE KEYS */;
INSERT INTO `meetings` VALUES (1,'Test Meeting','Esta es una meeting de prueba','Vicente Lopez','2021-11-06 00:00:00','2021-11-04 00:07:12','2021-11-04 00:07:12',1),(2,'Creacion de meeting','Esta meeting es solo para tomar alcohol!','Vicente López','2021-11-03 00:00:00','2021-11-08 01:30:45','2021-11-08 01:30:45',1),(3,'Esta meet debe aparecer en la semana','ASDf','Pavón','2021-11-10 00:00:00','2021-11-08 01:31:33','2021-11-08 01:31:33',1),(4,'Test Meeting','adsdsaasd','Tolar Grande','2021-11-17 00:00:00','2021-11-08 02:08:27','2021-11-08 02:08:27',1);
/*!40000 ALTER TABLE `meetings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'User'),(2,'Admin');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Dante Rigoli','danterigoli02@gmail.com','$argon2id$v=19$t=3,m=4096,p=1$9d4Yr3cDHZq3wCWi/1jGRA$bSzpaVegFDfdNTjwP8UqMc4Hv2dWAmCjsmZ0HtMRndM',2,'2021-11-03 22:20:43','2021-11-03 22:20:43'),(3,'Dante Rigoli','daanterigoli@gmail.com','$argon2id$v=19$t=3,m=4096,p=1$iVuc2uecYZzrS/cV0VJ7NQ$SdT3Bd22qUaZK16vGFzQ+g8hbrvddIB48SjREl3Z5rY',NULL,'2021-11-04 03:18:52','2021-11-04 03:18:52'),(4,'Dante Rigoli','danterigoli02@gmail.coma','$argon2id$v=19$t=3,m=4096,p=1$KQPb5TnewqJhvobe9inF+Q$g5EGldqazFDwCxtrD4QNErgGm0UFqDeZP1wx/+F7GqM',NULL,'2021-11-04 03:23:18','2021-11-04 03:23:18'),(5,'Dante Rigoli','danterigoli0sad2@gmail.com','$argon2id$v=19$t=3,m=4096,p=1$SQotUWVP5CRHATaSUiaHeQ$u2QTmpEFw05IF7f4dLFneKYAud6RZdO/4MyCW917mwo',NULL,'2021-11-04 03:25:06','2021-11-04 03:25:06'),(6,'Dante Rigoli','danteriaagoli02@gmail.com','$argon2id$v=19$t=3,m=4096,p=1$5cUZN9BQOb3/aUW3R8m4UA$yBzkadcTL0gvOuFM+TavkohuEu8Uv1BEZ2sPQ1linPk',NULL,'2021-11-04 03:25:59','2021-11-04 03:25:59'),(7,'DanteRig','dantegoli02@gmail.com','$argon2id$v=19$t=3,m=4096,p=1$CcLqM6MPtVInSyGCK9XQoQ$sv1h9azul2VIrxJPQoWFxXNYXzWwC9gYXVmt86XNi7U',NULL,'2021-11-04 03:27:00','2021-11-04 03:27:00');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-08  0:04:33
