USE etaireia_aksiologisis;

DELIMITER $
DROP TRIGGER IF EXISTS validateApplicationUpdate$
CREATE TRIGGER validateApplicationUpdate
BEFORE UPDATE ON applies
FOR EACH ROW
BEGIN
DECLARE numOfActive INT;
SELECT COUNT(*) INTO numOfActive
FROM applies
WHERE applies.cand_usrname=NEW.cand_usrname
AND state='active';
IF numOfActive>=3 THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Invalid application. The employee already has at least 3 active applications';
END IF;
END$
DELIMITER ;



