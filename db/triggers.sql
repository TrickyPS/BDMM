/*  Triggers  */

/*drop trigger NivelesGratis;*/
 /*drop Trigger `TG_Resource`*/
  /*drop Trigger `TG_RegistroNivel`*/
  
  
 delimiter //

CREATE TRIGGER NivelesGratis AFTER UPDATE ON `course`
  FOR EACH ROW
  BEGIN
    if New.price is null THEN
		UPDATE `level` SET `price` = null WHERE `course` = new.`id_course` ;
    END IF;
  END //
  
 
delimiter //
CREATE TRIGGER `TG_Resource` Before INSERT on `resource` for each row
BEGIN
    if new.`url` <> "" THEN
	SET  new.`nombre` = null , new.`type` = null ,new.`resource` = null;
    else 
    SET  new.`url` = null ;
	End if;
END //


delimiter //
CREATE TRIGGER `TG_RegistroNivel` After INSERT on `courseprogress` for each row
BEGIN
	set @a = (SELECT level from video where id_video = new.video );
    REPLACE into `registro_level`(`level`,`user`) VALUES (@a,new.user);
    
    set @curso = (SELECT course from `level` where id_level = @a );
    set @progreso = (Select progresoCurso(new.user,@curso));
    
    if @progreso = 100 then
		UPDATE `registro_level` 
        INNER JOIN `level` ON `registro_level`.level = `level`.id_level 
        SET `registro_level`.fecha = now(), `registro_level`.is_updated = 1 WHERE `level`.course = @curso AND `registro_level`.is_updated = 0 AND `registro_level`.user = new.user;
    end if;
    
END // 