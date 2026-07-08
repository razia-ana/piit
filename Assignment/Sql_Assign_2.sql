-- Below are MySQL 8.0 compatible solutions for all the questions.
-- MySQL Assignment – Set 1 Solutions

-- Basic Questions

-- 1. Create a database named shop
DROP DATABASE if exists shop;
CREATE DATABASE shop;
USE shop;
CREATE TABLE products (id INT AUTO_INCREMENT PRIMARY KEY,name VARCHAR(100),price DECIMAL(8,2));
INSERT INTO products (name, price)VALUES('Laptop', 55000.00),
('Mobile', 400.50),
('Keyboard', 1200.00),
('Mouse', 750.00),
('Monitor', 15000.00);
select * from products;
UPDATE products SET price = 450.75 WHERE id = 2;
select * from products;
DELETE FROM products WHERE id = 3;
select * from products;
SELECT *FROM products WHERE price > 200;
CREATE TABLE customers (cust_id INT AUTO_INCREMENT PRIMARY KEY,cust_name VARCHAR(50),city VARCHAR(50));
INSERT INTO customers (cust_name, city) VALUES('Rita', 'Delhi'),('Taheera', 'Mumbai'),('Rasul', 'Delhi');
SELECT DISTINCT city FROM customers;
SELECT COUNT(*) AS total_products FROM products;
 CREATE TABLE books (book_id INT AUTO_INCREMENT PRIMARY KEY, title VARCHAR(100), author VARCHAR(100),price DECIMAL(8,2));
INSERT INTO books (title, author, price) VALUES('Python Basics', 'John', 250.00),('SQL Guide', 'Ben', 450.00),('Data Science', 'Dan', 150.00),('Web Dev', 'Susan', 600.00),('AI Introduction', 'Alan', 800.00);
SELECT *FROM books WHERE author LIKE '%n';
SELECT * FROM books ORDER BY price ASC;
SELECT * FROM books ORDER BY price DESC LIMIT 3;
 CREATE TABLE members( member_id INT AUTO_INCREMENT PRIMARY KEY, member_name VARCHAR(100));
INSERT INTO members (member_name) Values ('Alice'),('Bob'),('Charlie'), ('Rasul'),('Taheera');
SELECT COUNT(*) AS total_members FROM members;
SELECT DISTINCT author FROM books;
SELECT MAX(price) AS max_price FROM books;
SELECT MIN(price) AS min_price FROM books;
SELECT AVG(price) AS average_price FROM books;
ALTER TABLE members ADD email VARCHAR(100);
UPDATE members SET email = 'ram@example.com' WHERE member_id = 1;
SELECT * from members;

CREATE TABLE orders (order_id INT AUTO_INCREMENT PRIMARY KEY,cust_id INT,prod_id INT,order_date DATE);
INSERT INTO orders (cust_id, prod_id, order_date)VALUES(1,1,'2024-01-10'),(2,2,'2024-02-15'),(1,4,'2024-03-20');
DELETE FROM orders WHERE order_date < '2024-01-01';
SELECT *FROM products ORDER BY price DESC LIMIT 2;
SELECT c.cust_name, COUNT(o.order_id) AS total_orders FROM customers c JOIN orders o ON c.cust_id=o.cust_id GROUP BY c.cust_name HAVING COUNT(o.order_id) > 2;
-- Second highest priced product
SELECT * FROM products ORDER BY price DESC LIMIT 1 OFFSET 1;
-- Orders in each month of 2024
SELECT MONTH(order_date) AS month, COUNT(*) AS total_orders FROM orders WHERE YEAR(order_date)=2024 GROUP BY MONTH(order_date);
--  Distinct products purchased by each customer
SELECT c.cust_name, COUNT(DISTINCT o.prod_id) AS total_products FROM customers c JOIN orders o ON c.cust_id=o.cust_id GROUP BY c.cust_name;
--  Customers who never placed an order

SELECT c.cust_name
FROM customers c
LEFT JOIN orders o
ON c.cust_id=o.cust_id
WHERE o.order_id IS NULL;

--  Products ordered at least once
SELECT DISTINCT
p.*
FROM products p
INNER JOIN orders o
ON p.id=o.prod_id;
-- Average order amount for each customer

SELECT
c.cust_name,
AVG(p.price) AS average_order_amount
FROM customers c
JOIN orders o
ON c.cust_id=o.cust_id
JOIN products p
ON o.prod_id=p.id
GROUP BY c.cust_name;
-- Customers who ordered products above 500
SELECT DISTINCT
c.cust_name
FROM customers c
JOIN orders o
ON c.cust_id=o.cust_id
JOIN products p
ON o.prod_id=p.id
WHERE p.price > 500;
-- Highest order amount for each customer
SELECT
c.cust_name,
MAX(p.price) AS highest_order_amount
FROM customers c
JOIN orders o
ON c.cust_id=o.cust_id
JOIN products p
ON o.prod_id=p.id
GROUP BY c.cust_name;
-- Orders with product names
SELECT
o.order_id,
o.order_date,
p.name
FROM orders o
JOIN products p
ON o.prod_id=p.id
ORDER BY o.order_date DESC;
-- Create employees table

CREATE TABLE employees (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_name VARCHAR(100),
    dept_id INT,
    salary DECIMAL(10,2)
);
-- Insert 4 employees

INSERT INTO employees (emp_name, dept_id, salary)
VALUES
('Amit',1,45000),
('Rahul',2,38000),
('Priya',3,52000),
('Neha',1,25000);

-- Create departments table

CREATE TABLE departments (
    dept_id INT AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR(100) UNIQUE
);

-- Insert 3 departments

INSERT INTO departments (dept_name)
VALUES
('Sales'),
('HR'),
('IT');

-- Add foreign key

ALTER TABLE employees
ADD CONSTRAINT fk_department
FOREIGN KEY (dept_id)
REFERENCES departments(dept_id);

-- Display employees with department names

SELECT
e.emp_name,
d.dept_name,
e.salary
FROM employees e
JOIN departments d
ON e.dept_id=d.dept_id;
-- Increase Sales salary by 10%

UPDATE employees e
JOIN departments d
ON e.dept_id=d.dept_id
SET e.salary=e.salary*1.10
WHERE d.dept_name='Sales';
-- Delete employees with salary below 20000

DELETE FROM employees
WHERE salary < 20000;

-- Create payments table

CREATE TABLE payments (
    pay_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    amount DECIMAL(10,2),
    pay_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- Total salary paid to each employee
INSERT INTO payments (emp_id, amount) VALUES 
(1, 1500.50),
(2, 2300.00),
(3, 1500.50),
(4, 3125.75);
-- Total salary paid to each employee

SELECT
e.emp_name,
SUM(p.amount) AS total_salary_paid
FROM employees e
JOIN payments p
ON e.emp_id=p.emp_id
GROUP BY e.emp_name;

-- These solutions are compatible with MySQL 8.0 and cover key SQL concepts including DDL (CREATE, ALTER), DML (INSERT, UPDATE, DELETE), SELECT queries, filtering, sorting, aggregate functions, GROUP BY, HAVING, JOINs, subqueries, and foreign keys.