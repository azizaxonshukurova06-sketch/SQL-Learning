CREATE TABLE numbers2 (number INT);
INSERT INTO numbers2 VALUES (2), (3), (6), (7);

select * from numbers2

SELECT number,       
CASE 
WHEN  number %6 = 0 THEN'hi bye'
when number %3 = 0 THEN 'bye'
WHEN number %2 = 0 THEN 'hi'
ELSE 'NULL'
END AS Result 
From numbers2;

CREATE TABLE friendss (col1 VARCHAR(20), col2 VARCHAR(20));
INSERT INTO friendss VALUES ('John', 'Bob'), ('Bob', 'Rich'), ('Ann', 'John'), ('Ann', 'Rob');

SELECT * FROM friendss

SELECT col1 AS Friend, COUNT(col2) AS Dostlar_soni
FROM friendss
GROUP BY col1;

CREATE TABLE Students (
    StudentID INT,
    FullName VARCHAR(50),
    Score INT
);

INSERT INTO Students VALUES
(1, 'Ali Karimov', 95),
(2, 'Nodira Akhmedova', 82),
(3, 'Javohir Sobirov', 73),
(4, 'Dilnoza Rasulova', 59),
(5, 'Sardorbek Tursunov', 40),
(6, 'Bobur Usmonov', 0);

SELECT * FROM Students

select Score, FullName,
 CASE 
WHEN score >= 90 then  'A (Excelent)' 
when score >= 75 then 'B (Good_)' 
when score >= 60 then 'C (Avarage)'
when score >= 40 then 'F (Pass)'
else 'fale'
END AS Grade 
FROM Students

SELECT Score, FullName,
       IIF(Score < 50, 'Need Improvement', 'Pass') AS Grade
FROM Students;

