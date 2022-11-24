USE classicmodels;
-- SELECT * FROM customers;

(SELECT customerName, city, "inisial A" AS inisial FROM customers
	WHERE customerName LIKE 'A%' LIMIT 3)
UNION
(SELECT customerName, city, "inisial D" FROM customers
	WHERE customerName LIKE 'D%' LIMIT 3)
UNION
(SELECT customerName, city, "inisial G" FROM customers
   WHERE customerName LIKE 'G%' LIMIT 3);