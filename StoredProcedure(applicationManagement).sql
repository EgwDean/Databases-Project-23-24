DELIMITER $
CREATE PROCEDURE applicationManagement (empl_usrname VARCHAR(30), jobId INT(11), identifier ENUM ('i', 'c', 'a'))
BEGIN 
DECLARE applDate DATE;
DECLARE eva1 VARCHAR(30);
DECLARE eva2 VARCHAR (30);
 
SET applDate = CURDATE();
 
IF (identifier = 'i') THEN
  SELECT * FROM applies WHERE cand_usrname = empl_usrname AND job_id = jobId;
 
  SELECT evaluator1 INTO eva1 FROM evaluation INNER JOIN employee ON evaluated_user = employee.username INNER JOIN applies ON cand_usrname = employee.username;
  SELECT evaluator2 INTO eva2 FROM evaluation INNER JOIN employee ON evaluated_user = employee.username INNER JOIN applies ON cand_usrname = employee.username;
  
    IF (eva1 IS NULL OR eva2 IS NULL ) THEN 
      SELECT evaluator.username INTO eva1 FROM evaluator INNER JOIN evaluation ON evaluator1 = evaluator.username ORDER BY exp_years DESC;
	  SELECT evaluator.username INTO eva2 FROM evaluator INNER JOIN evaluation ON evaluator1 = evaluator.username ORDER BY exp_years DESC;
    ELSE 
      INSERT INTO applies VALUES ('empl_usrname', 'jobId', 'applDate', 'completed');
    END IF;

	
 ELSEIF (identifier = 'c') THEN 
    IF EXISTS ( SELECT * FROM applies WHERE empl_usrname = cand_usrname AND jobId = job_id) THEN
	  DELETE FROM applies 
      WHERE empl_usrname = cand_usrname AND jobId = job_id;
	  SELECT 'The application has been deleted';
	  INSERT INTO application_log (e_username, e_evaluator1, e_evaluator2, positionID, a_state) VALUES ('empl_usrname','eva1', 'eva2', 'jobId','canceled');
	ELSE 
      SELECT 'There is not any application or the application has been deleted';
	END IF;


 ELSEIF (identifier = 'a') THEN
    IF EXISTS ( SELECT * FROM application_log WHERE empl_usrname = e_username AND jobId = positionID ) THEN
	  INSERT INTO applies VALUES ('empl_usrname', 'jobId', 'applDate', 'active');
	  SELECT 'The application has been activated';
	ELSE 
      SELECT 'There is not any application or the application has already been activated';	
	END IF;
    
END IF;
 
 END$
DELIMITER ;
