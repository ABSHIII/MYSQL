USE PRODUCT;
CREATE TABLE Worker (
    Worker_Id INT PRIMARY KEY,
    FirstName CHAR(25),
    LastName CHAR(25),
    Salary INT(15),
    JoiningDate DATETIME,
    Department CHAR(25)
);

SHOW TABLES;

DELIMITER $$

CREATE PROCEDURE AddWorker(
    IN p_Worker_Id INT,
    IN p_FirstName CHAR(25),
    IN p_LastName CHAR(25),
    IN p_Salary INT,
    IN p_JoiningDate DATETIME,
    IN p_Department CHAR(25)
)
BEGIN
    INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
    VALUES (p_Worker_Id, p_FirstName, p_LastName, p_Salary, p_JoiningDate, p_Department);
END$$

DELIMITER ;

# Call the procedure
CALL AddWorker(1, 'John', 'Doe', 50000, '2022-01-01 10:00:00', 'Finance');

DELIMITER $$

CREATE PROCEDURE GetSalary(
    IN p_Worker_Id INT,
    OUT p_Salary INT
)
BEGIN
    SELECT Salary INTO p_Salary
    FROM Worker
    WHERE Worker_Id = p_Worker_Id;
END$$

DELIMITER ;

# Call the procedure
CALL GetSalary(1, @Salary);
SELECT @Salary AS Salary;

DELIMITER $$

CREATE PROCEDURE UpdateDepartment(
    IN p_Worker_Id INT,
    IN p_Department CHAR(25)
)
BEGIN
    UPDATE Worker
    SET Department = p_Department
    WHERE Worker_Id = p_Worker_Id;
END$$

DELIMITER ;

# Call the procedure
CALL UpdateDepartment(1, 'HR');


DELIMITER $$

CREATE PROCEDURE WorkerCountByDepartment(
    IN p_Department CHAR(25),
    OUT p_workerCount INT
)
BEGIN
    SELECT COUNT(*) INTO p_workerCount
    FROM Worker
    WHERE Department = p_Department;
END$$

DELIMITER ;

# Call the procedure
CALL WorkerCountByDepartment('Finance', @WorkerCount);
SELECT @WorkerCount AS WorkerCount;

DELIMITER $$

CREATE PROCEDURE AvgSalaryByDepartment(
    IN p_Department CHAR(25),
    OUT p_avgSalary DECIMAL(10, 2)
)
BEGIN
    SELECT AVG(Salary) INTO p_avgSalary
    FROM Worker
    WHERE Department = p_Department;
END$$

DELIMITER ;

#Call the procedure
CALL AvgSalaryByDepartment('Finance', @AvgSalary);
SELECT @AvgSalary AS AvgSalary;

