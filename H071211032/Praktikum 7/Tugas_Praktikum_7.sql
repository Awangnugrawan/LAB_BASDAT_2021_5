
-- Nomor 1
SELECT c.customerNumber AS `Nomor Pelanggan`, C.customerName AS `Nama Pelanggan`,
(SELECT MAX(amount) FROM payments AS p
	WHERE c.customerNumber = p.customerNumber) AS `Terbesar`,
(SELECT MIN(amount) FROM payments AS p
	WHERE c.customerNumber = p.customerNumber) AS `Terkecil`
FROM customers AS c
JOIN payments AS p
USING (customerNumber)
GROUP BY customerName



-- Nomor 2
SELECT * FROM employees
WHERE officeCode = 
	(SELECT officeCode 
	FROM employees 
	GROUP BY officeCode 
	ORDER BY COUNT(employeeNumber) DESC LIMIT 1);
	
	
	
-- Nomor 3
SELECT p.productName, p.productScale FROM products AS p
WHERE EXISTS (SELECT * FROM products WHERE p.productName LIKE '%Ford%'

-- Apa perbedaannya?
WHERE productName LIKE '%Ford%'


-- Nomor 4
SELECT c.customerName, e.firstName, e.lastName, o.orderNumber, SUM(od.quantityOrdered * od.priceEach)
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
	
	

-- Nomor 5
SELECT DISTINCT country AS 'negara', LENGTH(country) AS 'panjang karakter' 
FROM customers
WHERE LENGTH(country) = (SELECT MAX(LENGTH(country)) FROM customers) OR 
		LENGTH(country) = (SELECT MIN(LENGTH(country)) FROM customers)
ORDER BY LENGTH(country) DESC;

