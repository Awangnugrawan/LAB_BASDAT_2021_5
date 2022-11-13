-- USE classicmodels;

	#NOMOR 1
SELECT customerNumber, customerName AS 'Pengguna', MAX(p.amount) AS 'Pembayaran Terbesar', MIN(p.amount) AS 'Pembayaran Terkecil'
FROM payments p
JOIN customers c
USING(customerNumber)
WHERE c.customerName IN
	(SELECT customerName FROM customers)
    GROUP BY customerName
    ORDER BY customerNumber; 
    
	#NOMOR 2
SELECT employeeNumber, firstName, lastName, city, officeCode
FROM employees
JOIN offices
USING(officeCode)
WHERE officeCode = 
	(SELECT officeCode FROM (
	SELECT officeCode, COUNT(officeCode) AS 'Employee' FROM employees
	GROUP BY officeCode
	ORDER BY 'Employee'
	LIMIT 1) AS O); 
    
    #NOMOR 3
SELECT productName, productScale 
FROM products
WHERE productName IN (
	SELECT productName 
    FROM products 
    WHERE productName LIKE "%Ford%");

	#NOMOR 4
SELECT customerName, e.firstName, e.lastName, o.orderNumber, SUM(od.priceEach*od.quantityOrdered) AS 'total_order'
FROM customers c
JOIN employees e
on c.salesRepEmployeeNumber = e.employeeNumber
NATURAL JOIN orders o
NATURAL JOIN orderdetails od
GROUP BY o.orderNumber, customerName, e.firstName, e.lastName
HAVING SUM(od.priceEach*od.quantityOrdered) = (
	SELECT MAX(a) FROM 
    (SELECT SUM(od.priceEach*od.quantityOrdered) AS a FROM orderdetails od
	GROUP BY orderNumber) AS b); 
    
	#NOMOR 5
SELECT country AS 'negara', LENGTH(country) AS 'panjang_karakter' 
FROM customers
WHERE LENGTH(country) = (
	SELECT MAX(LENGTH(country)) FROM customers)
    OR LENGTH(country) = (SELECT MIN(LENGTH(country)) FROM customers)
    GROUP BY country; 