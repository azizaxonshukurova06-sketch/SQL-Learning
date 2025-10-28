1.WITH RECURSIVE Numbers AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1
    FROM Numbers
    WHERE n < 1000
)
SELECT * FROM Numbers;
2. SELECT e.employee_id, e.name, s.total_sales
FROM Employees e
JOIN (
    SELECT employee_id, SUM(amount) AS total_sales
    FROM Sales
    GROUP BY employee_id
) s ON e.employee_id = s.employee_id;
3. WITH AvgSalary AS (
    SELECT AVG(salary) AS avg_salary
    FROM Employees
)
SELECT * FROM AvgSalary;
4. SELECT p.product_id, p.product_name, s.max_sale
FROM Products p
JOIN (
    SELECT product_id, MAX(amount) AS max_sale
    FROM Sales
    GROUP BY product_id
) s ON p.product_id = s.product_id;
5. WITH RECURSIVE Doubles AS (
    SELECT 1 AS num
    UNION ALL
    SELECT num * 2
    FROM Doubles
    WHERE num * 2 < 1000000
)
SELECT * FROM Doubles;
6. WITH SalesCount AS (
    SELECT employee_id, COUNT(*) AS total_sales
    FROM Sales
    GROUP BY employee_id
)
SELECT e.name, s.total_sales
FROM Employees e
JOIN SalesCount s ON e.employee_id = s.employee_id
WHERE s.total_sales > 5;
7. WITH ProductSales AS (
    SELECT product_id, SUM(amount) AS total_sales
    FROM Sales
    GROUP BY product_id
)
SELECT p.product_name, ps.total_sales
FROM Products p
JOIN ProductSales ps ON p.product_id = ps.product_id
WHERE ps.total_sales > 500;
8.
WITH AvgSal AS (
    SELECT AVG(salary) AS avg_salary FROM Employees
)
SELECT e.*
FROM Employees e, AvgSal
WHERE e.salary > AvgSal.avg_salary;
1.
SELECT e.employee_id, e.name, s.order_count
FROM Employees e
JOIN (
    SELECT employee_id, COUNT(*) AS order_count
    FROM Sales
    GROUP BY employee_id
    ORDER BY COUNT(*) DESC
    LIMIT 5
) s ON e.employee_id = s.employee_id;
2.
SELECT p.category_id, SUM(s.amount) AS total_sales
FROM Products p
JOIN (
    SELECT product_id, SUM(amount) AS amount
    FROM Sales
    GROUP BY product_id
) s ON p.product_id = s.product_id
GROUP BY p.category_id;
3.
WITH RECURSIVE FactorialCTE AS (
    SELECT num, num AS fact_value, num AS original
    FROM Numbers1
    WHERE num = 1
    UNION ALL
    SELECT n.num, f.fact_value * n.num, n.original
    FROM FactorialCTE f
    JOIN Numbers1 n ON n.num = f.num + 1
    WHERE n.num <= (SELECT MAX(num) FROM Numbers1)
)
SELECT original AS Number, fact_value AS Factorial
FROM FactorialCTE;
4.
WITH RECURSIVE SplitCTE AS (
    SELECT str, 1 AS pos, SUBSTRING(str, 1, 1) AS ch
    FROM Example
    UNION ALL
    SELECT str, pos + 1, SUBSTRING(str, pos + 1, 1)
    FROM SplitCTE
    WHERE pos + 1 <= LENGTH(str)
)
SELECT str, pos, ch
FROM SplitCTE
WHERE ch <> '';
5.
WITH MonthlySales AS (
    SELECT 
        DATE_FORMAT(sale_date, '%Y-%m') AS month,
        SUM(amount) AS total_sales
    FROM Sales
    GROUP BY DATE_FORMAT(sale_date, '%Y-%m')
)
SELECT 
    m1.month,
    m1.total_sales,
    (m1.total_sales - COALESCE(m2.total_sales, 0)) AS difference
FROM MonthlySales m1
LEFT JOIN MonthlySales m2 
    ON DATE_SUB(CONCAT(m1.month, '-01'), INTERVAL 1 MONTH) = CONCAT(m2.month, '-01');
6.
SELECT e.employee_id, e.name, s.quarter, s.total_sales
FROM Employees e
JOIN (
    SELECT 
        employee_id,
        QUARTER(sale_date) AS quarter,
        SUM(amount) AS total_sales
    FROM Sales
    GROUP BY employee_id, QUARTER(sale_date)
    HAVING SUM(amount) > 45000
) s ON e.employee_id = s.employee_id;
1.
WITH Fibonacci AS (
    SELECT 1 AS n, 0 AS fib
    UNION ALL
    SELECT 2, 1
    UNION ALL
    SELECT n + 1, fib + LAG(fib) OVER (ORDER BY n)
    FROM Fibonacci
    WHERE n < 10
)
SELECT * FROM Fibonacci;
2.
SELECT *
FROM FindSameCharacters
WHERE LEN(Vals) > 1
  AND Vals IS NOT NULL
  AND LEN(REPLACE(Vals, LEFT(Vals, 1), '')) = 0;
3.
DECLARE @n INT = 5;

WITH Sequence AS (
    SELECT 1 AS num, CAST('1' AS VARCHAR(10)) AS pattern
    UNION ALL
    SELECT num + 1, pattern + CAST(num + 1 AS VARCHAR(10))
    FROM Sequence
    WHERE num + 1 <= @n
)
SELECT * FROM Sequence;
4.
SELECT TOP 5 e.EmployeeID, e.FirstName, e.LastName, s.TotalSales
FROM Employees e
JOIN (
    SELECT EmployeeID, SUM(SalesAmount) AS TotalSales
    FROM Sales
    WHERE SaleDate >= DATEADD(MONTH, -6, GETDATE())
    GROUP BY EmployeeID
) s ON e.EmployeeID = s.EmployeeID
ORDER BY s.TotalSales DESC;
5.
SELECT 
    PawanName,
    Pawan_slug_name,
    REPLACE(
        Pawan_slug_name,
        REPLICATE(SUBSTRING(Pawan_slug_name, CHARINDEX('-', Pawan_slug_name) + 1, 1),
                  LEN(SUBSTRING(Pawan_slug_name, CHARINDEX('-', Pawan_slug_name) + 1, LEN(Pawan_slug_name)))),
        SUBSTRING(Pawan_slug_name, CHARINDEX('-', Pawan_slug_name) + 1, 1)
    ) AS Cleaned_Value
FROM RemoveDuplicateIntsFromNames;
