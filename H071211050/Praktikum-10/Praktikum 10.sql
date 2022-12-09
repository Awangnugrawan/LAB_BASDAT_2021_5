USE classicmodels;

SELECT c.customerName,
case
when c.creditLimit - SUM(od.priceEach * od.quantityOrdered) > 0 then 'You are safe'
when c.creditLimit - SUM(od.priceEach * od.quantityOrdered) < 0 then 'You are in debt'
when c.creditLimit - SUM(od.priceEach * od.quantityOrdered) = 0 then 'You are running out of credits'
END AS 'Are you safe?',
c.creditLimit - SUM(od.priceEach * od.quantityOrdered) AS Total
FROM customers c
JOIN orders o
USING (customerNumber)
JOIN orderdetails od
USING (orderNumber)
GROUP BY c.customerNumber
ORDER BY c.customerName  DESC;