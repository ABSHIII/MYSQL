#creating database and using 
CREATE DATABASE Sales;

USE Sales;

#Creating the ORDERS table
CREATE TABLE Orders (
    Order_Id INT PRIMARY KEY,               
    Customer_name VARCHAR(50) NOT NULL,     
    Product_Category VARCHAR(50),
    Ordered_item VARCHAR(50) NOT NULL,      
    Contact_No VARCHAR(15) UNIQUE          
);

# adding  new column named "order_quantity" 
ALTER TABLE Orders ADD order_quantity INT;

# Renaming the Orders table to sales_orders
ALTER TABLE Orders RENAME TO sales_orders;

# Inserting values
INSERT INTO sales_orders (Order_Id, Customer_name, Product_Category, Ordered_item, Contact_No, order_quantity)
VALUES 
(1, 'JOHN', 'Electronics', 'Laptop', '1234567890', 2),
(2, 'BOBY', 'Furniture', 'Chair', '1234567891', 4),
(3, 'CHARLY', 'Electronics', 'Mobile Phone', '1234567892', 1),
(4, 'CHRIS', 'Clothing', 'T-Shirt', '1234567893', 3),
(5, 'SIMON', 'Groceries', 'Apples', '1234567894', 5),
(6, 'PETE', 'Groceries', 'Milk', '1234567895', 2),
(7, 'LOGAN', 'Clothing', 'Jeans', '1234567896', 1),
(8, 'JJ', 'Electronics', 'Headphones', '1234567897', 1),
(9, 'OLATUNJ', 'Furniture', 'Table', '1234567898', 2),
(10, 'JUDE', 'Groceries', 'Eggs', '1234567899', 12);

Select * from sales_orders;

# To get customer name and Ordered item from the  table
SELECT Customer_name, Ordered_item FROM sales_orders;

# Updating the name of the product 
UPDATE sales_orders
SET Ordered_item = 'Gaming Laptop'
WHERE Order_Id = 1;

# Drop the table
DROP TABLE sales_orders;