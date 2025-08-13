-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: bloginfo2025
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_usuario'),(22,'Can change user',6,'change_usuario'),(23,'Can delete user',6,'delete_usuario'),(24,'Can view user',6,'view_usuario'),(25,'Can add articulo',7,'add_articulo'),(26,'Can change articulo',7,'change_articulo'),(27,'Can delete articulo',7,'delete_articulo'),(28,'Can view articulo',7,'view_articulo'),(29,'Can add comentario',8,'add_comentario'),(30,'Can change comentario',8,'change_comentario'),(31,'Can delete comentario',8,'delete_comentario'),(32,'Can view comentario',8,'view_comentario');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_articulo`
--

DROP TABLE IF EXISTS `blog_articulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_articulo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `titulo` varchar(200) NOT NULL,
  `contenido` longtext NOT NULL,
  `fecha_creacion` datetime(6) NOT NULL,
  `fecha_actualizacion` datetime(6) NOT NULL,
  `imagen_portada` varchar(100) DEFAULT NULL,
  `autor_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_articulo_autor_id_bb4a651d_fk_blog_usuario_id` (`autor_id`),
  CONSTRAINT `blog_articulo_autor_id_bb4a651d_fk_blog_usuario_id` FOREIGN KEY (`autor_id`) REFERENCES `blog_usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_articulo`
--

LOCK TABLES `blog_articulo` WRITE;
/*!40000 ALTER TABLE `blog_articulo` DISABLE KEYS */;
INSERT INTO `blog_articulo` VALUES (31,'La evolución de los gráficos en videojuegos','Desde los píxeles de 8 bits hasta el ray tracing actual, los gráficos han sido clave en la experiencia gamer.','2025-08-09 20:03:06.000000','2025-08-09 20:03:06.000000',NULL,1),(32,'Top 5 RPGs de la última década','Los juegos de rol han marcado tendencia con historias profundas y mundos abiertos. Descubre los mejores.','2025-08-09 20:03:06.000000','2025-08-09 20:03:06.000000',NULL,1),(33,'¿Por qué Minecraft sigue siendo popular?','La creatividad y la comunidad mantienen a Minecraft como uno de los títulos más jugados del mundo.','2025-08-09 20:03:06.000000','2025-08-09 20:03:06.000000',NULL,1),(34,'El impacto de los eSports en la cultura gamer','Los deportes electrónicos han transformado el gaming en un fenómeno global con millones de seguidores.','2025-08-09 20:03:06.000000','2025-08-09 20:03:06.000000',NULL,1),(35,'Nintendo Switch: innovación portátil','La consola híbrida de Nintendo revolucionó la forma de jugar en casa y en movimiento.','2025-08-09 20:03:06.000000','2025-08-09 20:03:06.000000',NULL,1),(36,'La historia de The Legend of Zelda','Una saga que ha marcado generaciones con aventuras épicas y mundos mágicos.','2025-08-09 20:03:06.000000','2025-08-09 20:03:06.000000',NULL,1),(37,'Los mejores juegos indie de 2025','Los desarrolladores independientes sorprenden con propuestas originales y jugabilidad única.','2025-08-09 20:03:06.000000','2025-08-09 20:03:06.000000',NULL,1),(38,'¿Qué esperar de GTA VI?','Rumores, filtraciones y expectativas sobre el próximo gran lanzamiento de Rockstar Games.','2025-08-09 20:03:06.000000','2025-08-09 20:03:06.000000',NULL,1),(39,'La importancia de la narrativa en los videojuegos','Historias envolventes y personajes memorables hacen que los juegos sean más que solo entretenimiento.','2025-08-09 20:03:06.000000','2025-08-09 20:03:06.000000',NULL,1),(40,'El regreso de los juegos retro','La nostalgia impulsa remakes y colecciones de clásicos para nuevas generaciones.','2025-08-09 20:03:06.000000','2025-08-09 20:03:06.000000',NULL,1),(41,'PlayStation vs Xbox: la batalla continúa','Comparativa de consolas, exclusivos y servicios en la guerra por el mercado gamer.','2025-08-09 20:03:06.000000','2025-08-09 20:03:06.000000',NULL,1),(42,'Cómo elegir tu primer PC gamer','Consejos sobre hardware, periféricos y presupuesto para iniciarte en el gaming de PC.','2025-08-09 20:03:06.000000','2025-08-09 20:03:06.000000',NULL,1),(43,'La revolución de la realidad virtual','VR promete experiencias inmersivas y nuevas formas de jugar.','2025-08-09 20:03:06.000000','2025-08-09 20:03:06.000000',NULL,1),(44,'Fortnite: más que un battle royale','Eventos, colaboraciones y una comunidad activa mantienen a Fortnite en la cima.','2025-08-09 20:03:06.000000','2025-08-09 20:03:06.000000',NULL,1),(45,'El fenómeno de Among Us','Un juego simple que conquistó a millones con su mecánica de deducción social.','2025-08-09 20:03:06.000000','2025-08-09 20:03:06.000000',NULL,1),(46,'Los mejores juegos cooperativos para jugar con amigos','Opciones ideales para divertirse en grupo y fortalecer lazos.','2025-08-09 20:03:06.000000','2025-08-09 20:03:06.000000',NULL,1),(47,'La música en los videojuegos','Bandas sonoras que han quedado en la memoria de los jugadores.','2025-08-09 20:03:06.000000','2025-08-09 20:03:06.000000',NULL,1),(48,'Cyberpunk 2077: de la polémica al éxito','El camino de CD Projekt Red tras un lanzamiento complicado y su redención.','2025-08-09 20:03:06.000000','2025-08-09 20:03:06.000000',NULL,1),(49,'El rol de las mujeres en la industria gamer','Desarrolladoras, jugadoras y personajes femeninos que inspiran.','2025-08-09 20:03:06.000000','2025-08-09 20:03:06.000000',NULL,1),(50,'Cómo los videojuegos ayudan al aprendizaje','Gamificación y títulos educativos que potencian habilidades.','2025-08-09 20:03:06.000000','2025-08-09 20:03:06.000000',NULL,1),(51,'La evolución de los controles de juego','Desde joysticks clásicos hasta mandos adaptativos y VR.','2025-08-09 20:03:06.000000','2025-08-09 20:03:06.000000',NULL,1),(52,'Pokémon: más de 25 años atrapando criaturas','La franquicia sigue creciendo con nuevos juegos y generaciones.','2025-08-09 20:03:06.000000','2025-08-09 20:03:06.000000',NULL,1),(53,'El auge de los juegos móviles','Smartphones y tablets han democratizado el acceso al gaming.','2025-08-09 20:03:06.000000','2025-08-09 20:03:06.000000',NULL,1),(54,'Los mejores juegos de terror para valientes','Títulos que desafían tus nervios y te sumergen en atmósferas inquietantes.','2025-08-09 20:03:06.000000','2025-08-09 20:03:06.000000',NULL,1),(55,'La comunidad modder y su impacto','Mods que mejoran, transforman y extienden la vida útil de los juegos.','2025-08-09 20:03:06.000000','2025-08-09 20:03:06.000000',NULL,1),(56,'El futuro del cloud gaming','Jugar sin consola ni PC potente gracias a la nube.','2025-08-09 20:03:06.000000','2025-08-09 20:03:06.000000',NULL,1),(57,'Animal Crossing: el refugio virtual','Un juego que ofrece paz, creatividad y comunidad en tiempos difíciles.','2025-08-09 20:03:06.000000','2025-08-09 20:03:06.000000',NULL,1),(58,'La importancia de la accesibilidad en videojuegos','Opciones y tecnologías para que todos puedan jugar.','2025-08-09 20:03:06.000000','2025-08-09 20:03:06.000000',NULL,1),(59,'Los mejores juegos de carreras de 2025','Simulación, arcade y adrenalina en los títulos más destacados del género.','2025-08-09 20:03:06.000000','2025-08-09 20:03:06.000000',NULL,1),(60,'Cómo los videojuegos inspiran otras artes','Cine, música y literatura influenciados por el mundo gamer.','2025-08-09 20:03:06.000000','2025-08-09 20:03:06.000000',NULL,1),(61,'La evolución de los gráficos en videojuegos','Desde los píxeles de 8 bits hasta el ray tracing actual, los gráficos han sido clave en la experiencia gamer.','2025-08-09 20:03:31.000000','2025-08-09 20:03:31.000000',NULL,1),(62,'Top 5 RPGs de la última década','Los juegos de rol han marcado tendencia con historias profundas y mundos abiertos. Descubre los mejores.','2025-08-09 20:03:31.000000','2025-08-09 20:03:31.000000',NULL,1),(63,'¿Por qué Minecraft sigue siendo popular?','La creatividad y la comunidad mantienen a Minecraft como uno de los títulos más jugados del mundo.','2025-08-09 20:03:31.000000','2025-08-09 20:03:31.000000',NULL,1),(64,'El impacto de los eSports en la cultura gamer','Los deportes electrónicos han transformado el gaming en un fenómeno global con millones de seguidores.','2025-08-09 20:03:31.000000','2025-08-09 20:03:31.000000',NULL,1),(65,'Nintendo Switch: innovación portátil','La consola híbrida de Nintendo revolucionó la forma de jugar en casa y en movimiento.','2025-08-09 20:03:31.000000','2025-08-09 20:03:31.000000',NULL,1),(66,'La historia de The Legend of Zelda','Una saga que ha marcado generaciones con aventuras épicas y mundos mágicos.','2025-08-09 20:03:31.000000','2025-08-09 20:03:31.000000',NULL,1),(67,'Los mejores juegos indie de 2025','Los desarrolladores independientes sorprenden con propuestas originales y jugabilidad única.','2025-08-09 20:03:31.000000','2025-08-09 20:03:31.000000',NULL,1),(68,'¿Qué esperar de GTA VI?','Rumores, filtraciones y expectativas sobre el próximo gran lanzamiento de Rockstar Games.','2025-08-09 20:03:31.000000','2025-08-09 20:03:31.000000',NULL,1),(69,'La importancia de la narrativa en los videojuegos','Historias envolventes y personajes memorables hacen que los juegos sean más que solo entretenimiento.','2025-08-09 20:03:31.000000','2025-08-09 20:03:31.000000',NULL,1),(70,'El regreso de los juegos retro','La nostalgia impulsa remakes y colecciones de clásicos para nuevas generaciones.','2025-08-09 20:03:31.000000','2025-08-09 20:03:31.000000',NULL,1),(71,'PlayStation vs Xbox: la batalla continúa','Comparativa de consolas, exclusivos y servicios en la guerra por el mercado gamer.','2025-08-09 20:03:31.000000','2025-08-09 20:03:31.000000',NULL,1),(72,'Cómo elegir tu primer PC gamer','Consejos sobre hardware, periféricos y presupuesto para iniciarte en el gaming de PC.','2025-08-09 20:03:31.000000','2025-08-09 20:03:31.000000',NULL,1),(73,'La revolución de la realidad virtual','VR promete experiencias inmersivas y nuevas formas de jugar.','2025-08-09 20:03:31.000000','2025-08-09 20:03:31.000000',NULL,1),(74,'Fortnite: más que un battle royale','Eventos, colaboraciones y una comunidad activa mantienen a Fortnite en la cima.','2025-08-09 20:03:31.000000','2025-08-09 20:03:31.000000',NULL,1),(75,'El fenómeno de Among Us','Un juego simple que conquistó a millones con su mecánica de deducción social.','2025-08-09 20:03:31.000000','2025-08-09 20:03:31.000000',NULL,1),(76,'Los mejores juegos cooperativos para jugar con amigos','Opciones ideales para divertirse en grupo y fortalecer lazos.','2025-08-09 20:03:31.000000','2025-08-09 20:03:31.000000',NULL,1),(77,'La música en los videojuegos','Bandas sonoras que han quedado en la memoria de los jugadores.','2025-08-09 20:03:31.000000','2025-08-09 20:03:31.000000',NULL,1),(78,'Cyberpunk 2077: de la polémica al éxito','El camino de CD Projekt Red tras un lanzamiento complicado y su redención.','2025-08-09 20:03:31.000000','2025-08-09 20:03:31.000000',NULL,1),(79,'El rol de las mujeres en la industria gamer','Desarrolladoras, jugadoras y personajes femeninos que inspiran.','2025-08-09 20:03:31.000000','2025-08-09 20:03:31.000000',NULL,1),(80,'Cómo los videojuegos ayudan al aprendizaje','Gamificación y títulos educativos que potencian habilidades.','2025-08-09 20:03:31.000000','2025-08-09 20:03:31.000000',NULL,1),(81,'La evolución de los controles de juego','Desde joysticks clásicos hasta mandos adaptativos y VR.','2025-08-09 20:03:31.000000','2025-08-09 20:03:31.000000',NULL,1),(82,'Pokémon: más de 25 años atrapando criaturas','La franquicia sigue creciendo con nuevos juegos y generaciones.','2025-08-09 20:03:31.000000','2025-08-09 20:03:31.000000',NULL,1),(83,'El auge de los juegos móviles','Smartphones y tablets han democratizado el acceso al gaming.','2025-08-09 20:03:31.000000','2025-08-09 20:03:31.000000',NULL,1),(84,'Los mejores juegos de terror para valientes','Títulos que desafían tus nervios y te sumergen en atmósferas inquietantes.','2025-08-09 20:03:31.000000','2025-08-09 20:03:31.000000',NULL,1),(85,'La comunidad modder y su impacto','Mods que mejoran, transforman y extienden la vida útil de los juegos.','2025-08-09 20:03:31.000000','2025-08-09 20:03:31.000000',NULL,1),(86,'El futuro del cloud gaming','Jugar sin consola ni PC potente gracias a la nube.','2025-08-09 20:03:31.000000','2025-08-09 20:03:31.000000',NULL,1),(87,'Animal Crossing: el refugio virtual','Un juego que ofrece paz, creatividad y comunidad en tiempos difíciles.','2025-08-09 20:03:31.000000','2025-08-09 20:03:31.000000',NULL,1),(88,'La importancia de la accesibilidad en videojuegos','Opciones y tecnologías para que todos puedan jugar.','2025-08-09 20:03:31.000000','2025-08-09 20:03:31.000000',NULL,1),(89,'Los mejores juegos de carreras de 2025','Simulación, arcade y adrenalina en los títulos más destacados del género.','2025-08-09 20:03:31.000000','2025-08-09 20:03:31.000000',NULL,1),(90,'Cómo los videojuegos inspiran otras artes','Cine, música y literatura influenciados por el mundo gamer.','2025-08-09 20:03:31.000000','2025-08-11 01:01:48.989388','portadas/133928416715936369_WObi2jQ.jpg',1),(91,'dsdsada','dsdsadsad','2025-08-12 20:40:02.944740','2025-08-12 20:40:02.944757','portadas/133981315727821070.jpg',2);
/*!40000 ALTER TABLE `blog_articulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_comentario`
--

DROP TABLE IF EXISTS `blog_comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_comentario` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha_creacion` datetime(6) NOT NULL,
  `contenido` longtext NOT NULL,
  `articulo_id` bigint NOT NULL,
  `autor_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_comentario_articulo_id_e8382bb5_fk_blog_articulo_id` (`articulo_id`),
  KEY `blog_comentario_autor_id_37f1b3c2_fk_blog_usuario_id` (`autor_id`),
  CONSTRAINT `blog_comentario_articulo_id_e8382bb5_fk_blog_articulo_id` FOREIGN KEY (`articulo_id`) REFERENCES `blog_articulo` (`id`),
  CONSTRAINT `blog_comentario_autor_id_37f1b3c2_fk_blog_usuario_id` FOREIGN KEY (`autor_id`) REFERENCES `blog_usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_comentario`
--

LOCK TABLES `blog_comentario` WRITE;
/*!40000 ALTER TABLE `blog_comentario` DISABLE KEYS */;
INSERT INTO `blog_comentario` VALUES (1,'2025-08-13 02:23:50.714220','probanfo',31,2),(2,'2025-08-13 02:23:58.706734','dgfgfgf',31,2),(3,'2025-08-13 02:24:22.124377','4535355',31,2);
/*!40000 ALTER TABLE `blog_comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_usuario`
--

DROP TABLE IF EXISTS `blog_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_usuario` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `email` varchar(254) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `es_colaborador` tinyint(1) NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_usuario`
--

LOCK TABLES `blog_usuario` WRITE;
/*!40000 ALTER TABLE `blog_usuario` DISABLE KEYS */;
INSERT INTO `blog_usuario` VALUES (1,'pbkdf2_sha256$1000000$OM9JZVKXSJU9ufhbHaK2mu$MLLPa7evC9IheecmhxsCi1lfhAsQHqfGRfqPhvPQdRk=','2025-08-13 00:51:08.354946',1,'admin','','',1,1,'2025-08-09 23:03:01.024234','','','admin@admin.com','2000-01-01',0,'usuarios/usuario_default.png'),(2,'pbkdf2_sha256$1000000$ZdK8gITF6uAXIy50udrEu6$1yl0ewjpmSHpIzJfFdUWNgcQQVFk9PDWQQaP2nMOuLc=','2025-08-13 15:28:54.239530',0,'lopezezequiel','','',0,1,'2025-08-09 23:06:30.859320','Ezequiel','Lopez','lopezezequiel.09@gmail.com','1991-07-01',0,'usuarios/usuario_default.png'),(3,'pbkdf2_sha256$1000000$p7uIDD9JdkpiWmlaNpHhwf$SVWn+PsH2VW506ugxQAgpCXkyTAV5O6nz6wD6lIP2gI=',NULL,0,'camilaonosky','','',0,1,'2025-08-11 00:32:32.006476','Camila','Onosky','camilaonosky@gmail.com','2001-06-29',0,'usuarios/usuario_default.png');
/*!40000 ALTER TABLE `blog_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_usuario_groups`
--

DROP TABLE IF EXISTS `blog_usuario_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_usuario_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `usuario_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_usuario_groups_usuario_id_group_id_dcb5eda9_uniq` (`usuario_id`,`group_id`),
  KEY `blog_usuario_groups_group_id_c7cb358c_fk_auth_group_id` (`group_id`),
  CONSTRAINT `blog_usuario_groups_group_id_c7cb358c_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `blog_usuario_groups_usuario_id_85628879_fk_blog_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `blog_usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_usuario_groups`
--

LOCK TABLES `blog_usuario_groups` WRITE;
/*!40000 ALTER TABLE `blog_usuario_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_usuario_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_usuario_user_permissions`
--

DROP TABLE IF EXISTS `blog_usuario_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_usuario_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `usuario_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_usuario_user_permis_usuario_id_permission_id_718ea11b_uniq` (`usuario_id`,`permission_id`),
  KEY `blog_usuario_user_pe_permission_id_309166ae_fk_auth_perm` (`permission_id`),
  CONSTRAINT `blog_usuario_user_pe_permission_id_309166ae_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `blog_usuario_user_pe_usuario_id_0eebada8_fk_blog_usua` FOREIGN KEY (`usuario_id`) REFERENCES `blog_usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_usuario_user_permissions`
--

LOCK TABLES `blog_usuario_user_permissions` WRITE;
/*!40000 ALTER TABLE `blog_usuario_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_usuario_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_blog_usuario_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_blog_usuario_id` FOREIGN KEY (`user_id`) REFERENCES `blog_usuario` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-08-11 01:01:48.992681','90','Cómo los videojuegos inspiran otras artes',2,'[{\"changed\": {\"fields\": [\"Imagen portada\"]}}]',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(7,'blog','articulo'),(8,'blog','comentario'),(6,'blog','usuario'),(4,'contenttypes','contenttype'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-08-09 23:01:24.704802'),(2,'contenttypes','0002_remove_content_type_name','2025-08-09 23:01:24.804120'),(3,'auth','0001_initial','2025-08-09 23:01:25.038803'),(4,'auth','0002_alter_permission_name_max_length','2025-08-09 23:01:25.097785'),(5,'auth','0003_alter_user_email_max_length','2025-08-09 23:01:25.102901'),(6,'auth','0004_alter_user_username_opts','2025-08-09 23:01:25.107309'),(7,'auth','0005_alter_user_last_login_null','2025-08-09 23:01:25.112240'),(8,'auth','0006_require_contenttypes_0002','2025-08-09 23:01:25.115668'),(9,'auth','0007_alter_validators_add_error_messages','2025-08-09 23:01:25.120034'),(10,'auth','0008_alter_user_username_max_length','2025-08-09 23:01:25.124818'),(11,'auth','0009_alter_user_last_name_max_length','2025-08-09 23:01:25.129112'),(12,'auth','0010_alter_group_name_max_length','2025-08-09 23:01:25.138927'),(13,'auth','0011_update_proxy_permissions','2025-08-09 23:01:25.145248'),(14,'auth','0012_alter_user_first_name_max_length','2025-08-09 23:01:25.149890'),(15,'blog','0001_initial','2025-08-09 23:01:25.616408'),(16,'admin','0001_initial','2025-08-09 23:01:25.741242'),(17,'admin','0002_logentry_remove_auto_add','2025-08-09 23:01:25.748549'),(18,'admin','0003_logentry_add_action_flag_choices','2025-08-09 23:01:25.755692'),(19,'sessions','0001_initial','2025-08-09 23:01:25.795107');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('nrbw7vdl5p37kp0m8y36fzoc2s9d1u7z','.eJxVjDsOwjAQBe_iGlnYjn-U9DlDtN5d4wCypTipEHeHSCmgfTPzXmKCbS3T1nmZZhIXocXpd0uAD647oDvUW5PY6rrMSe6KPGiXYyN-Xg_376BAL9-aA5hg2RkPiQwabb3DiN6FBF57QA6Kz2ogp8C4PHC0FDPHGFLWUWvx_gDpQzfz:1umDPK:8rn0UNTU0mJcZfWVO6oe5pIVNCf-fBa4WZIDiYFXhGU','2025-08-27 15:28:54.246637');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-13 17:14:18
