USE etaireia_aksiologisis;


CREATE TABLE IF NOT EXISTS administrator_log(
administrator VARCHAR(30) NOT NULL,
excecution_time DATETIME DEFAULT '2024-01-01 00:00:00',
event_type TEXT NOT NULL,  
PRIMARY KEY (event_type)
); 
