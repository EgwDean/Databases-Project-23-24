CREATE TABLE IF NOT EXISTS applies(
	cand_usrname VARCHAR(30) NOT NULL,
    job_id INT(11) NOT NULL,
    application_date DATE DEFAULT '1900-01-01' NOT NULL,
    state ENUM('active', 'completed', 'canceled') DEFAULT 'active' NOT NULL,
    PRIMARY KEY(cand_usrname, job_id),
    CONSTRAINT APPEMPL FOREIGN KEY(cand_usrname) REFERENCES employee(username)
    ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT APPLJOB FOREIGN KEY(job_id) REFERENCES job(id)
    ON UPDATE CASCADE ON DELETE CASCADE
    );
