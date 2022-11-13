USE classicmodels;

-- no 1
SELECT c.customerNumber 'Nomor Customer', c.customerName 'Nama Customer',
	(SELECT MAX(amount) FROM payments p) ' Pembayaran Terbesar',
	(SELECT MIN(amount) FROM payments p) 'Pembayaran Terkecil'
FROM customers c
RIGHT JOIN payments p
USING (customerNumber)
GROUP BY customerNumber;

-- no 2
SELECT e.employeeNumber, e.lastName, e.firstName, o.city, e.officeCode
FROM employees e
JOIN offices o
USING (officeCode)
WHERE officeCode = 
	(SELECT officeCode FROM employees GROUP BY officeCode ORDER BY COUNT(employeeNumber) DESC LIMIT 1);

-- no 3
SELECT productName 'Nama Produk', productScale 'Skala' 
FROM products p
WHERE EXISTS (SELECT * FROM products WHERE p.productName LIKE '%Ford%');

-- no 4
SELECT 
	c.customerName 'Nama Customer', 
	e.firstName, e.lastName, 
	o.orderNumber,
	SUM(od.quantityOrdered * od.priceEach) 'total_order'
FROM customers c
JOIN employees e
ON c.salesRepEmployeeNumber = e.employeeNumber
JOIN orders o
USING (customerNumber)
JOIN orderdetails od
USING (orderNumber)
WHERE od.orderNumber =
	(SELECT orderNumber FROM orderdetails 
	GROUP BY orderNumber 
	ORDER BY SUM(quantityOrdered * priceEach) DESC LIMIT 1);

-- no 5
SELECT DISTINCT country 'negara', LENGTH(country) 'panjang karakter' 
FROM customers
WHERE 
	LENGTH(country) =
	(SELECT MAX(LENGTH(country)) FROM customers) OR 
	LENGTH(country) = 
	(SELECT MIN(LENGTH(country)) FROM customers)
ORDER BY LENGTH(country) DESC;
