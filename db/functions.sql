/* ffunctions */

drop function if exists NivelesComprados;
Delimiter //
CREATE  FUNCTION NivelesComprados(
userid INT,
courseid INT
) RETURNS varchar(50) 
BEGIN
DECLARE A INT;
DECLARE B INT;
DECLARE C INT;

SET A = ( select count(payment_level.level) as cantidadl from payment_level 
 INNER JOIN user on user.id_user = payment_level.user 
 INNER JOIN level on  payment_level.level = level.id_level 
 INNER JOIN course on course.id_course = level.course 
 where user.id_user = userid and course.id_course = courseid);
SET B = (select count(level.id_level) as nivel from level INNER JOIN course on level.course = course.id_course where course.id_course = courseid and level.deleted_at is null);

SET C = IF(A<=B,true,false);
RETURN C;
END //

drop function if exists progresoCurso;
Delimiter //
CREATE  FUNCTION progresoCurso(
idUser  INT,
idCourse INT
) RETURNS tinyint
BEGIN
DECLARE A INT;
DECLARE B INT;
DECLARE C FLOAT;

SET A = (select count(video.id_video) as video from 
 video INNER JOIN level ON level.id_level = video.level
INNER JOIN courseprogress ON video.id_video= courseprogress.video
where courseprogress.user = idUser AND level.course = idCourse);

set B = (select count(video.id_video) as video from level 
INNER JOIN video ON level.id_level = video.level where level.course = idCourse);

SET C = (A / B) * 100;

RETURN C;
END //

drop function if exists progresoNivel;
DELIMITER //
CREATE  FUNCTION progresoNivel(
_idUser  INT,
_idNivel INT
) RETURNS varchar(50) 
BEGIN
DECLARE A INT;
DECLARE B INT;
DECLARE C varchar(50);

SET A = (select count(video.id_video) as video from courseprogress
INNER JOIN video ON video.id_video = courseprogress.video
where courseprogress.user = _idUser AND video.level = _idNivel);

set B = (select count(id_video)  from video
WHERE level = _idNivel AND deleted_at is null);

SET C = IF(B<=A,"Completado","Por Completar");

RETURN C;
END //





