-- Establecer la zona horaria para la sesión actual
SET time_zone = 'America/Mexico_City';

-- Crear la base de datos si no existe
CREATE DATABASE IF NOT EXISTS `db_sia` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

-- Usar la base de datos recién creada
USE `db_sia`;


DROP TABLE IF EXISTS `Marca`;


CREATE TABLE `Marca` (
  `m_id` int NOT NULL AUTO_INCREMENT,
  `m_nombre` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




INSERT INTO `Marca` VALUES (3,'La Costeña'),(6,'Del Valle'),(9,'Lipton'),(11,'Olé'),(12,'Starbucks'),(15,'Fud'),(17,'Bachoco'),(19,'Bimbo'),(26,'A'),(32,'Test'),(33,'Kellogs');


DROP TABLE IF EXISTS `UnidadMedida`;


CREATE TABLE `UnidadMedida` (
  `um_id` varchar(5) NOT NULL,
  `um_nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`um_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO `UnidadMedida` VALUES ('bag','bolsas'),('box','cajas'),('btl','botellas'),('cL','centilitros'),('cm','centímetros'),('cn','latas'),('cup','tazas'),('dL','decilitros'),('dz','docena'),('fl_oz','onzas fluidas'),('g','gramos'),('gal','galones'),('jar','frascos'),('Kg','Kilogramos'),('L','litros'),('lb','libras'),('m','metros'),('mg','miligramos'),('mL','mililitros'),('mm','milímetros'),('oz','onzas'),('p','paquetes'),('pt','pintas'),('qt','cuartos'),('t','toneladas'),('Tbsp','cucharadas'),('tsp','cucharaditas'),('U','Unidad');


DROP TABLE IF EXISTS `Usuario`;


CREATE TABLE `Usuario` (
  `u_id` varchar(20) NOT NULL,
  `u_nombre` varchar(40) DEFAULT NULL,
  `u_apellidos` varchar(40) DEFAULT NULL,
  `u_email` varchar(50) DEFAULT NULL,
  `u_pass` varchar(64) DEFAULT NULL,
  `u_rol` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




INSERT INTO `Usuario` VALUES ('augustgm','Augusto','Maxil','augustogomezmaxil2003@gmail.com','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4',NULL),('diegotg','Diego','Tomé','dgtome@gmail.com','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5',NULL),('dsfasfsf','dddds','testtt','testing@gmail.com','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4',NULL),('ElRoger','roger','hernandez','roger@gmail.com','0fd9cd5e3a94e33faed845226f367d386a3906d4a014afae6c50024fcbf91e0b',NULL),('Jacqui','Jacqueline','Villa Ascensio','jacquivilla02@gmail.com','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5',NULL),('Luiss','Luis Angel','Cruz García','lacgg24@gmail.com','31e0234dfbe087eaa7a81122b03697f78eaff8aefdb99d90caf1dc8ec565d092',NULL),('luit','Luis','Cruz','0d9as@gmail.com','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4',NULL),('Luit2','Luis','Cruz','lajlsdl@gmail.com','38c4da5c0188b1e50ae57b0bab851d3dbe1b10cef369541ae47eb0b8b87df722',NULL),('luit3','aslkda','lkasdl','lñasl@gmal.com','31e0234dfbe087eaa7a81122b03697f78eaff8aefdb99d90caf1dc8ec565d092',NULL),('ManejadorEventos','Event','Handler','','',1),('marcs','Marian ','Gómez Cepeda','marcd2003@gmail.com','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5',NULL),('SAdmin','Giselle','Hernandez','LACG24@outlook.com','38f015a3d771e6f0854989ff3a0f4051efaece727cc42be1dab1e514022bbb42',1),('testval','validate','ahhhh','august@gmail.com','91f907d7671ca7fa4e6e27841c0d427fc7b83da3342a8bb232841bc572ff921e',NULL),('usertest','Usuario','ussss','testign@gmail.com','38083c7ee9121e17401883566a148aa5c2e2d55dc53bc4a94a026517dbff3c6b',NULL),('yvesfonsec','yvesss','fonsec lopez','yvesaahh@gmail.com','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4',NULL);




DROP TABLE IF EXISTS `Alimento`;


CREATE TABLE `Alimento` (
  `a_id` int NOT NULL AUTO_INCREMENT,
  `a_nombre` varchar(30) DEFAULT NULL,
  `a_cantidad` decimal(13,3) DEFAULT NULL,
  `a_stock` int DEFAULT NULL,
  `a_fechaSalida` date DEFAULT NULL,
  `a_fechaEntrada` date DEFAULT NULL,
  `a_fechaCaducidad` date DEFAULT NULL,
  `um_id` varchar(4) DEFAULT NULL,
  `m_id` int DEFAULT NULL,
  PRIMARY KEY (`a_id`),
  KEY `um_id` (`um_id`),
  KEY `m_id` (`m_id`),
  CONSTRAINT `Alimento_ibfk_1` FOREIGN KEY (`um_id`) REFERENCES `UnidadMedida` (`um_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Alimento_ibfk_2` FOREIGN KEY (`m_id`) REFERENCES `Marca` (`m_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=270 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



INSERT INTO `Alimento` VALUES (172,'Té Verde',600.000,50,NULL,'2024-05-17','2027-05-07','mL',9),(173,'Té Negro',600.000,50,NULL,'2024-05-17','2027-05-07','mL',9),(174,'Té Negro Durazno',600.000,50,NULL,'2024-05-17','2027-05-07','mL',9),(175,'Café',550.000,59,NULL,'2024-05-17','2027-05-07','mL',11),(176,'Café Macchiato',550.000,50,NULL,'2024-05-17','2027-05-07','L',11),(177,'Jamón',680.000,1001,NULL,'2024-05-17','2028-05-11','g',NULL),(178,'Huevos',20.000,0,NULL,'2024-05-17','2022-05-06','dz',17),(179,'Jamón',20.000,1,NULL,'2024-05-17','2022-05-06','g',15),(180,'Pan',680.000,40000,NULL,'2024-05-17','2100-08-10','g',19),(181,'Pan integral',680.000,40000,NULL,'2024-05-17','2100-08-10','g',19),(182,'Pan Integral',200.000,39,NULL,'2024-05-17','2024-05-26','g',19),(183,'Té Negro Durazno',2.000,5,NULL,'2024-05-17',NULL,'g',NULL),(185,'Pan Integral',13.000,1,NULL,'2024-05-17',NULL,'g',NULL),(189,'Huevos Blancos',20.000,21,NULL,'2024-05-18','2024-05-29','dz',17),(190,'Huevos',20.000,0,NULL,'2024-05-18','2024-05-30','dz',17),(191,'Huevos',20.000,0,NULL,'2024-05-18','2024-05-31','dz',17),(192,'Pan',680.000,15,NULL,'2024-05-18','2024-06-02','g',19),(193,'Té Negro',600.000,23,NULL,'2024-05-18','2024-05-27','mL',9),(194,'Té Negro',600.000,23,NULL,'2024-05-18','2024-05-27','mL',9),(196,'Té Negro Manzana',300.000,50,NULL,'2024-05-20',NULL,'g',NULL),(197,'Té Negro Manzana',300.000,50,NULL,'2024-05-20',NULL,'g',NULL),(198,'Té Negro Manzana',300.000,50,NULL,'2024-05-20',NULL,'g',NULL),(199,'Café Macchiato',400.000,20,NULL,'2024-05-20',NULL,'g',NULL),(200,'Huevos',550.000,0,'2024-05-24','2024-05-20','2027-05-07','g',NULL),(201,'Café Macchiato',400.000,10,NULL,'2024-05-20',NULL,'g',NULL),(202,'Café Macchiato',400.000,10,NULL,'2024-05-20',NULL,'g',NULL),(203,'Café Macchiato',400.000,7,'2024-05-27','2024-05-20',NULL,'g',NULL),(204,'Café Macchiato',400.000,10,NULL,'2024-05-20',NULL,'g',NULL),(212,'Atun Robalo',600.000,49,'2024-05-27','2024-05-27',NULL,'mg',NULL),(213,'Atun Robalo',600.000,46,'2024-05-27','2024-05-20','2024-05-07','mg',3),(214,'Café Macchiato',400.000,10,NULL,'2024-05-20','2027-08-19','g',NULL),(228,'Café Macchiato2',550.000,10,NULL,'2024-05-21','2027-08-19','mL',12),(231,'Té Negro Manzana',550.000,20,NULL,'2024-05-21','2026-05-24','g',12),(232,'Café Macchiato',550.000,50,NULL,'2024-05-21',NULL,'g',NULL),(245,'Robaladas',15.000,1,NULL,'2024-05-22','2025-01-01','g',19),(246,'Robaladas de nuez',600.000,2,NULL,'2024-05-22','2025-01-01','g',19),(247,'Robaladas marmoleadas',600.000,12,NULL,'2024-05-22','2024-05-23','g',19),(259,'Expresso',550.000,13,NULL,'2024-05-27','2024-05-09','mL',NULL),(260,'Latte',1.000,50,NULL,'2024-05-23','2024-05-24','cup',NULL),(261,'Manzana',100.000,20,NULL,'2024-05-23','2024-05-24','g',NULL),(268,'Cimimini',389.000,5,'2024-05-27','2024-05-27','2024-09-20','g',33),(269,'Pan Multigrano',1000.000,30,NULL,'2024-05-29','2024-05-31','g',19);




DROP TABLE IF EXISTS `UsuarioAlimento`;


CREATE TABLE `UsuarioAlimento` (
  `ua_id` int NOT NULL AUTO_INCREMENT,
  `u_id` varchar(20) DEFAULT NULL,
  `a_id` int DEFAULT NULL,
  `ua_cantidad` int DEFAULT NULL,
  `ua_accion` varchar(10) DEFAULT NULL,
  `ua_fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`ua_id`),
  KEY `u_id` (`u_id`),
  KEY `a_id` (`a_id`),
  CONSTRAINT `UsuarioAlimento_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `Usuario` (`u_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `UsuarioAlimento_ibfk_2` FOREIGN KEY (`a_id`) REFERENCES `Alimento` (`a_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO `UsuarioAlimento` VALUES (9,NULL,NULL,20,'Add','2024-04-19 20:53:31'),(10,NULL,NULL,50,'Add','2024-04-19 20:53:31'),(11,NULL,NULL,20,'Add','2024-04-19 20:53:31'),(12,NULL,NULL,10,'Reduce','2024-04-19 20:53:31'),(13,NULL,NULL,20,'Update','2024-04-19 20:53:31'),(16,'ManejadorEventos',NULL,2,'Delete','2024-04-19 23:05:20'),(17,NULL,NULL,20,'Add',NULL),(22,NULL,NULL,10,'Add',NULL),(23,'luit',NULL,51,'Add','2024-05-22 21:51:32'),(24,'luit',NULL,14,'Add','2024-05-22 21:51:36'),(25,'luit',NULL,10,'Reduce','2024-05-22 21:52:00'),(26,'luit',NULL,1,'Add','2024-05-22 21:52:49'),(27,'luit',NULL,4,'Reduce','2024-05-22 21:52:56'),(28,'luit',189,21,'Update','2024-05-22 22:11:45'),(29,'luit',NULL,1,'Add','2024-05-23 01:14:11'),(30,'luit',NULL,1,'Update','2024-05-23 01:19:10'),(31,'luit',NULL,1,'Add','2024-05-23 01:36:27'),(32,'luit',NULL,1,'Add','2024-05-23 01:36:36'),(33,'luit',NULL,1,'Add','2024-05-23 01:37:01'),(34,'luit',NULL,1,'Add','2024-05-23 01:37:25'),(35,'luit',NULL,1,'Add','2024-05-23 01:38:33'),(36,'luit',NULL,2,'Update','2024-05-23 01:38:47'),(37,'luit',NULL,2,'Add','2024-05-23 01:39:09'),(38,'luit',NULL,1,'Add','2024-05-23 01:47:30'),(39,'luit',NULL,1,'Add','2024-05-23 01:49:29'),(40,'luit',NULL,1,'Add','2024-05-23 01:50:06'),(41,'luit',NULL,1,'Add','2024-05-23 01:50:12'),(42,'luit',NULL,1,'Add','2024-05-23 01:54:47'),(43,'luit',NULL,1,'Add','2024-05-23 01:54:47'),(44,'luit',NULL,1,'Add','2024-05-23 01:54:47'),(45,'luit',NULL,1,'Add','2024-05-23 01:54:47'),(46,'luit',NULL,1,'Add','2024-05-23 01:54:50'),(47,'luit',NULL,1,'Add','2024-05-23 02:00:32'),(48,'luit',NULL,1,'Add','2024-05-23 02:00:45'),(49,'luit',NULL,1,'Add','2024-05-23 02:00:45'),(50,'luit',NULL,2,'Reduce','2024-05-23 02:04:39'),(51,'luit',NULL,4,'Add','2024-05-23 02:04:39'),(52,'luit',NULL,10,'Update','2024-05-23 02:32:53'),(53,NULL,NULL,11,'Update','2024-05-23 14:26:18'),(54,NULL,NULL,10,'Update','2024-05-23 14:27:48'),(55,NULL,NULL,10,'Update','2024-05-23 14:28:26'),(56,NULL,NULL,10,'Update','2024-05-23 14:34:15'),(57,NULL,NULL,11,'Update','2024-05-23 15:05:09'),(58,NULL,NULL,13,'Update','2024-05-23 15:08:17'),(59,NULL,NULL,13,'Update','2024-05-23 15:09:01'),(60,NULL,NULL,15,'Update','2024-05-23 15:09:26'),(61,NULL,NULL,13,'Update','2024-05-23 15:14:22'),(62,NULL,NULL,23,'Update','2024-05-23 18:22:20'),(63,NULL,NULL,13,'Update','2024-05-23 18:28:29'),(64,NULL,NULL,31,'Update','2024-05-23 18:28:29'),(65,'luit',NULL,1,'Update','2024-05-23 21:30:34'),(66,NULL,NULL,10,'Add','2024-05-23 21:42:37'),(67,NULL,259,10,'Update','2024-05-23 21:54:09'),(68,NULL,260,50,'Update','2024-05-23 21:54:49'),(69,NULL,261,20,'Update','2024-05-23 21:56:24'),(70,NULL,NULL,2,'Update','2024-05-23 22:08:36'),(71,NULL,NULL,352,'Update','2024-05-23 22:09:05'),(72,NULL,NULL,11,'Update','2024-05-24 02:40:21'),(73,NULL,NULL,11,'Update','2024-05-24 02:47:53'),(74,NULL,NULL,NULL,'Reduce','2024-05-24 17:09:33'),(75,NULL,NULL,NULL,'Reduce','2024-05-24 17:09:59'),(76,NULL,NULL,NULL,'Reduce','2024-05-24 17:10:42'),(77,NULL,NULL,NULL,'Reduce','2024-05-24 17:36:41'),(78,NULL,NULL,1,'Update','2024-05-24 17:37:43'),(79,NULL,NULL,1,'Update','2024-05-24 17:37:55'),(80,NULL,NULL,2,'Update','2024-05-24 17:38:03'),(81,'luit',NULL,NULL,'Reduce','2024-05-24 17:39:10'),(82,'luit',NULL,NULL,'Reduce','2024-05-24 17:40:56'),(83,'luit',NULL,NULL,'Reduce','2024-05-24 17:41:47'),(84,NULL,NULL,1,'Add','2024-05-24 17:43:25'),(85,NULL,NULL,0,'Reduce','2024-05-24 17:43:25'),(86,NULL,NULL,1,'Reduce','2024-05-24 17:43:28'),(87,'luit',NULL,NULL,'Reduce','2024-05-24 17:46:08'),(88,'luit',NULL,50,'Reduce','2024-05-24 17:46:56'),(89,NULL,NULL,1,'Update','2024-05-24 17:47:22'),(90,'luit',NULL,50,'Reduce','2024-05-24 17:47:29'),(91,NULL,NULL,49,'Add','2024-05-24 17:47:51'),(92,NULL,NULL,20,'Add','2024-05-24 17:47:59'),(93,NULL,NULL,NULL,'Reduce','2024-05-24 17:51:12'),(94,NULL,NULL,NULL,'Reduce','2024-05-24 17:51:16'),(95,NULL,NULL,NULL,'Reduce','2024-05-24 17:51:36'),(96,NULL,NULL,NULL,'Reduce','2024-05-24 17:51:36'),(97,NULL,NULL,NULL,'Reduce','2024-05-24 17:51:36'),(98,NULL,NULL,61,'Add','2024-05-24 17:51:36'),(99,NULL,NULL,NULL,'Reduce','2024-05-24 17:51:36'),(100,NULL,NULL,NULL,'Reduce','2024-05-24 17:51:37'),(101,NULL,NULL,0,'Reduce','2024-05-24 17:51:54'),(102,NULL,NULL,1,'Add','2024-05-24 17:51:54'),(105,'luit',NULL,20,'Reduce','2024-05-24 18:16:19'),(106,NULL,NULL,1,'Update','2024-05-26 19:24:53'),(107,NULL,NULL,8,'Update','2024-05-26 19:25:24'),(108,NULL,NULL,20,'Update','2024-05-26 19:45:56'),(109,'luit',212,3,'Reduce','2024-05-27 05:16:44'),(110,'luit',212,1,'Reduce','2024-05-27 07:02:34'),(111,'luit',176,50,'Update','2024-05-27 07:07:10'),(112,'Luiss',213,50,'Update','2024-05-27 08:18:48'),(113,'luit',213,50,'Update','2024-05-27 08:19:56'),(114,'luit',213,55,'Update','2024-05-27 08:23:37'),(115,'luit',175,0,'Update','2024-05-27 08:26:18'),(116,'luit',175,500,'Update','2024-05-27 08:26:29'),(117,'luit',175,45,'Update','2024-05-27 08:27:17'),(118,'luit',175,45,'Update','2024-05-27 08:27:50'),(119,'luit',175,45,'Update','2024-05-27 08:27:59'),(120,'luit',175,45,'Update','2024-05-27 08:29:03'),(121,'luit',175,45,'Update','2024-05-27 08:29:18'),(122,'luit',175,59,'Update','2024-05-27 08:40:02'),(123,'luit',175,59,'Update','2024-05-27 08:49:42'),(124,'luit',175,59,'Update','2024-05-27 08:50:21'),(125,'luit',175,59,'Update','2024-05-27 09:15:07'),(126,'ElRoger',213,9,'Reduce','2024-05-27 15:49:05'),(127,'ElRoger',268,2,'Update','2024-05-27 15:53:58'),(128,'ElRoger',268,1,'Reduce','2024-05-27 15:54:19'),(129,'ElRoger',203,3,'Reduce','2024-05-27 15:55:48'),(130,'ElRoger',212,3,'Add','2024-05-27 15:55:49'),(131,'ElRoger',259,3,'Add','2024-05-27 15:55:49'),(132,'ElRoger',268,2,'Add','2024-05-27 15:55:49'),(133,'ElRoger',268,2,'Add','2024-05-27 15:56:22'),(134,'luit',269,30,'Update','2024-05-28 20:27:53');

DELIMITER //


CREATE FUNCTION contarRegistrosUsuario(usuario_id VARCHAR(20)) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total_registros INT;
    
    SELECT COUNT(*) INTO total_registros
    FROM UsuarioAlimento
    WHERE u_id = usuario_id AND ua_accion = 'Add';
    
    RETURN total_registros;
END //


DELIMITER ;



DELIMITER //


CREATE PROCEDURE stockAlimentos (IN alimento_id INT, IN usuario_id VARCHAR(20), IN actionType INT, IN quantity INT)
BEGIN
    -- Add Reduce Update = 0 1 2 
    CASE actionType
        WHEN 0 THEN
            -- Código para manejar el tipo de acción add
            UPDATE Alimento
            SET a_stock = a_stock + quantity, a_fechaEntrada = NOW()
            WHERE a_id = alimento_id;
            
            INSERT INTO UsuarioAlimento (u_id, a_id, ua_cantidad, ua_accion, ua_fecha) VALUES (usuario_id, alimento_id, quantity, "Add", NOW());
        WHEN 1 THEN
            -- Código para manejar el tipo de acción reduce
            UPDATE Alimento
            SET a_stock = a_stock - quantity, a_fechaSalida = NOW()
            WHERE a_id = alimento_id;
            
            INSERT INTO UsuarioAlimento (u_id, a_id, ua_cantidad, ua_accion, ua_fecha) VALUES (usuario_id, alimento_id, quantity, "Reduce",NOW());
            
        WHEN 2 THEN
            -- Código para manejar el tipo de acción 2
            INSERT INTO UsuarioAlimento (u_id, a_id, ua_cantidad, ua_accion, ua_fecha) 
            VALUES (usuario_id, alimento_id, quantity, "Update", NOW());


    END CASE;
    
END //


DELIMITER ;


DELIMITER //


CREATE EVENT eliminarAlimentosAntiguos
ON SCHEDULE EVERY 1 MONTH
DO
BEGIN
    DECLARE num_alimentos_eliminados INT;
    
    -- Contar el número de alimentos que cumplen las condiciones
    SELECT COUNT(*) INTO num_alimentos_eliminados
    FROM Alimento
    WHERE a_stock = 0 AND a_fechaSalida <= DATE_SUB(NOW(), INTERVAL 1 YEAR);
    
    -- Eliminar todas las entradas de la tabla Alimento que cumplen las condiciones
    DELETE FROM Alimento
    WHERE a_stock = 0 AND a_fechaSalida <= DATE_SUB(NOW(), INTERVAL 1 YEAR);
    
    -- Guardar el número de alimentos eliminados en la tabla UsuarioAlimento
    IF num_alimentos_eliminados > 0 THEN
        INSERT INTO UsuarioAlimento (u_id, a_id, ua_cantidad, ua_accion, ua_fecha)
        VALUES ('ManejadorEventos', NULL, num_alimentos_eliminados, 'Delete', NOW());
    END IF;
END //


DELIMITER ;



