-- USE classicmodels;

-- no 1
-- SELECT o.orderDate, od.productCode, p.productName 
-- FROM orders o 
-- INNER JOIN orderdetails od
-- USING (orderNumber)
-- ON od.orderNumber = o.orderNumber
-- INNER JOIN products p
-- USING (productCode)
-- WHERE productName = '1940 Ford Pickup Truck'
-- ORDER BY orderDate DESC;

-- no 2
-- SELECT p.productName, od.priceEach, p.MSRP
-- FROM products p
-- INNER JOIN orderdetails od
-- USING (productCode)
-- ON p.productCode = od.productCode
-- WHERE priceEach < p.MSRP * 0.8;

-- no 3
-- USE appseminar;
-- SELECT p.id_pembimbing_utama, d.id_dosen, d.nama, m.nama
-- FROM ss_pembimbing p
-- JOIN ss_dosen d
-- ON p.id_pembimbing_utama = d.id_dosen
-- JOIN ss_mahasiswa m
-- USING (id_mahasiswa)
-- ON p.id_mahasiswa = m.id_mahasiswa
-- WHERE m.nama = 'Sulaeman';

-- no 4
-- ALTER TABLE customers
-- ADD `status` VARCHAR(10) DEFAULT 'Regular';

-- UPDATE customers c
-- INNER JOIN payments p
-- USING (customerNumber)
-- INNER JOIN orders o
-- USING (customerNumber)
-- INNER JOIN orderdetails od
-- USING (orderNumber)
-- SET c.`status` = 'VIP'
-- WHERE (p.amount > 100000 OR od.quantityOrdered >= 50);
 
-- SELECT DISTINCT c.customerName, c.customerNumber, c.`status`
-- FROM customers c 
-- INNER JOIN payments p
-- USING (customerNumber)
-- INNER JOIN orders o
-- USING (customerNumber)
-- INNER JOIN orderdetails od
-- USING (orderNumber);

-- no 5
-- SELECT COLUMN_NAME, CONSTRAINT_NAME, REFERENCED_COLUMN_NAME, REFERENCED_TABLE_NAME
-- FROM information_schema.KEY_COLUMN_USAGE
-- WHERE TABLE_NAME = 'payments';
-- 
-- ALTER TABLE orders DROP CONSTRAINT orders_ibfk_1;
-- ALTER TABLE orderdetails DROP CONSTRAINT orderdetails_ibfk_1;
-- ALTER TABLE payments DROP CONSTRAINT payments_ibfk_1;
-- 
-- DELETE customers 
-- FROM customers 
-- LEFT JOIN orders  
-- on customers.customerNumber = orders.customerNumber
-- WHERE orders.`status` = 'Cancelled';

-- SELECT o.`status`
-- FROM customers c
-- LEFT JOIN orders o
-- USING (customerNumber)
-- WHERE o.`status`='Cancelled';
-- 
-- SELECT * FROM orders o
-- WHERE `status`='Cancelled';

-- SELECT * FROM customers
-- WHERE customerNumber = 496;


-- SELECT*FROM ss_pembimbing;
-- SELECT*FROM ss_mahasiswa;
-- SELECT*FROM ss_dosen;
-- SELECT * FROM customers;
-- SELECT * FROM orders;
-- SELECT * FROM orderdetails;
-- SELECT * FROM payments;
-- SELECT * FROM employees;
-- SELECT * FROM products;
-- SELECT * FROM productlines;
