DELIMITER $
DROP PROCEDURE IF EXISTS applicationManagement$
CREATE PROCEDURE applicationManagement (empl_usrname VARCHAR(30), jobId INT(11), identifier ENUM ('i', 'c', 'a'))
BEGIN 
DECLARE applDate DATE;
DECLARE eva1 VARCHAR(30);
DECLARE eva2 VARCHAR (30);
DECLARE sameFirm CHAR(9);
 
SET applDate = CURDATE();
 
IF (identifier = 'i') THEN
 
  SELECT evaluator1 INTO eva1 FROM evaluation 
  INNER JOIN employee ON evaluation.evaluated_user = employee.username 
  INNER JOIN applies ON applies.cand_usrname = employee.username 
  WHERE cand_usrname = empl_usrname AND job_id = jobId;
  
  SELECT evaluator2 INTO eva2 FROM evaluation 
  INNER JOIN employee ON evaluation.evaluated_user = employee.username 
  INNER JOIN applies ON applies.cand_usrname = employee.username
  WHERE cand_usrname = empl_usrname AND job_id = jobId;
  
    IF (eva1 IS NULL) THEN 
      SELECT evaluator.username INTO eva1 FROM evaluator 
      INNER JOIN job ON evaluator.username=job.evaluator
      INNER JOIN applies ON job.id=applies.job_id
      INNER JOIN employee ON applies.cand_usrname=employee.username
      WHERE cand_usrname = empl_usrname AND job_id = jobId;
      UPDATE evaluation
      SET evaluation.evaluator1=eva1
      WHERE evaluation.evaluated_user=empl_usrname;
	END IF;
    
    IF(eva2 IS NULL) THEN
    
      SELECT evaluator.firm INTO sameFirm FROM evaluator
      INNER JOIN evaluation ON evaluator.username=evaluation.evaluator1;
      
	  SELECT evaluator.username INTO eva2 FROM evaluator 
      WHERE evaluator.firm=sameFirm
      LIMIT 1;
      UPDATE evaluation
      SET evaluation.evaluator2=eva2
      WHERE evaluation.evaluated_user=empl_usrname;
	END IF;
      
      INSERT INTO applies VALUES ('empl_usrname', 'jobId', 'applDate', 'completed');

	
 ELSEIF (identifier = 'c') THEN 
    IF EXISTS ( SELECT * FROM applies WHERE empl_usrname = cand_usrname AND jobId = job_id) THEN
	  DELETE FROM applies 
      WHERE empl_usrname = cand_usrname AND jobId = job_id;
	  SIGNAL SQLSTATE '45000'
	  SET MESSAGE_TEXT = 'The application has been deleted';
	  
      INSERT INTO application_log (e_username, e_evaluator1, e_evaluator2, positionID, a_state) VALUES ('empl_usrname','eva1', 'eva2', 'jobId','canceled');
	ELSE 
      SIGNAL SQLSTATE '45000'
	  SET MESSAGE_TEXT = 'There is not any application or the application has been deleted';
	END IF;


 ELSEIF (identifier = 'a') THEN
    IF EXISTS ( SELECT * FROM application_log WHERE empl_usrname = e_username AND jobId = positionID AND a_state='canceled' ) THEN
	  INSERT INTO applies VALUES ('empl_usrname', 'jobId', 'applDate', 'active');
	  SIGNAL SQLSTATE '45000'
	  SET MESSAGE_TEXT = 'The application has been activated';
	ELSE 
	  SIGNAL SQLSTATE '45000'
	  SET MESSAGE_TEXT = 'There is not any application or the application has already been activated';	
	END IF;
    
END IF;
 
END$
DELIMITER ;
