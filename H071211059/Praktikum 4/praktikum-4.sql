USE classicmodels;

-- Nomor 1
SELECT p.productName, o.orderDate
FROM products p
INNER JOIN orderdetails od 
USING (productCode)
INNER JOIN orders o 
USING (orderNumber)
WHERE p.productName = "1940 Ford Pickup Truck"
ORDER BY o.orderDate DESC;


-- Nomor 2
SELECT DISTINCT p.productName, od.priceEach, p.MSRP
FROM products p
INNER JOIN orderdetails od 
USING (productCode)
WHERE od.priceEach < (0.8 * p.MSRP);

-- Nomor 3
USE appseminar;
SELECT d.nama AS `Dosen Pembimbing`, mhs.nama AS `Nama Mahasiswa`
FROM ss_mahasiswa AS mhs
INNER JOIN ss_pembimbing AS pb 
USING (id_mahasiswa)
INNER JOIN ss_dosen AS d ON pb.id_pembimbing_utama = d.id_dosen
WHERE mhs.nama = "Sulaeman";

-- nomor 4
USE classicmodels;

ALTER TABLE customers
ADD `status` VARCHAR(10) NOT NULL;

UPDATE customers AS c
INNER JOIN payments p 
USING (customerNumber)
INNER JOIN orders o 
USING (customerNumber)
INNER JOIN orderdetails od 
USING (orderNumber)
SET c.`status` = "VIP"
WHERE p.amount > 100000 OR od.quantityOrdered >= 50;

UPDATE customers 
SET `status` = "Regular"
WHERE `status` = "";

SELECT DISTINCT c.customerName, c.customerNumber, c.`status` 
FROM customers AS c
INNER JOIN payments p 
USING (customerNumber)
INNER JOIN orders o 
USING (customerNumber)
INNER JOIN orderdetails od 
USING (orderNumber);

-- Nomor 5
-- drop foreign key terkait dengan customers yaitu orders.customerNumber dan payments.customerNumber
ALTER TABLE orders
DROP FOREIGN KEY `orders_ibfk_1`;

ALTER TABLE payments
DROP FOREIGN KEY `payments_ibfk_1`;

-- delete table pada parent table (customers)
DELETE c
FROM customers AS c
LEFT JOIN orders o ON c.customerNumber = o.customerNumber
WHERE o.`status` = "cancelled";

-- add kembali foreign key, tapi error
ALTER TABLE orders
ADD FOREIGN KEY(customerNumber) REFERENCES customers(customerNumber) ON UPDATE CASCADE ON DELETE CASCADE; 
ALTER TABLE payments
ADD FOREIGN KEY(customerNumber) REFERENCES customers(customerNumber) ON UPDATE CASCADE ON DELETE CASCADE;
