USE classicmodels;

SELECT c.customerName,
CASE
	WHEN (c.creditLimit - SUM(od.quantityOrdered*priceEach)) > 0 THEN 'you are safe'
	WHEN (c.creditLimit - SUM(od.quantityOrdered*priceEach)) < 0 THEN 'you are in debt'
	WHEN (c.creditLimit - SUM(od.quantityOrdered*priceEach)) = 0 THEN 'you are running out of credits'
END AS 'Are you safe?',
(c.creditLimit - SUM(od.quantityOrdered*priceEach)) AS Total
FROM customers AS c
JOIN orders AS o
USING(customerNumber)
JOIN orderdetails AS od
USING(orderNumber)
GROUP BY c.customerNumber
ORDER BY c.customerName DESC;