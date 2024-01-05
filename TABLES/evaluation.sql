use etaireia_aksiologisis;

CREATE TABLE IF NOT EXISTS evaluation(
	evaluator1 VARCHAR(30),
    evaluator2 VARCHAR(30),
    evaluated_user VARCHAR(30) NOT NULL,
    grade1 INT DEFAULT '1',
    grade2 INT DEFAULT '1',
    final_grade INT DEFAULT '1',
    PRIMARY KEY(evaluated_user),
    CONSTRAINT EVALEMPL FOREIGN KEY(evaluated_user) REFERENCES employee(username)
    ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT EVALEVAL1 FOREIGN KEY(evaluator1) REFERENCES evaluator(username)
    ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT EVALEVAL2 FOREIGN KEY(evaluator2) REFERENCES evaluator(username)
    ON UPDATE CASCADE ON DELETE CASCADE
    );
