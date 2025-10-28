1. select
    SUBSTRING_INDEX(Name, ',', 1) as Name,
    TRIM(SUBSTRING_INDEX(Name, ',', -1)) as Surname
from TestMultipleColumns;
2. SELECT *
FROM TestPercent
WHERE TextColumn LIKE '%\%%' ESCAPE '\';
3. SELECT 
    SUBSTRING_INDEX(Value, '.', 1) AS Part1,
    SUBSTRING_INDEX(SUBSTRING_INDEX(Value, '.', 2), '.', -1) AS Part2,
    SUBSTRING_INDEX(Value, '.', -1) AS Part3
FROM Splitter;
4. SELECT *
FROM testDots
WHERE (LENGTH(Vals) - LENGTH(REPLACE(Vals, '.', ''))) > 2;
5. SELECT 
    Value,
    (LENGTH(Value) - LENGTH(REPLACE(Value, ' ', ''))) AS SpaceCount
FROM CountSpaces;

6. SELECT 
    e.employee_id,
    e.first_name,
    e.last_name,
    e.salary AS Employee_Salary,
    m.employee_id AS Manager_ID,
    m.salary AS Manager_Salary
FROM Employee e
JOIN Employee m 
    ON e.manager_id = m.employee_id
WHERE e.salary > m.salary;
7. SELECT 
    employee_id,
    first_name,
    last_name,
    hire_date,
    TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) AS Years_of_Service
FROM Employees
WHERE TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) BETWEEN 10 AND 15;
1. SELECT w1.id
FROM Weather w1
JOIN Weather w2 
    ON DATEDIFF(w1.recordDate, w2.recordDate) = 1
WHERE w1.temperature > w2.temperature;
2. SELECT 
    player_id,
    MIN(event_date) AS first_login
FROM Activity
GROUP BY player_id;
3. SELECT name
FROM Fruits
ORDER BY id
LIMIT 1 OFFSET 2;
4. SELECT 
    employee_id,
    first_name,
    hire_date,
    TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) AS Years_of_Service,
    CASE
        WHEN TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) < 1 THEN 'New Hire'
        WHEN TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) BETWEEN 1 AND 5 THEN 'Junior'
        WHEN TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) BETWEEN 5 AND 10 THEN 'Mid-Level'
        WHEN TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) BETWEEN 10 AND 20 THEN 'Senior'
        ELSE 'Veteran'
    END AS Employment_Stage
FROM Employees;
5. SELECT 
    Vals,
    CAST(REGEXP_SUBSTR(Vals, '^[0-9]+') AS UNSIGNED) AS IntegerValue
FROM GetIntegers;
1. SELECT 
  GROUP_CONCAT(
    CONCAT(
      SUBSTRING(SUBSTRING_INDEX(SUBSTRING_INDEX(Vals, ',', n), ',', -1), 2, 1), -- 2nd letter
      SUBSTRING(SUBSTRING_INDEX(SUBSTRING_INDEX(Vals, ',', n), ',', -1), 1, 1), -- 1st letter
      SUBSTRING(SUBSTRING_INDEX(SUBSTRING_INDEX(Vals, ',', n), ',', -1), 3)    -- remaining letters
    )
    ORDER BY n SEPARATOR ','
  ) AS SwappedVals
FROM MultipleVals
JOIN (
  SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
) nums
ON n <= (LENGTH(Vals) - LENGTH(REPLACE(Vals, ',', '')) + 1);
2. WITH RECURSIVE SplitChars AS (
    SELECT 1 AS n, SUBSTRING('sdgfhsdgfhs@121313131', 1, 1) AS Ch
    UNION ALL
    SELECT n + 1, SUBSTRING('sdgfhsdgfhs@121313131', n + 1, 1)
    FROM SplitChars
    WHERE n < LENGTH('sdgfhsdgfhs@121313131')
)
SELECT * FROM SplitChars;
3. SELECT 
    player_id,
    device_id
FROM Activity a
WHERE event_date = (
    SELECT MIN(event_date)
    FROM Activity
    WHERE player_id = a.player_id
);
4. SELECT
  REGEXP_REPLACE('rtcfvty34redt', '[0-9]', '') AS Characters,
  REGEXP_REPLACE('rtcfvty34redt', '[^0-9]', '') AS Numbers;
