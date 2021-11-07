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
`description` VARCHAR(50) NOT NULL COMMENT 'Descripción de la categoria',
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


CREATE TABLE IF NOT EXISTS `categoryCourse`(
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

CREATE TABLE IF NOT EXISTS `courseProgress`(
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
	 
	END //

	DELIMITER //
	CREATE  PROCEDURE `SP_AddUser`(
	IN _name VARCHAR(100),
	IN _email VARCHAR(50),
	IN _pass VARCHAR(50),
	IN _is_student BOOL
	 )
	BEGIN
    IF (SELECT count(`id_user`) FROM `user` WHERE `email` = _email  AND `deleted_at` IS NULL 
	 OR  `name` = _name  AND `deleted_at` IS NULL )>0 THEN
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
	
	END //
    
    
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
END //

DELIMITER //
CREATE PROCEDURE `SP_Category`(
IN _case TINYINT,
IN _name VARCHAR(100), 
IN _description VARCHAR(250),
IN _user INT UNSIGNED,
IN _categoria INT UNSIGNED,
IN _curso INT UNSIGNED
)
BEGIN
	IF _case = 1 THEN
        INSERT INTO `category`(`name`,`description`,`user`) VALUES (_name,_description,_user);
        SELECT `id_category`,`name`, `description` from `category`;
     END IF;
     IF _case = 2 THEN
        SELECT `id_category`,`name`, `description` from `category`;
     END IF;
       IF _case = 3 THEN
         INSERT INTO `categorycourse`(`category`,`course`) VALUES (_categoria,_curso);
     END IF;
     
END //

DROP PROCEDURE `SP_Curso`

DELIMITER //
CREATE PROCEDURE `SP_Curso`(
IN _case TINYINT,
IN _user INT UNSIGNED, 
IN _is_public BOOLEAN,
IN _name VARCHAR(250),
IN _description VARCHAR(250),
IN _price DECIMAL(12,2),
IN _image MEDIUMBLOB,
IN _type VARCHAR(50),
IN _curso INT UNSIGNED
)
BEGIN
	IF _case = 1 THEN
        INSERT INTO `image`(`image`,`type_image`) VALUES (_image,_type);
		INSERT INTO `course`(`user`,`is_public`,`name`,`price`,`description`,`image`) 
        VALUES (_user,_is_public,_name,_price,_description,(SELECT MAX(`id_image`)from `image`));
        SELECT Max(`id_course`) as id FROM `course`;
     END IF;
     IF _case = 2 THEN
        SELECT F.`id_course`,F.`is_public`,F.`name`,F.`price`,F.`description`,F.`created_at`,F.`updated_at`,F.`deleted_at`,
         (SELECT count(*) from `video` A INNER JOIN `level` B ON A.level = B.id_level INNER JOIN `course` C ON C.id_course = B.course
         WHERE C.`id_course`= F.`id_course` AND A.`deleted_at` is null AND B.`deleted_at` is null AND C.`deleted_at` is null) as 'count'
        FROM `course` F
         WHERE F.`user` = _user AND F.`deleted_at` is null ;
     END IF;
     IF _case = 3 THEN
		INSERT INTO `image`(`image`,`type_image`) VALUES (_image,_type);
		UPDATE `course` SET  `name` = _name, `description` = _description,`price`=_price, `image` = (SELECT MAX(`id_image`)from `image`)
        WHERE `id_course` = _curso;
        SELECT _curso as id ;
     END IF;
      IF _case = 4 THEN
		UPDATE `course` SET `deleted_at` = CURRENT_TIMESTAMP
        WHERE `id_course` = _curso;
     END IF;
      IF _case = 5 THEN
		UPDATE `course` SET `is_public` = 1
        WHERE `id_course` = _curso;
     END IF;
END //

drop trigger NivelesGratis;
 delimiter //

CREATE TRIGGER NivelesGratis AFTER UPDATE ON `course`
  FOR EACH ROW
  BEGIN
    if New.price is null THEN
		UPDATE `level` SET `price` = null WHERE `course` = new.`id_course` ;
    END IF;
  END //

DROP PROCEDURE `SP_Nivel`

DELIMITER //
CREATE PROCEDURE `SP_Nivel`(
IN _case TINYINT,
IN _idNivel INT UNSIGNED,
IN _name VARCHAR(250),
IN _curso INT UNSIGNED,
IN _price DECIMAL(12,2),
IN _type VARCHAR(250),
IN _resource MEDIUMBLOB,
IN _nameR VARCHAR(250),
IN _idR int UNSIGNED,
IN _url VARCHAR(250)
)
BEGIN
	IF _case = 1 THEN
		INSERT INTO `level`(`name`,`price`,`course`) VALUES (_name,_price,_curso);
        SELECT Max(`id_level`) as id FROM `level`;
    END IF;
    IF _case = 2 THEN
		SELECT A.id_level , A.`name`,A.`price`, B.`price` as 'priceC' ,B.`name` as 'curso',B.`id_course`
        FROM `level` A INNER JOIN `course` B ON A.course = B.id_course 
        WHERE B.`user` = _idNivel AND B.deleted_at IS NULL AND A.deleted_at IS NULL AND B.`is_public` = 0;
    END IF;
     IF _case = 3 THEN
		INSERT INTO `resource`(`nombre`,`level`,`type`,	`url`,`resource`) VALUES (_nameR,_idNivel,_type,_url,_resource);
    END IF;
    IF _case = 4 THEN
		UPDATE `level` SET `deleted_at` = CURRENT_TIMESTAMP
        WHERE `id_level` = _idNivel;
    END IF;
END//

drop Trigger `TG_Resource`
delimiter //
CREATE TRIGGER `TG_Resource` Before INSERT on `resource` for each row
BEGIN
    if new.`url` <> "" THEN
	SET  new.`nombre` = null , new.`type` = null ,new.`resource` = null;
    else 
    SET  new.`url` = null ;
	End if;
END //

DROP PROCEDURE `SP_Video`

DELIMITER //
CREATE PROCEDURE `SP_Video`(
IN _case TINYINT,
IN _idVideo INT UNSIGNED,
IN _idNivel INT UNSIGNED,
IN _title VARCHAR(250),
IN _type VARCHAR(250),
IN _path VARCHAR(250)

)
BEGIN
	IF _case = 1 THEN
		INSERT INTO `video`(`level`,`path`,`type`,`title`) VALUES (_idNivel,_path,_type,_title);
    END IF;
    IF _case = 2 THEN
		SELECT A.`title` as 'video', A.`id_video`, B.id_level , B.`name` as 'level',C.`name` as 'curso',C.`id_course` 
        FROM `video` A INNER JOIN `level` B ON A.`level` = B.`id_level`
        INNER JOIN `course` C ON C.`id_course` = B.`course` 
        WHERE C.`user` = _idVideo AND B.deleted_at IS NULL AND A.deleted_at IS NULL AND C.deleted_at IS NULL ;
    END IF;
    IF _case = 3 THEN
		UPDATE `video` SET `deleted_at` = CURRENT_TIMESTAMP
        WHERE `id_video` = _idVideo;
    END IF;
END//

drop procedure `SP_Buscar`;
delimiter //
CREATE PROCEDURE `SP_Buscar`(
IN _case tinyint,
IN _limit tinyint
)
BEGIN
	if _case = 1 THEN
		SELECT A.`id_course`,A.`created_at`,A.`name`, A.`description`, A.`price`,B.`image`,B.`type_image` FROM `course` A INNER JOIN `image` B ON A.`image` = B.`id_image`
        WHERE A.`deleted_at` is null AND A.`is_public` = 1 order by A.`created_at` DESC limit _limit;
    END if;
END	//

drop Procedure `SP_CursoState`	
DELIMiTER //
CREATE PROCEDURE `SP_CursoState`(
IN _case TINYINT,
IN _curso INT UNSIGNED,
IN _user INT UNSIGNED
)
BEGIN
	if _case = 1 then 
		SELECT A.`name` as 'curso', A.`price`, A.`description`, C.`image`, C.`type_image`, B.`name`, B.`email`,B.`id_user`,
        (SELECT count(*) from `payment_course` WHERE course = A.id_course AND `user` = _user) as 'is_comprado'
		FROM `course` A INNER JOIN `user` B 
		ON A.`user` = B.`id_user` INNER JOIN `image` C
		ON C.`id_image` = A.image 
		WHERE A.`id_course` = _curso ;
    end if;
    if _case = 2 then 
		SELECT   C.`name`,C.`description`,C.`id_category`
		FROM `course` A INNER JOIN `categorycourse` B 
		ON A.`id_course` = B.`course` INNER JOIN `category` C
        ON B.`category` = C.id_category
		WHERE A.`id_course` = _curso ;
    end if;
END //


