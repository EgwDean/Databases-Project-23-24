DELIMITER $
DROP INDEX idx_evaluator ON application_log$
CREATE INDEX idx_evaluator ON application_log(e_evaluator1, e_evaluator2)$

DROP PROCEDURE IF EXISTS searchByEval$
CREATE PROCEDURE searchByEval(IN eval_username VARCHAR(30))
BEGIN
SELECT e_username, positionID
FROM application_log
WHERE e_evaluator1=eval_username OR e_evaluator2=eval_username;
END$
DELIMITER ;
