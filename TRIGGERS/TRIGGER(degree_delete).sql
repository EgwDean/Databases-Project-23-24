DELIMITER $
DROP TRIGGER IF EXISTS degree_delete$
CREATE TRIGGER degree_delete AFTER DELETE ON degree
FOR EACH ROW 
BEGIN 
DECLARE d_titlos VARCHAR(150);
DECLARE d_idryma VARCHAR (140);
SELECT OLD.titlos, OLD.idryma INTO d_titlos, d_idryma FROM degree;
DECLARE event TEXT;
SET event = CONCAT('The degree with title ', d_titlos, 'and idryma ', d_idryma, ' has just been deleted by the administrator ',NEW.active_admin.username);
INSERT INTO administrator_log VALUES ( NEW.active_admin.username, NOW(), event);
END$
DELIMITER;
