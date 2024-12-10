#creating database and using 
create database SCHOOL;

use school;
#Creating the STUDENT table
CREATE TABLE STUDENT (
    Roll_No INT PRIMARY KEY,
    Name VARCHAR(50),
    Marks INT,
    Grade CHAR(1)
);

#inserting values 
INSERT INTO STUDENT (Roll_No, Name, Marks, Grade) VALUES
(1, 'JOHN', 85, 'A'),
(2, 'BOBY', 78, 'B'),
(3, 'CHARLY', 92, 'A'),
(4, 'CHRIS', 67, 'C'),
(5, 'SIMON', 80, 'A');

select * from Student ;

	#1.Add a new column named Contact
    ALTER TABLE STUDENT ADD Contact VARCHAR(15);
    
    #2. Remove the Grade column
    ALTER TABLE STUDENT DROP COLUMN Grade;
    
    #3.Rename the table to CLASSTEN
    ALTER TABLE STUDENT RENAME TO CLASSTEN;
    
    #4.Delete all the rows 
    TRUNCATE TABLE CLASSTEN;
    
    Select * from CLASSTEN;
    
    #5. Drop the table
	DROP TABLE CLASSTEN;
    
    show tables;
    
    
    