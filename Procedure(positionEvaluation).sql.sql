DELIMITER $
DROP PROCEDURE IF EXISTS positionEvaluation$
CREATE PROCEDURE positionEvaluation(IN ejob_id INT)
BEGIN
    DECLARE candidate_username VARCHAR(30);
    DECLARE evaluator_1 VARCHAR(30);
    DECLARE evaluator_2 VARCHAR(30);
    DECLARE finishedFlag INT;
    
    DECLARE gradeCorrectionCursor CURSOR FOR
    SELECT applies.cand_usrname FROM applies
    WHERE applies.job_id = ejob_id AND applies.state = 'active';
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finishedFlag = 1;
    
    SET finishedFlag = 0;
    
    OPEN gradeCorrectionCursor;
    
    WHILE (finishedFlag) = 0 DO
    FETCH gradeCorrectionCursor INTO candidate_username;
    CALL gradeCorrection(candidate_username);
    END WHILE;
    
    CLOSE gradeCorrectionCursor;
    
    SELECT applies.cand_usrname, evaluation.evaluator1, evaluation.evaluator2
    INTO candidate_username, evaluator_1, evaluator_2
	FROM applies
	INNER JOIN evaluation ON applies.cand_usrname = evaluation.evaluated_user
	WHERE applies.job_id = ejob_id AND applies.state = 'active'
	ORDER BY evaluation.final_grade DESC, applies.application_date ASC
    LIMIT 1;
    
    DELETE FROM applies
	WHERE applies.cand_usrname = candidate_username AND applies.job_id = ejob_id;
    
    INSERT INTO application_log (e_username, e_evaluator1, e_evaluator2, positionID, a_state, finalGrade)
	SELECT candidate_username, evaluator_1, evaluator_2, ejob_id, 'completed', evaluation.final_grade
	FROM evaluation
	WHERE evaluation.evaluated_user = candidate_username;
    
    IF EXISTS (SELECT * FROM has_position WHERE jobid = ejob_id) THEN
    UPDATE has_position
	SET employee_username = candidate_username
	WHERE jobid = ejob_id;
    ELSE
    INSERT INTO has_position
    VALUES (candidate_username, ejob_id);
    END IF;
END$

DELIMITER ;