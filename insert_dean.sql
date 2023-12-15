USE etaireia_aksiologisis;

INSERT INTO etaireia (AFM, DOY, nname, tel, street, num, city, country)
VALUES
('111234798', 'ATHENS', 'Zerocom', '2102625215', '	Androutsou', 13, 'Athens', 'Greece'),
('234987234', 'PATRAS', 'Interday', '2610102343', 'Karaiskaki', 90, 'Patras', 'Greece'),
('890345879', 'KALAMATA', 'Tranzitzone', '2763098765', 'Eleftherias', 101, 'Kalamata', 'Greece');

INSERT INTO uuser (username, ppassword, nname, lastname, reg_date, email)
VALUES
('maria123', 'sidufhnjsdf', 'Maria', 'Alexopoulou', '2023-01-15 08:30:00', 'maria123@gmail.com'),
('giorgospet', '93hg98grh', 'Giorgos', 'Petropoulos', '2023-02-20 10:45:00', 'georgepetropoulos@gmail.com'),
('mark_ion', '3908ifdjfh', 'Markos', 'Ioannou', '2023-03-25 12:15:00', 'mark.j@gmail.com'),
('sara84', '1234567890', 'Sara', 'Andreou', '2023-04-30 14:00:00', 'sara.999@gmail.com'),
('peter_wilson', 'lolokoko', 'Peter', 'Wilson', '2023-05-05 16:20:00', 'peterwil@gmail.com'),
('egwdean', '0irfje9rifj', 'Kostas', 'Anastasopoulos', '2023-06-10 18:00:00', 'egwegw@gmail.com'),
('anastasis9090', 'lmlmlma88yu', 'Anastasis', 'Kyriakopoulos', '2023-07-15 20:30:00', 'anast.kyre@gmail.com'),
('tzinaaa', 'foegoeirjg', 'Tzina', 'Lykourgou', '2023-08-20 22:45:00', 'tzinlyk@gmail.com'),
('michalis123', 'aa890890', 'Michalis', 'Mpikos', '2023-09-25 00:15:00', 'michalis123@gmail.com'),
('nicnic', 'aaaaakokokok', 'Nicole', 'Aslanidi', '2023-10-30 02:00:00', 'nicoleaslanidi@gmail.com'),
('manos1978', 'p9ifrje9ruifj', 'Manos', 'Asioglou', '2023-11-05 04:20:00', 'manos123@gmail.com'),
('emma_ross', 'woeidjweoidjioej', 'Emma', 'Ross', '2023-12-10 06:00:00', 'emma.ross@gmail.com');

INSERT INTO evaluator (username, exp_years, firm)
VALUES
('maria123', 5, '111234798'),
('giorgospet', 3, '234987234'),
('mark_ion', 8, '890345879'),
('sara84', 6, '111234798'),
('peter_wilson', 4, '234987234'),
('egwdean', 7, '890345879');

INSERT INTO employee (username, bio, sistatikes, certificates)
VALUES
('anastasis9090', 'Experienced software engineer with a focus on web development.', 'Web development', 'Bachelor of Computer Science'),
('tzinaaa', 'Passionate about data analysis and machine learning.', 'Data analysis, Machine learning', 'Master of Data Science'),
('michalis123', 'Results-driven project manager with a proven track record.', 'Project management', 'Master of Business Administration'),
('nicnic', 'Creative graphic designer with expertise in branding.', 'Graphic design, Branding', 'Bachelor of Fine Arts'),
('manos1978', 'Skilled network administrator with a strong IT background.', 'Network administration', 'Bachelor of Information Technology'),
('emma_ross', 'Dynamic marketing specialist with experience in digital campaigns.', 'Digital marketing', 'Bachelor of Marketing');

INSERT INTO languages (candid, lang)
VALUES
('anastasis9090', 'EN'),
('anastasis9090', 'FR'),
('tzinaaa', 'FR'),
('michalis123', 'SP');

INSERT INTO project (candid, num, descr, url)
VALUES
('anastasis9090', 0, 'E-commerce Website', 'https://www.ecomweb123.com'),
('tzinaaa', 0, 'Blog Platform', 'https://www.bigblog1.com'),
('michalis123', 0, 'Data Analysis Tool', 'https://www.dataanalysisnow.com'),
('manos1978', 0, 'Project Management System', 'https://www.proj.man.com'),
('tzinaaa', 0, 'Brand Identity Redesign', 'https://www.edegign.name.com'),
('emma_ross', 0, 'Network Infrastructure Upgrade', 'https://www.infranet12.com'),
('anastasis9090', 0, 'Digital Marketing Campaign', 'https://www.marketing123.com');

INSERT INTO job (id, start_date, salary, pposition, edra, evaluator, announce_date, submission_date)
VALUES
(NULL, '2023-01-15', 80000, 'Software Engineer', 'Metropolis', 'maria123', '2023-01-01 08:30:00', '2023-01-31'),
(NULL, '2023-02-20', 90000, 'Data Analyst', 'Cityville', 'maria123', '2023-02-01 10:45:00', '2023-02-28'),
(NULL, '2023-03-25', 100000, 'Project Manager', 'Innovation City', 'giorgospet', '2023-03-01 12:15:00', '2023-03-31'),
(NULL, '2023-04-30', 75000, 'Graphic Designer', 'Techland', 'giorgospet', '2023-04-01 14:00:00', '2023-04-30'),
(NULL, '2023-05-15', 85000, 'Network Administrator', 'Global City', 'peter_wilson', '2023-05-01 16:20:00', '2023-05-31'),
(NULL, '2023-06-20', 95000, 'Marketing Specialist', 'Data City', 'mark_ion', '2023-06-01 18:00:00', '2023-06-30'),
(NULL, '2023-07-25', 90000, 'Software Developer', 'Inno Lane', 'sara84', '2023-07-01 20:30:00', '2023-07-31'),
(NULL, '2023-08-30', 110000, 'IT Manager', 'Globe Avenue', 'egwdean', '2023-08-01 22:45:00', '2023-08-31');

INSERT INTO applies (cand_username, job_id)
VALUES
('anastasis9090', 1),
('tzinaaa', 2),
('michalis123', 3),
('nicnic', 4),
('manos1978', 5),
('emma_ross', 6);

INSERT INTO degree (titlos, idryma, bathmida)
VALUES
('Bachelor of Computer Science', 'University of Patras', 'BSc'),
('Master of Data Science', 'University of Peloponesse', 'MSc'),
('Master of Business Administration', 'University of Patras', 'MSc'),
('Bachelor of Fine Arts', 'Aristotle University of Thessaloniki', 'BSc'),
('Bachelor of Information Technology', 'University of Patras', 'BSc'),
('Bachelor of Marketing', 'University of Pireaus', 'PhD');

INSERT INTO has_degree (degr_title, degr_idryma, cand_usrname, etos, grade)
VALUES
('Bachelor of Computer Science', 'University of Patras', 'anastasis9090', 2019, 5.5),
('Master of Data Science', 'University of Peloponesse', 'tzinaaa', 2021, 9.0),
('Master of Business Administration', 'University of Patras', 'michalis123', 2020, 7.5),
('Bachelor of Fine Arts', 'Aristotle University of Thessaloniki', 'emma_ross', 2018, 6.5);

INSERT INTO ssubject (title, descr, belongs_to)
VALUES
('Programming Fundamentals', 'Introduction to programming concepts and problem-solving.', NULL),
('Data Analysis', 'Exploratory data analysis and statistical techniques.', NULL),
('Project Management', 'Principles and practices of project management.', NULL),
('Graphic Design Principles', 'Fundamental principles of graphic design.', NULL),
('Computer Networks', 'Fundamentals of computer networking.', 'Programming Fundamentals'),
('Digital Marketing Strategies', 'Strategies for effective digital marketing campaigns.', 'Programming Fundamentals'),
('Advanced Data Structures', 'In-depth study of advanced data structures.', 'Data Analysis'),
('Business Analytics', 'Application of statistical analysis to business data for decision-making.', 'Data Analysis');

INSERT INTO requires (job_id, subject_title)
VALUES
(1, 'Programming Fundamentals'),
(2, 'Data Analysis'),
(3, 'Project Management'),
(4, 'Graphic Design Principles'),
(5, 'Computer Networks'),
(6, 'Digital Marketing Strategies'),
(7, 'Advanced Data Structures'),
(8, 'Business Analytics');
