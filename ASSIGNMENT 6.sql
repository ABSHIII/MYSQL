use destination;

# Inner Join:to print that have matching Country_Id in both tables.
SELECT Persons.Fname, Persons.Lname, Persons.Country_Id, Country.Country_name
FROM Persons
INNER JOIN Country
ON Persons.Country_Id = Country.Id;

# Left Join: to print all rows from the Persons table and  matching rows from Country table.
SELECT Persons.Fname, Persons.Lname, Persons.Country_Id, Country.Country_name
FROM Persons
LEFT JOIN Country
ON Persons.Country_Id = Country.Id;

# Right Join: to print rows from the Country table and matching rows from Persons table.
SELECT Persons.Fname, Persons.Lname, Persons.Country_Id, Country.Country_name
FROM Persons
RIGHT JOIN Country
ON Persons.Country_Id = Country.Id;

#List all distinct country names from both the Country and Persons tables
SELECT DISTINCT Country_name
FROM Country
UNION
SELECT DISTINCT Country_name
FROM Persons;

# List all country names from both the Country and Persons tables, including duplicates.
SELECT Country_name
FROM Country
UNION ALL
SELECT Country_name
FROM Persons;

#Round the ratings of all persons to the nearest integer in the Persons table
SELECT Id, Fname, Lname, Population, ROUND(Rating, 0) AS Rounded_Rating, Country_Id, Country_name
FROM Persons;