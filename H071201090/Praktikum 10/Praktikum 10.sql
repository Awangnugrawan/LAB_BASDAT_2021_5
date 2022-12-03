SELECT c.customerName AS Nama,(c.creditlimit - SUM(od.quantityOrdered*od.priceEach)) AS Total,
case
when (c.creditlimit - SUM(od.quantityOrdered*od.priceEach)) > 0 then 'You Are Safe'
when (c.creditlimit - SUM(od.quantityOrdered*od.priceEach)) < 0 then 'You Are In Dept'
ELSE 'You Are Running Out of Credits'
END AS `Are You Safe?`
FROM customers c
JOIN orders o
USING(customerNumber)
JOIN orderdetails od
USING(orderNumber)
GROUP BY c.customerName DESC;
