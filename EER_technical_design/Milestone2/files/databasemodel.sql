-- MySQL Script generated by MySQL Workbench
-- Tue Apr 20 21:19:13 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `studentRecordsDb`;

CREATE SCHEMA IF NOT EXISTS `studentRecordsDb` DEFAULT CHARACTER SET UTF8MB4;
USE `studentRecordsDb`;

-- -----------------------------------------------------
-- Table `college`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `college` ;

CREATE TABLE IF NOT EXISTS `college` (
  `college_id` TINYINT NOT NULL AUTO_INCREMENT,
  `college_head` VARCHAR(45) NOT NULL,
  `name` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`college_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `major`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `major` ;

CREATE TABLE IF NOT EXISTS `major` (
  `major_ID` TINYINT NOT NULL AUTO_INCREMENT,
  `major_name` VARCHAR(45) NOT NULL,
  `major_head` VARCHAR(45) NOT NULL,
  `college` TINYINT NOT NULL,
  PRIMARY KEY (`major_ID`),
  UNIQUE INDEX `major_ID_UNIQUE` (`major_ID` ASC) VISIBLE,
  INDEX `fk_college_major_idx` (`college` ASC) VISIBLE,
  CONSTRAINT `fk_college_major`
    FOREIGN KEY (`college`)
    REFERENCES `college` (`college_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `major_program`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `major_program` ;

CREATE TABLE IF NOT EXISTS `major_program` (
  `major_program_id` TINYINT NOT NULL AUTO_INCREMENT,
  `major` TINYINT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `advisor` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`major_program_id`),
  INDEX `fk_major_ID_idx` (`major` ASC) VISIBLE,
  CONSTRAINT `fk_major_majProg`
    FOREIGN KEY (`major`)
    REFERENCES `major` (`major_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `student` ;

CREATE TABLE IF NOT EXISTS `student` (
  `student_id` TINYINT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `ethnicity` VARCHAR(20) NOT NULL,
  `fullname` VARCHAR(45) GENERATED ALWAYS AS (CONCAT(first_name, " " ,last_name)),
  `gender` VARCHAR(10) NOT NULL,
  `admission_number` TINYINT NOT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE INDEX `admission_number_UNIQUE` (`admission_number` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `EnrolledStudent`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EnrolledStudent` ;

CREATE TABLE IF NOT EXISTS `EnrolledStudent` (
  `enrd_student_id` TINYINT NOT NULL AUTO_INCREMENT,
  `prefer_name` VARCHAR(45) NULL DEFAULT NULL,
  `Date_of_birth` DATETIME NOT NULL,
  `student` TINYINT NOT NULL,
  PRIMARY KEY (`enrd_student_id`, `student`),
  INDEX `fk_ftStu_Student_idx` (`student` ASC) VISIBLE,
  CONSTRAINT `fk_pk_Stu_EnrdStudent`
    FOREIGN KEY (`student`)
    REFERENCES `student` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `permission_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `permission_type` ;

CREATE TABLE IF NOT EXISTS `permission_type` (
  `permission_type_id` TINYINT NOT NULL AUTO_INCREMENT,
  `permission_desctiption` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`permission_type_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `permission_level`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `permission_level` ;

CREATE TABLE IF NOT EXISTS `permission_level` (
  `permission_id` TINYINT NOT NULL AUTO_INCREMENT,
  `permssion_type` TINYINT NOT NULL,
  `permission_start` DATETIME NOT NULL,
  `permssion_end` DATETIME NOT NULL,
  `permission_granted` TINYINT NOT NULL,
  PRIMARY KEY (`permission_id`),
  INDEX `fk_perm_permType_idx` (`permssion_type` ASC) VISIBLE,
  CONSTRAINT `fk_perm_permType`
    FOREIGN KEY (`permssion_type`)
    REFERENCES `permission_type` (`permission_type_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `student_account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `student_account` ;

CREATE TABLE IF NOT EXISTS `student_account` (
  `student_account_id` TINYINT NOT NULL AUTO_INCREMENT,
  `activate` TINYINT NOT NULL,
  `created` DATETIME NOT NULL,
  `erd_student` TINYINT NOT NULL,
  `permission_level` TINYINT NOT NULL,
  PRIMARY KEY (`student_account_id`),
  INDEX `fk_stu_stuAcc_idx` (`erd_student` ASC) VISIBLE,
  INDEX `fk_perm_stuAcc_idx` (`permission_level` ASC) VISIBLE,
  CONSTRAINT `fk_stu_stuAcc`
    FOREIGN KEY (`erd_student`)
    REFERENCES `EnrolledStudent` (`enrd_student_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_perm_stuAcc`
    FOREIGN KEY (`permission_level`)
    REFERENCES `permission_level` (`permission_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `student_record_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `student_record_type` ;

CREATE TABLE IF NOT EXISTS `student_record_type` (
  `student_record_type` TINYINT NOT NULL AUTO_INCREMENT,
  `records_description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`student_record_type`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `student_records`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `student_records` ;

CREATE TABLE IF NOT EXISTS `student_records` (
  `student_records_id` TINYINT NOT NULL AUTO_INCREMENT,
  `student_account` TINYINT NOT NULL,
  `student_records_type` TINYINT NOT NULL,
  PRIMARY KEY (`student_records_id`),
  INDEX `fk_stuAcc_stuRecords_idx` (`student_account` ASC) VISIBLE,
  INDEX `fk_recType_stuRecords_idx` (`student_records_type` ASC) VISIBLE,
  CONSTRAINT `fk_stuAcc_stuRecords`
    FOREIGN KEY (`student_account`)
    REFERENCES `student_account` (`student_account_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_recType_stuRecords`
    FOREIGN KEY (`student_records_type`)
    REFERENCES `student_record_type` (`student_record_type`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `academics`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `academics` ;

CREATE TABLE IF NOT EXISTS `academics` (
  `student_academic_id` TINYINT NOT NULL AUTO_INCREMENT,
  `major_program_id` TINYINT NOT NULL,
  `student_account` TINYINT NOT NULL,
  `gpa` DECIMAL(2,1) NOT NULL,
  `graduation_status` TINYINT NOT NULL,
  `units_taken` INT NOT NULL,
  `student_records` TINYINT NOT NULL,
  INDEX `fk_major_program_id_idx` (`major_program_id` ASC) VISIBLE,
  INDEX `fk_stuAcc_academics_idx` (`student_account` ASC) VISIBLE,
  PRIMARY KEY (`student_academic_id`),
  INDEX `fk_stuRec_academics_idx` (`student_records` ASC) VISIBLE,
  CONSTRAINT `fk_majorProg_academics`
    FOREIGN KEY (`major_program_id`)
    REFERENCES `major_program` (`major_program_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stuAcc_academics`
    FOREIGN KEY (`student_account`)
    REFERENCES `student_account` (`student_account_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_stuRec_academics`
    FOREIGN KEY (`student_records`)
    REFERENCES `student_records` (`student_records_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `courses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `courses` ;

CREATE TABLE IF NOT EXISTS `courses` (
  `course_ID` TINYINT NOT NULL AUTO_INCREMENT,
  `subject` VARCHAR(45) NOT NULL,
  `major_id` TINYINT NULL,
  PRIMARY KEY (`course_ID`),
  INDEX `fk_major_ID_idx` (`major_id` ASC) VISIBLE,
  CONSTRAINT `fk_course_major_id`
    FOREIGN KEY (`major_id`)
    REFERENCES `major` (`major_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `faculty`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `faculty` ;

CREATE TABLE IF NOT EXISTS `faculty` (
  `faculty_id` TINYINT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `gender` VARCHAR(10) NOT NULL,
  `date_of_birth` DATETIME NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`faculty_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `faculty_account_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `faculty_account_type` ;

CREATE TABLE IF NOT EXISTS `faculty_account_type` (
  `faculty_acc_type` TINYINT NOT NULL AUTO_INCREMENT,
  `descritpion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`faculty_acc_type`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `faculty_account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `faculty_account` ;

CREATE TABLE IF NOT EXISTS `faculty_account` (
  `faculty_account_id` TINYINT NOT NULL AUTO_INCREMENT,
  `faculty` TINYINT NOT NULL,
  `created` DATETIME NOT NULL,
  `activated` TINYINT NOT NULL,
  `faculty_account_type` TINYINT NULL,
  `permission_type` TINYINT NOT NULL,
  `college` TINYINT NULL,
  PRIMARY KEY (`faculty_account_id`),
  INDEX `fk_faculty_facultyAcc_idx` (`faculty` ASC) VISIBLE,
  INDEX `fk_college_facultyAcc_idx` (`college` ASC) VISIBLE,
  INDEX `fk_perm_facultyAcc_idx` (`permission_type` ASC) VISIBLE,
  INDEX `fk_facAccType_facultyAcc_idx` (`faculty_account_type` ASC) VISIBLE,
  CONSTRAINT `fk_faculty_facultyAcc`
    FOREIGN KEY (`faculty`)
    REFERENCES `faculty` (`faculty_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_college_facultyAcc`
    FOREIGN KEY (`college`)
    REFERENCES `college` (`college_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_perm_facultyAcc`
    FOREIGN KEY (`permission_type`)
    REFERENCES `permission_level` (`permission_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_facAccType_facultyAcc`
    FOREIGN KEY (`faculty_account_type`)
    REFERENCES `faculty_account_type` (`faculty_acc_type`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `class_section`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `class_section` ;

CREATE TABLE IF NOT EXISTS `class_section` (
  `section_ID` TINYINT NOT NULL AUTO_INCREMENT,
  `class_number` VARCHAR(10) NOT NULL,
  `instructor` TINYINT NULL,
  `units` INT NOT NULL,
  `course_id` TINYINT NOT NULL,
  `opened` TINYINT NOT NULL,
  `prerequisites` VARCHAR(45) NULL,
  `description` VARCHAR(45) NOT NULL,
  `subject` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`section_ID`),
  UNIQUE INDEX `section_ID_UNIQUE` (`section_ID` ASC) VISIBLE,
  INDEX `fk_course_id_idx` (`course_id` ASC) VISIBLE,
  INDEX `fk_facAcc_section_idx` (`instructor` ASC) VISIBLE,
  CONSTRAINT `fk_course_section`
    FOREIGN KEY (`course_id`)
    REFERENCES `courses` (`course_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_facAcc_section`
    FOREIGN KEY (`instructor`)
    REFERENCES `faculty_account` (`faculty_account_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `class_roster`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `class_roster` ;

CREATE TABLE IF NOT EXISTS `class_roster` (
  `class_roster_id` TINYINT NOT NULL AUTO_INCREMENT,
  `section` TINYINT NOT NULL,
  `semester` VARCHAR(45) NOT NULL,
  INDEX `fk_class_section_id_idx` (`section` ASC) VISIBLE,
  PRIMARY KEY (`class_roster_id`),
  CONSTRAINT `fk_section_roster`
    FOREIGN KEY (`section`)
    REFERENCES `class_section` (`section_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `transcripts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `transcripts` ;

CREATE TABLE IF NOT EXISTS `transcripts` (
  `transcript_id` TINYINT NOT NULL AUTO_INCREMENT,
  `academic` TINYINT NOT NULL,
  `ordered` DATETIME NOT NULL,
  PRIMARY KEY (`transcript_id`),
  INDEX `fk_acRec_transcript_idx` (`academic` ASC) VISIBLE,
  CONSTRAINT `fk_acRec_transcript`
    FOREIGN KEY (`academic`)
    REFERENCES `academics` (`student_academic_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `courses_taken`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `courses_taken` ;

CREATE TABLE IF NOT EXISTS `courses_taken` (
  `courses_taken_id` TINYINT NOT NULL AUTO_INCREMENT,
  `section` TINYINT NOT NULL,
  `grades` DECIMAL(2,1) NOT NULL,
  `semester` VARCHAR(10) NOT NULL,
  `units` INT NOT NULL,
  `academic` TINYINT NOT NULL,
  `transcript` TINYINT NOT NULL,
  PRIMARY KEY (`courses_taken_id`),
  INDEX `fk_acdemic_crsTaken_idx` (`academic` ASC) VISIBLE,
  INDEX `fk_section_crsTaken_idx` (`section` ASC) VISIBLE,
  INDEX `fk_transcript_crsTaken_idx` (`transcript` ASC) VISIBLE,
  CONSTRAINT `fk_acdemic_crsTaken`
    FOREIGN KEY (`academic`)
    REFERENCES `academics` (`student_academic_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_section_crsTaken`
    FOREIGN KEY (`section`)
    REFERENCES `class_section` (`section_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transcript_crsTaken`
    FOREIGN KEY (`transcript`)
    REFERENCES `transcripts` (`transcript_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `department` ;

CREATE TABLE IF NOT EXISTS `department` (
  `department_id` TINYINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) NOT NULL,
  `department_head` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`department_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `employee_account_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `employee_account_type` ;

CREATE TABLE IF NOT EXISTS `employee_account_type` (
  `employee_account_type_id` TINYINT NOT NULL AUTO_INCREMENT,
  `employee_description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`employee_account_type_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `employee` ;

CREATE TABLE IF NOT EXISTS `employee` (
  `employee_id` TINYINT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `gender` VARCHAR(10) NOT NULL,
  `date_of_birth` DATETIME NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`employee_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `employee_account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `employee_account` ;

CREATE TABLE IF NOT EXISTS `employee_account` (
  `employee_acc_id` TINYINT NOT NULL AUTO_INCREMENT,
  `account_type` TINYINT NULL,
  `permission_type` TINYINT NOT NULL,
  `employee` TINYINT NOT NULL,
  `created` DATETIME NOT NULL,
  `activated` TINYINT NOT NULL,
  `department` TINYINT NOT NULL,
  PRIMARY KEY (`employee_acc_id`),
  INDEX `fk_emp_account_type_id_idx` (`account_type` ASC) VISIBLE,
  INDEX `fk_emp_permission_type_id_idx` (`permission_type` ASC) VISIBLE,
  INDEX `fk_dept_empAcc_idx` (`department` ASC) VISIBLE,
  INDEX `fk_emp_empAcc_idx` (`employee` ASC) VISIBLE,
  CONSTRAINT `fk_empAcctype_empAcc`
    FOREIGN KEY (`account_type`)
    REFERENCES `employee_account_type` (`employee_account_type_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_empPermType_empAcc`
    FOREIGN KEY (`permission_type`)
    REFERENCES `permission_type` (`permission_type_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_dept_empAcc`
    FOREIGN KEY (`department`)
    REFERENCES `department` (`department_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_emp_empAcc`
    FOREIGN KEY (`employee`)
    REFERENCES `employee` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `finance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `finance` ;

CREATE TABLE IF NOT EXISTS `finance` (
  `student_finance_id` TINYINT NOT NULL AUTO_INCREMENT,
  `balance` INT NULL,
  `charge` INT NULL,
  `payment` INT NULL,
  `pending_aid` VARCHAR(45) NULL DEFAULT NULL,
  `student_records` TINYINT NOT NULL,
  PRIMARY KEY (`student_finance_id`),
  INDEX `fk_stuRec_Finance_idx` (`student_records` ASC) VISIBLE,
  CONSTRAINT `fk_stuRec_Finance`
    FOREIGN KEY (`student_records`)
    REFERENCES `student_records` (`student_records_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `financial_aid`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `financial_aid` ;

CREATE TABLE IF NOT EXISTS `financial_aid` (
  `student_financial_aid_id` TINYINT NOT NULL AUTO_INCREMENT,
  `balance` INT NULL DEFAULT NULL,
  `years` VARCHAR(45) NULL DEFAULT NULL,
  `student_records` TINYINT NOT NULL,
  PRIMARY KEY (`student_financial_aid_id`),
  INDEX `fk_stuRec_financialAid_idx` (`student_records` ASC) VISIBLE,
  CONSTRAINT `fk_stuRec_financialAid`
    FOREIGN KEY (`student_records`)
    REFERENCES `student_records` (`student_records_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `health_service`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `health_service` ;

CREATE TABLE IF NOT EXISTS `health_service` (
  `student_health_id` TINYINT NOT NULL AUTO_INCREMENT,
  `immunization` VARCHAR(45) NULL DEFAULT NULL,
  `note` VARCHAR(45) NULL DEFAULT NULL,
  `student_records` TINYINT NOT NULL,
  PRIMARY KEY (`student_health_id`),
  INDEX `fk_stuRec_health_idx` (`student_records` ASC) VISIBLE,
  CONSTRAINT `fk_stuRec_health`
    FOREIGN KEY (`student_records`)
    REFERENCES `student_records` (`student_records_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `student_address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `student_address` ;

CREATE TABLE IF NOT EXISTS `student_address` (
  `student_address_id` TINYINT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(45) NOT NULL,
  `city` VARCHAR(20) NOT NULL,
  `state` VARCHAR(15) NOT NULL,
  `zipcode` VARCHAR(5) NOT NULL,
  `phone` VARCHAR(10) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`student_address_id`),
  UNIQUE INDEX `address_id_UNIQUE` (`student_address_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `student_employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `student_employee` ;

CREATE TABLE IF NOT EXISTS `student_employee` (
  `student_emp_id` TINYINT NOT NULL AUTO_INCREMENT,
  `department` TINYINT NULL,
  `student_account` TINYINT NOT NULL,
  `salary` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`student_emp_id`),
  INDEX `fk_department_studentEmp_idx` (`department` ASC) VISIBLE,
  INDEX `fk_stuAcc_stuEmp_idx` (`student_account` ASC) VISIBLE,
  CONSTRAINT `fk_dept_stuEmp`
    FOREIGN KEY (`department`)
    REFERENCES `department` (`department_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_stuAcc_stuEmp`
    FOREIGN KEY (`student_account`)
    REFERENCES `student_account` (`student_account_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `student_employee_account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `student_employee_account` ;

CREATE TABLE IF NOT EXISTS `student_employee_account` (
  `student_emp_account_id` TINYINT NOT NULL AUTO_INCREMENT,
  `created` DATETIME NOT NULL,
  `activated` TINYINT NOT NULL,
  `student_employee` TINYINT NOT NULL,
  PRIMARY KEY (`student_emp_account_id`, `student_employee`),
  INDEX `fk_stuEmp_stuEmpAcc_idx` (`student_employee` ASC) VISIBLE,
  CONSTRAINT `fk_pk_stuEmp_stuEmpAcc`
    FOREIGN KEY (`student_employee`)
    REFERENCES `student_employee` (`student_emp_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `TA_Grader`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TA_Grader` ;

CREATE TABLE IF NOT EXISTS `TA_Grader` (
  `student_emp_id` TINYINT NOT NULL AUTO_INCREMENT,
  `class_section` TINYINT NOT NULL,
  `student_account` TINYINT NOT NULL,
  `salary` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`student_emp_id`),
  INDEX `fk_Section_TA/GD_idx` (`class_section` ASC) VISIBLE,
  INDEX `fk_stuAcc_TA/GD_idx` (`student_account` ASC) VISIBLE,
  CONSTRAINT `fk_Section_TA/GD`
    FOREIGN KEY (`class_section`)
    REFERENCES `class_section` (`section_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_stuAcc_TA/GD`
    FOREIGN KEY (`student_account`)
    REFERENCES `student_account` (`student_account_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `StudentAddAddress`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `StudentAddAddress` ;

CREATE TABLE IF NOT EXISTS `StudentAddAddress` (
  `addAddress_id` TINYINT NOT NULL AUTO_INCREMENT,
  `Enrd_Student` TINYINT NOT NULL,
  `student_address` TINYINT NOT NULL,
  PRIMARY KEY (`addAddress_id`),
  INDEX `fk_enrdStu_StuAddAdd_idx` (`Enrd_Student` ASC) VISIBLE,
  INDEX `fk_stuAdd_StuAddAdd_idx` (`student_address` ASC) VISIBLE,
  CONSTRAINT `fk_enrdStu_StuAddAdd`
    FOREIGN KEY (`Enrd_Student`)
    REFERENCES `EnrolledStudent` (`enrd_student_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_stuAdd_StuAddAdd`
    FOREIGN KEY (`student_address`)
    REFERENCES `student_address` (`student_address_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `enrollSection`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `enrollSection` ;

CREATE TABLE IF NOT EXISTS `enrollSection` (
  `enroll_section_id` TINYINT NOT NULL AUTO_INCREMENT,
  `class_roster` TINYINT NULL,
  `student_account` TINYINT NOT NULL,
  PRIMARY KEY (`enroll_section_id`),
  INDEX `fk_roster_enroll_idx` (`class_roster` ASC) VISIBLE,
  INDEX `fk_stuAcc_enroll_idx` (`student_account` ASC) VISIBLE,
  CONSTRAINT `fk_roster_enroll`
    FOREIGN KEY (`class_roster`)
    REFERENCES `class_roster` (`class_roster_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_stuAcc_enroll`
    FOREIGN KEY (`student_account`)
    REFERENCES `student_account` (`student_account_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- TRIGGER

DELIMITER $$$

CREATE TRIGGER creatingStuAcc AFTER INSERT ON EnrolledStudent
FOR EACH ROW
BEGIN
		DECLARE newStu TINYINT;
        SET newStu = new.enrd_student_id;
		INSERT INTO student_account (created, activate, erd_student, permission_level) VALUES (now(), 1, newStu, 3);
END$$$

DELIMITER ;



DELIMITER $$$

CREATE TRIGGER updatingGPA AFTER INSERT ON courses_taken
FOR EACH ROW
BEGIN
        DECLARE newGrade DECIMAL(2,1);
        DECLARE denominator DOUBLE;
        DECLARE recordExist INT;
        
        SET newGrade = (SELECT AVG(grades) FROM courses_taken);
        SET denominator = (SELECT COUNT(*) FROM courses_taken);
        
        IF (denominator > 0) THEN 
            UPDATE academics SET gpa = newGrade WHERE student_academic_id = NEW.academic;

		ELSE
			INSERT INTO academics (gpa) VALUES (newGrade);
        END IF;
END$$$

-- PROCEDURE (CALL IS IN inserts.sql FILE
CREATE PROCEDURE findName (IN studentRecordID TINYINT, OUT studentName VARCHAR(50) )
BEGIN
    DECLARE stuAccID TINYINT;
    DECLARE erdStuID TINYINT;
    DECLARE stuID TINYINT;
    
    SET stuAccID = (SELECT student_account FROM student_records WHERE student_records_id = studentRecordID);
    SET erdStuID= (SELECT student FROM EnrolledStudent WHERE enrd_student_id = stuAccID);
    SET studentName = (SELECT fullname FROM student WHERE student_id = erdStuID);
    
END$$$


CREATE FUNCTION balanceOut (stuFinanceId TINYINT)
RETURNS TINYINT
DETERMINISTIC
BEGIN
	DECLARE pendingPayment INT;
    DECLARE pendingAid INT;
    DECLARE pendingAidID TINYINT;
    DECLARE newBalance INT;
    
    SET pendingAidID = (SELECT pending_aid FROM finance WHERE student_finance_id = stuFinanceId);
    SET pendingAid = (SELECT balance FROM financial_aid WHERE student_financial_aid_id = pendingAidID);
   
    SET newBalance = (SELECT balance FROM financial_aid WHERE student_financial_aid_id = pendingAidID);
    
    IF(pendingAid != NULL) THEN
		SET pendingPayment = (SELECT payment FROM finance WHERE student_finance_id = stuFinanceId);
	ELSE
		SET pendingPayment = (SELECT payment FROM finance WHERE student_finance_id = stuFinanceId) + pendingAid;
    END IF;
     
	SET newBalance = pendingPayment-(SELECT charge FROM finance WHERE student_finance_id = stuFinanceId) ;
		
    RETURN newBalance;
END $$$

DELIMITER ;


