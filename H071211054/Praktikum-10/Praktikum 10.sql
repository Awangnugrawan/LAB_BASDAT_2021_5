USE classicmodels;
SELECT c.customerName,CASE 
WHEN (c.creditLimit-SUM(od.quantityOrdered*od.priceEach)) < 0 
THEN 'You are in Debt'
WHEN (c.creditLimit-SUM(od.quantityOrdered*od.priceEach)) > 0 
THEN 'You are in Safe'
WHEN (c.creditLimit-SUM(od.quantityOrdered*od.priceEach)) = 0 
THEN 'You are runing out of credits' END
AS 'Are You Safe',(c.creditLimit-SUM(od.quantityOrdered*od.priceEach)) AS Total 
FROM customers AS c
JOIN orders AS o
USING (customerNumber)
JOIN orderdetails AS od
USING (orderNumber)
GROUP BY c.customerNumber
ORDER BY c.customerName
DESC;
