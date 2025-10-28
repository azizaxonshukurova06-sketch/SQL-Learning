1. SELECT *
FROM employees
WHERE salary = (SELECT MIN(salary) FROM employees);
2. SELECT *
FROM products
WHERE price > (SELECT AVG(price) FROM products);
3.
SELECT *
FROM employees
WHERE department_id = (
  SELECT id FROM departments WHERE department_name = 'Sales'
);
4. SELECT *
FROM customers
WHERE customer_id NOT IN (
  SELECT customer_id FROM orders
);
5.
SELECT p.*
FROM products p
WHERE price = (
  SELECT MAX(price)
  FROM products
  WHERE category_id = p.category_id
);
6.
SELECT *
FROM employees
WHERE department_id = (
  SELECT department_id
  FROM employees
  GROUP BY department_id
  ORDER BY AVG(salary) DESC
  LIMIT 1
);
7. SELECT e.*
FROM employees e
WHERE e.salary > (
  SELECT AVG(salary)
  FROM employees
  WHERE department_id = e.department_id
);
8. SELECT s.name, g.course_id, g.grade
FROM grades g
JOIN students s ON s.student_id = g.student_id
WHERE g.grade = (
  SELECT MAX(grade)
  FROM grades
  WHERE course_id = g.course_id
);
9.
SELECT p1.*
FROM products p1
WHERE 2 = (
  SELECT COUNT(DISTINCT p2.price)
  FROM products p2
  WHERE p2.category_id = p1.category_id
    AND p2.price > p1.price
);
10. SELECT e.*
FROM employees e
WHERE e.salary > (SELECT AVG(salary) FROM employees)
  AND e.salary < (
      SELECT MAX(salary)
      FROM employees
      WHERE department_id = e.department_id
  );
