-- Show all employees whose salary is NULL
SELECT *
FROM Employees
WHERE salary IS NULL;

-- Show all orders where discount is NOT NULL
SELECT *
FROM Orders
WHERE discount IS NOT NULL;

-- Get products where category is NULL
SELECT *
FROM Products
WHERE category IS NULL;

-- Count number of employees with NULL manager_id
SELECT COUNT(*) AS total_null_managers
FROM Employees
WHERE manager_id IS NULL;

-- Replace NULL salary with 0
SELECT emp_id, name,
       ISNULL(salary, 0) AS salary
FROM Employees;

-- Replace NULL bonus with 1000
SELECT emp_id, name,
       ISNULL(bonus, 1000) AS bonus
FROM Employees;

-- Show order amount, if NULL replace with 500
SELECT order_id, customer_name,
       ISNULL(amount, 500) AS amount
FROM Orders;

-- Replace NULL stock with 0
SELECT product_id, product_name,
       ISNULL(stock, 0) AS stock
FROM Products;

-- Show employee earnings using salary, if NULL use bonus
SELECT name,
       COALESCE(salary, bonus) AS earnings
FROM Employees;

-- Show first available value salary → bonus → 0
SELECT name,
       COALESCE(salary, bonus, 0) AS income
FROM Employees;

-- Show product price price → 1000 (default)
SELECT product_name,
       COALESCE(price, 1000) AS final_price
FROM Products;

-- Get customer payment amount → discount → 0
SELECT customer_name,
       COALESCE(amount, discount, 0) AS payment
FROM Orders;

-- Convert salary to NULL if salary = 0
SELECT name,
       NULLIF(salary, 0) AS salary
FROM Employees;

-- Convert discount to NULL if discount = 0
SELECT order_id,
       NULLIF(discount, 0) AS discount
FROM Orders;

-- Use NULLIF to avoid divide by zero
SELECT amount / NULLIF(discount, 0)
FROM Orders;

-- Replace coupon_code with NULL if it is 'DISC10'
SELECT order_id,
       NULLIF(coupon_code, 'DISC10') AS coupon_code
FROM Orders;

-- Calculate total earnings salary + bonus (handle NULL properly)
SELECT name,
       COALESCE(salary, 0) + COALESCE(bonus, 0) AS total_earnings
FROM Employees;

-- Show employees where both salary AND bonus are NULL
SELECT *
FROM Employees
WHERE salary IS NULL
AND bonus IS NULL;

-- Show products where price is NULL but category is NOT NULL
SELECT *
FROM Products
WHERE price IS NULL
AND category IS NOT NULL;

-- Show orders where both amount and discount are NULL
SELECT *
FROM Orders
WHERE amount IS NULL
AND discount IS NULL;

-- Show employee income COALESCE(salary, bonus, 1000)
SELECT name,
       COALESCE(salary, bonus, 1000) AS income
FROM Employees;

-- Replace empty discount with NULL using NULLIF
SELECT order_id,
       NULLIF(discount, 0) AS discount
FROM Orders;

-- Show final payable amount amount - discount (handle NULL)
SELECT order_id,
       COALESCE(amount, 0) - COALESCE(discount, 0) AS final_amount
FROM Orders;

-- Find employees where salary is NULL but manager exists
SELECT *
FROM Employees
WHERE salary IS NULL
AND manager_id IS NOT NULL;