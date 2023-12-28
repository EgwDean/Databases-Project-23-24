use etaireia_aksiologisis;

DELIMITER $
DROP TRIGGER IF EXISTS evaluationGrade$
CREATE TRIGGER evaluationGrade
BEFORE UPDATE ON evaluation
FOR EACH ROW
BEGIN
    DECLARE Grade1 INT;
    DECLARE Grade2 INT;

    SELECT evaluation.grade1 INTO Grade1
    FROM evaluation
    WHERE evaluation.evaluated_user = NEW.evaluated_user;

    SELECT evaluation.grade2 INTO Grade2
    FROM evaluation
    WHERE evaluation.evaluated_user = NEW.evaluated_user;   

    IF (Grade1 < 1 OR Grade1 > 20) OR (Grade2 < 1 OR Grade2 > 20) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'The grade has to be between 1 and 20.';
    END IF;
END$
DELIMITER ;