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


