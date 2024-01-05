USE etaireia_aksiologisis;

CREATE TABLE IF NOT EXISTS administrator(
admin_name VARCHAR(30) NOT NULL,
start_date DATE NOT NULL,
end_date DATE DEFAULT NULL,
PRIMARY KEY(admin_name),
CONSTRAINT ADMINUSER FOREIGN KEY(admin_name) REFERENCES user(username) 
ON UPDATE CASCADE ON DELETE CASCADE
);
