DELIMITER $
DROP TRIGGER IF EXISTS job_insert$
CREATE TRIGGER job_insert AFTER INSERT ON job
FOR EACH ROW 
BEGIN 
DECLARE job_id INT(11);
SELECT MAX(job.id) INTO job_id FROM job;
DECLARE current_datetime DATETIME ;
DECLARE event TEXT;
SET current_datetime = NOW();
SET event = CONCAT('The job with id ', job_id, ' has just been inserted by the administrator ',NEW.active_admin.username);
INSERT INTO administrator_log VALUES (NEW.active_admin.username, current_datetime, event);
END$
DELIMITER;
