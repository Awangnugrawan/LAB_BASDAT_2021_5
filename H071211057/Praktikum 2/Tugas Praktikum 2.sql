 -- No.1
SELECT * FROM offices WHERE city= 'San Francisco'

-- No.2
SELECT * FROM orderdetails
SELECT * FROM orderdetails WHERE quantityOrdered>70 ORDER BY orderLineNumber asc

-- N0.3
SELECT distinct productline from products 

-- No.4
SELECT * FROM customers
SELECT customerNumber AS 'nomor costumer', customerName AS 'nama costumer' FROM customers WHERE customerNumber >=100 AND customerNumber <=150

-- No.5
SELECT * FROM customers
SELECT * FROM customers where country != "USA" and creditLimit != 0 order by customerName asc limit 10,10