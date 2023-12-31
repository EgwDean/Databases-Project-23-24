DELIMITER $
DROP PROCEDURE IF EXISTS checkIfEvaluated$
CREATE PROCEDURE checkIfEvaluated(IN eval_username VARCHAR(30), IN empl_username VARCHAR(30), IN job_id INT(11), OUT result INT(11))
BEGIN

DECLARE grade1 INT(11);
DECLARE grade2 INT(11);

IF NOT EXISTS(
SELECT evaluator.username, employee.username, job.id
FROM evaluator
INNER JOIN job ON evaluator.username=job.evaluator
INNER JOIN applies ON job.id=applies.job_id
INNER JOIN employee ON applies.cand_usrname=employee.username
WHERE evaluator.username=eval_username
AND employee.username=empl_username
AND job.id=job_id)
THEN
SET result=0;

ELSE

IF evaluation.evaluator1=eval_username
THEN
SELECT evaluation.grade1
INTO grade1
FROM evaluation
INNER JOIN employee ON evaluation.evaluated_user=employee.username
WHERE evaluation.evaluator1=eval_username;
IF grade1 IS NOT NULL
THEN 
SET result=grade1;
ELSE
CALL gradeCorrection(empl_username);
END IF; 
END IF;

IF evaluation.evaluator2=eval_username
THEN
SELECT evaluation.grade2
INTO grade2
FROM evaluation
INNER JOIN employee ON evaluation.evaluated_user=employee.username
WHERE evaluation.evaluator2=eval_username;
IF grade2 IS NOT NULL
THEN
SET result=grade2;
ELSE
CALL gradeCorrection(empl_username);
END IF; 
END IF;

END IF;
END$

DELIMITER ;
