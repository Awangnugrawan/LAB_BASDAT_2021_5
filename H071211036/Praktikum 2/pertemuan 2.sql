-- SELECT city FROM offices

-- SELECT * FROM offices

-- SELECT * FROM offices WHERE country="USA"

-- SELECT * FROM employees WHERE officeCode = 8 OR jobTitle = "Sales Rep"

-- SELECT * FROM  offices ORDER BY city DESC

-- SELECT * FROM employees LIMIT 5,19

-- SELECT DISTINCT jobTitle FROM employees

-- 	TUGAS
-- Jawaban No. 1
-- SELECT * FROM offices WHERE city='San Francisco'

-- Jawaban No. 2
-- SELECT * FROM orderdetails WHERE quantityOrdered>70 ORDER BY orderLineNumber ASC

-- Jawaban No. 3
-- SELECT DISTINCT productLine FROM products

-- Jawaban No. 4
-- SELECT customerNumber AS 'nomor Customer', customerName AS 'nama Customer' FROM customers WHERE customerNumber>100 AND customerNumber<150

-- jawaban No. 5
SELECT * FROM customers WHERE country!="USA" and creditLimit>0 ORDER BY customerName ASC LIMIT 10,10