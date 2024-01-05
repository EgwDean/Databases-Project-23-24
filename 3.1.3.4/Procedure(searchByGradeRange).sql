DELIMITER $
DROP INDEX idx_empljob ON application_log$
CREATE INDEX idx_empljob ON application_log(finalGrade)$

DROP PROCEDURE IF EXISTS searchByGradeRange$
CREATE PROCEDURE searchByGradeRange(IN low INT(11), IN high INT(11))
BEGIN
SELECT application.e_username, application.positionID, application.finalGrade 
FROM application_log 
WHERE application_log.finalGrade BETWEEN low AND high; 
END$
DELIMITER ;
#..
