1. create table Employees (
 EmpID INT,
 Name varchar (50),
 Salary varchar (10,2)
);
2. INSERT INTO Employees (EmpID, Name, Salary)
VALUES (1, 'Ali Isakulov', 3500.00);
INSERT INTO Employees (EmpID, Name, Salary)
VALUES (2, 'Sunatilla Isoqov', 7000.00);
INSERT INTO Employees (EmpID, Name, Salary)
VALUES 
(3, 'Zarina Ziyayeva', 5500.00),
(4, 'Yusuf Samadov', 8700.00);
3. UPDATE Employees
SET Salary = 7000.00
WHERE EmpID = 1;
4.DELETE FROM Employees
WHERE EmpID = 2;
5. In SQL, the DROP command removes a table from the database, DELETE removes records from a table, and TRUNCATE removes all rows from a table.
The delete statement is an SQL command used to remove one or more rows from a table based on a specific condition. It is a DML (data manipulation command). This command allows us to remove unwanted or obsolete data from a database and can be used to delete single rows.
Unwanted or obsolete data refers to data that is no longer needed or useful but they do take up space in the Database for example incorrect, duplicated, or outdated data.
The DROP statement in SQL allows us to remove an entire table, along with all its data, indexes and triggers from the database. Once executed, the table and its data are permanently deleted.
A trigger is a special type of program that is stored in the database’s memory and has a unique name. This program automatically runs when something happens in a database, like when an existing row is changed or when a new row is added.
This statement allows us to remove all the data from the table by maintaining the table structure. The Truncate statement can be rolled back using the ROLLBACK statement. It is much faster than the DELETE statement. But it cannot remove specific rows based on a condition.
6. ALTER TABLE Employees
ALTER COLUMN Name VARCHAR(100);
ALTER TABLE Employees
MODIFY COLUMN Name VARCHAR(100);
7.ALTER TABLE Employees
ADD Department VARCHAR(50);
8. ALTER TABLE Employees
ALTER COLUMN Salary FLOAT;
9. CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);
10. TRUNCATE TABLE Employees;
11. INSERT INTO Departments (DepartmentID, DepartmentName, Location)
SELECT 1, 'ERP', 'CANADA' UNION ALL
SELECT 2, 'MARKETING', 'INDIA' UNION ALL
SELECT 3, 'SALES', 'USA' UNION ALL
SELECT 4, 'IT', 'RUSSIA';
12. UPDATE Employees
SET Department = 'Management'
WHERE Salary > 5000;
13. TRUNCATE TABLE Employees;
14. ALTER TABLE Employees
DROP COLUMN Department;
15. ALTER TABLE Employees RENAME TO StaffMembers;
16. DROP TABLE Departments;
17. CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    StockQuantity INT
);
18. ALTER TABLE EMPLOYEES
ADD CONSTRAINT chk_Price_Positive CHECK (Price > 0);
19. ALTER TABLE EMPLOYEES
ADD StockQuantity INT DEFAULT 50;
20. ALTER TABLE Products
CHANGE Category ProductCategory VARCHAR(50);

21. INSERT INTO Products (ProductID, ProductName, Price, StockQuantity)
VALUES (101, 'Laptop', 1200.00, 50);

INSERT INTO Products (ProductID, ProductName, Price, StockQuantity)
VALUES (102, 'Mouse', 25.50, 200);

INSERT INTO Products (ProductID, ProductName, Price, StockQuantity)
VALUES (103, 'Keyboard', 75.00, 150);

INSERT INTO Products (ProductID, ProductName, Price, StockQuantity)
VALUES (104, 'Monitor', 300.00, 75);

INSERT INTO Products (ProductID, ProductName, Price, StockQuantity)
VALUES (105, 'Webcam', 49.99, 100);
22. SELECT *
INTO Products_Backup
FROM Products;

23. RENAME TABLE Products TO Inventory;
24. ALTER TABLE Inventory
ALTER COLUMN Price FLOAT;
25. ALTER TABLE Inventory
ADD ProductCode INT IDENTITY(1000, 5);
