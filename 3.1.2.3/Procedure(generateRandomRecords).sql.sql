	USE etaireia_aksiologisis;

DELIMITER $
DROP PROCEDURE IF EXISTS generateRandomRecords$
CREATE PROCEDURE generateRandomRecords()
BEGIN
    DECLARE i INT;
    SET i = 0;

    WHILE i < 60001 DO
        INSERT INTO application_log
        VALUES (
            CONCAT('user_', i),
            CONCAT('evaluator1_', i),
            CONCAT('evaluator2_', i),
            i MOD 500 + 1,
            'completed', 
            (i MOD 20) + 1
        );
        SET i = i + 1;
    END WHILE;
END $
DELIMITER ;
#Edit->Preferences->SQL Editor (all the timers in MySQL session to be set to 3600)
CALL generateRandomRecords();
