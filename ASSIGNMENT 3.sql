USE Sales;

# Creating Managers table
CREATE TABLE Managers (
    Manager_Id INT PRIMARY KEY,                  
    First_name VARCHAR(50) NOT NULL,            
    Last_Name VARCHAR(50) NOT NULL,             
    DOB DATE NOT NULL,                          
    Age INT CHECK (Age > 18 AND Age < 65),      
    Last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    Gender CHAR(1) CHECK (Gender IN ('M', 'F')), 
    Department VARCHAR(50) NOT NULL,            
    Salary DECIMAL(10, 2) NOT NULL             
);

# Inserting
INSERT INTO Managers (Manager_Id, First_name, Last_Name, DOB, Age, Gender, Department, Salary)
VALUES 
(1, 'John', 'AA', '1980-06-15', 44, 'M', 'Finance', 30000),
(2, 'BOBY', 'BB', '1990-11-23', 34, 'F', 'IT', 27000),
(3, 'CHARLY', 'CC', '1985-04-10', 39, 'M', 'HR', 20000),
(4, 'CHRIS', 'DD', '1995-08-14', 29, 'F', 'IT', 40000),
(5, 'SIMON', 'EE', '1983-02-05', 41, 'M', 'Marketing', 25000),
(6, 'PETE', 'FF', '1987-09-30', 37, 'F', 'Finance', 35000),
(7, 'LOGAN', 'GG', '1992-07-01', 32, 'M', 'IT', 30000),
(8, 'JJ', 'HH', '1989-03-19', 35, 'F', 'HR', 22000),
(9, 'ETHAN', 'II', '1998-12-25', 26, 'M', 'IT', 15000),
(10, 'JUDE', 'JJ', '1991-05-17', 33, 'F', 'Marketing', 28000);

# Displaying name and DOB of the manager with Manager_Id = 1
SELECT First_name, Last_Name, DOB
FROM Managers
WHERE Manager_Id = 1;

# Displaying the annual income of all managers
SELECT Manager_Id, First_name, Last_Name, (Salary * 12) AS Annual_Income
FROM Managers;

# Displaying records of all managers except ‘Aaliya’
SELECT *
FROM Managers
WHERE First_name != 'Aaliya';

# Displaying details of managers whose department is IT and earn more than 25000 per month
SELECT *
FROM Managers
WHERE Department = 'IT' AND Salary > 25000;

# Displaying details of managers whose salary is between 10000 and 35000
SELECT *
FROM Managers
WHERE Salary BETWEEN 10000 AND 35000;