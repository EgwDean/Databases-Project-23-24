DELIMITER $
DROP TRIGGER IF EXISTS user_insert$
CREATE TRIGGER user_insert AFTER INSERT ON user 
FOR EACH ROW 
BEGIN 
DECLARE t_username VARCHAR(30);
SELECT NEW.username INTO t_username FROM user;
DECLARE event TEXT;
SET event = CONCAT('The user with username ', t_username, ' has just been inserted by the administrator ',NEW.active_admin.username);
INSERT INTO administrator_log VALUES (NEW.active_admin.username, NOW(), event);
END$
DELIMITER;
