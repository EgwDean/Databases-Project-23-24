DELIMITER $
DROP TRIGGER IF EXISTS job_update$
CREATE TRIGGER job_update AFTER UPDATE ON job
FOR EACH ROW 
BEGIN 
DECLARE job_id INT(11);
SELECT NEW.job.id INTO job_id FROM job;
DECLARE current_datetime DATETIME ;
SET current_datetime = NOW();
DECLARE event TEXT;
SET event = CONCAT('The job with id ', job_id, ' has just been updated by the administrator ',NEW.active_admin.username);
INSERT INTO administrator_log VALUES (NEW.active_admin.username, current_datetime, event);
END$
DELIMITER;
