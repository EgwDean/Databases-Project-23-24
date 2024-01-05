DELIMITER $
DROP TRIGGER IF EXISTS job_delete$
CREATE TRIGGER job_delete AFTER DELETE ON job
FOR EACH ROW 
BEGIN 
DECLARE job_id INT(11);
SELECT OLD.job.id INTO job_id FROM job;
DECLARE current_datetime DATETIME ;
SET current_datetime = NOW();
DECLARE event TEXT;
SET event = CONCAT('The job with id ', job_id, ' has just been deleted by the administrator ',NEW.active_admin.username);
INSERT INTO administrator_log VALUES (NEW.active_admin.username, current_datetime, event);   //χρησιμοποιείται το ψευδώνημο NEW γιατί δεν με ενδιαφέρει κάποια τίμη που διαγράφεται  
END$
DELIMITER;
