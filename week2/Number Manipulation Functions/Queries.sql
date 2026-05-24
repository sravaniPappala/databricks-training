-- Find the absolute value of -100
SELECT ABS(-100);

-- Round base_salary to 0 decimal places
SELECT ROUND(base_salary, 0)
FROM employee_salary;

-- Round base_salary to 2 decimal places
SELECT ROUND(base_salary, 2)
FROM employee_salary;

-- Round up base_salary using CEIL
SELECT CEIL(base_salary)
FROM employee_salary;

-- Round down base_salary using FLOOR
SELECT FLOOR(base_salary)
FROM employee_salary;

-- Truncate base_salary to 1 decimal place without rounding
SELECT TRUNCATE(base_salary, 1)
FROM employee_salary;

-- Find the remainder when experience_years is divided by 2
SELECT MOD(experience_years, 2)
FROM employee_salary;

-- Find the power of 2 raised to 3
SELECT POWER(2, 3);

-- Find the power of 5 raised to 2
SELECT POW(5, 2);

-- Find the square root of 64
SELECT SQRT(64);

-- Find the sign of base_salary
SELECT SIGN(base_salary)
FROM employee_salary;

-- Generate a random number using RAND
SELECT RAND();

-- Format base_salary with 2 decimal places
SELECT FORMAT(base_salary, 2)
FROM employee_salary;

-- Find the greatest value between base_salary and bonus
SELECT emp_name,
       GREATEST(base_salary, IFNULL(bonus, 0))
FROM employee_salary;

-- Find the least value between base_salary and bonus
SELECT emp_name,
       LEAST(base_salary, IFNULL(bonus, 0))
FROM employee_salary;