USE classicmodels;

-- Nomor 1
SELECT customerNumber, customerName, MAX(amount), MIN(amount) FROM customers
JOIN payments p
USING (customerNumber)
WHERE  EXISTS(SELECT amount FROM payments WHERE amount AND customerNumber != 0) 
GROUP BY customerNumber;

-- Nomor 2
SELECT e.employeeNumber, e.firstName, e.lastName, o.city, o.officeCode 
FROM employees e
JOIN offices o 
USING (officeCode)
WHERE officeCode IN (
	SELECT officeCode FROM offices
    HAVING MAX(officeCode)
    );

-- Nomor 3
SELECT productName, productScale
FROM products
WHERE productName IN(
	SELECT productName FROM products
    WHERE productName LIKE '%Ford%');
    
-- Nomor 4
SELECT customerName, firstName, lastName AS 'last name', o.orderNumber,
SUM(quantityOrdered * priceEach) AS 'Total'
FROM customers c
JOIN employees e
ON c.salesRepEmployeeNumber = e.employeeNumber
JOIN orders o
USING (customerNumber)
JOIN orderdetails od
USING (orderNumber)
WHERE orderNUmber = (
	SELECT orderNumber
    FROM orderdetails
    GROUP BY orderNumber
    ORDER BY SUM(quantityOrdered * priceEach)
    DESC LIMIT 1);
    
-- Nomor 5
SELECT c.country AS negara, LENGTH(c.country) AS panjang_karakter
FROM customers c
HAVING panjang_karakter IN (SELECT MAX(LENGTH(country)) FROM customers)
	OR panjang_karakter IN (SELECT MIN(LENGTH(country)) FROM customers)
ORDER BY c.country ASC
LIMIT 2
;
