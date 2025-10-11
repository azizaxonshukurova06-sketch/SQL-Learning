Aggregate Functions & HAVING

1 MIN va MAX

MIN() – eng kichik qiymatni qaytaradi.

MAX() – eng katta qiymatni qaytaradi.

Sonlarda eng katta/eng kichik qiymatni, matnda esa alifbo tartibidagi eng birinchi va oxirgi qiymatni beradi.


Real hayotda foydasi:

Eng katta va eng kichik narxni topish (masalan, bozorda eng qimmat mahsulotni aniqlash).

Eng qadimgi va eng so‘nggi sana (recordlarni) topish.

drop table Products

CREATE TABLE Products (
    ProductID INT,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2)
);

INSERT INTO Products VALUES 
(1, 'Laptop', 800),
(2, 'Phone', 500),
(3, 'Tablet', 300),
(4, 'Camera', 450);

select * from Products

select max(price) as maxprice, min(price) as minprice from Products

SELECT MIN(ProductName) AS FirstProduct, MAX(ProductName) AS LastProduct FROM Products;
select * from Products

2 COUNT

Teoriya:

COUNT(*) → barcha qatorlarni sanaydi (NULL bo‘lsa ham).

COUNT(column) → faqat NULL bo‘lmagan qiymatlarni sanaydi.

COUNT(DISTINCT column) → faqat unikal qiymatlarni sanaydi.
 
 drop table Employees


CREATE TABLE Employees (
    EmpID INT,
    Name VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

INSERT INTO Employees VALUES
(1, 'John', 'HR', 50000),
(2, 'Mary', 'IT', 70000),
(3, 'Steve', 'IT', NULL),
(4, 'Sara', 'Finance', 60000),
(5, 'Mike', 'HR', 55000);

select * from Employees

SELECT COUNT(*) AS TotalEmployees FROM Employees;


SELECT COUNT(Department) AS EmployeesWithSalary FROM Employees;

SELECT COUNT(DISTINCT Department) AS UniqueDepartments FROM Employees;

SELECT COUNT(*) AS IT_Employees FROM Employees WHERE Department = 'IT';
select * from Employees

Real hayotda foydasi:

Xodimlar soni, buyurtmalar soni, mijozlar sonini hisoblash.

Bir xil qiymatlarni sanash.


                           AVG (Average)

Teoriya:

AVG() – o‘rtacha qiymatni hisoblaydi.

DISTINCT bilan faqat noyob qiymatlarni oladi.

NULL qiymatlar hisobga olinmaydi.


select * from Employees

SELECT AVG(Salary) AS AvgSalary FROM Employees;

SELECT AVG(DISTINCT Salary) AS AvgUniqueSalary FROM Employees;

Real hayotda foydasi:

O‘rtacha maoshni topish.

O‘rtacha xarajat yoki o‘rtacha sotuv summasini topish.

                               4SUM
Teoriya:

SUM() – umumiy yig‘indini hisoblaydi.

Ko‘pincha GROUP BY bilan ishlatiladi.

Real hayotda foydasi:

Jami savdoni hisoblash.

Oy bo‘yicha sotuvlarni chiqarish.

Mahsulot bo‘yicha umumiy tushumni hisoblash.

drop table Sales
CREATE TABLE Sales (
    SaleID INT,
    ProductName VARCHAR(50),
    Quantity INT,
    Price DECIMAL(10,2)
);

INSERT INTO Sales VALUES
(1, 'Laptop', 2, 800),
(2, 'Phone', 3, 500),
(3, 'Laptop', 1, 800),
(4, 'Tablet', 5, 300),
(5, 'Phone', 2, 500);
select * from Sales

SELECT SUM(Quantity * Price) AS TotalRevenue FROM Sales;

SELECT ProductName, SUM(Quantity * Price) AS TotalRevenue
FROM Sales
GROUP BY ProductName;
select * from Sales

                             GROUP BY
Teoriya:

GROUP BY → ma’lumotlarni guruhlash uchun ishlatiladi.

Har bir guruh uchun aggregate function ishlatadi.

select * from Employees

SELECT Department, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Department;


SELECT ProductName, SUM(Quantity * Price) AS TotalRevenue
FROM Sales
GROUP BY ProductName;

                                   6  HAVING

Teoriya:

HAVING – GROUP BY natijalarini filtrlash uchun ishlatiladi.

WHERE qatorlarga, HAVING esa guruhlarga qo‘llanadi.


select * from Employees

SELECT Department, COUNT(*) AS EmployeeCount
FROM Employees

GROUP BY Department

HAVING COUNT(*) > 1;

select * from Sales

SELECT ProductName, SUM(Quantity * Price) AS TotalRevenue
FROM Sales
GROUP BY ProductName
HAVING SUM(Quantity * Price) > 1000;
