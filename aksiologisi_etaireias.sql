DROP DATABASE etaireia_aksiologisis;
CREATE DATABASE etaireia_aksiologisis;
USE etaireia_aksiologisis;

CREATE TABLE IF NOT EXISTS etaireia(
    AFM CHAR(9) NOT NULL,
    DOY VARCHAR(30) DEFAULT 'unknown' NOT NULL,
    name VARCHAR(35) DEFAULT 'unknown' NOT NULL,
    tel VARCHAR(10) NOT NULL,
    street VARCHAR(15) DEFAULT 'unknown' NOT NULL,
    num INT(11) DEFAULT '0' NOT NULL,
    city VARCHAR(45) DEFAULT 'unknown' NOT NULL,
    country VARCHAR(15) DEFAULT 'unknown' NOT NULL,
    PRIMARY KEY(AFM),
    UNIQUE(tel)
    );
    
CREATE TABLE IF NOT EXISTS user(
    username VARCHAR(30) NOT NULL,
    password VARCHAR(20) DEFAULT 'unknown' NOT NULL,
    name VARCHAR(25) DEFAULT 'unknown' NOT NULL,
    lastname VARCHAR(35) DEFAULT 'unknown' NOT NULL,
    reg_date DATETIME DEFAULT '1900-01-01 00-00-00' NOT NULL,
    email VARCHAR(30) NOT NULL,
    PRIMARY KEY(username),
    UNIQUE(email)
    );
    
CREATE TABLE IF NOT EXISTS evaluator(
	username VARCHAR(30) NOT NULL,
    exp_years tinyint(4) DEFAULT '0' NOT NULL,
    firm CHAR(9) NOT NULL,
    PRIMARY KEY(username),
    CONSTRAINT EVALUSER FOREIGN KEY(username) REFERENCES user(username) 
    ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT EVALFIRM FOREIGN KEY(firm) REFERENCES etaireia(AFM)
    ON UPDATE CASCADE ON DELETE CASCADE
    );
    
CREATE TABLE IF NOT EXISTS employee(
    username VARCHAR(30) NOT NULL,
    bio TEXT NOT NULL,
    sistatikes VARCHAR(35) DEFAULT 'unknown',
    certificates VARCHAR(35) DEFAULT 'unknown',
    PRIMARY KEY(username),
    CONSTRAINT EMPLUSER FOREIGN KEY(username) REFERENCES user(username) 
    ON UPDATE CASCADE ON DELETE CASCADE
    );
CREATE TABLE IF NOT EXISTS languages(
    candid VARCHAR(30) NOT NULL,
    lang SET('EN', 'FR', 'SP', 'GE', 'CH', 'GR') NOT NULL,
    PRIMARY KEY(candid, lang),
    CONSTRAINT LANGEMPL FOREIGN KEY(candid) REFERENCES employee(username)
	ON UPDATE CASCADE ON DELETE CASCADE
    );
    
CREATE TABLE IF NOT EXISTS project(
    candid VARCHAR(30) NOT NULL,
    num TINYINT(4) NOT NULL,
    descr TEXT NOT NULL,
    url VARCHAR(60) DEFAULT 'unknown' NOT NULL,
    PRIMARY KEY(candid, num),
    CONSTRAINT PROJEMPL FOREIGN KEY(candid) REFERENCES employee(username)
    ON UPDATE CASCADE ON DELETE CASCADE
    );

CREATE TABLE IF NOT EXISTS job(
    id INT(11) AUTO_INCREMENT NOT NULL,
    start_date DATE DEFAULT '1900-01-01' NOT NULL,
    salary FLOAT DEFAULT '0' NOT NULL,
    pposition VARCHAR(60) DEFAULT 'unknown' NOT NULL,
    edra VARCHAR(60) DEFAULT 'unknown' NOT NULL,
    evaluator VARCHAR(30) NOT NULL,
    announce_date DATETIME DEFAULT '1900-01-01 00-00-00' NOT NULL,
    submission_date DATE DEFAULT '1900-01-01' NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT JOBEVAL FOREIGN KEY(evaluator) REFERENCES evaluator(username)
    ON UPDATE CASCADE ON DELETE CASCADE
    );
    
CREATE TABLE IF NOT EXISTS applies(
    cand_username VARCHAR(30) NOT NULL,
    job_id INT(11) NOT NULL,
    PRIMARY KEY(cand_username, job_id),
    CONSTRAINT APPEMPL FOREIGN KEY(cand_username) REFERENCES employee(username)
    ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT APPLJOB FOREIGN KEY(job_id) REFERENCES job(id)
    ON UPDATE CASCADE ON DELETE CASCADE
    );
    
CREATE TABLE IF NOT EXISTS degree(
    titlos VARCHAR(150) NOT NULL,
    idryma VARCHAR(140) NOT NULL,
    bathmida ENUM('BSc', 'MSc', 'PhD') NOT NULL,
    PRIMARY KEY(titlos, idryma)
    );
    
    CREATE TABLE IF NOT EXISTS has_degree(
    degr_title VARCHAR(150) NOT NULL,
    degr_idryma VARCHAR(140) NOT NULL,
    cand_usrname VARCHAR(30) NOT NULL,
    etos YEAR(4) DEFAULT '0000' NOT NULL,
    grade FLOAT DEFAULT '0' NOT NULL,
    PRIMARY KEY(degr_title, degr_idryma, cand_usrname),
    CONSTRAINT DEGEMPL FOREIGN KEY(cand_usrname) REFERENCES employee(username)
    ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT DEGDEG FOREIGN KEY(degr_title, degr_idryma) REFERENCES degree(titlos, idryma)
    ON UPDATE CASCADE ON DELETE CASCADE
    );
    
CREATE TABLE IF NOT EXISTS subject(
    title VARCHAR(36) NOT NULL,
    descr TINYTEXT NOT NULL,
    belongs_to VARCHAR(36),
    PRIMARY KEY(title),
    CONSTRAINT SUBSUB FOREIGN KEY(belongs_to) REFERENCES subject(title)
    ON UPDATE CASCADE ON DELETE CASCADE
    );
    
CREATE TABLE IF NOT EXISTS requires(
    job_id INT(11) NOT NULL,
    subject_title VARCHAR(36) NOT NULL,
    PRIMARY KEY(job_id, subject_title),
    CONSTRAINT REQJOB FOREIGN KEY(job_id) REFERENCES job(id)
    ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT REQSUB FOREIGN KEY(subject_title) REFERENCES subject(title)
    ON UPDATE CASCADE ON DELETE CASCADE
    );
