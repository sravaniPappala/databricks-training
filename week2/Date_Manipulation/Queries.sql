-- Display the current date using MySQL functions.
SELECT CURDATE();
SELECT CURRENT_DATE();

-- Display the current time using MySQL functions.
SELECT CURTIME();
SELECT CURRENT_TIME();

-- Display the current date and time using MySQL functions.
SELECT NOW();
SELECT CURRENT_TIMESTAMP;

-- Extract year, month, and day from order_date.
SELECT
    YEAR(order_date),
    MONTH(order_date),
    DAY(order_date)
FROM orders;

-- Extract year, month, and day using EXTRACT().
SELECT
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date),
    EXTRACT(DAY FROM order_date)
FROM orders;

-- Display month name and day name from order_date.
SELECT
    MONTHNAME(order_date),
    DAYNAME(order_date)
FROM orders;

-- Display weekday number and day of week number from order_date.
SELECT
    WEEKDAY(order_date),
    DAYOFWEEK(order_date)
FROM orders;

-- Identify weekend orders using DAYNAME().
SELECT order_id, order_date
FROM orders
WHERE DAYNAME(order_date) IN ('Saturday', 'Sunday');

-- Identify weekend orders using DAYOFWEEK().
SELECT order_id, order_date
FROM orders
WHERE DAYOFWEEK(order_date) IN (1, 7);

-- Identify weekday orders.
SELECT order_id, order_date
FROM orders
WHERE DAYOFWEEK(order_date) BETWEEN 2 AND 6;

-- Add 5 days to order_date.
SELECT order_date,
       DATE_ADD(order_date, INTERVAL 5 DAY)
FROM orders;

-- Subtract 3 days from order_date.
SELECT order_date,
       DATE_SUB(order_date, INTERVAL 3 DAY)
FROM orders;

-- Add 1 month to order_date.
SELECT DATE_ADD(order_date, INTERVAL 1 MONTH)
FROM orders;

-- Subtract 2 months from order_date.
SELECT DATE_SUB(order_date, INTERVAL 2 MONTH)
FROM orders;

-- Add 1 year to order_date.
SELECT DATE_ADD(order_date, INTERVAL 1 YEAR)
FROM orders;

-- Find the difference in days between delivery date and order date using DATEDIFF().
SELECT
    order_id,
    DATEDIFF(delivery_date, order_date) AS delivery_days
FROM orders;

-- Find the difference in days and months using TIMESTAMPDIFF().
SELECT
    TIMESTAMPDIFF(DAY, order_date, delivery_date) AS days_diff,
    TIMESTAMPDIFF(MONTH, order_date, delivery_date) AS months_diff
FROM orders;

-- Display the last day of the month for each order_date.
SELECT LAST_DAY(order_date)
FROM orders;

-- Display the first day of the month for each order_date.
SELECT DATE_SUB(order_date, INTERVAL DAY(order_date)-1 DAY)
FROM orders;

-- Format order_date as DD-MM-YYYY.
SELECT DATE_FORMAT(order_date, '%d-%m-%Y')
FROM orders;

-- Format order_date as Month DD, YYYY.
SELECT DATE_FORMAT(order_date, '%M %d, %Y')
FROM orders;

-- Convert a string into date format using STR_TO_DATE().
SELECT STR_TO_DATE('15-01-2024', '%d-%m-%Y');

-- Format timestamp values using DATE_FORMAT().
SELECT DATE_FORMAT(order_timestamp, '%d-%m-%Y %H:%i:%s')
FROM orders;

-- Display all orders placed in January.
SELECT *
FROM orders
WHERE MONTH(order_date) = 1;

-- Display all orders placed in February.
SELECT *
FROM orders
WHERE MONTHNAME(order_date) = 'February';

-- Find the financial year for each order using CASE.
SELECT order_date,
CASE
    WHEN MONTH(order_date) >= 4
    THEN CONCAT(YEAR(order_date), '-', YEAR(order_date)+1)
    ELSE CONCAT(YEAR(order_date)-1, '-', YEAR(order_date))
END AS financial_year
FROM orders;

-- Display orders placed in the last 7 days.
SELECT *
FROM orders
WHERE order_date >= CURDATE() - INTERVAL 7 DAY;

-- Display orders placed today.
SELECT *
FROM orders
WHERE DATE(order_timestamp) = CURDATE();