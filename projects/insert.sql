
USE `studentRecordsDb`;

INSERT INTO student (first_name, last_name, ethnicity, gender, admission_number) VALUES ("JUNGSUN","EOH","ASIAN","FEMALE",12);
INSERT INTO student (first_name, last_name, ethnicity, gender, admission_number) VALUES ("KAIN","KIM","RATIN","MALE",22);
INSERT INTO student (first_name, last_name, ethnicity, gender, admission_number) VALUES ("SIDNY","ORTIZ","EU","N/A",3);
INSERT INTO student (first_name, last_name, ethnicity, gender, admission_number) VALUES ("JULY","MOORE","HAWAI","TRANS",4);

INSERT INTO permission_type (permission_desctiption) VALUES ("1: NO READ, NO WRITE");
INSERT INTO permission_type (permission_desctiption) VALUES ("2: READ, NO WRITE");
INSERT INTO permission_type (permission_desctiption) VALUES ("3: READ, WRITE");

INSERT INTO permission_level (permssion_type, permission_start, permssion_end, permission_granted)
VALUES (1, now(), DATE_ADD(now(), INTERVAL 3 MONTH), 1);
INSERT INTO permission_level (permssion_type, permission_start, permssion_end, permission_granted)
VALUES (2, now(), DATE_ADD(now(), INTERVAL 3 MONTH), 1);
INSERT INTO permission_level (permssion_type, permission_start, permssion_end, permission_granted)
VALUES (3, now(), DATE_ADD(now(), INTERVAL 3 MONTH), 1);
INSERT INTO permission_level (permssion_type, permission_start, permssion_end, permission_granted)
VALUES (3, now(), DATE_ADD(now(), INTERVAL 3 MONTH), 1);

INSERT INTO EnrolledStudent (prefer_name, Date_of_birth, student) VALUES ("JUNE", "2000/02/22", 1);
INSERT INTO EnrolledStudent (prefer_name, Date_of_birth, student) VALUES ("KAY", "2000/02/22", 2);
INSERT INTO EnrolledStudent (Date_of_birth, student) VALUES ("2000/03/22", 3);
INSERT INTO EnrolledStudent (Date_of_birth, student) VALUES ("2000/04/22", 4);

INSERT INTO student_account (activate, created, erd_student, permission_level, username, password) VALUES (1, now(), 1, 2, "1","1");
INSERT INTO student_account (activate, created, erd_student, permission_level, username, password) VALUES (1, now(), 2, 2, "kay123","1234");
INSERT INTO student_account (activate, created, erd_student, permission_level, username, password) VALUES (1, now(), 3, 2, "sid123","1234");
INSERT INTO student_account (activate, created, erd_student, permission_level, username, password) VALUES (1, now(), 4, 2, "july","1234");

INSERT INTO department (name, department_head) VALUES ("COMPUTER SCIENCE","JOSE ORTIZ");
INSERT INTO department (name, department_head) VALUES ("NURSING","TONY GEUS");
INSERT INTO department (name, department_head) VALUES ("MATH","ALBERT SCHUMIT");

INSERT INTO student_employee (department, student_account, salary) VALUES (1, 1, 100);
INSERT INTO student_employee (department, student_account, salary) VALUES (1, 2, 200);
INSERT INTO student_employee (department, student_account, salary) VALUES (3, 3, 10);

INSERT INTO student_address (street, city, state, zipcode, phone, email) VALUES ("4TH ST.", "BERKELEY", "CA", "94706", "5108983341", "apple@gmail.com");
INSERT INTO student_address (street, city, state, zipcode, phone, email) VALUES ("5640 BAY ST.", "EMERYVILLE", "CA", "94608", "5103502499", "Bay@gmail.com");
INSERT INTO student_address (street, city, state, zipcode, phone, email) VALUES ("300 POST ST.", "SAN FRANCISCO", "CA", "94108", "4154864800", "SF@gmail.com");
INSERT INTO student_address (street, city, state, zipcode, phone, email) VALUES ("1520 REDWOOD HWY", "CORTE MADERA", "CA", "94925", "4154139273", "ACM@gmail.com");

INSERT INTO studentAddAddress (enrd_Student, student_address) VALUES (1, 1);
INSERT INTO studentAddAddress (enrd_Student, student_address) VALUES (2, 2);
INSERT INTO studentAddAddress (enrd_Student, student_address) VALUES (3, 3);
INSERT INTO studentAddAddress (enrd_Student, student_address) VALUES (4, 4);

INSERT INTO employee (first_name, last_name, gender, date_of_birth, email) VALUES ("KIMMY", "SHMITS", "FEMALE", "2000/01/11","kim@gmail.com");
INSERT INTO employee (first_name, last_name, gender, date_of_birth, email) VALUES ("TIM", "WAX", "MALE", "2000/02/22", "TIM@gmail");
INSERT INTO employee (first_name, last_name, gender, date_of_birth, email) VALUES ("CHRIS", "WAZ", "MALE", "2000/03/30", "waz@gmail");

INSERT INTO employee_account_type (employee_description) VALUES ("STAFF");
INSERT INTO employee_account_type (employee_description) VALUES ("SENIOR");
INSERT INTO employee_account_type (employee_description) VALUES ("JUNIOR");

INSERT INTO employee_account (account_type, permission_level, employee, created, activated, department, username, password) VALUES (1, 4, 1, now(), 1, 1, "1", "1");
INSERT INTO employee_account (account_type, permission_level, employee, created, activated, department, username, password) VALUES (2, 4, 2, now(), 1, 2, "qwe2", "123");
INSERT INTO employee_account (account_type, permission_level, employee, created, activated, department, username, password) VALUES (3, 4, 3, now(), 1, 3, "qwe3", "123");

INSERT INTO faculty (first_name, last_name, gender, date_of_birth, email) VALUES ("BARBARA", "ATKINS", "FEMALE", "2000/01/11", "B@gmail.com");
INSERT INTO faculty (first_name, last_name, gender, date_of_birth, email) VALUES ("CAROLYN", "BERTOZZI", "FEMALE", "2000/02/22", "AAA@gmail.com");
INSERT INTO faculty (first_name, last_name, gender, date_of_birth, email) VALUES ("TIMMY", "BLACK", "MALE", "2000/03/13", "EB@gmail.com");
INSERT INTO faculty (first_name, last_name, gender, date_of_birth, email) VALUES ("GIN", "GREIDER", "MALE", "2000/04/14", "HEL@gmail.com");

INSERT INTO faculty_account_type (descritpion) VALUES ("TEMP");
INSERT INTO faculty_account_type (descritpion) VALUES ("HEAD");
INSERT INTO faculty_account_type (descritpion) VALUES ("TEACHER");

INSERT INTO college (college_head, name) VALUES ("JOSE ORTIZ", "SIENCE&ENGINEERING");
INSERT INTO college (college_head, name) VALUES ("HELEN BLAU", "BUSINESS");
INSERT INTO college (college_head, name) VALUES ("CYNTHIA ORTIZ", "ETHNIC STUDY");
INSERT INTO college (college_head, name) VALUES ("LINDA BUCK", "EDUCATION");

INSERT INTO major (major_name, major_head, college) VALUES ("COMPUTER SCIENCE", "JOSE ORTIZ", 1);
INSERT INTO major (major_name, major_head, college) VALUES ("ENGINEERING", "ANNA CARAIARNI", 1);
INSERT INTO major (major_name, major_head, college) VALUES ("MATHMETICS", "TIMMY BLACK", 1);
INSERT INTO major (major_name, major_head, college) VALUES ("BIOLOGY", "ATKINS CARAIARNI", 1);
INSERT INTO major (major_name, major_head, college) VALUES ("PHYSICS", "BABRBARA CARAIARNI", 1);
INSERT INTO major (major_name, major_head, college) VALUES ("ECONOMICS", "JOCY KIM", 2);
INSERT INTO major (major_name, major_head, college) VALUES ("BUSINESS ADMINISTRATION", "JOCELYN BELL", 2);
INSERT INTO major (major_name, major_head, college) VALUES ("LABOR & EMPLOYMENT", "JENN WONG", 2);
INSERT INTO major (major_name, major_head, college) VALUES ("HOSPITALITY & TOURISM", "KIM BELL", 2);
INSERT INTO major (major_name, major_head, college) VALUES ("ASIAN AMERICAN STUDY", "ABUL BURNS", 3);
INSERT INTO major (major_name, major_head, college) VALUES ("AFRICAN STUDY", "ANTWI AKON", 3);
INSERT INTO major (major_name, major_head, college) VALUES ("AMERICAN INDIANSTUDY", "SHAWN GINWRIT", 3);
INSERT INTO major (major_name, major_head, college) VALUES ("LATINA/LATINO STUDY", "JENINE WRIGHT", 3);
INSERT INTO major (major_name, major_head, college) VALUES ("RACE & RESISTANCE", "DONELA ORTIZ", 3);
INSERT INTO major (major_name, major_head, college) VALUES ("EDUCATIONAL LEADERSHIP", "ROBERT AKIN", 4);
INSERT INTO major (major_name, major_head, college) VALUES ("ELEMENTARY EDUCATION", "JOSEPHINE ACRE", 4);
INSERT INTO major (major_name, major_head, college) VALUES ("EDUCATIONAL TECHNOLOGY", "GEORGE KIM", 4);
INSERT INTO major (major_name, major_head, college) VALUES ("SECONDARY EDUCATION", "YANAN FAN", 4);
INSERT INTO major (major_name, major_head, college) VALUES ("SPECAIL EDUCATION", "ERIC HSU", 4);

INSERT INTO faculty_account(faculty, created, activated, faculty_account_type, permission_level, college, username, password) VALUES (1, now(), 1, 1, 1, 3, "1", "1");
INSERT INTO faculty_account(faculty, created, activated, faculty_account_type, permission_level, college, username, password) VALUES (2, now(), 1, 1, 1, 3, "asd2", "123");
INSERT INTO faculty_account(faculty, created, activated, faculty_account_type, permission_level, college, username, password) VALUES (3, now(), 1, 1, 1, 3, "asd3", "123");
INSERT INTO faculty_account(faculty, created, activated, faculty_account_type, permission_level, college, username, password) VALUES (4, now(), 1, 1, 1, 3, "asd4", "123");

INSERT INTO major_program (major, name, advisor) VALUES (1, "Artificial Intelligence", "JULIA RAMOS");
INSERT INTO major_program (major, name, advisor) VALUES (1, "SOFTWARE ENGINEERING", "SMITH WANG");
INSERT INTO major_program (major, name, advisor) VALUES (1, "DATA ENGINEERING", "JOSE ORTIZ");
INSERT INTO major_program (major, name, advisor) VALUES (2, "BUSINESS Intelligence", "SIRIA TRISS");
INSERT INTO major_program (major, name, advisor) VALUES (2, "BUSINESS Concentration in Accounting", "JENINE WRIGHT");
INSERT INTO major_program (major, name, advisor) VALUES (2, "Cybersecurity for Managerse", "DONELA ORTIZ");
INSERT INTO major_program (major, name, advisor) VALUES (3, "Law, Politics, and Society WITH ETHNIC", "GEORGE KIM");
INSERT INTO major_program (major, name, advisor) VALUES (3, "Science, Health, and Environmental Studies", "JENN KIM");
INSERT INTO major_program (major, name, advisor) VALUES (4, "Equity, Leadership Studies", "DORIS CLOW");
INSERT INTO major_program (major, name, advisor) VALUES (4, "Counseling, Psychology, & Social Work", "CHNTHIA GUZMAN");


INSERT INTO courses (subject, major_id) VALUES ("INTRO TO SQL", 1);
INSERT INTO courses (subject, major_id) VALUES ("DATABASE MANAGEMENT", 1);
INSERT INTO courses (subject, major_id) VALUES ("Data Science and Machine Learning", 1);
INSERT INTO courses (subject, major_id) VALUES ("Analysis of Algorithms", 1);
INSERT INTO courses (subject, major_id) VALUES ("Theory of Computing", 1);
INSERT INTO courses (subject, major_id) VALUES ("Introduction to Engineering", 2);
INSERT INTO courses (subject, major_id) VALUES ("ENGINEERING: Dynamics ", 2);
INSERT INTO courses (subject, major_id) VALUES ("Materials of Electrical and Electronic ", 2);
INSERT INTO courses (subject, major_id) VALUES ("Circuits and Instrumentation Laboratory", 2);
INSERT INTO courses (subject, major_id) VALUES ("Introduction to MATLAB", 2);
INSERT INTO courses (subject, major_id) VALUES ("Calculus3", 3);
INSERT INTO courses (subject, major_id) VALUES ("Concepts of the Number System", 3);
INSERT INTO courses (subject, major_id) VALUES ("Statistics", 3);
INSERT INTO courses (subject, major_id) VALUES ("Calculus1", 3);
INSERT INTO courses (subject, major_id) VALUES ("Calculus2", 3);
INSERT INTO courses (subject, major_id) VALUES ("Human Biology", 4);
INSERT INTO courses (subject, major_id) VALUES ("The World of Plants", 4);
INSERT INTO courses (subject, major_id) VALUES ("Marine Biology", 4);
INSERT INTO courses (subject, major_id) VALUES ("Animal Diversity", 4);
INSERT INTO courses (subject, major_id) VALUES ("General Microbiology and Public Health", 4);
INSERT INTO courses (subject, major_id) VALUES ("Conceptual Physics", 5);
INSERT INTO courses (subject, major_id) VALUES ("General Physics 1", 5);
INSERT INTO courses (subject, major_id) VALUES ("General Physics 2", 5);
INSERT INTO courses (subject, major_id) VALUES ("Physics with Calculus II", 5);
INSERT INTO courses (subject, major_id) VALUES ("Physics with Calculus I", 5);
INSERT INTO courses (subject, major_id) VALUES ("Introduction to Microeconomic Analysis", 6);
INSERT INTO courses (subject, major_id) VALUES ("Introduction to Macroeconomic Analysis", 6);
INSERT INTO courses (subject, major_id) VALUES ("Intermediate Microeconomic Theory", 6);
INSERT INTO courses (subject, major_id) VALUES ("Statistical Methods and Interpretation", 6);
INSERT INTO courses (subject, major_id) VALUES ("Intermediate Macroeconomic Theory", 6);
INSERT INTO courses (subject, major_id) VALUES ("Foundations in Business Communications", 7);
INSERT INTO courses (subject, major_id) VALUES ("Starting a Small Business", 7);
INSERT INTO courses (subject, major_id) VALUES ("Introduction to Entrepreneurship", 7);
INSERT INTO courses (subject, major_id) VALUES ("Social Entrepreneurship: Mission-Driven Ventures", 7);
INSERT INTO courses (subject, major_id) VALUES ("Building the Entrepreneurial Venture", 7);
INSERT INTO courses (subject, major_id) VALUES ("Introduction to the Study of Labor", 8);
INSERT INTO courses (subject, major_id) VALUES ("Know Your Work Rights", 8);
INSERT INTO courses (subject, major_id) VALUES ("Researching Labor Issues", 8);
INSERT INTO courses (subject, major_id) VALUES ("Women and Work", 8);
INSERT INTO courses (subject, major_id) VALUES ("Slavery and Antislavery in the United States ", 8);
INSERT INTO courses (subject, major_id) VALUES ("Introduction to Hospitality and Tourism Management", 9);
INSERT INTO courses (subject, major_id) VALUES ("Legal Aspects of Hospitality and Tourism Management", 9);
INSERT INTO courses (subject, major_id) VALUES ("Service Leadership: Theory and Practice ", 9);
INSERT INTO courses (subject, major_id) VALUES ("Hospitality Tourism Management Business Communication", 9);
INSERT INTO courses (subject, major_id) VALUES ("Food Science and Production", 9);
INSERT INTO courses (subject, major_id) VALUES ("Identity, Equity, and Student Success", 10);
INSERT INTO courses (subject, major_id) VALUES ("Asian American Activism", 10);
INSERT INTO courses (subject, major_id) VALUES ("Asian American Artistic Explorations", 10);
INSERT INTO courses (subject, major_id) VALUES ("Critical Thinking and the Asian American Experience", 10);
INSERT INTO courses (subject, major_id) VALUES ("Quantitative Analysis in Asian American Studies", 10);


INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (17345, 1, 3, 1, 1, "", "SQL FOR EVERY LEVEL. FIRST CLASS OF DATABASE", "CSC675");
INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (45434, 1, 3, 2, 1, "CSC675", "HOW TO AVOID NEWBIE-STAKE: DATABASE", "CSC875");
INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (43432, 1, 3, 3, 1, "", "HOW TO BE DATA SCIENTIST", "CSC805");
INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (32334, 1, 3, 4, 1, "", "ANALYZE ALGORITHMS LIKE PRO", "CSC510");
INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (43334, 1, 3, 5, 1, "", "READY FOR MATH COMPUTING?", "CSC520");

INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (44234, 1, 3, 6, 1, "", "ENGINEERING FOR EVERYONE", "ENG101");
INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (23434, 1, 3, 7, 1, "ENG101", "MEDIUM ENGINEERING", "ENG201");
INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (54455, 1, 3, 8, 1, "ENG201", "SO YOU THOUGHT ENGINEERING IS EASY", "ENG301");
INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (45312, 1, 3, 9, 1, "", "READY FOR PHISICAL ENGINEERING?", "ENG 305");
INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (45431, 1, 3, 10, 1, "", "PROGRAMING AND ENGINEERING", "ENG313");

INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (67434, 1, 3, 11, 1, "MAT200", "DIFFICULT MATH ", "MAT300");
INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (46734, 1, 3, 12, 1, "", "READY FOR MATH ESSAY AND TEARS", "MAT305");
INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (45674, 1, 3, 13, 1, "", "STATISTICS ARE COOL", "MAT 310");
INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (45467, 1, 3, 14, 1, "MAT100", "MERIUM RARE MATH", "MAT200");
INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (42403, 1, 3, 15, 1, "", "EASY MATH", "MAT100");

INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (45478, 1, 3, 16, 1, "", "MOST INTERESTING BIOLIGY", "BIO101");
INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (45784, 1, 3, 17, 1, "", "GREEN BIOLOGY", "BIO200");
INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (47834, 1, 3, 18, 1, "", "BLUE BIOLOGY", "BIO205");
INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (78434, 1, 3, 19, 1, "", "RED BIOLOGY", "BIO235");
INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (90434, 1, 3, 20, 1, "BIO101", "HARD BIOLOGY", "BIO400");

INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (49034, 1, 3, 21, 1, "", "PHYSICS FOR BEGINNER", "PHY101");
INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (45904, 1, 3, 22, 1, "", "PHYSICS FOR STEM", "PHY200");
INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (45490, 1, 3, 23, 1, "", "PHYSICS FOR STEM2", "PHY201");
INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (13434, 1, 3, 24, 1, "PHY200", "PHYSICS FOR STEM3", "PHY300");
INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (95234, 1, 3, 25, 1, "PHY200", "PHYSICS FOR STEM4", "PHY301");

INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (85434, 1, 3, 26, 1, "", "MICROECONOMIC IS DIFFRENT THAN MACROECONOMIC", "ECN101");
INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (78434, 1, 3, 27, 1, "", "MACROECONOMIC IS DIFFERENT THATN MICROECONOMIC", "ECN102");
INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (46034, 1, 3, 28, 1, "ECN101", "MICROECONOMIC FOR MEDIUM", "ECN201");
INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (41034, 1, 3, 29, 1, "", "MATH BUSINESS", "ECN 301");
INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (42934, 1, 3, 30, 1, "ECN102", "IT IS NOT MAC AND CHEESE", "ECN202");

INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (45404, 1, 3, 31, 1, "", "COMMUNICATION AND BUSINESS", "BUS101");
INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (45504, 1, 3, 32, 1, "", "YOU WILL LEARN!", "BUS201");
INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (47734, 1, 3, 33, 1, "BUS201", "READY TO BE RICH?", "BUS301");
INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (11434, 1, 3, 34, 1, "BUS301", "BUSINESS AND MISSION", "BUS400");
INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (22434, 1, 3, 35, 1, "", "VENTURE", "BUS500");

INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (33434, 1, 3, 36, 1, "", "INTRO TO LOBOR", "LNE100");
INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (44434, 1, 3, 37, 1, "", "LEARN ABOUT LAW", "LNE200");
INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (55434, 1, 3, 38, 1, "", "RESEARCH", "LNE300");
INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (66434, 1, 3, 39, 1, "", "LABOR+FEMINISM", "LNE350");
INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (77434, 1, 3, 40, 1, "LNE100", "MODERN SLAVERY", "LNE400");

INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (88434, 1, 3, 41, 1, "", "TOURISM FOR BEGINNER", "HTM101");
INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (99434, 1, 3, 42, 1, "", "TOURISM AND LAW", "HTM200");
INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (00424, 1, 3, 43, 1, "", "HR AND TOURSM", "HTM230");
INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (00454, 1, 3, 44, 1, "", "COMMUNICATION AND TOURSM", "HTM250");
INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (00494, 1, 3, 45, 1, "HTM101", "FOOD!!!!!", "HTM300");

INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (40034, 1, 3, 46, 1, "", "INTRO ASIAN AMERICAN STURY", "ETH101");
INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (40134, 1, 3, 47, 1, "", "AAPI 1", "ETH200");
INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (40234, 1, 3, 48, 1, "", "AAPI2", "ETH240");
INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (40334, 1, 3, 49, 1, "", "AAPI3", "ETH300");
INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (40434, 1, 3, 50, 1, "", "AAPI4", "ETH233");

INSERT INTO TA_Grader (class_section, student_account, salary) VALUES (1, 1, 100);
INSERT INTO TA_Grader (class_section, student_account, salary) VALUES (2, 1, 10);
INSERT INTO TA_Grader (class_section, student_account, salary) VALUES (3, 1, 90);

INSERT INTO student_record_type (records_description) VALUES ("FINANCE");
INSERT INTO student_record_type (records_description) VALUES ("FINANCIAL AID");
INSERT INTO student_record_type (records_description) VALUES ("HEALTH");
INSERT INTO student_record_type (records_description) VALUES ("ACADEMICS");

INSERT INTO student_records (student_account, student_records_type) VALUES (1, 1);
INSERT INTO student_records (student_account, student_records_type) VALUES (1, 2);
INSERT INTO student_records (student_account, student_records_type) VALUES (1, 3);
INSERT INTO student_records (student_account, student_records_type) VALUES (1, 4);
INSERT INTO student_records (student_account, student_records_type) VALUES (2, 1);
INSERT INTO student_records (student_account, student_records_type) VALUES (3, 1);
INSERT INTO student_records (student_account, student_records_type) VALUES (4, 1);
INSERT INTO student_records (student_account, student_records_type) VALUES (2, 2);
INSERT INTO student_records (student_account, student_records_type) VALUES (3, 2);
INSERT INTO student_records (student_account, student_records_type) VALUES (4, 2);
INSERT INTO student_records (student_account, student_records_type) VALUES (2, 4);
INSERT INTO student_records (student_account, student_records_type) VALUES (3, 4);
INSERT INTO student_records (student_account, student_records_type) VALUES (4, 4);

INSERT INTO class_roster(section, semester, student_account, grade) VALUES (1, "2021SP", 1, 2.2);
INSERT INTO class_roster(section, semester, student_account, grade) VALUES (2, "2021SP", 2, 3.2);
INSERT INTO class_roster(section, semester, student_account, grade) VALUES (3, "2021SP", 3, 4.0);
INSERT INTO class_roster(section, semester, student_account, grade) VALUES (4, "2021SP", 4, 2.9);

-- INSERT INTO class_roster(section, semester) VALUES (1, "2021SP");
-- INSERT INTO class_roster(section, semester) VALUES (2, "2021SP");
-- INSERT INTO class_roster(section, semester) VALUES (3, "2021SP");
-- INSERT INTO class_roster(section, semester) VALUES (4, "2021SP");



INSERT INTO enrollSection (class_roster, student_account) VALUES(1,1);
INSERT INTO enrollSection (class_roster, student_account) VALUES(1,2);
INSERT INTO enrollSection (class_roster, student_account) VALUES(1,3);
INSERT INTO enrollSection (class_roster, student_account) VALUES(2,2);
INSERT INTO enrollSection (class_roster, student_account) VALUES(2,3);
INSERT INTO enrollSection (class_roster, student_account) VALUES(3,1);
INSERT INTO enrollSection (class_roster, student_account) VALUES(3,3);
INSERT INTO enrollSection (class_roster, student_account) VALUES(3,4);
INSERT INTO enrollSection (class_roster, student_account) VALUES(3,2);

INSERT INTO academics (major_program_id, student_account, gpa, graduation_status, units_taken, student_records) VALUES (1, 1, 3.9, 0, 200, 4);
INSERT INTO academics (major_program_id, student_account, gpa, graduation_status, units_taken, student_records) VALUES (4, 2, 3.2, 0, 20, 4);
INSERT INTO academics (major_program_id, student_account, gpa, graduation_status, units_taken, student_records) VALUES (5, 3, 3.1, 0, 30, 4);
INSERT INTO academics (major_program_id, student_account, gpa, graduation_status, units_taken, student_records) VALUES (1, 4, 2.8, 0, 30, 4);

INSERT INTO transcripts (academic, ordered) VALUES (1, now());
INSERT INTO transcripts (academic, ordered) VALUES (2, now());
INSERT INTO transcripts (academic, ordered) VALUES (3, now());
INSERT INTO transcripts (academic, ordered) VALUES (4, now());

INSERT INTO courses_taken (section, grades, semester, units, academic, transcript) VALUES (1, 3.2, "2020SP", 3, 1, 1);
INSERT INTO courses_taken (section, grades, semester, units, academic, transcript) VALUES (2, 2.0, "2020FA", 3, 1, 1);
INSERT INTO courses_taken (section, grades, semester, units, academic, transcript) VALUES (3, 3.9, "2020SP", 3, 1, 1);
INSERT INTO courses_taken (section, grades, semester, units, academic, transcript) VALUES (4, 2.2, "2021SP", 3, 1, 1);
INSERT INTO courses_taken (section, grades, semester, units, academic, transcript) VALUES (5, 3.7, "2020FA", 3, 1, 1);
INSERT INTO courses_taken (section, grades, semester, units, academic, transcript) VALUES (6, 3.9, "2020SP", 3, 1, 1);

INSERT INTO courses_taken (section, grades, semester, units, academic, transcript) VALUES (31, 3.2, "2020SP", 3, 2, 2);
INSERT INTO courses_taken (section, grades, semester, units, academic, transcript) VALUES (32, 2.9, "2020FA", 3, 2, 2);
INSERT INTO courses_taken (section, grades, semester, units, academic, transcript) VALUES (33, 3.0, "2020SP", 3, 2, 2);
INSERT INTO courses_taken (section, grades, semester, units, academic, transcript) VALUES (34, 2.3, "2021SP", 3, 2, 2);
INSERT INTO courses_taken (section, grades, semester, units, academic, transcript) VALUES (35, 3.3, "2020FA", 3, 2, 2);
INSERT INTO courses_taken (section, grades, semester, units, academic, transcript) VALUES (30, 3.3, "2020SP", 3, 2, 2);

INSERT INTO courses_taken (section, grades, semester, units, academic, transcript) VALUES (31, 3.2, "2020SP", 3, 3, 3);
INSERT INTO courses_taken (section, grades, semester, units, academic, transcript) VALUES (32, 2.0, "2020FA", 3, 3, 3);
INSERT INTO courses_taken (section, grades, semester, units, academic, transcript) VALUES (33, 3.1, "2020SP", 3, 3, 3);
INSERT INTO courses_taken (section, grades, semester, units, academic, transcript) VALUES (34, 2.1, "2021SP", 3, 3, 3);
INSERT INTO courses_taken (section, grades, semester, units, academic, transcript) VALUES (35, 3.1, "2020FA", 3, 3, 3);
INSERT INTO courses_taken (section, grades, semester, units, academic, transcript) VALUES (30, 3.9, "2020SP", 3, 3, 3);

INSERT INTO courses_taken (section, grades, semester, units, academic, transcript) VALUES (1, 3.2, "2020SP", 3, 4, 4);
INSERT INTO courses_taken (section, grades, semester, units, academic, transcript) VALUES (2, 2.0, "2020FA", 3, 4, 4);
INSERT INTO courses_taken (section, grades, semester, units, academic, transcript) VALUES (3, 3.9, "2020SP", 3, 4, 4);
INSERT INTO courses_taken (section, grades, semester, units, academic, transcript) VALUES (4, 2.2, "2021SP", 3, 4, 4);
INSERT INTO courses_taken (section, grades, semester, units, academic, transcript) VALUES (5, 3.7, "2020FA", 3, 4, 4);
INSERT INTO courses_taken (section, grades, semester, units, academic, transcript) VALUES (6, 3.9, "2020SP", 3, 4, 4);

INSERT INTO health_service (immunization, note, student_records) VALUES ("COVID", "N/A", 3);
INSERT INTO health_service (immunization, note, student_records) VALUES ("N/A", "N/A", 3);
INSERT INTO health_service (immunization, note, student_records) VALUES ("MEASLE", "N/A", 3);

INSERT INTO finance(balance, charge, payment, student_records, pending_aid) VALUES (0, 100, 20,  1, 1);
INSERT INTO finance(balance, charge, payment, student_records, pending_aid) VALUES (0, 50, 10,  5, 2);
INSERT INTO finance(balance, charge, payment, student_records, pending_aid) VALUES (0, 300, 0,  6, 3);
INSERT INTO finance(balance, charge, payment, student_records, pending_aid) VALUES (0, 300, 0,  7, 3);

INSERT INTO financial_aid(balance, years, student_records) VALUES (30, "2021SP", 1);
INSERT INTO financial_aid(balance, years, student_records) VALUES (0, "2021SP", 5);
INSERT INTO financial_aid(balance, years, student_records) VALUES (500, "2021SP", 6);
INSERT INTO financial_aid(balance, years, student_records) VALUES (20, "2021SP", 7);

-- CALLING OUT PROCEDURE
-- CALL findName (1, @studentName);
-- SELECT @studentName as studentName;


-- CALLLING OUT FUNCTION
-- SELECT balanceOut(1);


-- SELECT * FROM student;
-- SELECT * FROM EnrolledStudent;
-- SELECT * FROM permission_type;
-- SELECT * FROM permission_level;
-- SELECT * FROM student_account;
-- SELECT * FROM department;
-- SELECT * FROM student_employee;
-- # using trigger to insert new student_employee_account
-- SELECT * FROM student_employee_account;
-- SELECT * FROM student_address;
-- SELECT * FROM studentAddAddress;
-- SELECT * FROM employee;
-- SELECT * FROM employee_account_type;
-- SELECT * FROM employee_account;
-- SELECT * FROM faculty;
-- SELECT * FROM faculty_account_type;
-- SELECT * FROM college;
-- SELECT * FROM major;
-- SELECT * FROM faculty_account;
-- SELECT * FROM major_program;
-- SELECT * FROM courses;
-- SELECT * FROM class_section;
-- SELECT * FROM TA_Grader;
-- SELECT * FROM student_record_type;
-- SELECT * FROM student_records;
-- SELECT * FROM class_roster;
-- SELECT * FROM enrollSection;
-- SELECT * FROM academics;
-- SELECT * FROM transcripts;
-- SELECT * FROM courses_taken;
-- SELECT * FROM health_service;
-- SELECT * FROM finance;
-- SELECT * FROM financial_aid;




