CREATE DATABASE DESTINATION;

USE DESTINATION;

# Creating  Country table
CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(50),
    Population INT,
    Area INT
);

# Creating  Persons table
CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population INT,
    Rating DECIMAL(2, 1),
    Country_Id INT,
    Country_name VARCHAR(50)
);

# Inserting
INSERT INTO Country (Id, Country_name, Population, Area)
VALUES 
(1, 'USA', 331002000, 9834000),
(2, 'India', 1393409038, 3287000),
(3, 'Canada', 37742000, 9985000),
(4, 'UK', 67886000, 243610),
(5, 'Australia', 25687000, 7692000),
(6, 'Germany', 83783942, 357022),
(7, 'France', 65273511, 551695),
(8, 'Japan', 125800000, 377975),
(9, 'Italy', 60461826, 301340),
(10, 'China', 1444216107, 9597000);

# Inserting 
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name)
VALUES 
(1, 'John', 'AA', 500000, 4.5, 1, 'USA'),
(2, 'Boby', 'BB', 200000, 3.9, 2, 'India'),
(3, 'Charly', 'CC', 1000000, 4.2, 3, 'Canada'),
(4, 'Chris', 'DD', 750000, 3.8, 4, 'UK'),
(5, 'Simon', 'EE', 900000, 4.7, 5, 'Australia'),
(6, 'Pete', 'FF', 600000, 4.1, 6, 'Germany'),
(7, 'Logan', 'GG', 300000, 3.5, 7, 'France'),
(8, 'JJ', 'HH', 400000, 4.6, 8, 'Japan'),
(9, 'Ethan', 'II', 250000, 3.3, 9, 'Italy'),
(10, 'Jude', 'JJ', 800000, 4.8, 10, 'China');



# List the distinct country names from the Persons table
SELECT DISTINCT Country_name
FROM Persons;

# Select first names and last names from the Persons table with aliases
SELECT Fname AS First_Name, Lname AS Last_Name
FROM Persons;

# Find all persons with a rating greater than 4.0
SELECT *
FROM Persons
WHERE Rating > 4.0;

#Find countries with a population greater than 10 lakhs
SELECT *
FROM Country
WHERE Population > 1000000;

# Find persons who are from 'USA' or have a rating greater than 4.5
SELECT *
FROM Persons
WHERE Country_name = 'USA' OR Rating > 4.5;

# Find all persons where the country name is NULL
SELECT *
FROM Persons
WHERE Country_name IS NULL;

#Find all persons from the countries 'USA', 'Canada', and 'UK'
SELECT *
FROM Persons
WHERE Country_name IN ('USA', 'Canada', 'UK');

# Find all persons not from the countries 'India' and 'Australia'
SELECT *
FROM Persons
WHERE Country_name NOT IN ('India', 'Australia');

# Find all countries with a population between 5 lakhs and 20 lakhs
SELECT *
FROM Country
WHERE Population BETWEEN 500000 AND 2000000;

# Find all countries whose names do not start with 'C'
SELECT *
FROM Country
WHERE Country_name NOT LIKE 'C%';
