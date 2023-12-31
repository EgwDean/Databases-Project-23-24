USE etaireia_aksiologisis;

DELIMITER $
DROP TRIGGER IF EXISTS validateApplicationDate$
CREATE TRIGGER validateApplicationDate
BEFORE INSERT ON applies
FOR EACH ROW
BEGIN
    DECLARE applicationDate DATE;
    DECLARE startDate DATE;
    DECLARE diff INT;

    SELECT start_date INTO startDate
    FROM job
    WHERE id = NEW.job_id;
    
    SELECT application_date INTO applicationDate
    FROM applies
    WHERE applies.application_date=NEW.application_date;

    SET diff = DATEDIFF(startDate, application_date);

    IF diff < 15  THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid application date! Must be more than 15 days before the start date of the job';
    END IF;
END$
DELIMITER ;
