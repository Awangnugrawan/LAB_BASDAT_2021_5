-- Nomor 1
SELECT c.customerNumber, c.customerName, 
(SELECT MAX(amount) FROM payments AS p
WHERE c.customerNumber=p.customerNumber),
(SELECT MIN(amount) FROM payments AS p
WHERE c.customerNumber=p.customerNumber) 
FROM customers AS c
JOIN payments p 
USING(customerNumber)
GROUP BY customerNumber;

-- Nomor 2
SELECT e.employeeNumber, e.lastName, e.firstName, o.city, e.officeCode
FROM employees AS e
JOIN offices AS o
USING(officeCode)
WHERE officeCode =
(( SELECT MAX(Office_Code) AS Kode_Kantor
FROM 
(SELECT COUNT(officeCode) AS Office_Code
FROM employees 
GROUP BY employeeNumber ) AS COUNT));

-- Nomor 3
SELECT productName, productScale FROM products
WHERE productName IN (SELECT productName FROM products WHERE productName LIKE '%Ford%');

--  Nomor 4
SELECT c.customerName, e.firstName, e.lastName, o.orderNumber, 
SUM(od.priceEach*od.quantityOrdered) AS 'Total Order'
FROM customers AS c
JOIN employees AS e
ON c.salesRepEmployeeNumber=e.employeeNumber
JOIN orders AS o
USING(customerNumber)
JOIN orderdetails AS od
USING(orderNumber)
GROUP BY c.customerName, e.firstName, e.lastName, o.orderNumber
HAVING SUM(od.priceEach*od.quantityOrdered) =
( SELECT MAX(a) FROM 
(SELECT SUM(od.priceEach*od.quantityOrdered) AS a
FROM orderdetails od
GROUP BY orderNumber) AS b);

-- Nomor 5
SELECT DISTINCT country, LENGTH(country) AS 'Panjang Karakter'
FROM customers 
WHERE LENGTH(country) = (SELECT MAX(LENGTH(country)) AS 'Terpanjang' FROM customers)
OR
LENGTH(country)= (SELECT MIN(LENGTH(country)) AS 'Terpendek' FROM customers)
ORDER BY `Panjang Karakter` DESC;
