USE classicmodels;

SELECT o.orderNumber, d.quantityOrdered, p.productName, d.priceEach
FROM orders o
JOIN orderdetails d
USING (orderNumber)
JOIN products p
USING(productCode)
WHERE productName LIKE '%Enzo%' AND d.priceEach > 200;