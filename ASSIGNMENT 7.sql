use destination;


#1 Adding a new column 'DOB' to the Persons table
ALTER TABLE Persons  
ADD DOB DATE;

#2 Creating a user-defined function to calculate the age based on the DOB
DELIMITER //  
CREATE FUNCTION CalculateAge(dob DATE)  
RETURNS INT  
DETERMINISTIC  
BEGIN  
    DECLARE age INT;  
    SET age = YEAR(CURDATE()) - YEAR(dob);  
    IF MONTH(CURDATE()) < MONTH(dob) OR 
       (MONTH(CURDATE()) = MONTH(dob) AND DAY(CURDATE()) < DAY(dob)) THEN  
        SET age = age - 1;  
    END IF;  
    RETURN age;
END //  
DELIMITER ;  

Select * from persons;

#3 Selecting the ID, name, DOB, and calculated age of each person
SELECT Id, Fname, Lname, DOB, CalculateAge(DOB) AS Age  
FROM Persons;

#4 Selecting country ID, name, and its length
SELECT Id, Country_name, LENGTH(Country_name) AS Name_Length  
FROM Country;

#5 Selecting country ID, name, and the first three characters of the name
SELECT Id, Country_name, LEFT(Country_name, 3) AS First_Three_Chars  
FROM Country;

#6 Selecting country ID, original name, uppercase version, and lowercase version
SELECT Id, Country_name,  
       UPPER(Country_name) AS Uppercase_Name,  
       LOWER(Country_name) AS Lowercase_Name  
FROM Country;


