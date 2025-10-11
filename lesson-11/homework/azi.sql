CREATE TABLE Customers (
    CustomerID INT,
    CustomerName VARCHAR(50),
    City VARCHAR(50)
);

CREATE TABLE Orders (
    OrderID INT,
    CustomerID INT,
    OrderAmount DECIMAL(10,2),
    PaymentType VARCHAR(20)
);

INSERT INTO Customers VALUES
(1, 'Alice', 'New York'),
(2, 'Bob', 'London'),
(3, 'Charlie', 'Paris'),
(4, 'David', 'New York'),
(5, 'Eva', 'Berlin');

INSERT INTO Orders VALUES
(101, 1, 250, 'Card'),
(102, 2, 100, 'Cash'),
(103, 3, 400, 'Card'),
(104, 4, 50,  'Cash'),
(105, 5, 300, 'Card'),
(106, 1, 150, 'Cash');

SELECT * from Customers
SELECT * from Orders

SELECT
c.CostumerName,
c.City
o.OrderAmount,
o.PaymentType
FROM Costumers c 
inner JOIN Orders o
ON c.CostumerID = o.CostumerID
WHERE c.City = 'New York'
AND (
(O.PaymentType = 'Card' AND o.OrderAmount > 200)
OR
(o.PaymentType = 'Cash' AND o.OrderAmount < 100)
);

SELECT 
    c.CustomerName,
    c.City,
    o.OrderAmount,
    o.PaymentType
FROM Customers c
INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID
WHERE o.PaymentType = 'Card'
  AND c.City <> 'London';

DROP TABLE Products;
DROP TABLE Orders;


  CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    ProductID INT,
    OrderDate DATE,
    Quantity INT
);

INSERT INTO Products VALUES
(1, 'Laptop'),
(2, 'Phone'),
(3, 'Tablet');

INSERT INTO Orders VALUES
(101, 1, '2024-01-05', 5),
(102, 1, '2024-02-10', 3),
(103, 1, '2024-03-15', 2),
(104, 2, '2024-01-20', 10),
(105, 2, '2024-02-25', 7),
(106, 3, '2024-03-05', 4);

SELECT * FROM Products
SELECT * FROM Orders

CREATE TABLE Employees (
    EmpID INT,
    EmpName VARCHAR(50),
    Department VARCHAR(50)
);

CREATE TABLE Projects (
    ProjectID INT,
    EmpID INT,
    ProjectName VARCHAR(50),
    StartDate DATE,
    Budget DECIMAL(10,2)
);

INSERT INTO Employees VALUES
(1, 'Alice', 'IT'),
(2, 'Bob', 'Finance'),
(3, 'Charlie', 'IT'),
(4, 'David', 'HR'),
(5, 'Eva', 'Marketing');

INSERT INTO Projects VALUES
(101, 1, 'Website Upgrade', '2024-04-10', 15000),
(102, 1, 'Data Migration', '2024-07-20', 12000),
(103, 2, 'Audit System', '2024-06-01', 8000),
(104, 3, 'Security Review', '2024-02-15', 10000),
(105, 3, 'AI Automation', '2024-09-10', 25000);

SELECT * FROM Employees
SELECT * FROM Projects

SELECT 
    e.EmpName,
    e.Department,
    p.ProjectName,
    p.StartDate,
    p.Budget
FROM Employees e
INNER JOIN Projects p
    ON e.EmpID = p.EmpID
WHERE p.StartDate = (
    SELECT MAX(p2.StartDate)
    FROM Projects p2
    WHERE p2.EmpID = e.EmpID
);

SELECT 
    e.EmpName,
    e.Department,
    p.ProjectName,
    p.StartDate,
    p.Budget
FROM Employees e
CROSS APPLY (
    SELECT TOP 1 
        pr.ProjectName,
        pr.StartDate,
        pr.Budget
    FROM Projects pr
    WHERE pr.EmpID = e.EmpID
    ORDER BY pr.StartDate DESC
) p;

SELECT 
    e.EmpName,
    e.Department,
    p.ProjectName,
    p.StartDate,
    p.Budget
FROM Employees e
OUTER APPLY (
    SELECT TOP 1 
        pr.ProjectName,
        pr.StartDate,
        pr.Budget
    FROM Projects pr
    WHERE pr.EmpID = e.EmpID
    ORDER BY pr.StartDate DESC
) p;
