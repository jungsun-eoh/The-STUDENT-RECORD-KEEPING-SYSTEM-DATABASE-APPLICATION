USE `studentRecordsDb`;

UPDATE academics SET gpa=4.0 WHERE student_academic_id = 1;
UPDATE academics SET major_program_id=3 WHERE student_academic_id = 1;
UPDATE academics SET student_records=3 WHERE student_academic_id = 2;
DELETE FROM academics WHERE student_academic_id = 3;
UPDATE class_roster SET section=3 WHERE class_roster_id=1;
DELETE FROM class_roster WHERE section=3;

-- UPDATE class_section SET course_id=5 WHERE class_number=2;
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`studentrecordsdb`.`class_section`, CONSTRAINT `fk_course_section` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_ID`) ON DELETE CASCADE ON UPDATE CASCADE)
-- DELETE FROM class_section WHERE class_number =2;
-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`studentrecordsdb`.`courses_taken`, CONSTRAINT `fk_section_crsTaken` FOREIGN KEY (`section`) REFERENCES `class_section` (`section_ID`))

UPDATE college SET college_head="ME" WHERE college_id=1;
-- DELETE FROM college WHERE college_id=1;
-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`studentrecordsdb`.`courses_taken`, CONSTRAINT `fk_section_crsTaken` FOREIGN KEY (`section`) REFERENCES `class_section` (`section_ID`))

UPDATE courses SET major_id= 3 WHERE course_ID=1;
DELETE FROM courses WHERE course_ID = 3;

UPDATE courses_taken SET section = 3 WHERE courses_taken_id=1;
UPDATE courses_taken SET section = 3 WHERE transcript=1;
UPDATE courses_taken SET section = 3 WHERE section=1;
DELETE FROM courses_taken WHERE courses_taken_id = 1;

UPDATE department SET name = "ME" WHERE department_id=1;
DELETE FROM department WHERE department_id =1;

UPDATE employee SET first_name = "CS GEN" WHERE employee_id =1;
DELETE FROM employee WHERE employee_id = 1;

UPDATE employee_account SET account_type=3 WHERE employee_acc_id=1;
UPDATE employee_account SET permission_type=1 WHERE employee_acc_id=1;
DELETE FROM employee_account  WHERE employee_acc_id=1;

UPDATE employee_account_type SET employee_description= "" WHERE employee_account_type_id=1;
DELETE FROM employee_account_type WHERE employee_account_type_id=1;

UPDATE EnrolledStudent SET prefer_name = "JINNY" WHERE enrd_student_id = 1;
-- UPDATE EnrolledStudent SET student = 2 WHERE enrd_student_id = 1;

-- DELETE FROM EnrolledStudent WHERE enrd_student_id = 1;
-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`studentrecordsdb`.`student_account`, CONSTRAINT `fk_stu_stuAcc` FOREIGN KEY (`erd_student`) REFERENCES `enrolledstudent` (`enrd_student_id`) ON UPDATE CASCADE)

UPDATE enrollSection SET class_roster = 3 WHERE enroll_section_id=1;
DELETE FROM enrollSection WHERE enroll_section_id=2;

UPDATE faculty SET gender= "FE" WHERE faculty_id = 1;
-- DELETE FROM faculty WHERE faculty_id= 3;

UPDATE faculty_account SET faculty_account_type= 3 WHERE faculty_account_id = 1;
-- DELETE FROM faculty_account WHERE faculty_account_id = 3;

UPDATE faculty_account_type SET descritpion = "" WHERE faculty_acc_type = 3;
DELETE FROM faculty_account_type WHERE faculty_acc_type = 3;

UPDATE finance SET pending_aid = 1 WHERE student_finance_id = 3;
DELETE FROM finance WHERE student_finance_id = 3;

UPDATE financial_aid SET student_records = 3 WHERE student_financial_aid_id= 1;
DELETE FROM financial_aid WHERE student_financial_aid_id = 1;

UPDATE health_service SET immunization = "" WHERE student_health_id = 1;
DELETE FROM health_service WHERE student_health_id = 3;

UPDATE major SET college = 3 WHERE major_ID = 1;
DELETE FROM major WHERE major_ID = 3;

-- UPDATE major_program SET major = 3 WHERE major_program_id = 2;
-- DELETE FROM major_program WHERE major_program_id = 3;

UPDATE permission_level SET permssion_type = 3 WHERE permission_id = 3;
-- DELETE FROM permission_level WHERE permission_id = 3;

UPDATE permission_type SET permission_desctiption = "" WHERE permission_type_id = 1;
-- DELETE FROM permission_type WHERE permission_type_id = 3;

UPDATE student SET admission_number = 34 WHERE student_id = 1;
-- DELETE FROM student WHERE student_id = 4;

UPDATE student_account SET erd_student = 3 WHERE student_account_id = 2;
-- DELETE FROM student_account WHERE student_account_id = 2;

UPDATE StudentAddAddress SET Enrd_Student = 3 WHERE addAddress_id = 2;
DELETE FROM StudentAddAddress WHERE addAddress_id = 3;

UPDATE student_address SET email = "" WHERE student_address_id = 1;
DELETE FROM student_address WHERE student_address_id = 3;

UPDATE student_employee SET department = 3 WHERE student_emp_id = 1;
-- DELETE FROM student_employee WHERE student_emp_id = 3;

UPDATE student_employee_account SET activated=0 WHERE student_emp_account_id = 3;
DELETE FROM student_employee_account WHERE activated=0;

UPDATE student_records SET student_records_type = 3 WHERE student_records_id = 1;
-- DELETE FROM student_records WHERE student_records_id=3;

UPDATE student_record_type SET records_description ="" WHERE student_record_type=1;
-- DELETE FROM student_record_type WHERE student_record_type = 3;


UPDATE TA_Grader SET class_section = 1 WHERE student_emp_id=3;
DELETE FROM TA_Grader WHERE student_emp_id = 3;


UPDATE transcripts SET academic = 1 WHERE transcript_id = 3;
DELETE FROM transcripts WHERE transcript_id = 3;







