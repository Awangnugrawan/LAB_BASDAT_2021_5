USE classicmodels;

#nomor 1
SELECT c.customerName, c.creditLimit, o.`status`, o.comments
FROM customers c
JOIN orders o
USING (customerNumber)
WHERE o.comments LIKE '%credit limit exceeded%';

#nomor 2
SELECT c.customerName, o.`status`, o.comments
FROM customers c
JOIN orders o
USING (customerNumber)
WHERE o.comments LIKE '%DHL%';

#nomor 3 
SELECT c.customerName, pr.productName, o.`status`, o.shippedDate
FROM customers c
JOIN orders o
USING (customerNumber)
JOIN orderdetails d
USING (orderNumber)
JOIN products pr
USING (productCode)
WHERE pr.productName LIKE '%Ferrari%'      
ORDER BY o.shippedDate DESC;

#nomor 4
INSERT INTO orders VALUE (10099, CURRENT_DATE, ADDDATE(CURRENT_DATE, INTERVAL 1 YEAR), '2022-12-12', 'In Process', NULL, 465);
INSERT INTO orderdetails VALUE (10099, 'S18_2957', 50, 62.46, 1);

SELECT DISTINCT c.customerName, d.quantityOrdered, p.productName, o.`status`, o.orderDate, o.requiredDate, d.priceEach, p.MSRP
FROM customers c
JOIN orders o
USING (customerNumber)
JOIN orderdetails d
USING (orderNumber)
JOIN products p
USING (productCode)
WHERE c.customerNumber = 465;