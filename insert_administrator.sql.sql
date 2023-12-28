USE etaireia_aksiologisis;

INSERT INTO user (username, password, name, lastname, reg_date, email)
VALUES
('jimmynew', 'wifundsc', 'Dimitris', 'Andreou', '2023-01-15 10:20:00', 'jimmynew@gmail.com'),
('maria9090', '93ofveijfnv', 'Maria', 'Alexiou', '2023-02-20 10:45:00', 'maria9090@gmail.com');

INSERT INTO administrator (admin_name, start_date, end_date)
VALUES
('jimmynew', '2023-01-15', NULL),
('maria9090', '2023-02-20', '2023-10-20');