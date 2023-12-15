use etaireia_aksiologisis;

DELIMITER $ 
DROP TRIGGER IF EXISTS autoIncrementProject$
CREATE TRIGGER autoIncrementProject
BEFORE INSERT ON project
FOR EACH ROW 
BEGIN 
DECLARE pnum TINYINT(4); 
SELECT MAX(num) INTO pnum 
FROM project
WHERE candid=NEW.candid; 
IF pnum is NULL THEN  
SET pnum=0;  
END IF; 
SET NEW.num=pnum+1; 
END$ 
DELIMITER ;