-- Create a new database named 'sales'
CREATE DATABASE sales;

-- Use the '' database
USE sales;

-- Create a table named 'customers'
CREATE TABLE customers(
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    address VARCHAR(50)
);

-- Insert sample data into the 'customers' table
INSERT INTO customers(customer_id, customer_name, address)
VALUES
(1, "John", "Kathmandu"),
(2, "David", "Butwal"),
(3, "Albert", "Gorkha"),
(4, "Roman", "Palpa"),
(5, "Rocky", "Gulmi");

-- Select all data from the 'customers' table
SELECT * FROM customers;

-- Create a table named 'payment'
CREATE TABLE payment(
    customer_id INT PRIMARY KEY,
    amount DOUBLE,
    method VARCHAR(50)
);

-- Insert sample data into the 'payment' table
INSERT INTO payment(customer_id, amount, method)
VALUES
(1, 2000, "online"),
(2, 5000, "cash"),
(5, 4000, "online");

-- Select all data from the 'payment' table
SELECT * FROM payment;

-- Update the amount to 3000 for the customer with customer_id = 1
UPDATE payment set amount=3000 where customer_id = 1;

-- Delete the payment record where customer_id = 1
DELETE FROM payment WHERE customer_id = 1;

-- Select all payments where the method is 'online'
SELECT * FROM payment WHERE method IN("online");

-- Select the method and the total amount, grouped by method and ordered ascending, limited to 1 result
SELECT method, sum(amount) as total_amount
FROM payment
GROUP BY method
ORDER BY method ASC
LIMIT 1;

-- Select all from payment where method is 'online' (Having clause)
SELECT * FROM payment HAVING method="online";

-- Count the number of payments where the method is 'online'
SELECT COUNT(customer_id) FROM payment WHERE method = "online";

-- Select distinct payment methods
SELECT DISTINCT(method) FROM payment;

-- Inner join between 'customers' and 'payment' tables on customer_id
SELECT * 
FROM customers as c
INNER JOIN payment as p
ON c.customer_id = p.customer_id;

-- Left join between 'customers' and 'payment' tables on customer_id
SELECT * 
FROM customers as c
LEFT JOIN payment as p
ON c.customer_id = p.customer_id;

-- Right join between 'customers' and 'payment' tables on customer_id
SELECT* 
FROM customers as c
RIGHT JOIN payment as p 
ON c.customer_id = p.customer_id;

-- Full join by combining left and right joins
SELECT * 
FROM customers as c
LEFT JOIN payment as p
ON c.customer_id = p.customer_id
UNION
SELECT* 
FROM customers as c
RIGHT JOIN payment as p 
ON c.customer_id = p.customer_id;

-- Left exclusive join: select customers with no corresponding payment record
SELECT * 
FROM customers as c
LEFT JOIN payment as p
ON c.customer_id = p.customer_id
WHERE p.customer_id IS NULL;

-- Right exclusive join: select payments with no corresponding customer record
SELECT * FROM customers as c
RIGHT JOIN payment as p
ON c.customer_id = p.customer_id
WHERE c.customer_id IS NULL;

-- Use a LIKE query to select customers whose name starts with 'D'
SELECT * FROM customers
WHERE customer_name LIKE "D%";