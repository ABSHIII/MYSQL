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
(1, 'John', 'AA', 'john.aa@example.com', '1234567890', '123 Elm St', 'Los Angeles', 'California', '10001', 'US'),  
(2, 'BOBY', 'BB', 'boby.bb@example.com', '2345678901', '456 Oak St', 'San Francisco', 'California', '94101', 'US'),  
(3, 'CHARLY', 'CC', 'charly.cc@example.com', '3456789012', '789 Pine St', 'San Francisco', 'Texas', '73301', 'US'),  
(4, 'CHRIS', 'DD', 'chris.dd@example.com', '4567890123', '101 Maple St', 'Houston', 'Texas', '77001', 'US'),  
(5, 'SIMON', 'EE', 'simon.ee@example.com', '5678901234', '202 Birch St', 'New York', 'New York', '10001', 'US'),  
(6, 'PETE', 'FF', 'pete.ff@example.com', '6789012345', '303 Cedar St', 'Miami', 'Florida', '33101', 'US'),  
(7, 'LOGAN', 'GG', 'logan.gg@example.com', '7890123456', '404 Walnut St', 'San Francisco', 'Illinois', '60601', 'US'),  
(8, 'JJ', 'HH', 'jj.hh@example.com', '8901234567', '505 Cherry St', 'Boston', 'San Francisco', '02101', 'US'),  
(9, 'ETHAN', 'II', 'ethan.ii@example.com', '9012345678', '606 Palm St', 'Seattle', 'New York', '98101', 'US'),  
(10, 'JUDE', 'JJ', 'jude.jj@example.com', '1230987654', '707 Spruce St', 'Denver', 'New York', '80201', 'US');

# Create a view for full name and email
CREATE VIEW customer_info AS  
SELECT CONCAT(First_name, ' ', Last_name) AS Full_Name, Email  
FROM Customer;


SELECT * FROM customer_info;

# Create a view for customers located in the US
CREATE VIEW US_Customers AS  
SELECT *  
FROM Customer  
WHERE Country = 'US';

# Create a view with full name, email, phone number, and state
CREATE VIEW Customer_details AS  
SELECT CONCAT(First_name, ' ', Last_name) AS Full_Name,  
       Email, Phone_no, State  
FROM Customer;

# Count the number of customers per state and filter those with more than 5
SELECT State, COUNT(*) AS Number_of_Customers  
FROM Customer  
GROUP BY State  
HAVING COUNT(*) > 5;

# Count customers per state from the Customer_details view
SELECT State, COUNT(*) AS Number_of_Customers  
FROM Customer_details  
GROUP BY State;


SELECT *  
FROM Customer_details  
ORDER BY State ASC;





