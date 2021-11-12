/*  Triggers  */

drop trigger NivelesGratis;
 delimiter //

CREATE TRIGGER NivelesGratis AFTER UPDATE ON `course`
  FOR EACH ROW
  BEGIN
    if New.price is null THEN
		UPDATE `level` SET `price` = null WHERE `course` = new.`id_course` ;
    END IF;
  END //
  
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

drop Trigger `TG_RegistroNivel`
delimiter //
CREATE TRIGGER `TG_RegistroNivel` After INSERT on `courseprogress` for each row
BEGIN
	set @a = (SELECT level from video where id_video = new.video );
    REPLACE into `registro_level`(`level`,`user`) VALUES (@a,new.user);
END // /* agregar que tambien  */