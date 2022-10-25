-- USE classicmodels;

# Nomor 1
-- SELECT o.orderDate, p.productName
-- FROM orderdetails AS od
-- INNER JOIN orders AS o
-- USING (orderNumber)
-- INNER JOIN products AS p
-- USING (productCode)
-- WHERE productName = "1940 Ford Pickup Truck"
-- ORDER BY o.orderDate DESC; 


# Nomor 2
-- SELECT p.productName, od.priceEach, p.MSRP
-- FROM products AS p
-- INNER JOIN orderdetails AS od
-- USING (productCode)
-- WHERE priceEach < (0.8*MSRP)
-- 

# Nomor 3
-- USE appseminar;
-- 
-- SELECT m.nama, d.nama
-- FROM ss_mahasiswa AS m 
-- INNER JOIN ss_pembimbing AS p 
-- USING (id_mahasiswa) 
-- INNER JOIN ss_dosen AS d
-- ON p.id_pembimbing_utama = d.id_dosen 
-- WHERE m.nama="Sulaeman";


# Nomor 4
-- USE classicmodels;

-- ALTER TABLE customers 
-- ADD `status` varchar (100);


-- UPDATE customers AS c
-- INNER JOIN orders AS o
-- USING (customerNumber)
-- INNER JOIN payments AS p
-- USING (customerNumber)
-- INNER JOIN orderdetails AS od
-- USING (orderNumber)
-- SET c.`status` = "Regular" 
-- WHERE c.`status` = ''


-- UPDATE customers AS c
-- INNER JOIN orders AS o
-- USING (customerNumber)
-- INNER JOIN payments AS p
-- USING (customerNumber)
-- INNER JOIN orderdetails AS od
-- USING (orderNumber)
-- SET c.`status` = "VIP" 	
-- WHERE p.amount > 100000 OR od.quantityOrdered >= 50;
-- 
SELECT DISTINCT  c.customerName, c.customerNumber, c.`status`
FROM customers AS c
INNER JOIN orders AS o
USING (customerNumber)
INNER JOIN payments AS p
USING (customerNumber)
INNER JOIN orderdetails AS od
USING (orderNumber)

-- 
# Nomor 5
-- ALTER TABLE orders 
-- DROP CONSTRAINT orders_ibfk_1;
-- ALTER TABLE payments 
-- DROP CONSTRAINT payments_ibfk_1;
-- 
-- DELETE c 
-- FROM customers AS c
-- INNER JOIN orders AS o
-- ON c.customerNumber = o.customerNumber
-- WHERE o.`status` = "Cancelled"





