USE etaireia_aksiologisis;

CREATE TABLE IF NOT EXISTS application_log(
    e_username VARCHAR(30) NOT NULL,
    e_evaluator1 VARCHAR(30),
    e_evaluator2 VARCHAR(30),
    positionID INT NOT NULL,
    a_state ENUM('active', 'completed', 'canceled') DEFAULT 'completed' NOT NULL,
    finalGrade INT NOT NULL,
    PRIMARY KEY(e_username, positionID)
	#CONSTRAINT LOGEMPL FOREIGN KEY(e_username) REFERENCES employee(username)
    #ON UPDATE CASCADE ON DELETE CASCADE,
    #CONSTRAINT LOGJOB FOREIGN KEY(positionID) REFERENCES job(id)
    #ON UPDATE CASCADE ON DELETE CASCADE,
    #CONSTRAINT LOGSTA FOREIGN KEY(a_state) REFERENCES applies(state)
    #ON UPDATE CASCADE ON DELETE CASCADE,
    #CONSTRAINT LOGGRA FOREIGN KEY(finalGrade) REFERENCES evaluation(final_grade)
    #ON UPDATE CASCADE ON DELETE CASCADE,
	#CONSTRAINT LOGEVAL1 FOREIGN KEY(e_evaluator1) REFERENCES evaluation(evaluator1)
    #ON UPDATE CASCADE ON DELETE CASCADE,
    #CONSTRAINT LOGEVAL2 FOREIGN KEY(e_evaluator2) REFERENCES evaluation(evaluator2)
    #ON UPDATE CASCADE ON DELETE CASCADE
    );
