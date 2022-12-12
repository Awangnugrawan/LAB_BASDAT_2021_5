
USE classicmodels


-- Nomor 2
SELECT o.orderNumber, od.quantityOrdered, p.productName, od.priceEach
FROM orders AS o
JOIN orderdetails AS od
USING (orderNumber)
JOIN products AS p
USING (productCode)
WHERE p.productName LIKE '%f%' AND od.priceEach > 200;



-- Nomor 10
(SELECT SUM(od.quantityOrdered) AS 'Jumlah', p.productName AS 'Nama Produk'
FROM orderdetails AS od
JOIN products AS p
USING (productCode)
GROUP BY p.productCode
ORDER BY SUM(od.quantityOrdered) DESC LIMIT 2)
UNION 
(SELECT SUM(od.quantityOrdered) AS 'Jumlah', p.productName AS 'Nama Produk'
FROM products AS p
JOIN orderdetails AS od
USING (productCode)
GROUP BY p.productCode
ORDER BY SUM(od.quantityOrdered) ASC LIMIT 2);



