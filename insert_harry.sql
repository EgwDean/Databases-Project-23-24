USE etaireia_aksiologisis;

INSERT INTO etaireia (AFM, DOY, name, tel, street, num, city, country)
VALUES
('784512369', 'PATRAS', 'ConnectWave Communications', '2610123456', 'Androutsou', 58, 'Patras', 'Greece'),
('630974182', 'THEBES', 'SwiftLink TeleSystems', '2262032550', 'Amfionos', 15, 'Thebes', 'Greece'),
('215689347', 'THESSALONIKI', 'NexusNet Telecom Technologies', '2310123456', 'Egnatia', 88, 'Thessaloniki', 'Greece');

INSERT INTO user (username, password, name, lastname, reg_date, email)
VALUES
('emily_johnson84', 'duyfgwuef78', 'Emily', 'Johnson', '2023-03-13 14:00:00', 'emily_johnson84@gmail.com'),
('alex_smithson22', 'hduwdh6786', 'Alex', 'Smithson', '2023-04-26 18:45:00', 'alexsmithson@gmail.com'),
('olivia_brown92', '3748jdscsj', 'Olivia', 'Brown', '2023-05-01 15:35:00', 'oliviabrown@gmail.com'),
('jack_robinson77', '556783420', 'Jack', 'Robinson', '2023-07-28 19:31:00', 'jackrobinson@gmail.com'),
('chloe_davis89', 'grinder567', 'Chloe', 'Davis', '2023-07-05 09:20:00', 'chloedav@gmail.com'),
('ethan_miller64', 'isyoboy3434', 'Ethan', 'Miller', '2023-06-19 11:26:00', 'ethanmiller@gmail.com'),
('lily_wilson78', 'grgerg454', 'Lily', 'Wilson', '2023-07-05 21:13:00', 'lily_wilson@gmail.com'),
('noah_thompson55', 'fgeft4t545', 'Noah', 'Thompson', '2023-07-04 19:45:00', 'noah_thompson@gmail.com'),
('ava_harrison86', 'aaoiokjin458', 'Ava', 'Harrison', '2023-08-16 14:15:00', 'ava_harrison@gmail.com'),
('james_mitchell71', 'isoiswni798', 'James', 'Mitchell', '2023-09-28 01:00:00', 'james_mitchell@gmail.com'),
('sophia_baker79', 'osideienkscn90', 'Sophia', 'Baker', '2023-10-01 03:43:00', 'sophia_baker@gmail.com'),
('daniel_parker88', 'weywureosxcn870', 'Daniel', 'Parker', '2023-10-15 09:00:00', 'daniel_parker@gmail.com');


INSERT INTO evaluator (username, exp_years, firm)
VALUES
('emily_johnson84', 4, '784512369'),
('alex_smithson22', 2, '630974182'),
('olivia_brown92', 5, '215689347'),
('jack_robinson77', 9, '784512369'),
('chloe_davis89', 3, '630974182'),
('ethan_miller64', 4, '215689347');



INSERT INTO employee (username, bio, sistatikes, certificates)
VALUES
('lily_wilson78', 'A proficient network engineer adept at navigating the intricate tapestry of connectivity. Dedicated to optimizing network efficiency and resolving complexities.', 'Network Engineering', 'Bachelor of Computer Science'),
('noah_thompson55', 'An astute data analyst adept at deciphering vast datasets to extract pivotal insights shaping the telecommunications landscape. Proficient in data analytics.', 'Data analysis', 'Master of Data Science'),
('ava_harrison86', 'A dedicated customer support specialist adept at bridging the technical intricacies of telecommunications with user-friendly assistance.', 'Customer Relationship Management', 'Bachelor of Business Administration'),
('james_mitchell71', 'An unwavering cybersecurity specialist dedicated to fortifying digital landscapes against evolving threats.', 'Master of Network Security', 'Bachelor of Computer Science'),
('sophia_baker79', 'A seasoned telecommunications engineer adept at architecting robust and scalable network infrastructures.', 'Telecommunications Engineering', 'Bachelor of Telecommunications'),
('daniel_parker88', 'A forward-thinking technology strategist specializing in telecommunications. Proficient in devising strategic roadmaps that align with organizational goals.', 'Bachelor of Technology', 'Digital marketing');



INSERT INTO languages (candid, lang)
VALUES
('lily_wilson78', 'EN'),
('james_mitchell71', 'FR'),
('james_mitchell71', 'SP'),
('daniel_parker88', 'GE');



INSERT INTO project (candid, num, descr, url)
VALUES
('lily_wilson78', 1, 'OptiLink: Enhancing Network Efficiency and Scalability', 'https://www.optilink.com'),
('noah_thompson55', 1, 'DataSift: Unraveling Insights to Shape Telecom Trends', 'https://www.datasift.com'),
('ava_harrison86', 1, 'ClientConnect: Elevating Customer Interaction Experience', 'https://www.clientconnect.com'),
('james_mitchell71', 1, 'CyberShield: Fortifying Telecom Networks Against Threats', 'https://www.cybershield.com'),
('sophia_baker79', 1, 'NetArchitect: Designing Resilient Network Infrastructures', 'https://www.infranet.com'),
('daniel_parker88', 1, 'TechVista: Charting Future Telecom Strategies', 'https://www.telstrategist.com'),
('lily_wilson78', 2, 'DataFlow Nexus: Optimizing Network Bandwidth and Stability', 'https://www.dataflownexus.com');



INSERT INTO job (id, start_date, salary, position, edra, evaluator, announce_date, submission_date)
VALUES
(NULL, '2023-01-10', 100000, 'Senior Network Engineer', 'Silicon Valley', 'emily_johnson84', '2023-01-01 08:30:00', '2023-01-31'),
(NULL, '2023-02-10', 70000, 'Data Analyst', 'London', 'emily_johnson84', '2023-02-01 10:45:00', '2023-02-28'),
(NULL, '2023-03-15', 60000, 'Customer Support Manager', 'Singapore', 'alex_smithson22', '2023-03-01 12:15:00', '2023-03-31'),
(NULL, '2023-04-15', 75000, 'Project Manager', 'Dubai', 'alex_smithson22', '2023-04-01 14:00:00', '2023-04-30'),
(NULL, '2023-05-20', 90000, 'Telecommunications Systems Architect', 'Tokyo', 'olivia_brown92', '2023-05-01 16:20:00', '2023-05-31'),
(NULL, '2023-06-20', 70000, 'Security Analyst', 'Tokyo', 'jack_robinson77', '2023-06-01 18:00:00', '2023-06-30'),
(NULL, '2023-07-25', 80000, 'Technology Strategist', 'Sydney', 'chloe_davis89', '2023-07-01 20:30:00', '2023-07-31'),
(NULL, '2023-08-30', 110000, 'Software Engineer', 'Toronto', 'ethan_miller64', '2023-08-01 22:45:00', '2023-08-31');



INSERT INTO applies (cand_username, job_id)
VALUES
('lily_wilson78', 1),
('noah_thompson55', 2),
('ava_harrison86', 3),
('james_mitchell71', 4),
('sophia_baker79', 5),
('daniel_parker88', 6);



INSERT INTO degree (titlos, idryma, bathmida)
VALUES
('Bachelor of Computer Science', 'University of Patras', 'BSc'),
('Master of Data Science', 'University of Patras', 'MSc'),
('Bachelor of Business Administration', 'University of Thessaloniki', 'BSc'),
('Master of Network Security', 'Aristotle University of Thessaloniki', 'MSc'),
('Bachelor of Telecommunications Engineering', 'University of Piraeus', 'BSc'),
('Bachelor of Technology Innovation and Strategy', 'Kapodistrian University of Athens', 'BSc');



INSERT INTO has_degree (degr_title, degr_idryma, cand_usrname, etos, grade)
VALUES
('Bachelor of Computer Science', 'University of Patras', 'lily_wilson78', 2020, 8),
('Master of Data Science', 'University of Patras', 'noah_thompson55', 2021, 7),
('Bachelor of Business Administration', 'University of Thessaloniki', 'ava_harrison86', 2019, 8.5),
('Master of Network Security', 'Aristotle University of Thessaloniki', 'james_mitchell71', 2017, 6.5);



INSERT INTO subject (title, descr, belongs_to)
VALUES
('Advanced Algorithms', 'Exploring complex algorithms and advanced data structures used in optimizing computational processes and problem-solving.', NULL),
('Machine Learning', 'Investigating the principles and applications of machine learning and AI techniques in developing intelligent systems and algorithms.', NULL),
('Network Security', 'Understanding cryptographic principles and network security protocols to protect information and ensure secure communication over networks.', NULL),
('Wireless Networking', 'Studying wireless communication technologies and protocols alongside mobile networking architectures and their applications in modern communication systems.', NULL),
('Ethical Hacking', 'Exploring the methods and tools used by ethical hackers to identify vulnerabilities and conduct penetration tests to secure networks and systems.', NULL),
('Incident Response', 'Investigating procedures for incident handling, digital evidence collection, and forensic analysis to respond effectively to cybersecurity incidents.', NULL),
('Digital Marketing', 'Analyzing digital marketing strategies, tools, and analytics methods to optimize campaigns and drive effective online marketing initiatives.', NULL),
('Vulnerability Assessment', 'Assessing vulnerabilities in systems, networks, and applications while managing and mitigating risks associated with potential security threats.', 'Ethical Hacking');



INSERT INTO requires (job_id, subject_title)
VALUES
(1, 'Advanced Algorithms'),
(2, 'Machine Learning'),
(3, 'Network Security'),
(4, 'Wireless Networking'),
(5, 'Ethical Hacking'),
(6, 'Incident Response'),
(7, 'Digital Marketing'),
(8, 'Vulnerability Assessment');
