use bdm
select * from  categorycourse
select * from user;
select * from level;
select * from video;
select * from categorycourse;
select * from course;
select * from payment_course;
CALL `bdm`.`SP_Pago`(11,2,22.22,1,"efwefewfwefwefwef");
CALL `bdm`.`SP_Pago`(<{IN _courseid INT UNSIGNED}>, <{IN _userid INT UNSIGNED}>, <{IN _precio decimal(12,2)}>, <{in _payment INT UNSIGNED}>, <{IN _keyp varchar(150)}>);

SELECT  `course`.`name` as nombrec,`course`.`price` as precioc , `course`.`description` as decripcionc,`image`.`type_image` as tipo , `image`.`image` as imagen
        FROM `course` INNER JOIN `image` ON `course`.`image` = `image`.`id_image` where `course`.`id_course`= 11;
select  `level`.`id_level` as idNivel,
 `level`.`name` as nombreNivel,
 `level`.`price` as precio, `course`.`name` as nombreCurso, `level`.`id_level` as nivelId FROM `user` 
 INNER JOIN `payment_course` 
 ON `user`.`id_user` = `payment_course`.`user` 
 INNER JOIN `course` 
 ON `payment_course`.`course` =`course`.`id_course`
 INNER JOIN `level` ON `payment_course`.`course`= `level`.`course` where  `user`.`id_user` = 1 and `level`.`deleted_at` is null;
 
 
 select  `level`.`id_level` as idNivel,
 `level`.`name` as nombreNivel,
 `level`.`price` as precio, `course`.`name` as nombreCurso, `level`.`id_level` as nivelId,`bdm`.`progresoNivel`(idNivel,1) as Progreso FROM `user` 
 INNER JOIN `payment_course` 
 ON `user`.`id_user` = `payment_course`.`user` 
 INNER JOIN `course` 
 ON `payment_course`.`course` =`course`.`id_course`
 INNER JOIN `level` ON `payment_course`.`course`= `level`.`course` where  `user`.`id_user` = 1 
 and `level`.`deleted_at` is null and `course`.`id_course` = 11;
 
 /*select `bdm`.`progresoNivel`(26,1) as Progreso*/
 
 
 
 
 
 
 
 
 
 
 
 
 select  `level`.`id_level` as idNivel,
 `level`.`name` as nombreNivel,
 `level`.`price` as precio, `course`.`name` as nombreCurso, `level`.`id_level` as nivelId 
 FROM `course` INNER JOIN `level` ON `course`.`id_course`= `level`.`course` 
 where `course`.`id_course` = 11 and `level`.`deleted_at` is null;

select  `level`.`id_level` as idNivel,
 `level`.`name` as nombreNivel,
 `level`.`price` as precio, `course`.`name` as nombreCurso, `level`.`id_level` as nivelId FROM `user` 
 INNER JOIN `payment_course` 
 ON `user`.`id_user` = `payment_course`.`user` 
 INNER JOIN `course` 
 ON `payment_course`.`course` =`course`.`id_course`
 INNER JOIN `level` ON `payment_course`.`course`= `level`.`course` where  `user`.`id_user` = 1 
 and `level`.`deleted_at` is null and `course`.`id_course` = 11;

select  `level`.`id_level` as idNivel,
 `level`.`name` as nombreNivel,
 `level`.`price` as precio, `course`.`name` as nombreCurso, `level`.`id_level` as nivelId 
 FROM `course` INNER JOIN `payment_course` ON `payment_course`.`course` = `course`.`id_course` INNER JOIN 
 where `course`.`id_course` = _idCurso and `level`.`deleted_at` is null;
 
 
select `id_video` as video , `user` as usuarioNIvel from `user` 
INNER JOIN `course` ON `user`.`id_user` =`course`.`user` 
INNER JOIN `level` ON `course`.`id_course` 
INNER JOIN `video` ON `level`.`id_level` = `video`.`level` INNER JOIN `courseprogress`ON `video`.`id_video`= `courseprogress`.`video` where `user`.`id_user` = 1;
select `id_video` as video from `level` INNER JOIN `video` ON `level`.`id_level` = `video`.`level`;
SET GLOBAL log_bin_trust_function_creators = 1;
select count(`id_video`) as video from `user` 
INNER JOIN `course` ON `user`.`id_user` =`course`.`user` 
INNER JOIN `level` ON `course`.`id_course` 
INNER JOIN `video` ON `level`.`id_level` = `video`.`level` 
INNER JOIN `courseprogress` ON `video`.`id_video`= `courseprogress`.`video` 
where `user`.`id_user` = 1;

select count(`id_video`) as video from `level` 
INNER JOIN `video` ON `level`.`id_level` =`video`.`level` where `level`.`course` = 11;


select * from course ; 