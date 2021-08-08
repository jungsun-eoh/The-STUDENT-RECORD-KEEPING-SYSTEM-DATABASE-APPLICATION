USE `studentRecordsDb`;

INSERT INTO student (first_name, last_name, ethnicity, gender, admission_number) VALUES ('1','1','1','1','1');
INSERT INTO EnrolledStudent (prefer_name, Date_of_birth, student) VALUES ('1','1111/1/1','5');
INSERT INTO student_account (activate, created, erd_student, permission_level, username, password) VALUES ('1','2021-05-18 14:17:08','5','2','1','1');
INSERT INTO faculty (first_name, last_name, gender, date_of_birth, email) VALUES ('1','1','1','1111/1/1','1');
INSERT INTO faculty_account (faculty, created, activated, faculty_account_type, permission_level, username, password) VALUES ('5','2021-05-18 14:17:25','1','1','3','1','1');
INSERT INTO employee (first_name, last_name, gender, date_of_birth, email) VALUES ('1','1','1','1111/1/1','1');
INSERT INTO employee_account (account_type, permission_level, employee, created, activated, department, username, password) VALUES ('2','4','4','2021-05-18 14:17:38','1','1','1','1');
