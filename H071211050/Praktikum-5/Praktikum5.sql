USE classicmodels;
-- NOMOR 1
-- SELECT * FROM customers;
-- SELECT * FROM orders;
-- 
-- SELECT c.customerName, c.creditLimit, o.`status`, o.comments
-- FROM customers AS c
-- JOIN orders AS o
-- USING (customerNumber)
-- WHERE o.comments LIKE '%credit limit exceeded%';

-- NOMOR 2
-- SELECT * FROM customers;
-- SELECT * FROM orders;
-- 
-- SELECT c.customerName, o.`status`, o.comments
-- FROM customers AS c
-- JOIN orders AS o
-- USING (customerNumber)
-- WHERE o.comments LIKE '%DHL%';

-- NOMOR 3
-- SELECT * FROM customers;
-- SELECT * FROM products;
-- SELECT * FROM orders;
-- SELECT * FROM orderdetails;
-- 
-- SELECT c.customerName, p.productName, o.`status`, o.shippedDate
-- FROM customers AS c
-- JOIN orders AS o
-- USING (customerNumber)
-- JOIN orderdetails AS od
-- USING (orderNumber)
-- JOIN products AS p
-- USING (productCode)
-- WHERE p.productName LIKE '%Ferrari%'
-- ORDER BY o.shippedDate DESC;

-- NOMOR 4
-- INSERT  INTO orders(orderNumber,orderDate,requiredDate,shippedDate, `status`, comments,customerNumber)
-- VALUES ('2022',CURRENT_DATE(),CURRENT_DATE(),CURRENT_DATE() + INTERVAL 1 YEAR,'In Process',NULL,'465');

-- INSERT INTO orderdetails(orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
-- VALUES ('2022', 'S18_2957', '50', '62.46', '20');

-- SELECT * FROM customers;
-- SELECT * FROM products;
-- SELECT * FROM orders;
-- SELECT * FROM orderdetails;

-- SELECT c.customerNumber, c.customerName, o.`status`, o.orderDate, o.shippedDate, od.quantityOrdered, p.productName
-- FROM customers AS c
-- JOIN orders AS o
-- USING (customerNumber)
-- JOIN orderdetails AS od
-- USING (orderNumber)
-- JOIN products AS p
-- USING (productCode)
-- WHERE c.customerNumber = '465';