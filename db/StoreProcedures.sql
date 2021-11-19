/*script store Procedure */

/*DROP PROCEDURE IF EXISTS SP_FindUserByAuth;*/
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
    
/*drop procedure IF EXISTS SP_UpdateUser;*/

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

/*drop procedure IF EXISTS `SP_Category`;*/
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
     IF _case = 4 THEN
         Select count(B.category) as cant,B.category,C.name from V_Reportes A 
         INNER JOIN categorycourse B ON A.curso = B.course
         Inner join category C ON B.category = C.id_category
         group by B.category;
     END IF;
     
END //

/*DROP PROCEDURE IF EXISTS  `SP_Curso`*/

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
         WHERE F.`user` = _user AND F.`deleted_at` is null  ;
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
		UPDATE `course` SET `is_public` = 1,`created_at` = CURRENT_TIMESTAMP
        WHERE `id_course` = _curso;
     END IF;
      IF _case = 6 THEN
		SELECT 
        (SELECT SUM(amount) from V_Amount Where user = _user) as monto,
        (SELECT count(curso) from (SELECT curso from V_Historial WHERE owned = _user GROUP BY curso) countCurso ) as cursos,
        (SELECT SUM(amount) from V_Amount
        Where user = _user AND month(created_at) = month(curdate()) ANd year(created_at) = year(curdate())) as montoMes;
     END IF;
     if _case = 7 then
		select sum(amount) as monto,A.curso,C.image,C.type_image,B.name from V_Amount A INNER JOIN `course` B ON A.curso = B.id_course 
        INNER JOIN image C ON B.image = C.id_image
        WHERE A.user = _user group by A.curso Order by monto DESC limit 3;
     end if;
      if _case = 8 then
		SELECT
		(SELECT  SUM(amount)  from V_Amount
        Where user = _user AND
		YEAR(created_at) = YEAR(CURRENT_DATE - INTERVAL 1 MONTH)
		AND MONTH(created_at) = MONTH(CURRENT_DATE)) as '0',
        (SELECT  SUM(amount)  from V_Amount
        Where user = _user AND
		YEAR(created_at) = YEAR(CURRENT_DATE - INTERVAL 1 MONTH)
		AND MONTH(created_at) = MONTH(CURRENT_DATE - INTERVAL 1 MONTH)) as '1',
         (SELECT  SUM(amount)  from V_Amount
        Where user = _user AND
		YEAR(created_at) = YEAR(CURRENT_DATE - INTERVAL 2 MONTH)
		AND MONTH(created_at) = MONTH(CURRENT_DATE - INTERVAL 2 MONTH)) as '2',
          (SELECT  SUM(amount)  from V_Amount
        Where user = _user AND
		YEAR(created_at) = YEAR(CURRENT_DATE - INTERVAL 3 MONTH)
		AND MONTH(created_at) = MONTH(CURRENT_DATE - INTERVAL 3 MONTH)) as '3',
          (SELECT  SUM(amount)  from V_Amount
        Where user = _user AND
		YEAR(created_at) = YEAR(CURRENT_DATE - INTERVAL 4 MONTH)
		AND MONTH(created_at) = MONTH(CURRENT_DATE - INTERVAL 4 MONTH)) as '4',
          (SELECT  SUM(amount)  from V_Amount
        Where user = _user AND
		YEAR(created_at) = YEAR(CURRENT_DATE - INTERVAL 5 MONTH)
		AND MONTH(created_at) = MONTH(CURRENT_DATE - INTERVAL 5 MONTH)) as '5';
        
     end if;
     if _case = 9 then
    SELECT course.id_course,course.`name`, course.is_public,course.price,
        (SELECT count(curso) from V_Reportes WHERE curso = course.id_course) as inscritos,
        (SELECT sum(amount) from V_Amount WHERE curso = course.id_course ) as ingresos,
        (SELECT round(avg(cant),0) from V_Nivel WHERE curso = course.id_course) as nlPromedio
        from  course  WHERE course.deleted_at is null and course.`user` = _user;
     END if;
     if _case = 10 then
		select SUM(A.amount) as monto, A.payment_method,B.name  from V_Amount A INNER JOIN payment_method B ON A.payment_method = B.id_payment_method
        WHERE A.user = _user GROUP BY A.payment_method;
     end if;
     if _case = 11 then
		select A.usuario,B.`name`,B.`email`,A.created_at,progresoCurso(A.usuario,_curso) as progreso,
        sum(amount) as monto,
        
        (select group_concat(name) from V_Metodos WHERE curso = _curso AND customer = A.usuario group by curso,customer ) as metodos
        from V_Historial A 
        INNER JOIN `user` B ON A.usuario = B.id_user
        WHERE A.curso = _curso GROUP by A.curso,A.usuario;
     end if;
     IF _case = 12 THEN
        SELECT F.`id_course`,F.`is_public`,F.`name`,F.`price`,F.`description`,F.`created_at`,F.`updated_at`,F.`deleted_at`,
         (SELECT count(*) from `video` A INNER JOIN `level` B ON A.level = B.id_level INNER JOIN `course` C ON C.id_course = B.course
         WHERE C.`id_course`= F.`id_course` AND A.`deleted_at` is null AND B.`deleted_at` is null AND C.`deleted_at` is null) as 'count'
        FROM `course` F
         WHERE F.`user` = _user AND F.`deleted_at` is null AND  F.is_public = 0 ;
     END IF;
END //

/*DROP PROCEDURE if exists `SP_Nivel`*/

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
    IF _case = 5 THEN 
		Select `resource`.`id_resource`,`resource`.`nombre`,`resource`.`type`,`resource`.`url`,`resource`.`resource` 
        from `resource`
        WHERE `resource`.`level` = _idNivel; 
    END IF;
      
END//

/*DROP PROCEDURE if exists `SP_Video`*/

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
        WHERE C.`user` = _idVideo AND B.deleted_at IS NULL AND A.deleted_at IS NULL AND C.deleted_at IS NULL AND C.is_public = 0 ;
    END IF;
    IF _case = 3 THEN
		UPDATE `video` SET `deleted_at` = CURRENT_TIMESTAMP
        WHERE `id_video` = _idVideo;
    END IF;
     IF _case = 4 THEN
		Select `level`,`path`,`created_at`,`type`,`title` FROM `video` 
        WHERE id_video = _idVideo ; /* validar si compro el video - level -paymentlevel-paymentcurso */
    END IF;
	IF _case = 5 THEN
		Replace INTO `courseprogress` (`video`, `user`) VALUES (_idVideo,_idNivel);
    END IF;
      IF _case = 6 THEN
		Select `id_video`,`path`,`created_at`,`type`,`title` FROM `video` 
        WHERE `level` = _idNivel AND deleted_at is null ORDER BY `created_at` DESC ; /* validar si compro el video - level -paymentlevel-paymentcurso */
    END IF;
END//

/*drop procedure if exists `SP_Buscar`;*/
delimiter //
CREATE PROCEDURE `SP_Buscar`(
IN _case tinyint,
IN _limit tinyint,
IN _buscar VARCHAR(250),
IN _a date ,
IN _desde date,
IN _categoria INT UNSIGNED,
IN _by tinyint
)
BEGIN
	if _case = 1 THEN
		SELECT A.`id_course`,A.`created_at`,A.`name`, A.`description`, A.`price`,B.`image`,B.`type_image` FROM `course` A INNER JOIN `image` B ON A.`image` = B.`id_image`
        WHERE A.`deleted_at` is null AND A.`is_public` = 1 order by A.`created_at` DESC limit _limit;
    END if;
    if _case = 2 THEN
		SELECT  A.id_course, B.title, B.nombre,B.image,B.type_image,B.created_at,B.price,
           (SELECT avg(`pts`) FROM `score` WHERE course = A.id_course) as puntos
           from course A INNER JOIN V_BuscarLanding B ON A.id_course = B.id_course
           WHERe A.deleted_at is null ANd A.is_public = 1 ORDER BY puntos DESC LIMIT 4;
    END if;
    if _case = 3 THEN
		SELECT  A.id_course, B.title, B.nombre,B.image,B.type_image,B.created_at,B.price,
           (SELECT count(curso) from (SELECT usuario,curso from V_Historial  GROUP BY curso,usuario) si WHERE si.curso = A.id_course ) as cant
           from course A INNER JOIN V_BuscarLanding B ON A.id_course = B.id_course
           WHERe A.deleted_at is null ANd A.is_public = 1 ORDER BY cant DESC LIMIT 4;
    END if;
    if _case = 4 THEN
		if _categoria = 0 then
			if _by = 0 then
        SELECT  id_course, image,type_image,title,price,nombre,created_at,category,_buscar FROM V_Buscar
         WHERE title LIKE CONCAT('%',_buscar,'%') AND created_at between _desde   and _a + interval 1 day  
         OR  nombre LIKE CONCAT('%',_buscar,'%') AND created_at  between _desde  and _a + interval 1 day 
         GROUP BY id_course ORDER BY created_at DESC ;
        end if;
        if _by = 1 then
        SELECT  id_course, image,type_image,title,price,nombre,created_at,category,_buscar FROM V_Buscar
         WHERE title LIKE CONCAT('%',_buscar,'%') AND created_at between _desde  and _a + interval 1 day 
         GROUP BY id_course ORDER BY created_at DESC ;
        end if;
         if _by = 2 then
        SELECT  id_course, image,type_image,title,price,nombre,created_at,category,_buscar FROM V_Buscar
         WHERE nombre LIKE CONCAT('%',_buscar,'%') AND created_at between _desde  and _a + interval 1 day  
         GROUP BY id_course ORDER BY created_at DESC ;
         end if;
        else
			if _by = 0 then
        SELECT  id_course, image,type_image,title,price,nombre,created_at,category,_buscar FROM V_Buscar
         WHERE title LIKE CONCAT('%',_buscar,'%') AND created_at between _desde   and _a + interval 1 day  AND category = _categoria
         OR  nombre LIKE CONCAT('%',_buscar,'%') AND created_at  between _desde  and _a + interval 1 day AND category = _categoria
         GROUP BY id_course ORDER BY created_at DESC ;
        end if;
        if _by = 1 then
        SELECT  id_course, image,type_image,title,price,nombre,created_at,category,_buscar FROM V_Buscar
         WHERE title LIKE CONCAT('%',_buscar,'%') AND created_at between _desde  and _a + interval 1 day  AND category = _categoria
         GROUP BY id_course ORDER BY created_at DESC ;
        end if;
         if _by = 2 then
        SELECT  id_course, image,type_image,title,price,nombre,created_at,category,_buscar FROM V_Buscar
         WHERE nombre LIKE CONCAT('%',_buscar,'%') AND created_at between _desde  and _a + interval 1 day  AND category = _categoria
         GROUP BY id_course ORDER BY created_at DESC ;
        end if;
    
        end if;
    
       
    end if;
END	//

/*drop Procedure if exists `SP_CursoState`	*/
DELIMiTER //
CREATE PROCEDURE `SP_CursoState`(
IN _case TINYINT,
IN _curso INT UNSIGNED,
IN _user INT UNSIGNED
)
BEGIN
	if _case = 1 then 
		SELECT A.`name` as 'curso', A.`price`, A.`description`, C.`image`, C.`type_image`, B.`name`, B.`email`,B.`id_user`,
        (SELECT count(*) from `payment_course` WHERE course = A.id_course AND `user` = _user) as 'is_comprado',
		progresoCurso (_user,_curso) as porcentaje,
        (SELECT avg(`pts`) FROM `score` WHERE course = _curso) as puntos,
        (SELECT count(`pts`) FROM `score` WHERE course = _curso) as countPts,
        (SELECT count(*) from `score` WHERE `user` = _user AND 	`course` = _curso) as isCalificado
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
    if _case = 3 then 
		SELECT  `course`.`name` as nombrec,`course`.`price` as precioc , `course`.`description` as decripcionc,`image`.`type_image` as tipo , `image`.`image` as imagen,
         (SELECT avg(`pts`) FROM `score` WHERE course = _curso) as puntos,
        (SELECT count(`pts`) FROM `score` WHERE course = _curso) as countPts
        FROM `course` INNER JOIN `image` ON `course`.`image` = `image`.`id_image` where `course`.`id_course`= _curso;
	END IF;
END //

/*drop procedure if exists `SP_Chat`;*/
delimiter //
create procedure `SP_Chat`(
IN _case TINYINT,
IN _from INT UNSIGNED,
IN _to INT UNSIGNED,
IN _msg VARCHAR(250)
)
BEGIN
	if _case = 1 then
		INSERT INTO `chat`(`message`,`from`,`to`) VALUES (_msg,_from,_to);
    END If;
    if _case = 2 then
		SELECT `message`,`created_at`,`from`,`to` from `chat`
        WHERE  `from` = _from AND `to` = _to  OR  `from` = _to AND `to` = _from
        ORDER by created_at Asc;	
    END If;
	if _case = 3 then
		SELECT B.`name`,B.`email`,C.`image`,C.`type_image`,B.`id_user` 
		from (SELECT  CASE 
		WHEN `to` = _from THEN `from` 
		ELSE `to` END AS other 
		FROM `chat` 
		WHERE `from` = _from OR `to` = _from GROUP BY other) A INNER JOIN `user` B 
        ON A.other = B.id_user  INNER JOIN `image` C 
        ON C.id_image =  B.`avatar`;
    END If;
	if _case = 4 then
		SELECT `message`,`created_at`,`from`,`to` from `chat` WHERE  `from` = _from AND `to` = _to OR  `from` = _to AND `to` = _from
        ORDER BY `created_at` Desc Limit 1;	
    END If;
    if _case = 5 then
		SELECT A.`name`,A.`email`, B.`image`, B.type_image from `user` A INNER JOIN `image` B ON A.`avatar` = B.`id_image`
        WHERE  A.`id_user` = _to;
    END If;
ENd //

/*drop procedure if exists `SP_Comentarios`;*/
DELIMITER //
CREATE  PROCEDURE `SP_Comentarios`(
IN _case TINYINT,
IN _curso INT UNSIGNED,
IN _user INT UNSIGNED,
IN _comentario VARCHAR(250)
)
BEGIN
	if _case = 1 then
		INSERT INTO `comment`(`comment`,`user`,`course`) VALUES (_comentario,_user,_curso);
    END If;
    if _case = 2 then
		SELECT  `comment`.`created_at`as fecha, `comment`.`comment` as comentario, `user`.`name` as nombre,`user`.`email` as correo,`image`.`image` as imagen ,`image`.`type_image` as tipo
        from `comment` INNER JOIN `user` ON `comment`.`user` = `user`.`id_user`
        INNER JOIN `image` ON `image`.`id_image` = `user`.`avatar`
        WHERE `comment`.`course` = _curso  AND `comment`.`deleted_at` is null
        ORDER by `comment`.created_at ASC;	
    END If;
	
END//

/*drop procedure if exists SP_GetLevel;*/
DELIMITER //
CREATE PROCEDURE  SP_GetLevel (
IN _idCurso INT unsigned
)
BEGIN
 select   level . id_level  as idNivel,
  level . name  as nombreNivel,
  level . price  as precio,  course . name  as nombreCurso,  level . id_level  as nivelId,
 (select count(id_video) as cuenta from video 
 INNER JOIN level on video.level = level.id_level 
 where level.course = _idCurso and level.id_level = nivelId) as cantidad
 FROM  course  INNER JOIN  level  ON  course . id_course =  level . course  
 where  course . id_course  = _idCurso and  level . deleted_at  is null;
END //

/*drop procedure if exists SP_GetLevelUS;*/
DELIMITER //
CREATE PROCEDURE  SP_GetLevelUS (
IN _idCurso INT,
IN _idUser INT
)
BEGIN
select   level.id_level  as idNivel,
  level.name  as nombreNivel,
  level.price  as precio,  course.name  as nombreCurso,  level.id_level  as nivelId, 
 (select count(payment_level.id_payment_level) from payment_level where payment_level.user = _idUser and payment_level.level = level.id_level
 ) as Comprado, (select count(id_video) as cuenta from video 
 INNER JOIN level on video.level = level.id_level 
 where level.course = _idCurso and level.id_level = nivelId) as cantidad,
 progresoNivel(_idUser,level.id_level) as Progreso
  FROM  course  INNER JOIN  level  ON  course . id_course =  level.course  
 where  course.id_course  = _idCurso and  level.deleted_at  is null;

END//

/*drop procedure if exists SP_GetVideoLevel;*/
DELIMITER //
CREATE PROCEDURE SP_GetVideoLevel (
IN _levelid INT
)
BEGIN
 select  video.id_video  as videoid, title  as tituloVideo, video.level  
 FROM level  
 INNER  JOIN video 
ON  video.level  = level.id_level  
INNER JOIN course  
ON course.id_course  = level.course  where level.id_level  = _levelid AND video.deleted_at is null;
END //


/*drop procedure if exists SP_GetVideoLevelUser;*/
DELIMITER //
CREATE PROCEDURE SP_GetVideoLevelUser (
IN _levelid INT,
IN _userid INT
)
BEGIN
 select video.id_video  as videoid, title  as tituloVideo, video.level  FROM video  INNER JOIN  level  ON
  level . id_level  = video.level  where level.id_level  = _levelid AND video.deleted_at is null ;
END//

/*drop procedure if exists SP_Historial;*/
DELIMITER //
CREATE PROCEDURE SP_Historial (
IN _case INT unsigned,
IN id_usuario INT unsigned,
IN _curso INT unsigned
)
BEGIN
	if _case = 1 then
		select course.id_course  as idCurso, course.name  as nombreCurso, hist.created_at as 'creacion',
        description  as descripcionCurso, image.image  as imagen , image.type_image  as tipo,
        progresoCurso (id_usuario,course.id_course) as porcentaje,
        (SELECT level from V_Registro
        WHERE course = course.id_course AND `user` = id_usuario ORDER BY updated_at DESC LIMIT 1 ) as 'idNivelLast',
         (SELECT updated_at from V_Registro
        WHERE course = course.id_course AND `user` = id_usuario ORDER BY updated_at DESC LIMIT 1 ) as 'lastDateLevel',
         (SELECT `name` from V_Registro
        WHERE course = course.id_course AND `user` = id_usuario ORDER BY updated_at DESC LIMIT 1 ) as 'lastNameLevel',
        (SELECT `fecha` from V_Registro 
		WHERE course = course.id_course AND `user` = id_usuario LIMIT 1	) as concluido
		FROM user  INNER JOIN (SELECT usuario, curso,created_at from V_Historial GROUP BY curso , usuario) as hist
		ON user.id_user  = hist.usuario  
		INNER JOIN course  
		ON hist.curso  = course.id_course  INNER JOIN image  ON
		course.image  = image.id_image 
		where user.id_user  = id_usuario ;
    END IF;
	
    if _case = 2 then
		SELECT A.fecha as fin,
        (select `name` from `user` WHERE id_user = id_usuario ) as nombre,
        (select created_at from V_Historial WHERE usuario =id_usuario AND curso =_curso ORDER BY created_at ASC LIMIT 1) as inicio,
        (select `name` from course WHERE id_course = _curso) as curso
        from V_Registro A WHERE A.course = _curso AND A.`user` = id_usuario LIMIT 1;
    end if;
END//

/*drop procedure if exists SP_PagarNivel;*/
DELIMITER //
CREATE PROCEDURE SP_PagarNivel (
IN iduser int,
IN idlevel int,
IN nombreNivel varchar(60),
IN precio decimal(12,2),
IN metodo int,
IN llave varchar(150)
)
BEGIN
INSERT INTO payment_level 
( level ,
 user ,
 amount ,
 payment_method ,
 `key` )
VALUES
(idlevel,
iduser,
precio,
metodo,
llave);
END//

/*drop procedure if exists SP_Pago;*/
DELIMITER //
CREATE PROCEDURE SP_Pago (
IN _courseid INT UNSIGNED,
IN _userid INT UNSIGNED,
IN _precio decimal(12,2),
in _payment INT UNSIGNED,
IN _keyp varchar(150)
)
BEGIN
INSERT INTO payment_course ( course , user , amount , payment_method , `key` ) VALUES(_courseid,_userid,_precio,_payment,_keyp);
END//

/*drop procedure if exists SP_PROGRESOTOTAL;*/
DELIMITER //
CREATE PROCEDURE SP_PROGRESOTOTAL (
IN id_user INT,
IN id_course INT
)
BEGIN
select progresoCurso (id_user,id_course) as porcentaje;
END//


DELIMITER //
CREATE PROCEDURE SP_StatusNivel (
IN nivelid INT,
IN iduser INT
)
BEGIN
 select progresoNivel(iduser,nivelid) as Progreso;
END//

/*drop procedure if exists SP_GetVideoLevel;*/
DELIMITER //
CREATE  PROCEDURE SP_GetVideoLevel(
IN _levelid INT
)
BEGIN
 select  `video`.id_video as videoid, `title` as tituloVideo,`video`.`level` 
 FROM `level` 
 INNER  JOIN `video`
ON  `video`.level = `level`.id_level 
INNER JOIN `course` 
ON `course`.id_course =`level`.course where `level`.id_level = _levelid;
END //

/*drop procedure if exists SP_Score;*/
DELIMITER //
CREATE  PROCEDURE SP_Score(
IN _case tinyint,
IN _user INT UNSIGNED,
IN _curso INT UNSIGNED,
IN _pts TINYINT
)
BEGIN
 if _case = 1 THEN
	INSERT INTO score(`user`,`course`,pts) VALUES (_user,_curso,_pts);
 END IF;
 if _case = 2 THEN
	SELECT avg(`pts`) FROM `score` WHERE course = _curso;
 END IF;
END //







