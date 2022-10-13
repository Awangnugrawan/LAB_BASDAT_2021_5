-- NOMOR 1

USE classicmodels;
SELECT o.orderDate, p.productName
FROM orders o
INNER JOIN orderdetails od
-- ON od.orderNumber = o.orderNumber
USING (orderNumber)
INNER JOIN products p
-- ON p.productCode = od.productCode
USING (productCode)
WHERE productName = '1940 Ford Pickup Truck';

-- NOMOR 2

SELECT p.productname, MSRP, od.priceEach FROM products p
INNER JOIN orderdetails od
-- ON p.productCode = od.productCode
USING (productCode)
WHERE priceEach < (80/100)*MSRP;

-- NOMOR 3

USE appseminar;
DESC ss_pembimbing;
DESC ss_mahasiswa;
DESC ss_dosen;

SELECT m.nama AS `Nama Mahasiswa`, d.nama AS `Nama Dosen`, p.id_pembimbing_utama 
FROM ss_mahasiswa m
LEFT  JOIN ss_pembimbing p
-- ON m.id_mahasiswa = p.id_mahasiswa
USING (id_mahasiswa)
LEFT  JOIN ss_dosen d
ON p.id_pembimbing_utama = d.id_dosen
WHERE  m.nama = 'Sulaeman';

-- NOMOR 4 

USE classicmodels;
ALTER TABLE customers
ADD `status` VARCHAR(10);
DESC customers;

UPDATE customers
SET `status` = 'Reguler';

UPDATE customers c
INNER JOIN payments p
-- ON c.customerNumber = p.customerNumber
USING (customerNumber)
INNER JOIN orders o
-- ON c.customerNumber= o.customerNumber
USING (customerNumber)
INNER JOIN orderdetails od
-- ON o.orderNumber = od.orderNumber
USING (orderNumber)
SET c.`status` = 'VIP'
WHERE amount >= 100000 OR quantityOrdered >= 50;

SELECT DISTINCT c.customerName, c.customerNumber, c.`status` FROM customers c
JOIN payments p
-- ON c.customerNumber = p.customerNumber
USING (customerNumber)
JOIN orders o
-- ON c.customerNumber= o.customerNumber
USING (customerNumber)
JOIN orderdetails od
-- ON o.orderNumber = od.orderNumber;
USING (orderNumber)

-- NOMOR 5

ALTER TABLE orderdetails
DROP CONSTRAINT orderdetails_ibfk_1;
ALTER TABLE payments
DROP CONSTRAINT payments_ibfk_1 ;

ALTER TABLE orders ADD CONSTRAINT orders_ibfk_1 FOREIGN KEY (customerNumber) REFERENCES customers(customerNumber)
ON DELETE CASCADE ON UPDATE CASCADE;

DELETE customers
FROM customers
LEFT JOIN orders 
-- ON customers.customerNumber = orders.customerNumber
USING (customerNumber)
WHERE orders.`status` = 'Cancelled';

SELECT DISTINCT `status` FROM orders;
SELECT * FROM customers;
SELECT * FROM orders
WHERE `status` = 'Cancelled';