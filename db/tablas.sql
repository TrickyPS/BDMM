CREATE DATABASE IF NOT EXISTS BDM;
USE BDM;


CREATE TABLE IF NOT EXISTS `image`(
`id_image`  INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla',
`image` MEDIUMBLOB NULL COMMENT 'Imagen blob para los cursos y el usuario',
`type_image` VARCHAR(50) NULL DEFAULT NULL COMMENT 'Tipo MIME de la imagen',
PRIMARY KEY(`id_image`)
);

CREATE TABLE IF NOT EXISTS `user` (
`id_user` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla usuario',
`name` VARCHAR(100) NOT NULL COMMENT 'Nombre del usuario',
`is_student` BOOL NOT NULL COMMENT 'Si es true es un usuario estudiante, si es false es maestro',
`email` VARCHAR(50) NOT NULL COMMENT 'Email del usuario',
`pass` VARCHAR(50) NOT NULL COMMENT 'Contraseña del usuario',
`avatar` INT UNSIGNED NULL COMMENT 'Referencia para la imagen del usuario',
`gender` TINYINT NULL DEFAULT NULL COMMENT 'Género del usuario',
`date_birth` DATE NULL DEFAULT NULL COMMENT 'Fecha de nacimiento',
`created_at` TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de creación del usaurio',
`deleted_at` TIMESTAMP NULL DEFAULT NULL COMMENT 'Fecha en que se elimina el usuario',
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha en que se actualiza el usuario',
CONSTRAINT FK_USER_IMAGE 
FOREIGN KEY (`avatar`) REFERENCES `image`(`id_image`),
PRIMARY KEY(`id_user`)
);

CREATE TABLE IF NOT EXISTS `category`(
`id_category` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla',
`user` INT UNSIGNED NOT NULL COMMENT 'Usuario que creó la categoria',
`name` VARCHAR(50) NOT NULL COMMENT 'Nombre de la categoria',
`description` VARCHAR(150) NOT NULL COMMENT 'Descripción de la categoria',
`created_at` TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha en que se creó la categoria',
`deleted_at` TIMESTAMP NULL DEFAULT NULL COMMENT 'Fecha en que se elimina la categoria',
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha en que se actualiza la categoria',
CONSTRAINT FK_CAT_USER  
FOREIGN KEY (`user`) REFERENCES `user`(`id_user`),
PRIMARY KEY (`id_category`)
);

CREATE TABLE IF NOT EXISTS `payment_method`(
`id_payment_method` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador del método de pago',
`name` VARCHAR(50) NOT NULL COMMENT 'Nombre del método de pago',
`created_at` TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha en  que se creó el método de pago',
`deleted_at` TIMESTAMP NULL DEFAULT NULL COMMENT 'Fecha en que se elimina el método de pago',
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha en que se actualiza el método de pago',
PRIMARY KEY(`id_payment_method`)
);

INSERT INTO payment_method(`name`) VALUES ("Paypal");
INSERT INTO payment_method(`name`) VALUES ("Master Card");
INSERT INTO payment_method(`name`) VALUES ("Gratis");

CREATE TABLE IF NOT EXISTS `course`(
`id_course` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador del curso',
`user` INT UNSIGNED NOT NULL COMMENT 'Usuario que creó el curso',
`is_public` BOOL NOT NULL COMMENT 'Si es publico el usuario ya no puede agrgar videos',
`name` VARCHAR(50) NOT NULL COMMENT 'Nombre del curso',
`price` DECIMAL(12,2) NULL COMMENT 'Precio del curso, si es nulo es gratis',
`description` VARCHAR(250) NOT NULL COMMENT 'Descripción del curso',
`image` INT UNSIGNED NOT NULL COMMENT 'Referencia para la imagen del curso',
`created_at` TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha en que se creó el curso',
`deleted_at` TIMESTAMP NULL DEFAULT NULL COMMENT 'Fecha en que se elimina el curso',
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha en que se actualiza el curso',
CONSTRAINT FK_COUR_USER
FOREIGN KEY (`user`) REFERENCES `user`(`id_user`),
CONSTRAINT FK_COUR_IMG
FOREIGN KEY (`image`) REFERENCES `image`(`id_image`),
PRIMARY KEY(`id_course`)
);


CREATE TABLE IF NOT EXISTS `level`(
`id_level` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador del nivel',
`name` VARCHAR(50) NOT NULL COMMENT 'Nombre del nivel',
`price` DECIMAL(12,2) NULL COMMENT 'Precio del nivel, si es null es gratis',
`course` INT UNSIGNED NOT NULL COMMENT 'Curso en el que esta el nivel' ,
`created_at` TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha en que se crea el nivel',
`deleted_at` TIMESTAMP NULL DEFAULT NULL COMMENT 'Fecha en que se elimina el nivel',
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha en que se actualiza el nivel',
CONSTRAINT FK_LEV_COUR
FOREIGN KEY (`course`) REFERENCES `course`(`id_course`),
PRIMARY KEY (`id_level`)
);

CREATE TABLE IF NOT EXISTS `resource`(
`id_resource` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador del recurso',
`nombre` VARCHAR(250) NULL COMMENT 'Nombre del recurso',
`level` INT UNSIGNED NOT NULL COMMENT 'Nivel en que se encuentra el recurso',
`type` VARCHAR(20)  NULL COMMENT 'Tipo MIME del recurso',
`url` VARCHAR(100) NULL COMMENT 'Url como recurso',
`resource` MEDIUMBLOB NULL COMMENT 'Recurso en blob',
`created_at` TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha en que se crea el recurso',
`deleted_at` TIMESTAMP NULL DEFAULT NULL COMMENT 'Fecha en que se elimina el recurso',
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha en que se actualiza el recurso',
CONSTRAINT FK_RES_LEV
FOREIGN KEY (`level`) REFERENCES `level`(`id_level`),
PRIMARY KEY (`id_resource`)
);


CREATE TABLE IF NOT EXISTS `categorycourse`(
`category` INT UNSIGNED NOT NULL COMMENT 'Categoria que tiene el curso',
`course` INT UNSIGNED NOT NULL COMMENT 'Curso que contiene la categoria',
`created_at` TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha en que se crea el registro',
`deleted_at` TIMESTAMP NULL DEFAULT NULL COMMENT 'Fecha en que se elimina el registro',
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha en que se actualiza el registro',
CONSTRAINT FK_CATCOUR_CAT
FOREIGN KEY (`category`) REFERENCES `category`(`id_category`),
CONSTRAINT FK_CATCOUR_COUR
FOREIGN KEY (`course`) REFERENCES `course`(`id_course`),
PRIMARY KEY(`category`,`course`)
);



CREATE TABLE IF NOT EXISTS `video`(
`id_video` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador del video',
`level` INT UNSIGNED NOT NULL COMMENT 'Nivel en que se encuentra el video',
`path` VARCHAR(250) NOT NULL COMMENT 'Ruta en el que se encuentra el video',
`created_at` TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha en que se crea el video',
`deleted_at` TIMESTAMP NULL DEFAULT NULL COMMENT 'Fecha en que se elimina el video',
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha en que se actualiza el video',
CONSTRAINT FK_VID_LEV
FOREIGN KEY (`level`) REFERENCES `level`(`id_level`),
PRIMARy KEY (`id_video`)
);
ALTER TABLE `video` Add Column `type` VARCHAR(250) NOT NULL;
ALTER TABLE `video` Add Column `title` VARCHAR(250) NOT NULL;


CREATE TABLE IF NOT EXISTS `comment`(
`id_comment` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador del comentario',
`comment` VARCHAR(250) NOT NULL COMMENT 'Comentario',
`user` INT UNSIGNED NOT NULL COMMENT 'Usuario que hace el comentario',
`course` INT UNSIGNED NOT NULL COMMENT 'Curso que se comenta',
`created_at` TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha en que se crea el comentario',
`deleted_at` TIMESTAMP NULL DEFAULT NULL COMMENT 'Fecha en que se elimina el comentario',
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha cuando se actualiza el comentario',
CONSTRAINT FK_COMM_USER
FOREIGN KEY (`user`) REFERENCES `user`(`id_user`),
CONSTRAINT FK_COMM_COUR
FOREIGN KEY (`course`) REFERENCES `course`(`id_course`),
PRIMARY KEY (`id_comment`)
);

CREATE TABLE IF NOT EXISTS `chat`(
`id_chat` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador del chat',
`message` VARCHAR(250) NOT NULL COMMENT 'Mensaje del chat',
`from` INT UNSIGNED NOT NULL COMMENT 'Usuario que envia el mensaje',
`to` INT UNSIGNED NOT NULL COMMENT 'Usuario a quien va dirgido el mensaje',
`created_at` TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha en que se crea el mensaje',
`deleted_at` TIMESTAMP NULL DEFAULT NULL COMMENT '¨Fecha en que se elimina el mensaje',
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha en que se actualiza el mensaje',
CONSTRAINT FK_CHAT_FROM
FOREIGN KEY (`from`) REFERENCES `user`(`id_user`),
CONSTRAINT FK_CHAT_TO
FOREIGN KEY (`to`) REFERENCES `user`(`id_user`),
PRIMARY KEY (`id_chat`)
);

CREATE TABLE IF NOT EXISTS `courseprogress`(
`video`  INT UNSIGNED NOT NULL COMMENT 'Video que ya vio el usuario',
`user` INT UNSIGNED NOT NULL COMMENT 'Usuario que registra un progreso ',
`created_at` TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha en que se crea el progreso',
`deleted_at` TIMESTAMP NULL DEFAULT NULL COMMENT 'Fecha en que se elimina un progreso',
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha en que se actualiza un progreso',
CONSTRAINT FK_PROG_USER
FOREIGN KEY (`user`) REFERENCES `user`(`id_user`),
CONSTRAINT FK_PROG_VID
FOREIGN KEY (`video`) REFERENCES `video`(`id_video`),
PRIMARY KEY (`video`,`user`)
);

CREATE TABLE IF NOT EXISTS `payment_course` (
`id_payment_course` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador del pago del curso',
`course` INT UNSIGNED NOT NULL COMMENT 'Curso que se paga',
`user` INT UNSIGNED NOT NULL COMMENT 'Usuario que hace el pago',
`amount` DECIMAL(12,2) NULL COMMENT 'Monto a pagar',
`payment_method` INT UNSIGNED NOT NULL COMMENT 'Metodo de pago',
`key` VARCHAR(150) NULL COMMENT 'Clave de seguridad del pago',
`created_at` TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha en que se crea el pago',
`deleted_at` TIMESTAMP NULL DEFAULT NULL COMMENT 'Fecha en que se elimina el pago',
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha en que se actualiza el pago',
CONSTRAINT	FK_PAYCOUR_USER
FOREIGN KEY (`user`) references `user`(`id_user`),
CONSTRAINT FK_PAYCOUR_COUR
FOREIGN KEY (`course`) REFERENCES `course`(`id_course`),
CONSTRAINT FK_PAYCOUR_MET
FOREIGN KEY (`payment_method`) REFERENCES `payment_method`(`id_payment_method`),
PRIMARY KEY (`id_payment_course`)
);

CREATE TABLE IF NOT EXISTS `payment_level` (
`id_payment_level` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador del pago del nivel ',
`level` INT UNSIGNED NOT NULL COMMENT 'Nivel que se paga',
`user` INT UNSIGNED NOT NULL COMMENT 'Usuario que hace el pago',
`amount` DECIMAL(12,2) NULL COMMENT 'Monto a pagar',
`payment_method` INT UNSIGNED NOT NULL COMMENT 'Metodo de pago',
`key` VARCHAR(150) NULL COMMENT 'Clave de seguridad del pago',
`created_at` TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha en que se crea el pago',
`deleted_at` TIMESTAMP NULL DEFAULT NULL COMMENT 'Fecha en que se elimina el pago',
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha en que se actualiza el pago',
CONSTRAINT	FK_PAYLEV_USER
FOREIGN KEY (`user`) references `user`(`id_user`),
CONSTRAINT FK_PAYLEV_LEV
FOREIGN KEY (`level`) REFERENCES `level`(`id_level`),
CONSTRAINT FK_PAYLEV_MET
FOREIGN KEY (`payment_method`) REFERENCES `payment_method`(`id_payment_method`),
PRIMARY KEY (`id_payment_level`)
);


CREATE TABLE IF NOT EXISTS `score`(
`user` INT UNSIGNED NOT NULL COMMENT 'Usuario que califica un curso',
`course` INT UNSIGNED NOT NULL COMMENT 'El curso que se califica',
`pts` TINYINT NOT NULL COMMENT 'Puntos que da el usuario' ,
`created_at` TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha en que se crea la puntuación',
`deleted_at` TIMESTAMP NULL DEFAULT NULL COMMENT 'Fecha en que se elimina la puntuación',
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha de actualización',
CONSTRAINT FK_SCO_USER
FOREIGN KEY (`user`) REFERENCES `user`(`id_user`),
CONSTRAINT FK_SCO_COUR
FOREIGN KEY (`course`) REFERENCES `course`(`id_course`),
PRIMARY KEY(`user`,`course`)
);

CREATE TABLE `registro_level` (
  `level` int unsigned NOT NULL COMMENT 'Ultimo nivel al que se ingresa',
  `user` int unsigned NOT NULL COMMENT 'Usuario que ve el video',
  `fecha` datetime DEFAULT NULL COMMENT 'Fecha en la que se termino el curso',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha en que se actualiza el nivel',
  PRIMARY KEY (`level`,`user`),
  KEY `FK_Registro_user` (`user`),
  CONSTRAINT `FK_Registro_level` FOREIGN KEY (`level`) REFERENCES `level` (`id_level`),
  CONSTRAINT `FK_Registro_user` FOREIGN KEY (`user`) REFERENCES `user` (`id_user`)
);
ALTER TABLE `registro_level` Add Column `is_updated` boolean DEFAULT 0;

