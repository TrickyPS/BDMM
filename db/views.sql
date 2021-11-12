/*  Views */
drop view if exists V_Historial;
CREATE VIEW V_Historial
AS SELECT payment_course.`amount`, payment_course.course as curso,payment_course.user as usuario,payment_course.created_at,course.`user` as 'owned' FROM payment_course
 INNER JOIN course on course.id_course = payment_course.course
UNION ALL 
SELECT payment_level.`amount`, course.id_course as curso,payment_level.user as usuario,payment_level.created_at,course.`user` as 'owned'
 from payment_level 
INNER JOIN level ON level.id_level = payment_level.level 
INNER JOIN course ON course.id_course = level.course;

drop view if exists V_Amount;
CREATE VIEW V_Amount
AS 
SELECT payment_level.user as customer, payment_level.`amount`,payment_level.`created_at`,payment_level.`deleted_at`,payment_level.`payment_method`,course.`user`,course.id_course as curso
 from payment_level INNER JOIN level ON payment_level.level = level.id_level
 INNER JOIN course on course.id_course = level.course WHERE payment_level.`deleted_at` is null
UNION ALL
SELECT payment_course.user as customer, payment_course.`amount`,payment_course.`created_at`,payment_course.`deleted_at`,payment_course.`payment_method`,course.`user`,course.id_course as curso
from payment_course
INNER JOIN course on course.id_course = payment_course.course WHERE payment_course.`deleted_at` is null;

drop view if exists V_NivelAvg;
CREATE VIEW V_NivelAvg
AS 
SELECT registro_level.`level`,registro_level.`user`,`level`.course from registro_level 
INNER JOIN `level` ON registro_level.level = `level`.id_level;

drop view if exists V_Metodos;
CREATE VIEW V_Metodos
AS 
SELECT A.payment_method,A.customer,A.curso,B.`name` from V_Amount A 
INNER JOIN payment_method B ON A.payment_method = B.id_payment_method;