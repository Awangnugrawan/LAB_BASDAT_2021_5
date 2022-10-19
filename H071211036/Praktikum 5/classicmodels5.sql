-- USE classicmodels

		# nomor 1
SELECT c.customerName, o.status, o.comments
FROM `orders` AS o
LEFT JOIN customers AS c
USING(customerNumber)
WHERE o.`comments` LIKE 'Customer credit limit exceeded%';


		# nomor 2
SELECT c.customerName, o.status, o.comments
FROM `orders` AS o
LEFT JOIN customers AS c
USING(customerNumber)
WHERE o.`comments` LIKE '%DHL%';


		# nomor 3
SELECT p.productName, c.customerName, o.status, o.shippedDate
FROM `products` AS P
JOIN orderdetails AS od
USING(productCode)
JOIN orders AS o
USING(orderNumber)
JOIN customers AS c
USING(customerNumber)
WHERE p.productName LIKE '%Ferrari%' ORDER BY shippedDate DESC;

		# nomor 4
INSERT INTO `products`
SELECT c.customerName, od.quantityOrdered, p.productName, o.status, o.orderDate, o.requiredDate, o.comments
FROM `products` AS P
JOIN orderdetails AS od
USING(productCode)
JOIN orders AS o
USING(orderNumber)
JOIN customers AS c
USING(customerNumber);

INSERT INTO orders (`orderNumber`, `orderDate`, `requiredDate`, `shippedDate`, `status`,`comments`,`customerNumber`)
VALUES
	(10789, CURRENT_DATE(), CURRENT_DATE() + INTERVAL 1 YEAR, '2022-10-20', 'In Process', 'The car will be resold at the same price as the retail price
official/retail price', 465);

INSERT INTO orderdetails
VALUES (10789,'S18_2957',50, 62.46, 40);

SELECT c.customerName, od.quantityOrdered, p.productName, o.status, o.orderDate, o.requiredDate, o.comments
FROM `products` AS P
JOIN orderdetails AS od
USING(productCode)
JOIN orders AS o
USING(orderNumber)
JOIN customers AS c
USING(customerNumber)
WHERE customerNumber = 465;