
DELIMITER $
DROP PROCEDURE IF EXISTS checkPositionOccupied$
CREATE PROCEDURE checkPositionOccupied(IN job_id VARCHAR(30))
BEGIN
CALL positionEvaluation(job_id);
SELECT emp_username, jobid
FROM has_position
WHERE jobid=job_id;
END$
DELIMITER ;
