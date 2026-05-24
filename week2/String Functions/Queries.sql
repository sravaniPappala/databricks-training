-- Returns the number of characters using LENGTH function
SELECT full_name,
       LENGTH(full_name)
FROM employees;

-- Returns the number of characters using CHAR_LENGTH function
SELECT full_name,
       CHAR_LENGTH(full_name)
FROM employees;

-- Convert department to uppercase and city to lowercase
SELECT UPPER(department),
       LOWER(city)
FROM employees;

-- Remove spaces using TRIM, LTRIM, and RTRIM
SELECT
       TRIM(full_name),
       LTRIM(full_name),
       RTRIM(full_name)
FROM employees;

-- Join full_name and department using CONCAT
SELECT CONCAT(full_name, ' - ', department) AS emp_details
FROM employees;

-- Join values with separator using CONCAT_WS
SELECT CONCAT_WS(' | ', emp_id, full_name, city)
FROM employees;

-- Extract part of email using SUBSTRING
SELECT SUBSTRING(email, 1, 7)
FROM employees;

-- Extract part of email using SUBSTR
SELECT SUBSTR(email, 1, 5)
FROM employees;

-- Extract characters from left and right using LEFT and RIGHT
SELECT LEFT(full_name, 4),
       RIGHT(city, 3)
FROM employees;

-- Find the position of @ symbol using INSTR
SELECT email,
       INSTR(email, '@')
FROM employees;

-- Find the position of . symbol using LOCATE
SELECT email,
       LOCATE('.', email)
FROM employees;

-- Replace Data with Big Data in department
SELECT REPLACE(department, 'Data', 'Big Data')
FROM employees;

-- Reverse the full_name string
SELECT full_name,
       REVERSE(full_name)
FROM employees;

-- Pad emp_id with zeros on the left using LPAD
SELECT LPAD(emp_id, 5, '0')
FROM employees;

-- Pad city with * on the right using RPAD
SELECT RPAD(city, 15, '*')
FROM employees;

-- Remove spaces from city using TRIM and REPLACE
SELECT TRIM(REPLACE(city, ' ', ''))
FROM employees;

-- Handle NULL remarks using IFNULL
SELECT full_name,
       IFNULL(remarks, 'No remarks')
FROM employees;

-- Return first non-NULL value using COALESCE
SELECT full_name,
       COALESCE(remarks, 'N/A')
FROM employees;

-- Search value in comma-separated list using FIND_IN_SET
SELECT FIND_IN_SET('Analytics', 'Data,Analytics,AI');