
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

INSERT INTO EnrolledStudent (prefer_name, Date_of_birth, student) VALUES ("JUNE", "2000/02/22", 1);
INSERT INTO EnrolledStudent (prefer_name, Date_of_birth, student) VALUES ("KAY", "2000/02/22", 2);
INSERT INTO EnrolledStudent (Date_of_birth, student) VALUES ("2000/03/22", 3);
INSERT INTO EnrolledStudent (Date_of_birth, student) VALUES ("2000/04/22", 4);

-- INSERT INTO student_account (activate, created, erd_student, permission_level) VALUES (1, now(), 1, 1);
-- INSERT INTO student_account (activate, created, erd_student, permission_level) VALUES (1, now(), 2, 1);
-- INSERT INTO student_account (activate, created, erd_student, permission_level) VALUES (1, now(), 3, 1);
-- INSERT INTO student_account (activate, created, erd_student, permission_level) VALUES (1, now(), 4, 1);

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

INSERT INTO employee_account (account_type, permission_type, employee, created, activated, department) VALUES (1, 2, 1, now(), 1, 1);
INSERT INTO employee_account (account_type, permission_type, employee, created, activated, department) VALUES (2, 1, 2, now(), 1, 2);
INSERT INTO employee_account (account_type, permission_type, employee, created, activated, department) VALUES (3, 1, 3, now(), 1, 3);

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
INSERT INTO major (major_name, major_head, college) VALUES ("ECONOMICS", "JOCELYN BELL", 2);
INSERT INTO major (major_name, major_head, college) VALUES ("ASIAN AMERICAN STUDY", "STEPHAN BURNS", 3);

INSERT INTO faculty_account(faculty, created, activated, faculty_account_type, permission_type, college) VALUES (1, now(), 1, 1, 1, 1);
INSERT INTO faculty_account(faculty, created, activated, faculty_account_type, permission_type, college) VALUES (2, now(), 1, 1, 1, 1);
INSERT INTO faculty_account(faculty, created, activated, faculty_account_type, permission_type, college) VALUES (3, now(), 1, 1, 1, 2);
INSERT INTO faculty_account(faculty, created, activated, faculty_account_type, permission_type, college) VALUES (4, now(), 1, 1, 1, 3);

INSERT INTO major_program (major, name, advisor) VALUES (1, "Artificial Intelligence", "JULIA RAMOS");
INSERT INTO major_program (major, name, advisor) VALUES (1, "SOFTWARE ENGINEERING", "SMITH WANG");
INSERT INTO major_program (major, name, advisor) VALUES (2, "BUSINESS Intelligence", "SIRIA TRISS");
INSERT INTO major_program (major, name, advisor) VALUES (1, "DATA ENGINEERING", "JOSE ORTIZ");

INSERT INTO courses (subject, major_id) VALUES ("INTRO TO SQL", 1);
INSERT INTO courses (subject, major_id) VALUES ("EXCEL FOR FRESHMAN", 2);
INSERT INTO courses (subject, major_id) VALUES ("DATABASE MANAGEMENT", 1);
INSERT INTO courses (subject, major_id) VALUES ("WEB DEV WITH REACT", 1);

INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (17345, 1, 3, 1, 1, "", "SQL FOR EVERY LEVEL. FIRST CLASS OF DATABASE", "CSC675");
INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (22383, 2, 2, 2, 1, "", "EXCEL FOR EVERY LEVEL. BRING YOUR LAPTOP", "BUS200");
INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (33434, 3, 4, 4, 1, "", "REACT REDUC NODE ETC", "CSC667");
INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (45434, 1, 3, 1, 1, "CSC675", "HOW TO AVOID NEWBIE-STAKE: DATABASE", "CSC875");
INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (55432, 2, 3, 2, 1, "CSC875", "SMASHING MONGODB", "CSC815");
INSERT INTO class_section (class_number, instructor, units, course_id, opened, prerequisites, description, subject) VALUES (64456, 3, 3, 4, 1, "CSC667", "PRO WEB DEV VS. NEWBIE", "CSC867");


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

INSERT INTO class_roster(section, semester) VALUES (1, "2021SP");
INSERT INTO class_roster(section, semester) VALUES (2, "2021SP");
INSERT INTO class_roster(section, semester) VALUES (3, "2021SP");
INSERT INTO class_roster(section, semester) VALUES (4, "2021SP");

INSERT INTO enrollSection (class_roster, student_account) VALUES(1,1);
INSERT INTO enrollSection (class_roster, student_account) VALUES(2,2);
INSERT INTO enrollSection (class_roster, student_account) VALUES(3,3);

INSERT INTO academics (major_program_id, student_account, gpa, graduation_status, units_taken, student_records) VALUES (4, 1, 0, 0, 200, 4);
INSERT INTO academics (major_program_id, student_account, gpa, graduation_status, units_taken, student_records) VALUES (2, 2, 3.2, 0, 20, 4);
INSERT INTO academics (major_program_id, student_account, gpa, graduation_status, units_taken, student_records) VALUES (4, 3, 3.1, 0, 30, 4);

INSERT INTO transcripts (academic, ordered) VALUES (1, now());
INSERT INTO transcripts (academic, ordered) VALUES (2, now());
INSERT INTO transcripts (academic, ordered) VALUES (1, now());

INSERT INTO courses_taken (section, grades, semester, units, academic, transcript) VALUES (1, 3.2, "2020SP", 3, 1, 1);
INSERT INTO courses_taken (section, grades, semester, units, academic, transcript) VALUES (2, 2.0, "2020FA", 3, 1, 1);
INSERT INTO courses_taken (section, grades, semester, units, academic, transcript) VALUES (3, 3.9, "2020SP", 3, 1, 1);
INSERT INTO courses_taken (section, grades, semester, units, academic, transcript) VALUES (4, 2.2, "2021SP", 3, 1, 1);
INSERT INTO courses_taken (section, grades, semester, units, academic, transcript) VALUES (5, 3.7, "2020FA", 3, 1, 1);
INSERT INTO courses_taken (section, grades, semester, units, academic, transcript) VALUES (6, 3.9, "2020SP", 3, 1, 1);

INSERT INTO health_service (immunization, note, student_records) VALUES ("COVID", "N/A", 3);
INSERT INTO health_service (immunization, note, student_records) VALUES ("N/A", "N/A", 3);
INSERT INTO health_service (immunization, note, student_records) VALUES ("MEASLE", "N/A", 3);

INSERT INTO finance(balance, charge, payment, student_records, pending_aid) VALUES (0, 100, 20,  1, 1);
INSERT INTO finance(balance, charge, payment, student_records, pending_aid) VALUES (0, 50, 10,  5, 2);
INSERT INTO finance(balance, charge, payment, student_records, pending_aid) VALUES (0, 300, 0,  6, 3);

INSERT INTO financial_aid(balance, years, student_records) VALUES (30, "2021SP", 1);
INSERT INTO financial_aid(balance, years, student_records) VALUES (0, "2021SP", 5);
INSERT INTO financial_aid(balance, years, student_records) VALUES (500, "2021SP", 6);

-- CALLING OUT PROCEDURE
 CALL findName (1, @studentName);
 SELECT @studentName as studentName;


-- CALLLING OUT FUNCTION
SELECT balanceOut(1);


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




