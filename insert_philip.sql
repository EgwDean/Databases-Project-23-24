USE etaireia_aksiologisis;

INSERT INTO user VALUES
('user1','gsjhahgsa','Giorgos','Papadopoulos','2023-12-30 07:27:00','us1@email.com'),
('user2','gsjhaadqw','Kostas','Papadopoulos','2023-09-27 09:29:00','us2@email.com'),
('user3','gswwwgsa','Roula','Gogka','2023-04-21 11:17:00','us3@email.com'),
('user4','yauagdahgsa','Maki','Toge','2023-03-30 13:02:00','us4@email.com'),
('user5','QAWJSgsa','Itadori','Yugi','2022-11-08 20:20:00','us5@email.com'),
('user6','gshagshhgsa','Gojo','Satoru','2023-12-28 14:21:00','us6@email.com'),
('user7','hahahhgsa','Mei','Zenin','2022-09-30 11:27:00','us7@email.com'),
('user8','hahahsaahgsa','Foivos','Delivorias','2023-01-01 01:27:00','us8@email.com'),
('user9','gsjhhjjaaGG','Despoina','Vndi','2023-09-02 11:30:00','us9@email.com'),
('user10','1999wwzz','Lionel','Messi','2023-07-29 08:13:00','us10@email.com'),
('user11','goat10hgsa','Cristiano','Ronaldo','2022-11-27 17:27:00','us11@email.com'),
('user12','netflix2121','Nina','Simone','2023-12-11 07:27:00','us12@email.com');

INSERT INTO etaireia VALUES
('10AM56789', 'ATHENS', 'PEPSI', '2102516782', 'Ermou', 7, 'Athens', 'Greece'),
('10AM62718', 'PATRAS', 'NIKE', '2610827165', 'Ermou', 27, 'Patras', 'Greece'),
('10AM32176', 'KOZANI', 'ADIDAS', '2461022516', 'Nikolaou', 17, 'Kozani', 'Greece');

INSERT INTO evaluator VALUES
('user1', 3, '10AM56789'),
('user2', 7, '10AM56789'),
('user3', 2, '10AM62718'),
('user4', 8, '10AM62718'),
('user5', 5, '10AM32176'),
('user6', 9, '10AM32176');

INSERT INTO employee VALUES
('user7', 'this is text', 'sistatiki1', 'BSc Physics'),
('user8', 'this is text', 'sistatiki2', 'BSc Mathematics'),
('user9', 'this is text', 'sistatiki3', 'BSc Data Analysis'),
('user10', 'this is text', 'sistatiki4', 'MSc Physics'),
('user11', 'this is text', 'sistatiki5', 'BSc Computer Science'),
('user12', 'this is text', 'sistatiki6', 'PhD Computer Architecture');

INSERT INTO project VALUES
('user7', 0, '2s Numbers Multiplier', 'https://www.arduino/toge.com'),
('user8', 0, '2s Numbers Adder', 'https://www.arduino/egot.com'),
('user9', 0, 'DFA to NFA', 'https://www.doityourselfNfaDfa.com'),
('user10', 0, 'CSV reader', 'https://www.CsvREAD/toge.com'),
('user11', 0, 'Sound Redesign', 'https://www.flstudio/toge.com'),
('user12', 0, 'CAD simulator', 'https://www.VerilogLover/toge.com');

INSERT INTO languages VALUES
('user8', 'EN'),
('user12', 'FR'),
('user9', 'SP'),
('user7', 'EN');

INSERT INTO job VALUES
(NULL, '2023-02-17', 70000, 'Sound Designer', 'Oakland', 'user1', '2023-08-02 09:30:00', '2023-11-20'),
(NULL, '2023-03-17', 90000, 'Sofware Engineer', 'Windows', 'user2', '2023-09-02 10:30:00', '2023-11-21'),
(NULL, '2023-02-21', 70500, 'Designer', 'Oakland', 'user3', '2023-10-02 09:40:00', '2023-01-20'),
(NULL, '2023-11-17', 170000, 'Tester', 'New Transistors', 'user4', '2023-10-02 09:30:00', '2023-11-20'),
(NULL, '2023-02-17', 100000, 'Data Analyst', 'Analyst', 'user5', '2023-08-02 09:30:00', '2023-09-20'),
(NULL, '2023-02-17', 75000, 'Sound Designer', 'Oakland', 'user6', '2023-08-02 19:30:00', '2023-03-20');


INSERT INTO applies VALUES
('user7', 1),
('user8', 2),
('user9', 3),
('user10', 4),
('user11', 5),
('user12', 6);

INSERT INTO degree VALUES
('Bachelor of Physics', 'Harvard University', 'BSc'),
('Bachelor of Mathematics', 'Oxford University', 'BSc'),
('Master of Computer Engineering', 'University of Patras', 'MSc'),
('Bachelor of Physics', 'Warwick University', 'BSc'),
('Bachelor of Computer Science', 'Athens University', 'BSc'),
('PhD of Computer Architecture', 'Harvard University', 'PhD');

INSERT INTO has_degree VALUES
('Bachelor of Physics', 'Harvard University', 'user7', 2020, 8.5),
('Bachelor of Mathematics', 'Oxford University', 'user8', 2018, 7),
('Master of Computer Engineering', 'University of Patras', 'user9', 2020, 7.5),
('PhD of Computer Architecture', 'Harvard University', 'user12', 2017, 9);

INSERT INTO subject VALUES
('Micro Electronics', 'Introduction to the study and manufacture of very small electronic designs and components', NULL),
('Linear Algebra', 'Introduction to vector spaces and linear transformations', NULL),
('Computer Architecture', 'Hardware', NULL),
('Logic Design', 'Basic organization of the circuitry of a digital computer', 'Computer Architecture'),
('Signal and Systems', 'Basic description of signals and systems', NULL),
('Matrices', 'Basic tool of Linear Algebra', 'Linear Algebra'),
('Programming', 'Basic analysis of higher level languages', NULL),
('C Programming', 'C higher level language', 'Programming');

INSERT INTO requires VALUES
(1, 'Micro Electronics'),
(2, 'Linear Algebra'),
(3, 'Computer Architecture'),
(4, 'Logic Design'),
(5, 'Signal and Systems'),
(6, 'Matrices'),
(7, 'Programming'),
(8, 'C Programming');
