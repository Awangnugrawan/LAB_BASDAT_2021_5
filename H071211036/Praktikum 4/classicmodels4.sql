-- CREATE DATABASE classicmodels

-- USE classicmodels

-- SELECT * FROM orders


	# nomor 1
-- SELECT od.orderNumber, od.productCode, p.productName, o.orderDate
-- FROM orderdetails AS od
-- RIGHT JOIN orders AS o
-- USING(orderNumber)
-- RIGHT JOIN products AS p
-- USING(productCode)
-- WHERE productName = '1940 Ford Pickup Truck' ORDER BY orderDate ASC;



	# nomor 2
-- SELECT p.productName, od.priceEach, p.MSRP as '80% MSRP'
-- FROM products AS p
-- INNER JOIN orderdetails AS od
-- USING(productCode)
-- WHERE od.priceEach < (p.MSRP*0.8);



	# nomor 4
-- ALTER TABLE customers
-- ADD `status` VARCHAR(100) DEFAULT 'Regular';

-- UPDATE customers 
-- INNER JOIN payments
-- USING(customerNumber)
-- INNER JOIN orders
-- USING(customerNumber)
-- INNER JOIN orderdetails
-- USING(orderNumber)
-- SET customers.status = 'VIP'
-- WHERE payments.amount > 100000 OR orderdetails.quantityOrdered >= 50;

-- SELECT DISTINCT c.customerName, c.customerNumber, c.`status`
-- FROM customers AS c
-- JOIN payments AS p
-- USING(customerNumber)
-- JOIN orders AS o
-- USING(customerNumber)
-- JOIN orderdetails AS od
-- USING(orderNumber);



-- 	# nomor 5

-- SELECT TABLE_NAME, CONSTRAINT_NAME, referenced_column_name, referenced_table_name
-- FROM information_schema.key_column_usage
-- WHERE TABLE_NAME = 'orders';

-- ALTER TABLE orders
-- DROP CONSTRAINT `orders_ibfk_1`;

-- SELECT TABLE_NAME, CONSTRAINT_NAME, referenced_column_name, referenced_table_name
-- FROM information_schema.key_column_usage
-- WHERE TABLE_NAME = 'payments'; 

-- ALTER TABLE payments
-- DROP CONSTRAINT `payments_ibfk_1`;

-- SELECT TABLE_NAME, CONSTRAINT_NAME, referenced_column_name, referenced_table_name 
-- FROM information_schema. key_column_usage
-- WHERE TABLE_NAME = 'orderdetails';

-- ALTER TABLE orderdetails
-- DROP CONSTRAINT `orderdetails_ibfk_1`;

-- ALTER TABLE orderdetails
-- DROP CONSTRAINT `orderdetails_ibfk_2`;

-- DELETE customers
-- FROM customers
-- JOIN orders
-- USING(customerNumber)
-- WHERE orders.status = 'cancelled';

-- SELECT customers.customerNumber, orders.status
-- FROM customers
-- JOIN orders
-- USING(customerNumber)
-- WHERE orders.status = 'cancelled';

-- SELECT * FROM orders
-- WHERE status = 'cancelled';

-- SELECT * FROM customers
-- WHERE customerNumber = 496;