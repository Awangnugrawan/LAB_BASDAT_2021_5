USE classicmodels;

SELECT c.customerName 'Nama', (c.creditLimit - SUM(od.quantityOrdered * od.priceEach)) 'Total',
case 
	when (c.creditLimit - SUM(od.quantityOrdered * od.priceEach)) > 0 then 'You Are Safe'
	when (c.creditLimit - SUM(od.quantityOrdered * od.priceEach)) < 0 then 'You Are In Debt'
	ELSE 'You Are Running Out of Credits'
	END AS `Are You Safe?`
FROM customers c
JOIN orders o
USING (customerNumber)
JOIN orderdetails od
USING (orderNumber)
GROUP BY c.customerName DESC;