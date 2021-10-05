/*CREATE DATABASE IF NOT EXISTS BDM;
USE BDM;*/

CREATE TABLE IF NOT EXISTS `image`(
`id_image`  INT UNSIGNED NOT NULL AUTO_INCREMENT,
`image` MEDIUMBLOB NULL,
`type_image` VARCHAR(50) NULL DEFAULT NULL,
PRIMARY KEY(`id_image`)
);

CREATE TABLE IF NOT EXISTS `user` (
`id_user` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(100) NOT NULL,
`is_student` BOOL NOT NULL,
`email` VARCHAR(50) NOT NULL,
`pass` VARCHAR(50) NOT NULL,
`avatar` INT UNSIGNED NULL ,
`gender` TINYINT NULL DEFAULT NULL,
`date_birth` DATE NULL DEFAULT NULL,
`created_at` TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP,
`deleted_at` TIMESTAMP NULL DEFAULT NULL,
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
CONSTRAINT FK_USER_IMAGE 
FOREIGN KEY (`avatar`) REFERENCES `image`(`id_image`),
PRIMARY KEY(`id_user`)
);

CREATE TABLE IF NOT EXISTS `category`(
`id_category` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`user` INT UNSIGNED NOT NULL,
`name` VARCHAR(50) NOT NULL,
`description` VARCHAR(50) NOT NULL,
`created_at` TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP,
`deleted_at` TIMESTAMP NULL DEFAULT NULL,
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
CONSTRAINT FK_CAT_USER 
FOREIGN KEY (`user`) REFERENCES `user`(`id_user`),
PRIMARY KEY (`id_category`)
);

CREATE TABLE IF NOT EXISTS `payment_method`(
`id_payment_method` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(50) NOT NULL,
`created_at` TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP,
`deleted_at` TIMESTAMP NULL DEFAULT NULL,
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY(`id_payment_method`)
);

CREATE TABLE IF NOT EXISTS `course`(
`id_course` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`user` INT UNSIGNED NOT NULL,
`is_public` BOOL NOT NULL,
`name` VARCHAR(50) NOT NULL,
`price` DECIMAL(12,2) NULL,
`description` VARCHAR(250) NOT NULL,
`image` INT UNSIGNED NOT NULL,
`created_at` TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP,
`deleted_at` TIMESTAMP NULL DEFAULT NULL,
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
CONSTRAINT FK_COUR_USER
FOREIGN KEY (`user`) REFERENCES `user`(`id_user`),
CONSTRAINT FK_COUR_IMG
FOREIGN KEY (`image`) REFERENCES `image`(`id_image`),
PRIMARY KEY(`id_course`)
);


CREATE TABLE IF NOT EXISTS `level`(
`id_level` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(50) NOT NULL,
`price` DECIMAL(12,2) NULL,
`course` INT UNSIGNED NOT NULL,
`created_at` TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP,
`deleted_at` TIMESTAMP NULL DEFAULT NULL,
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
CONSTRAINT FK_LEV_COUR
FOREIGN KEY (`course`) REFERENCES `course`(`id_course`),
PRIMARY KEY (`id_level`)
);

CREATE TABLE IF NOT EXISTS `resource`(
`id_resource` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`nombre` VARCHAR(250),
`level` INT UNSIGNED NOT NULL,
`type` VARCHAR(20) NOT NULL ,
`resource` MEDIUMBLOB NOT NULL,
`created_at` TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP,
`deleted_at` TIMESTAMP NULL DEFAULT NULL,
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
CONSTRAINT FK_RES_LEV
FOREIGN KEY (`level`) REFERENCES `level`(`id_level`),
PRIMARY KEY (`id_resource`)
);


CREATE TABLE IF NOT EXISTS `categoryCourse`(
`category` INT UNSIGNED NOT NULL,
`course` INT UNSIGNED NOT NULL,
`created_at` TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP,
`deleted_at` TIMESTAMP NULL DEFAULT NULL,
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
CONSTRAINT FK_CATCOUR_CAT
FOREIGN KEY (`category`) REFERENCES `category`(`id_category`),
CONSTRAINT FK_CATCOUR_COUR
FOREIGN KEY (`course`) REFERENCES `course`(`id_course`),
PRIMARY KEY(`category`,`course`)
);



CREATE TABLE IF NOT EXISTS `video`(
`id_video` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`level` INT UNSIGNED NOT NULL,
`path` VARCHAR(250) NOT NULL,
`created_at` TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP,
`deleted_at` TIMESTAMP NULL DEFAULT NULL,
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
CONSTRAINT FK_VID_LEV
FOREIGN KEY (`level`) REFERENCES `level`(`id_level`),
PRIMARy KEY (`id_video`)
);


CREATE TABLE IF NOT EXISTS `comment`(
`id_comment` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`comment` VARCHAR(250) NOT NULL,
`user` INT UNSIGNED NOT NULL,
`course` INT UNSIGNED NOT NULL,
`created_at` TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP,
`deleted_at` TIMESTAMP NULL DEFAULT NULL,
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
CONSTRAINT FK_COMM_USER
FOREIGN KEY (`user`) REFERENCES `user`(`id_user`),
CONSTRAINT FK_COMM_COUR
FOREIGN KEY (`course`) REFERENCES `course`(`id_course`),
PRIMARY KEY (`id_comment`)
);

CREATE TABLE IF NOT EXISTS `chat`(
`id_chat` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`message` VARCHAR(250) NOT NULL,
`from` INT UNSIGNED NOT NULL,
`to` INT UNSIGNED NOT NULL,
`created_at` TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP,
`deleted_at` TIMESTAMP NULL DEFAULT NULL,
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
CONSTRAINT FK_CHAT_FROM
FOREIGN KEY (`from`) REFERENCES `user`(`id_user`),
CONSTRAINT FK_CHAT_TO
FOREIGN KEY (`to`) REFERENCES `user`(`id_user`),
PRIMARY KEY (`id_chat`)
);

CREATE TABLE IF NOT EXISTS `courseProgress`(
`video`  INT UNSIGNED NOT NULL,
`user` INT UNSIGNED NOT NULL,
`created_at` TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP,
`deleted_at` TIMESTAMP NULL DEFAULT NULL,
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
CONSTRAINT FK_PROG_USER
FOREIGN KEY (`user`) REFERENCES `user`(`id_user`),
CONSTRAINT FK_PROG_VID
FOREIGN KEY (`video`) REFERENCES `video`(`id_video`),
PRIMARY KEY (`video`,`user`)
);

CREATE TABLE IF NOT EXISTS `payment` (
`id_payment` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`course` INT UNSIGNED NOT NULL,
`level` INT UNSIGNED NOT NULL,
`user` INT UNSIGNED NOT NULL,
`price` DECIMAL(12,2) NULL,
`payment_method` INT UNSIGNED NOT NULL,
`key` VARCHAR(150) NULL,
`created_at` TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP,
`deleted_at` TIMESTAMP NULL DEFAULT NULL,
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
CONSTRAINT	FK_PAY_USER
FOREIGN KEY (`user`) references `user`(`id_user`),
CONSTRAINT FK_PAY_COUR
FOREIGN KEY (`course`) REFERENCES `course`(`id_course`),
CONSTRAINT FK_PAY_LEV
FOREIGN KEY (`level`) REFERENCES `level`(`id_level`),
CONSTRAINT FK_PAY_MET
FOREIGN KEY (`payment_method`) REFERENCES `payment_method`(`id_payment_method`),
PRIMARY KEY (`id_payment`)
);

CREATE TABLE IF NOT EXISTS 	`certificate`(
`course` INT UNSIGNED NOT NULL,
`user` INT UNSIGNED NOT NULL,
`created_at` TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP,
`deleted_at` TIMESTAMP NULL DEFAULT NULL,
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
CONSTRAINT FK_CER_USER
FOREIGN KEY (`user`) REFERENCES `user`(`id_user`),
CONSTRAINT FK_CER_COUR
FOREIGN KEY (`course`) REFERENCES `course`(`id_course`),
PRIMARY KEY (`course`,`user`)
);

CREATE TABLE IF NOT EXISTS `score`(
`user` INT UNSIGNED NOT NULL,
`course` INT UNSIGNED NOT NULL,
`pts` TINYINT NOT NULL ,
`created_at` TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP,
`deleted_at` TIMESTAMP NULL DEFAULT NULL,
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
CONSTRAINT FK_SCO_USER
FOREIGN KEY (`user`) REFERENCES `user`(`id_user`),
CONSTRAINT FK_SCO_COUR
FOREIGN KEY (`course`) REFERENCES `course`(`id_course`),
PRIMARY KEY(`user`,`course`)
);



Scripts de Store Procedures 

	DELIMITER //
	CREATE PROCEDURE `SP_FindUserByAuth`(
	IN _user VARCHAR(100), 
	IN _contra VARCHAR(50)
	 )
	BEGIN
	SELECT  A.`id_user`,  A.`pass`,   A.`name`,  A.`is_student`, A.`email`, A.`created_at`,B.`image` as "avatar",B.`type_image` as "type_image", A.`updated_at`, A.`gender`, A.`date_birth` FROM `user` A 
     INNER JOIN `image` B ON A.`avatar` = B.`id_image`
	 WHERE  A.`email` = _user AND  A.`pass` = _contra AND  A.`deleted_at` IS NULL 
	 OR   A.`name` = _user AND  A.`pass` = _contra AND  A.`deleted_at` IS NULL  Limit 1 ;
	 
	END\\

	DELIMITER //
	CREATE  PROCEDURE `SP_AddUser`(
	IN _name VARCHAR(100),
	IN _email VARCHAR(50),
	IN _pass VARCHAR(50),
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
    INSERT INTO `image`(`image`) VALUES (NULL);
   INSERT INTO `user`(`name`,`email`,`pass`,`is_student`,`avatar`) 
	VALUES (_name,_email,_pass,_is_student,(SELECT MAX(`id_image`)FROM `image`));
    SELECT  A.`id_user` , A.`pass`,  A.`name`,  A.`is_student`, A.`email`, A.`created_at`,B.`image` as "avatar",B.`type_image` as "type_image", A.`updated_at`, A.`gender`, A.`date_birth` FROM `user` A 
    INNER JOIN `image` B ON A.`avatar` = B.`id_image`
    WHERE  A.`id_user` = (SELECT MAX(`id_user`) FROM `user`);
    END;
    END IF;
	
	END\\
    
    
DELIMITER //
CREATE PROCEDURE `SP_UpdateUser`(
IN _id INT,
IN _name VARCHAR(100),
IN _email VARCHAR(100),
IN _pass VARCHAR(50),
IN _gender TINYINT,
IN _avatar MEDIUMBLOB,
IN _type VARCHAR(50),
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
		UPDATE `user` A INNER JOIN `image` B ON A.`avatar` = B.`id_image`
        SET A.`name`=_name, A.`email` = _email,  A.`pass` = _pass, A.`gender`=_gender,
         A.`date_birth` = _birth, B.`image` = _avatar , B.`type_image` = _type WHERE A.`id_user` = _id;
    END;
    END IF;
	SELECT A.`id_user`, A.`pass`, A.`name`, A.`is_student`,A.`email`,A.`created_at`,B.`image` as "avatar",B.`type_image` as "type_image",A.`updated_at`,A.`gender`,A.`date_birth` FROM `user` A 
	INNER JOIN `image` B ON A.`avatar` = B.`id_image`
    WHERE A.`id_user` = _id;
END

