USE classicmodels;

#jawaban no 1
SELECT o.orderDate, p.productName
FROM orders AS o
JOIN orderdetails AS d
USING (orderNumber)
JOIN products AS p
USING (productCode)
WHERE p.productName = '1940 Ford Pickup Truck'
ORDER BY o.orderDate DESC;

#jawababn no 2
SELECT DISTINCT p.productName, p.MSRP, d.priceEach
FROM orders AS o 
JOIN orderdetails AS d
USING (orderNumber)
JOIN products AS p
USING (productCode)
WHERE d.priceEach < (p.MSRP * 0.8);

-- #jawaban no 3
USE appseminar;

SELECT d.nama, m.nama
FROM ss_mahasiswa AS m
JOIN ss_pembimbing AS p
USING (id_mahasiswa)
JOIN ss_dosen AS d
ON p.id_pembimbing_utama = d.id_dosen)
WHERE m.nama = 'sulaeman';

-- #jawaban no 4
ALTER TABLE customers ADD `status` VARCHAR (10);

UPDATE customers AS c
JOIN payments p 
USING (customerNumber)
JOIN orders o 
USING (customerNumber)
JOIN orderdetails d 
USING (orderNumber)
SET c.`status` = 'VIP'
WHERE p.amount > 100000 OR d.quantityOrdered >= 50;

UPDATE customers 
SET `status` = 'Regular'
WHERE `status` = "";

SELECT DISTINCT c.customerNumber, c.customerName, c.`status`
FROM customers AS c
JOIN payments p 
USING (customerNumber)
JOIN orders o 
USING (customerNumber)
JOIN orderdetails d 
USING (orderNumber);

-- #jawaban no 5
ALTER TABLE orders
DROP FOREIGN KEY `orders_ibfk_1`;

ALTER TABLE payments
DROP FOREIGN KEY `payments_ibfk_1`;

ALTER TABLE orders
ADD FOREIGN KEY(customerNumber) REFERENCES customers(customerNumber) ON UPDATE CASCADE ON DELETE CASCADE; 
ALTER TABLE payments
ADD FOREIGN KEY(customerNumber) REFERENCES customers(customerNumber) ON UPDATE CASCADE ON DELETE CASCADE;

DELETE c
FROM customers AS c
LEFT JOIN orders o 
ON c.customerNumber = o.customerNumber
WHERE o.`status` = 'cancelled';

SELECT c.customerName
FROM customers AS c
LEFT JOIN orders o 
ON c.customerNumber = o.customerNumber
WHERE o.`status` = 'cancelled';