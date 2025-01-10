use destination;

#1 Count the number of persons grouped by country
SELECT Country_Id, Country_name, COUNT(*) AS Number_of_Persons  
FROM Persons  
GROUP BY Country_Id, Country_name;

#2 Count persons in each country and sort in descending order
SELECT Country_Id, Country_name, COUNT(*) AS Number_of_Persons  
FROM Persons  
GROUP BY Country_Id, Country_name  
ORDER BY Number_of_Persons DESC;

#3 Subquery to get the average rating of the USA and find matching countries
SELECT DISTINCT Country_name  
FROM Persons  
WHERE Rating = (SELECT AVG(Rating) FROM Persons WHERE Country_name = 'USA');

#4 Compare each country's population with the average population
SELECT Country_name, Population  
FROM Country  
WHERE Population > (SELECT AVG(Population) FROM Country);


#New Database 
CREATE DATABASE Product;

USE Product;

# Customer table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY AUTO_INCREMENT,  
    First_name VARCHAR(50) NOT NULL,             
    Last_name VARCHAR(50) NOT NULL,             
    Email VARCHAR(100) NOT NULL,               
    Phone_no VARCHAR(15) NOT NULL,               
    Address VARCHAR(255),                        
    City VARCHAR(50),                            
    State VARCHAR(50),                          
    Zip_code VARCHAR(10),                        
    Country VARCHAR(50)                         
);

-- Insert values into the Customer table
INSERT INTO Customer (Customer_Id, First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country)  
VALUES  
(1, 'John', 'AA', 'john.aa@example.com', '1234567890', '123 Elm St', 'Los Angeles', 'California', '90001', 'US'),  
(2, 'BOBY', 'BB', 'boby.bb@example.com', '2345678901', '456 Oak St', 'San Francisco', 'California', '94101', 'US'),  
(3, 'CHARLY', 'CC', 'charly.cc@example.com', '3456789012', '789 Pine St', 'Austin', 'Texas', '73301', 'US'),  
(4, 'CHRIS', 'DD', 'chris.dd@example.com', '4567890123', '101 Maple St', 'Houston', 'Texas', '77001', 'US'),  
(5, 'SIMON', 'EE', 'simon.ee@example.com', '5678901234', '202 Birch St', 'New York', 'New York', '10001', 'US'),  
(6, 'PETE', 'FF', 'pete.ff@example.com', '6789012345', '303 Cedar St', 'Miami', 'Florida', '33101', 'US'),  
(7, 'LOGAN', 'GG', 'logan.gg@example.com', '7890123456', '404 Walnut St', 'Chicago', 'Illinois', '60601', 'US'),  
(8, 'JJ', 'HH', 'jj.hh@example.com', '8901234567', '505 Cherry St', 'Boston', 'Massachusetts', '02101', 'US'),  
(9, 'ETHAN', 'II', 'ethan.ii@example.com', '9012345678', '606 Palm St', 'Seattle', 'Washington', '98101', 'US'),  
(10, 'JUDE', 'JJ', 'jude.jj@example.com', '1230987654', '707 Spruce St', 'Denver', 'Colorado', '80201', 'US');

# Create a view for full name and email
CREATE VIEW customer_info AS  
SELECT CONCAT(First_name, ' ', Last_name) AS Full_Name, Email  
FROM Customer;


SELECT * FROM customer_info;







