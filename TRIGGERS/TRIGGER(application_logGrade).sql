use etaireia_aksiologisis;

DELIMITER $
DROP TRIGGER IF EXISTS application_logGrade$
CREATE TRIGGER application_logGrade
BEFORE INSERT ON application_log
FOR EACH ROW
BEGIN
    DECLARE Grade INT;

    SELECT application_log.finalGrade INTO Grade
    FROM application_log
    WHERE application_log.e_username = NEW.application_log.e_username;

   
    IF (Grade < 1 OR Grade > 20)  THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'The grade is not between 1 and 20.';
    END IF;
END$
DELIMITER ;
