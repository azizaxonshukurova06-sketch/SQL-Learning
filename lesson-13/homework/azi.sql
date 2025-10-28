1. select concat(emp_id, '-', first_name, ' ', last_name) as Employee_Info
from employees;
2. update employees
set phone_number = replace(phone_number, '124', '999');
3. select
    first_name as "First Name",
    length(first_name) as "Name Length"
from employees
where first_name like 'A%' 
   or first_name like 'J%' 
   or first_name like 'M%'
order by first_name;
4. select 
    manager_id,
    sum(salary) as Total_Salary
from employees
group by manager_id;
5. select
    year,
    greatest(Max1, Max2, Max3) as Highest_Value
from TestMax;
6. select * from cinema
where (id % 2) = 1 and description <> 'boring';
7. select * from SingleOrder
order by (id = 0), id;
8. select coalesce (col1, col2, col3, col4) as First_NonNull
from person;


1.-- Assuming FullName is in the format 'First Middle Last'
ALTER TABLE Students ADD COLUMN Firstname VARCHAR(50);
ALTER TABLE Students ADD COLUMN Middlename VARCHAR(50);
ALTER TABLE Students ADD COLUMN Lastname VARCHAR(50);

UPDATE Students
SET
    Firstname = TRIM(SUBSTRING_INDEX(FullName, ' ', 1)),
    Lastname = TRIM(SUBSTRING_INDEX(FullName, ' ', -1)),
    Middlename = TRIM(
        SUBSTRING_INDEX(SUBSTRING_INDEX(FullName, ' ', 2), ' ', -1)
    )
WHERE FullName IS NOT NULL;
2. SELECT o.*
FROM Orders o
JOIN (
    SELECT DISTINCT CustomerID
    FROM Orders
    WHERE State = 'California'
) c ON o.CustomerID = c.CustomerID
WHERE o.State = 'Texas';
3. 
-- Example: concatenating a column 'ValueColumn' for each group
SELECT GroupColumn, GROUP_CONCAT(ValueColumn SEPARATOR ', ') AS ConcatenatedValues
FROM DMLTable
GROUP BY GroupColumn;
4. SELECT *
FROM Employees
WHERE
    LENGTH(CONCAT(FirstName, LastName))
    - LENGTH(REPLACE(CONCAT(FirstName, LastName), 'a', '')) >= 3;
5.SELECT 
    DepartmentID,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN DATEDIFF(CURDATE(), HireDate) > 365*3 THEN 1 ELSE 0 END) AS EmployeesOver3Years,
    ROUND(
        SUM(CASE WHEN DATEDIFF(CURDATE(), HireDate) > 365*3 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS PercentageOver3Years
FROM Employees
GROUP BY DepartmentID;
1.SELECT 
    StudentID,
    StudentName,
    SUM(Value) OVER (ORDER BY StudentID) AS CumulativeSum
FROM Students;
2.SELECT 
    BirthDate,
    STRING_AGG(StudentName, ', ') AS StudentsWithSameBirthday
FROM Students
GROUP BY BirthDate
HAVING COUNT(*) > 1;
3.SELECT 
    CASE WHEN PlayerA < PlayerB THEN PlayerA ELSE PlayerB END AS Player1,
    CASE WHEN PlayerA < PlayerB THEN PlayerB ELSE PlayerA END AS Player2,
    SUM(Score) AS TotalScore
FROM PlayerScores
GROUP BY 
    CASE WHEN PlayerA < PlayerB THEN PlayerA ELSE PlayerB END,
    CASE WHEN PlayerA < PlayerB THEN PlayerB ELSE PlayerA END;
4. WITH SplitChars AS (
    SELECT value AS ch
    FROM STRING_SPLIT('tf56sd#%OqH', '')
)
SELECT
    STRING_AGG(CASE WHEN ch LIKE '[A-Z]' THEN ch ELSE '' END, '') AS UppercaseLetters,
    STRING_AGG(CASE WHEN ch LIKE '[a-z]' THEN ch ELSE '' END, '') AS LowercaseLetters,
    STRING_AGG(CASE WHEN ch LIKE '[0-9]' THEN ch ELSE '' END, '') AS Numbers,
    STRING_AGG(CASE WHEN ch NOT LIKE '[A-Za-z0-9]' THEN ch ELSE '' END, '') AS SpecialChars
FROM SplitChars;
