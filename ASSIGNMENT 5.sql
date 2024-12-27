
USE DESTINATION;

# Inserting  into the Persons table
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name)
VALUES 

(11, 'Mia', NULL, 40000, 4.6, 8, 'Japan'),
(12, 'Etherion', NULL, 25000, 4.4, 9, 'Italy');

Select * from persons;


#1 to print the first three characters of Country_name from the Country table.
SELECT LEFT(Country_name, 3) AS First_Three_Characters
FROM Country;

#2 concatenate first name and last name from Persons table.
SELECT CONCAT(Fname, ' ', COALESCE(Lname, '')) AS Full_Name
FROM Persons;

#3 query to count the number of unique country names from Persons table.
SELECT COUNT(DISTINCT Country_name) AS Unique_Countries
FROM Persons;

#4 to print the maximum population from the Country table.
SELECT MAX(Population) AS Max_Population
FROM Country;

#5 to print the minimum population from Persons table
SELECT MIN(Population) AS Min_Population
FROM Persons;

#6 inserting into the Persons table making the Lname NULL
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name)
VALUES (13, 'Lucas', NULL, 45000, 4.1, 3, 'Canada'),
       (14, 'Ella', NULL, 35000, 4.2, 7, 'France');

# Count rows where `Lname` is NULL:
SELECT COUNT(*) AS Null_Lname_Count
FROM Persons
WHERE Lname IS NULL;

#7  the Persons table making the Lname NULL
SELECT COUNT(*) AS Total_Rows
FROM Persons;

#8 to show the population of the Country table for the first 3 rows
SELECT Population
FROM Country
LIMIT 3;

#9 to print 3 random rows of countries
SELECT *
FROM Country
ORDER BY RAND()
LIMIT 3;

#10 List all persons ordered by their rating in descending order
SELECT *
FROM Persons
ORDER BY Rating DESC;

#11  total population for each country in the Persons table.
SELECT Country_name, SUM(Population) AS Total_Population
FROM Persons
GROUP BY Country_name;

#12 to Find countries in the Persons table with a total population greater than 50,000
SELECT Country_name
FROM Persons
GROUP BY Country_name
HAVING SUM(Population) > 50000;

#13 the total number of persons and average rating for each country
SELECT Country_name, COUNT(*) AS Total_Persons, AVG(Rating) AS Average_Rating
FROM Persons
GROUP BY Country_name
HAVING COUNT(*) > 2
ORDER BY Average_Rating ASC;

