SELECT * FROM Employee;

SELECT name, salary FROM Employee;

SELECT * FROM Employee
WHERE age > 30;

SELECT name FROM Department;

SELECT * FROM Employee
WHERE department_id = 1;

SELECT * FROM Employee
WHERE name LIKE 'J%';

SELECT * FROM Employee
WHERE name LIKE '%e';

SELECT * FROM Employee
WHERE name LIKE '%a%';

SELECT * FROM Employee
WHERE LENGTH(name) = 9;

SELECT * FROM Employee
WHERE name LIKE '_o%';

SELECT * FROM Employee
WHERE YEAR(hire_date) = 2020;

SELECT * FROM Employee
WHERE MONTH(hire_date) = 1;

SELECT * FROM Employee
WHERE hire_date < '2019-01-01';

SELECT * FROM Employee
WHERE hire_date >= '2021-03-01';

SELECT * FROM Employee
WHERE hire_date >= CURRENT_DATE - INTERVAL 2 YEAR;

SELECT SUM(salary) FROM Employee;

SELECT AVG(salary) FROM Employee;

SELECT MIN(salary) FROM Employee;

SELECT department_id, COUNT(*) 
FROM Employee
GROUP BY department_id;

SELECT department_id, AVG(salary)
FROM Employee
GROUP BY department_id;

SELECT department_id, SUM(salary)
FROM Employee
GROUP BY department_id;

SELECT department_id, AVG(age)
FROM Employee
GROUP BY department_id;

SELECT YEAR(hire_date), COUNT(*)
FROM Employee
GROUP BY YEAR(hire_date);

SELECT department_id, MAX(salary)
FROM Employee
GROUP BY department_id;

SELECT department_id
FROM Employee
GROUP BY department_id
ORDER BY AVG(salary) DESC
LIMIT 1;

SELECT department_id
FROM Employee
GROUP BY department_id
HAVING COUNT(*) > 2;

SELECT department_id
FROM Employee
GROUP BY department_id
HAVING AVG(salary) > 55000;

SELECT YEAR(hire_date)
FROM Employee
GROUP BY YEAR(hire_date)
HAVING COUNT(*) > 1;

SELECT department_id
FROM Employee
GROUP BY department_id
HAVING SUM(salary) < 100000;

SELECT department_id
FROM Employee
GROUP BY department_id
HAVING MAX(salary) > 75000;

SELECT * FROM Employee
ORDER BY salary ASC;

SELECT * FROM Employee
ORDER BY age DESC;

SELECT * FROM Employee
ORDER BY hire_date ASC;

SELECT * FROM Employee
ORDER BY department_id, salary;

SELECT department_id, SUM(salary)
FROM Employee
GROUP BY department_id
ORDER BY SUM(salary);

SELECT e.name, d.name
FROM Employee e
JOIN Department d 
ON e.department_id = d.department_id;

SELECT p.name, d.name
FROM Project p
JOIN Department d 
ON p.department_id = d.department_id;

SELECT e.name, p.name
FROM Employee e
JOIN Project p 
ON e.department_id = p.department_id;

SELECT e.name, d.name
FROM Employee e
LEFT JOIN Department d 
ON e.department_id = d.department_id;

SELECT d.name, e.name
FROM Department d
LEFT JOIN Employee e 
ON d.department_id = e.department_id;