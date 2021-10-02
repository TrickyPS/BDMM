/*CREATE DATABASE IF NOT EXISTS BDM;
USE BDM;*/



CREATE TABLE IF NOT EXISTS `user` (
`id_user` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
`name` TEXT(100) NOT NULL,
`is_student` BOOL NOT NULL,
`email` TEXT(50) NOT NULL,
`pass` TEXT(50) NOT NULL,
`avatar` MEDIUMBLOB NULL DEFAULT NULL,
`type_image` TEXT(50) NULL DEFAULT NULL,
`gender` TINYINT NULL DEFAULT NULL,
`date_birth` DATE NULL DEFAULT NULL,
`created_at` TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP,
`deleted_at` TIMESTAMP NULL DEFAULT NULL,
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY(`id_user`)
);

CREATE TABLE IF NOT EXISTS `category`(
`id_category` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
`user` BIGINT UNSIGNED NOT NULL,
`name` TEXT(50) NOT NULL,
`description` TEXT(50) NOT NULL,
`created_at` TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP,
`deleted_at` TIMESTAMP NULL DEFAULT NULL,
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
FOREIGN KEY (`id_user`) REFERENCES `user`(`id_user`),
PRIMARY KEY (`id_category`)
);

CREATE TABLE IF NOT EXISTS `payment_method`(
`id_payment_method` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
`method` TEXT(50) NOT NULL,
`created_at` TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP,
`deleted_at` TIMESTAMP NULL DEFAULT NULL,
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY(`id_payment_method`)
);

CREATE TABLE IF NOT EXISTS `course`(
`id_course` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
`user` BIGINT UNSIGNED NOT NULL,
`is_public` BOOL NOT NULL,
`name` TEXT(50) NOT NULL,
`price` DECIMAL(12,2) NULL,
`description` TEXT(250) NOT NULL,
`img` MEDIUMBLOB NOT NULL,
`created_at` TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP,
`deleted_at` TIMESTAMP NULL DEFAULT NULL,
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
FOREIGN KEY (`user`) REFERENCES `user`(`id_user`),
PRIMARY KEY(`id_course`)
);


CREATE TABLE IF NOT EXISTS `level`(
`id_level` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
`name` TEXT(50) NOT NULL,
`price` DECIMAL(12,2) NULL,
`course` BIGINT UNSIGNED NOT NULL,
`created_at` TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP,
`deleted_at` TIMESTAMP NULL DEFAULT NULL,
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
FOREIGN KEY (`course`) REFERENCES `course`(`id_course`),
PRIMARY KEY (`id_level`)
);

CREATE TABLE IF NOT EXISTS `resource`(
`id_resource` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
`level` BIGINT UNSIGNED NOT NULL,
`type` TEXT(20) NOT NULL ,
`resource` MEDIUMBLOB NOT NULL,
`decription` TEXT(250),
`created_at` TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP,
`deleted_at` TIMESTAMP NULL DEFAULT NULL,
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
FOREIGN KEY (`level`) REFERENCES `level`(`id_level`),
PRIMARY KEY (`id_resource`)
);


CREATE TABLE IF NOT EXISTS `categoryCourse`(
`category` BIGINT UNSIGNED NOT NULL,
`course` BIGINT UNSIGNED NOT NULL,
`created_at` TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP,
`deleted_at` TIMESTAMP NULL DEFAULT NULL,
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
FOREIGN KEY (`category`) REFERENCES `category`(`id_category`),
FOREIGN KEY (`course`) REFERENCES `course`(`id_course`),
PRIMARY KEY(`catgeory`,`course`)
);



CREATE TABLE IF NOT EXISTS `video`(
`id_video` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
`level` BIGINT UNSIGNED NOT NULL,
`path` TEXT(250) NOT NULL,
`created_at` TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP,
`deleted_at` TIMESTAMP NULL DEFAULT NULL,
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
FOREIGN KEY (`level`) REFERENCES `level`(`id_level`),
PRIMARy KEY (`id_video`)
);


CREATE TABLE IF NOT EXISTS `courseComment`(
`id_course_comment` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
`comment` TEXT(250) NOT NULL,
`user` BIGINT UNSIGNED NOT NULL,
`course` BIGINT UNSIGNED NOT NULL,
`created_at` TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP,
`deleted_at` TIMESTAMP NULL DEFAULT NULL,
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
FOREIGN KEY (`user`) REFERENCES `user`(`id_user`),
FOREIGN KEY (`course`) REFERENCES `course`(`id`),
PRIMARY KEY (`id_course_comment`)
);

CREATE TABLE IF NOT EXISTS `chat`(
`id_chat` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
`message` TEXT(250) NOT NULL,
`from` BIGINT UNSIGNED NOT NULL,
`to` BIGINT UNSIGNED NOT NULL,
`created_at` TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP,
`deleted_at` TIMESTAMP NULL DEFAULT NULL,
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
FOREIGN KEY (`from`) REFERENCES `user`(`id_user`),
FOREIGN KEY (`to`) REFERENCES `user`(`id_user`),
PRIMARY KEY (`id_chat`)
);

CREATE TABLE IF NOT EXISTS `courseProgress`(
`id_course_progress` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
`video`  BIGINT UNSIGNED NOT NULL,
`user` BIGINT UNSIGNED NOT NULL,
`created_at` TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP,
`deleted_at` TIMESTAMP NULL DEFAULT NULL,
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
FOREIGN KEY (`user`) REFERENCES `user`(`id_user`),
FOREIGN KEY (`video`) REFERENCES `video`(`id_video`),
PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `payment` (
`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
`course` BIGINT UNSIGNED NOT NULL,
`level` BIGINT UNSIGNED NOT NULL,
`user` BIGINT UNSIGNED NOT NULL,
`price` DECIMAL(12,2) NULL,
`payment_method` BIGINT NOT NULL,
`key` TEXT(150) NULL,
`created_at` TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP,
`deleted_at` TIMESTAMP NULL DEFAULT NULL,
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
FOREIGN KEY (`user`) REFERENCES `user`(`id_user`),
FOREIGN KEY (`course`) REFERENCES `course`(`id_course`),
FOREIGN KEY (`level`) REFERENCES `level`(`id_level`),
FOREIGN KEY (`payment_method`) REFERENCES `payment_method`(`id_payment_method`),
PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS 	`certificate`(
`id_certificate` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
`course` BIGINT UNSIGNED NOT NULL,
`user` BIGINT UNSIGNED NOT NULL,
`created_at` TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP,
`deleted_at` TIMESTAMP NULL DEFAULT NULL,
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
FOREIGN KEY (`user`) REFERENCES `user`(`id_user`),
FOREIGN KEY (`course`) REFERENCES `course`(`id_course`),
PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `score`(
`id_score` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
`pts` TINYINT NOT NULL ,
`user` BIGINT UNSIGNED NOT NULL,
`course` BIGINT UNSIGNED NOT NULL,
`created_at` TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP,
`deleted_at` TIMESTAMP NULL DEFAULT NULL,
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
FOREIGN KEY (`user`) REFERENCES `user`(`id_user`),
FOREIGN KEY (`course`) REFERENCES `course`(`id_course`),
PRIMARY KEY(`id_score`)
);



Scripts de Store Procedures 

	DELIMITER //
	CREATE PROCEDURE `SP_FindUserByAuth`(
	IN _user TEXT(100), 
	IN _contra TEXT(50)
	 )
	BEGIN
	SELECT `id_user`, `pass`,  `name`, `is_student`,`email`,`created_at`,`avatar`,`type_image`,`updated_at`,`gender`,`date_birth` FROM `user`
	 WHERE `email` = _user AND `pass` = _contra AND `deleted_at` IS NULL 
	 OR  `name` = _user AND `pass` = _contra AND `deleted_at` IS NULL  Limit 1 ;
	 
	END\\

	DELIMITER //
	CREATE  PROCEDURE `SP_AddUser`(
	IN _name TEXT(100),
	IN _email TEXT(50),
	IN _pass TEXT(50),
	IN _is_student BOOL
	 )
	BEGIN
    IF (SELECT count(`id_user`) FROM `user` WHERE `email` = _name AND `pass` = _pass AND `deleted_at` IS NULL 
	 OR  `name` = _name AND `pass` = _pass AND `deleted_at` IS NULL )>0 THEN
    BEGIN
		Select "error" as "status";
    END;
    ELSE 
    BEGIN
   INSERT INTO `user`(`name`,`email`,`pass`,`is_student`) 
	VALUES (_name,_email,_pass,_is_student);
    SELECT  `id_user` ,`pass`, `name`, `is_student`,`email`,`created_at`,`avatar`,`type_image`,`updated_at`,`gender`,`date_birth` FROM `user` WHERE `id_user` = (SELECT MAX(`id_user`) FROM `user`);
    END;
    END IF;
	
	END\\
    
    
DELIMITER //
CREATE PROCEDURE `SP_UpdateUser`(
IN _id BIGINT,
IN _name TEXT(100),
IN _email TEXT(100),
IN _pass TEXT(50),
IN _gender TINYINT,
IN _avatar MEDIUMBLOB,
IN _type TEXT(50),
IN _birth DATE,
IN _update_avatar BOOL
)
BEGIN
	IF _update_avatar = false THEN
    BEGIN
		UPDATE `user` SET `name`=_name,`email` = _email, `pass` = _pass,`gender`=_gender,
        `date_birth` = _birth where `id_user` = _id;
    END;
    ELSE
    BEGIN
		UPDATE `user` SET `name`=_name,`email` = _email, `pass` = _pass,`gender`=_gender,
        `date_birth` = _birth, `avatar` = _avatar ,`type_image` = _type WHERE `id_user` = _id;
    END;
    END IF;
	SELECT `id_user`, `pass`, `name`, `is_student`,`email`,`created_at`,`avatar`,`type_image`,`updated_at`,`gender`,`date_birth` FROM `user` WHERE `id_user` = _id;
END
