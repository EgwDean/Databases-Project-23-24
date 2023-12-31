USE etaireia_aksiologisis;

DELIMITER $
DROP TRIGGER IF EXISTS validateApplicationDateCancel$
CREATE TRIGGER validateApplicationDateCancel
BEFORE UPDATE ON applies
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

    IF diff < 10 AND NEW.state='canceled' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid application cancel! Must be within 10 days before the start date of the job';
    END IF;
END$
DELIMITER ;
