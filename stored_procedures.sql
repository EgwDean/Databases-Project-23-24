USE etaireia_aksiologisis;

USE etaireia_aksiologisis;

DELIMITER $
DROP PROCEDURE IF EXISTS gradeCorrection$
CREATE PROCEDURE gradeCorrection(IN candidate_username VARCHAR(30))
BEGIN

DECLARE numLang INT;
DECLARE numProj INT;
DECLARE numBSc INT;
DECLARE numMSc INT;
DECLARE numPhD INT;

DECLARE corrected_grade INT;

DECLARE evaluator_1 VARCHAR(30);
DECLARE evaluator_2 VARCHAR(30);

DECLARE grade_1 INT;
DECLARE grade_2 INT;

SELECT COUNT(*) INTO numLang FROM languages
WHERE candidate_username=languages.candid;

SELECT COUNT(*) INTO numProj FROM project
WHERE candidate_username=project.candid;

SELECT COUNT(*) INTO numBSc FROM degree
INNER JOIN has_degree
ON degree.titlos=has_degree.degr_title
AND degree.idryma=has_degree.degr_idryma
WHERE candidate_username=has_degree.cand_usrname
AND degree.bathmida='BSc';

SELECT COUNT(*) INTO numMSc FROM degree
INNER JOIN has_degree
ON degree.titlos=has_degree.degr_title
AND degree.idryma=has_degree.degr_idryma
WHERE candidate_username=has_degree.cand_usrname
AND degree.bathmida='MSc';

SELECT COUNT(*) INTO numPhD FROM degree
INNER JOIN has_degree
ON degree.titlos=has_degree.degr_title
AND degree.idryma=has_degree.degr_idryma
WHERE candidate_username=has_degree.cand_usrname
AND degree.bathmida='PhD';

SET corrected_grade = numLang+numProj+numBSc+2*numMSc+3*numPhD;

SELECT evaluator1 INTO evaluator_1
FROM evaluation
WHERE evaluation.evaluated_user=candidate_username;

IF evaluator_1 IS NULL THEN
UPDATE evaluation
SET grade1 = corrected_grade
WHERE evaluation.evaluated_user=candidate_username;
END IF;

SELECT evaluator2 INTO evaluator_2
FROM evaluation
WHERE evaluation.evaluated_user=candidate_username;

IF evaluator_2 IS NULL THEN
UPDATE evaluation
SET grade2 = corrected_grade                                            
WHERE evaluation.evaluated_user=candidate_username;
END IF;

UPDATE evaluation
SET final_grade=(grade1+grade2)/2
WHERE evaluation.evaluated_user=candidate_username;

END$
DELIMITER ;

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

IF EXISTS (SELECT * FROM applies WHERE state = 'canceled' AND cand_usrname = candidate_username
	    AND job_id = ejob_id) THEN 
	INSERT INTO application_log (e_username, e_evaluator1, e_evaluator2, positionID, a_state, finalGrade)
	SELECT candidate_username, evaluator_1, evaluator_2, ejob_id, 'completed', '0'
	FROM evaluation
	WHERE evaluation.evaluated_user = candidate_username;
	END IF;

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
