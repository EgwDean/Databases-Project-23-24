use etaireia_aksiologisis;

CREATE TABLE IF NOT EXISTS has_position(
	emp_username VARCHAR(30) NOT NULL,
    jobid INT(11) NOT NULL,
    PRIMARY KEY(jobid),
    CONSTRAINT POSEMPL FOREIGN KEY(emp_username) REFERENCES employee(username)
    ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT POSJOB FOREIGN KEY(jobid) REFERENCES job(id)
    ON UPDATE CASCADE ON DELETE CASCADE
    );
	
