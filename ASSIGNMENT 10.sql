CREATE DATABASE teachers;

USE	teachers;


CREATE TABLE teachers (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    subject VARCHAR(50),
    experience INT,
    salary DECIMAL(10, 2)
);

INSERT INTO teachers (id, name, subject, experience, salary) VALUES
(1, 'Alice', 'Mathematics', 12, 60000),
(2, 'Bob', 'Physics', 8, 55000),
(3, 'Charlie', 'Chemistry', 10, 58000),
(4, 'David', 'Biology', 7, 53000),
(5, 'Eve', 'English', 5, 50000),
(6, 'Frank', 'History', 15, 70000),
(7, 'Grace', 'Geography', 9, 52000),
(8, 'Hank', 'Computer Science', 3, 45000);

#2 Create  BEFORE INSERT trigger to ensure salary cannot be negative
DELIMITER $$

CREATE TRIGGER before_insert_teacher
BEFORE INSERT ON teachers
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END$$

DELIMITER ;

INSERT INTO teachers (id, name, subject, experience, salary)
VALUES (9, 'Ivy', 'Physics', 4, 50000);

SELECT * FROM teachers;

#3 Create the 'teacher_log' table to store logs 
CREATE TABLE teacher_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    teacher_id INT,
    action VARCHAR(50),
    log_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


#4 Create an AFTER INSERT trigger to log
DELIMITER $$

CREATE TRIGGER after_insert_teacher
AFTER INSERT ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action)
    VALUES (NEW.id, 'INSERT');
END$$

DELIMITER ;

#5 Create a before delete trigger to prevent deletion of teachers with more than 10 years of experience
DELIMITER $$

CREATE TRIGGER before_delete_teacher
BEFORE DELETE ON teachers
FOR EACH ROW
BEGIN
    IF OLD.experience > 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete a teacher with experience greater than 10 years';
    END IF;
END$$

DELIMITER ;

#6 Create an AFTER DELETE trigger to log 

DELIMITER $$

CREATE TRIGGER after_delete_teacher
AFTER DELETE ON teachers
FOR EACH ROW
BEGIN
    -- Insert a log entry into the 'teacher_log' table after a row is deleted from 'teachers'
    INSERT INTO teacher_log (teacher_id, action)
    VALUES (OLD.id, 'DELETE'); -- Log the teacher ID and the action 'DELETE'
END$$

DELIMITER ;
#testing 
#before_insert_teacher
INSERT INTO teachers (id, name, subject, experience, salary)
VALUES (10, 'Jade', 'Mathematics', 6, -55000);
#after_insert_teacher
INSERT INTO teachers (id, name, subject, experience, salary)
VALUES (10, 'Jade', 'Mathematics', 6, 45000);

#before_delete_teacher
DELETE FROM teachers WHERE id = 1;

#after_delete_teacher
DELETE FROM teachers WHERE id = 8;

SELECT * FROM teacher_log;