USE etaireia_aksiologisis;

CREATE TABLE active_admin(
username VARCHAR(30) NOT NULL,
PRIMARY KEY(username),
CONSTRAINT ACTADMN FOREIGN KEY (username) REFERENCES administrator (admin_name)
);
