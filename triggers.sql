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

    IF diff < 15 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid application date! Must be more than 15 days before the start date of the job';
    END IF;
END$
DELIMITER ;

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

DELIMITER $
DROP TRIGGER IF EXISTS validateApplicationInsert$
CREATE TRIGGER validateApplicationInsert
BEFORE INSERT ON applies
FOR EACH ROW
BEGIN
DECLARE numOfActive INT;
SELECT COUNT(*) INTO numOfActive
FROM applies
WHERE applies.cand_usrname=NEW.cand_usrname
AND state='active';
IF numOfActive>=3 THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Invalid application. The employee already has at least 3 active applications';
END IF;
END$
DELIMITER ;

DELIMITER $
DROP TRIGGER IF EXISTS validateApplicationUpdate$
CREATE TRIGGER validateApplicationUpdate
BEFORE UPDATE ON applies
FOR EACH ROW
BEGIN
DECLARE numOfActive INT;
SELECT COUNT(*) INTO numOfActive
FROM applies
WHERE applies.cand_usrname=NEW.cand_usrname
AND state='active';
IF numOfActive>=3 THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Invalid application. The employee already has at least 3 active applications';
END IF;
END$
DELIMITER ;

DELIMITER $
DROP TRIGGER IF EXISTS evaluationGrade$
CREATE TRIGGER evaluationGrade
BEFORE INSERT ON evaluation
FOR EACH ROW
BEGIN
    DECLARE Grade1 INT;
    DECLARE Grade2 INT;

    SELECT evaluation.grade1 INTO Grade1
    FROM evaluation
    WHERE evaluation.evaluated_user = NEW.evaluated_user;

    SELECT evaluation.grade2 INTO Grade2
    FROM evaluation
    WHERE evaluation.evaluated_user = NEW.evaluated_user;   

    IF (Grade1 < 1 OR Grade1 > 20) OR (Grade2 < 1 OR Grade2 > 20) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'The grade has to be between 1 and 20.';
    END IF;
END$
DELIMITER ;
