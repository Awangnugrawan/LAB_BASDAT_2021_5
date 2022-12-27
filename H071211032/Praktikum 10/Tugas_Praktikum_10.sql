SELECT c.customerName,
CASE 
WHEN (c.creditLimit- SUM(od.quantityOrdered * od.priceEach)) < 0 THEN 'You are in debt'
WHEN (c.creditLimit- SUM(od.quantityOrdered * od.priceEach)) = 0 THEN 'You are running out of credits'
ELSE 'You are safe'
END
AS 'Are You Safe?',  (c.creditLimit- SUM(od.quantityOrdered * od.priceEach)) AS 'Total'
FROM customers AS c
JOIN orders AS o
USING (customerNumber)
JOIN orderdetails AS od
USING (orderNumber)
GROUP BY customerNumber