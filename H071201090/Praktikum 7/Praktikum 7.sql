#Jawaban no.1
-- SELECT customers.customerNumber,customers.customerName,MAX(payments.amount)AS max_amount,MIN(payments.amount)
-- FROM customers
-- INNER JOIN payments 
-- ON customers.customerNumber = payments.customerNumber
-- WHERE payments.amount IN 
-- (SELECT amount FROM payments
-- ) 
-- GROUP BY payments.customerNumber
#Jawaban no.2
-- SELECT e.employeeNumber, e.lastName, e.firstName, o.city, e.officeCode
-- FROM employees AS e
-- JOIN offices AS o
-- USING(officeCode)
-- WHERE officeCode =
-- (( SELECT MAX(Office_Code) AS Kode_Kantor
-- FROM 
-- (SELECT COUNT(officeCode) AS Office_Code
-- FROM employees 
-- GROUP BY employeeNumber ) AS COUNT));
#Jawaban no.3
-- SELECT productName , productScale 
-- FROM products p
-- WHERE productName IN (SELECT productName FROM products WHERE productName LIKE '%Ford%');
#Jawaban no.4
-- SELECT c.customerName, e.firstName, e.lastName, o.orderNumber, 
-- SUM(od.priceEach*od.quantityOrdered) AS 'Total Order'
-- FROM customers AS c
-- JOIN employees AS e
-- ON c.salesRepEmployeeNumber=e.employeeNumber
-- JOIN orders AS o
-- USING(customerNumber)
-- JOIN orderdetails AS od
-- USING(orderNumber)
-- GROUP BY c.customerName, e.firstName, e.lastName, o.orderNumber
-- HAVING SUM(od.priceEach*od.quantityOrdered) =
-- ( SELECT MAX(a) FROM 
-- (SELECT SUM(od.priceEach*od.quantityOrdered) AS a
-- FROM orderdetails od
-- GROUP BY orderNumber) AS b);
#Jawaban no.5
-- SELECT DISTINCT country , LENGTH(country) AS 'Panjang karakter'
-- FROM customers
-- WHERE LENGTH(country) =(SELECT MAX(LENGTH(country)) FROM customers) OR 
-- LENGTH(country) = (SELECT MIN(LENGTH(country)) FROM customers)
-- ORDER BY LENGTH(country) DESC;






