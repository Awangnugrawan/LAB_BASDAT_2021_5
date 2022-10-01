USE classicmodels;

#jawaban nomor 1
SELECT * FROM offices WHERE city = "san francisco";

#jawaban nomor 2
SELECT * FROM orderdetails WHERE quantityOrdered > 70 ORDER BY orderLineNumber ASC;

#jawaban nomor 3
SELECT DISTINCT productLine FROM products;

#jawaban nomor 4
SELECT customerNumber AS 'No. Customer', customerName AS 'Nama Customer' FROM customers WHERE customerNumber >= 100 AND customerNumber <= 150;

#jawaban nomor 5
SELECT * FROM customers WHERE country != 'usa' AND creditLimit !=  0  ORDER BY customerName ASC LIMIT 10,10;