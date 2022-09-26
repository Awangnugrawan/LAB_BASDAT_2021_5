USE classicmodels;
-- Jawaban No 1
SELECT * FROM offices WHERE city="San Francisco";

-- Jawaban No 2
SELECT * FROM orderdetails
WHERE quantityOrdered > 70
ORDER BY orderLineNumber ASC;

-- Jawaban No 3
SELECT DISTINCT productLine FROM products;

-- Jawaban No 4
SELECT customerNumber AS `No Kostumer`, customerName AS `Nama Kostumer` FROM customers
WHERE customerNumber > 100 AND customerNumber < 150;

-- Jawaban No 5
SELECT * FROM customers
WHERE country != "USA" AND creditLimit > 0
ORDER BY customerName ASC
LIMIT 10, 10; 