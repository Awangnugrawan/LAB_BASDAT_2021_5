USE classicmodels;

-- Nomor 1

SELECT c.customerName, o.`status`, o.comments, c.creditLimit FROM customers c
JOIN orders o
USING(customerNumber)
WHERE comments LIKE 'Customer credit limit%';

-- Nomor 2

SELECT c.customerName, o.`status`, o.comments FROM customers c
JOIN orders o
USING(customerNumber)
WHERE comments LIKE '%DHL%';

-- Nomor 3

SELECT c.customerName, p.productName, o.`status`, o.shippedDate FROM customers c
JOIN orders o USING (customerNumber)
JOIN orderdetails od USING (orderNumber)
JOIN products p USING (productCode)
WHERE productName LIKE '%Ferrari%'
order by shippedDate desc;

-- Nomor 4

SELECT * FROM products
WHERE productName = '1934 Ford V8 Coupe';

SELECT * FROM orders;
INSERT INTO orders
VALUE (25603, CURRENT_DATE(), ADDDATE(CURRENT_DATE(), INTERVAL 1 YEAR), NULL, 'In Process', NULL, 465);

INSERT INTO orderdetails
VALUE (25603, 'S18_2957', '50', '62.46', '15');

SELECT c.customerName, p.productName, od.quantityOrdered,o.`status`, o.orderDate, o.requiredDate, od.priceEach FROM orders o
JOIN customers c
USING (customerNumber)
JOIN orderdetails od
USING (orderNumber)
JOIN products p
USING (productCode)
WHERE orderNumber = 25603;

SELECT * FROM orders
WHERE customerNumber = 465;
SELECT * FROM customers
WHERE customerName LIKE 'Anton%';
SELECT * FROM orderdetails
WHERE orderNumber = '25603';