#Jawaban no.1
-- SELECT distinct O.orderDate, P.productName
-- FROM orders AS O
-- INNER JOIN orderdetails AS od
-- ON O.orderNumber = od.orderNumber
-- INNER JOIN products AS P
-- ON od.productCode = P.productCode
-- WHERE productName = '1940s Ford truck';

#Jawaban no.2
-- USE classicmodels
-- SELECT p.productName, (0.8* p.MSRP) AS "80% of MSRP"
-- FROM orderdetails AS od
-- INNER JOIN products AS p ON od.productCode = p.productCode
-- WHERE od.priceEach < (80/100 * p.MSRP);
#Jawaban no.3
-- SELECT m.nama,o.id_pembimbing_utama,d.nama
-- FROM ss_mahasiswa AS m
-- INNER JOIN ss_pembimbing AS o
-- ON m.id_mahasiswa = o.id_mahasiswa
-- INNER JOIN ss_dosen AS d
-- ON o.id_pembimbing_utama= d.id_dosen
-- WHERE m.nama = 'Sulaeman';
#Jawaban no.4
-- ALTER TABLE customers
-- ADD status VARCHAR(200);
-- UPDATE customers
-- SET `status` = 'Regular'
-- UPDATE customers AS c
-- INNER JOIN orders AS o
-- ON c.customerNumber = o.customerNumber
-- INNER JOIN orderdetails AS od
-- ON o.orderNumber = od.orderNumber
-- SET c.`status`= 'VIP'
-- WHERE quantityOrdered >= 50

-- UPDATE customers AS c
-- INNER JOIN payments AS pa
-- ON c.customerNumber = pa.customerNumber
-- SET c.`status`='VIP'
-- WHERE pa.amount > 100000

#Jawaban no.5
-- ALTER TABLE orderdetails
-- DROP CONSTRAINT orderdetails_ibfk_1;
-- 
-- ALTER TABLE orderdetails	
-- ADD CONSTRAINT orderdetails_ibfk_1 FOREIGN KEY(OrderNumber) REFERENCES orders(orderNumber)
-- ON DELETE CASCADE ON UPDATE CASCADE;
-- 
-- ALTER TABLE orders
-- DROP CONSTRAINT orders_ibfk_1;
-- 
-- ALTER TABLE orders
-- ADD CONSTRAINT orders_ibfk_1 FOREIGN KEY(customerNumber) REFERENCES customers(customerNumber)
-- ON DELETE CASCADE ON UPDATE CASCADE;
-- 
-- ALTER TABLE payments
-- DROP CONSTRAINT payments_ibfk_1;
-- 
-- ALTER TABLE Payments
-- ADD CONSTRAINT payments_ibfk_1 FOREIGN KEY(customerNumber) REFERENCES customers(customerNumber)
-- ON DELETE CASCADE ON UPDATE CASCADE;
-- 
-- DELETE customers
-- FROM customers
-- INNER JOIN orders
-- USING(customerNumber)
-- INNER JOIN payments
-- USING(customerNumber)
-- WHERE orders.status = 'Cancelled';
-- SELECT distinct STATUS FROM orders;
-- SELECT * FROM orders WHERE orders.`status`='Cancelled';
















