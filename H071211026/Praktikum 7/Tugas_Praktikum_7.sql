USE classicmodels;

-- No 1
SELECT c.customerNumber, c.customerName, 
		 (SELECT MAX(amount) FROM payments p WHERE c.customerNumber = p.customerNumber) AS Terbesar,
		 (SELECT MIN(amount) FROM payments p WHERE c.customerNumber = p.customerNumber) AS Terkecil
FROM customers c
GROUP BY customerName
HAVING Terbesar AND Terkecil IS NOT NULL
ORDER BY customerNumber;

-- NO 2
SELECT e.employeeNumber, CONCAT(firstName, ' ', lastName) AS Nama_Karyawan, o.city, e.officeCode
FROM employees e
JOIN offices o
USING (officeCode)
WHERE officeCode IN (SELECT b.officeCode FROM 
							(SELECT COUNT(employeeNumber) AS a, officeCode FROM employees GROUP BY officeCode ORDER BY a DESC LIMIT 1) AS b 
						  );

-- NO 3
SELECT productName, productScale 
FROM products
WHERE productName IN (SELECT productName FROM products WHERE productName LIKE '%Ford%');

-- NO 4
SELECT c.customerName, CONCAT(firstName, ' ', lastName) AS Nama_Karyawan, d.orderNumber, d.total_order 
FROM customers c
JOIN employees e
ON c.salesRepEmployeeNumber = e.employeeNumber
JOIN orders o
USING (customerNumber)
JOIN (SELECT orderNumber, SUM(quantityOrdered * priceEach) AS total_order FROM orderdetails GROUP BY orderNumber ORDER BY total_order DESC LIMIT 1) d
USING (orderNumber)
GROUP BY orderNumber 
ORDER BY total_order DESC LIMIT 1;

-- NO 5
SELECT DISTINCT country, LENGTH(country) panjang_karakter
FROM customers 
WHERE LENGTH(country) = (SELECT MAX(LENGTH(country)) FROM customers) OR LENGTH(country) = (SELECT MIN(LENGTH(country)) FROM customers)
ORDER BY panjang_karakter DESC;