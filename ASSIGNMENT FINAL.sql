CREATE DATABASE library;

USE library;

#Creating tables

CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(100),
    Contact_no VARCHAR(15)
);

CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(50),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

CREATE TABLE Books (
    ISBN INT PRIMARY KEY,
    Book_title VARCHAR(100),
    Category VARCHAR(50),
    Rental_Price DECIMAL(10, 2),
    Status VARCHAR(3), -- 'Yes' for available, 'No' for not available
    Author VARCHAR(50),
    Publisher VARCHAR(50)
);

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(50),
    Customer_address VARCHAR(100),
    Reg_date DATE
);

CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(100),
    Issue_date DATE,
    Isbn_book INT,
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(100),
    Return_date DATE,
    Isbn_book2 INT,
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);


#Inserting

INSERT INTO Branch VALUES
(1, 101, 'Downtown, City A', '1234567890'),
(2, 102, 'Uptown, City A', '9876543210'),
(3, 103, 'Eastside, City B', '4561237890'),
(4, 104, 'Westside, City B', '7891234560'),
(5, 105, 'Central, City C', '3216549870');

INSERT INTO Employee VALUES
(201, 'Alice', 'Manager', 60000, 1),
(202, 'Bob', 'Assistant', 45000, 1),
(203, 'Charlie', 'Manager', 70000, 2),
(204, 'Diana', 'Clerk', 40000, 3),
(205, 'Eve', 'Manager', 55000, 4);

INSERT INTO Books VALUES
(1001, 'History of the World', 'History', 30.00, 'Yes', 'Author A', 'Publisher X'),
(1002, 'Advanced Mathematics', 'Education', 25.00, 'Yes', 'Author B', 'Publisher Y'),
(1003, 'Physics Fundamentals', 'Science', 20.00, 'No', 'Author C', 'Publisher Z'),
(1004, 'English Grammar', 'Education', 15.00, 'Yes', 'Author D', 'Publisher X'),
(1005, 'World War II', 'History', 35.00, 'Yes', 'Author E', 'Publisher Y');

INSERT INTO Customer VALUES
(301, 'John Doe', '123 Main St', '2021-12-15'),
(302, 'Jane Smith', '456 Elm St', '2022-05-20'),
(303, 'Mark Johnson', '789 Oak St', '2023-03-10'),
(304, 'Emma Brown', '101 Pine St', '2020-10-05'),
(305, 'Luke Wilson', '202 Birch St', '2023-06-15');

INSERT INTO IssueStatus VALUES
(401, 301, 'History of the World', '2023-06-01', 1001),
(402, 302, 'Advanced Mathematics', '2023-06-05', 1002),
(403, 303, 'Physics Fundamentals', '2023-06-10', 1003),
(404, 305, 'World War II', '2023-06-15', 1005),
(405, 304, 'English Grammar', '2023-06-20', 1004);

INSERT INTO ReturnStatus VALUES
(501, 301, 'History of the World', '2023-06-15', 1001),
(502, 302, 'Advanced Mathematics', '2023-06-20', 1002),
(503, 303, 'Physics Fundamentals', '2023-06-25', 1003),
(504, 305, 'World War II', '2023-07-01', 1005),
(505, 304, 'English Grammar', '2023-07-05', 1004);

Select * from  Branch;
Select * from  Employee;
Select * from  Books;
Select * from  Customer;
Select * from  IssueStatus;
Select * from  ReturnStatus;


#1 Retrieving all available books
SELECT Book_title, Category, Rental_Price
FROM Books
WHERE Status = 'Yes';


#2  List employees and salaries in descending order
SELECT Emp_name, Salary
FROM Employee
ORDER BY Salary DESC;

#3 Retrieving book titles and their customers
SELECT b.Book_title, c.Customer_name
FROM Books b
JOIN IssueStatus i ON b.ISBN = i.Isbn_book
JOIN Customer c ON i.Issued_cust = c.Customer_Id;

#4 Count books by category
SELECT Category, COUNT(*) AS Total_Books
FROM Books
GROUP BY Category;

#5 Employees with salaries above 50,000
SELECT Emp_name, Position
FROM Employee
WHERE Salary > 50000;


#6 Customers registered before 2022 and not issued books
SELECT Customer_name
FROM Customer c
WHERE Reg_date < '2022-01-01'
  AND NOT EXISTS (
      SELECT 1
      FROM IssueStatus i
      WHERE i.Issued_cust = c.Customer_Id
  );

#7 Count employees in each branch
SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no;

#8 Customers who issued books in June 2023
SELECT DISTINCT c.Customer_name
FROM Customer c
JOIN IssueStatus i ON c.Customer_Id = i.Issued_cust
WHERE Issue_date BETWEEN '2023-06-01' AND '2023-06-30';

#9 Books containing 'history' in title
SELECT Book_title
FROM Books
WHERE Book_title LIKE '%history%';

#10 Branches with more than 5 employees
SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no
HAVING COUNT(*) > 5;


#11 Employees managing branches and their branch addresses
SELECT e.Emp_name, b.Branch_address
FROM Employee e
JOIN Branch b ON e.Emp_Id = b.Manager_Id;

#12 Customers who issued books with rental price > 25
SELECT DISTINCT c.Customer_name
FROM Customer c
JOIN IssueStatus i ON c.Customer_Id = i.Issued_cust
JOIN Books b ON i.Isbn_book = b.ISBN
WHERE b.Rental_Price > 25;



