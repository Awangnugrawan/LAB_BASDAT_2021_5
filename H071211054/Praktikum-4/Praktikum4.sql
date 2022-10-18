USE classicmodels;

-- Soal 1
SELECT o.orderDate, p.productName 
FROM orders AS o 
INNER JOIN orderdetails AS od 
ON o.orderNumber = od.orderNumber
INNER JOIN products as p 
ON p.productCode = od. productCode
WHERE productName = '1940 Ford Pickup Truck' 
ORDER BY o.orderDate DESC;

-- Soal 2
SELECT DISTINCT p.productName 
FROM orderdetails AS od 
INNER JOIN products AS p 
ON od.productCode = p.productCode 
WHERE od.priceEach < (0.8*p.MSRP);

-- Soal 3
USE appseminar;
SELECT d.nama, m.nama FROM ss_mahasiswa AS m 
INNER JOIN ss_pembimbing AS p
ON m.id_mahasiswa = p.id_mahasiswa
INNER JOIN ss_dosen AS d
ON p.id_pembimbing_utama = d.id_dosen
WHERE m.nama = 'Sulaeman';

-- Soal 4
USE classicmodels;

ALTER TABLE customers
ADD status VARCHAR(255) NOT NULL;

UPDATE customers AS c
INNER JOIN payments AS p
ON c.customerNumber = p.customerNumber
INNER JOIN orders AS o
ON o.customerNumber = p.customerNumber
INNER JOIN orderdetails AS od
ON o.orderNumber = od.orderNumber
SET c.status ='Regular';

UPDATE customers AS c
INNER JOIN payments AS p
ON c.customerNumber = p.customerNumber
INNER JOIN orders AS o
ON o.customerNumber = p.customerNumber
INNER JOIN orderdetails AS od
ON o.orderNumber = od.orderNumber
SET c.status = 'VIP'
WHERE quantityOrdered>=50 or amount>100000;

-- Untuk menampilkan outputnya

SELECT distinct c.customerName, p.customerNumber, c.status
FROM customers AS c
INNER JOIN payments AS p
USING (customerNumber)
INNER JOIN orders AS o
USING (customerNumber)
INNER JOIN orderdetails
USING (orderNumber);

-- Soal 5
ALTER TABLE orderdetails
DROP CONSTRAINT orderdetails_ibfk_1;

ALTER TABLE orderdetails	
ADD CONSTRAINT orderdetails_ibfk_1 FOREIGN KEY(OrderNumber) REFERENCES orders(orderNumber)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE orders
DROP CONSTRAINT orders_ibfk_1;

ALTER TABLE orders
ADD CONSTRAINT orders_ibfk_1 FOREIGN KEY(customerNumber) REFERENCES customers(customerNumber)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE payments
DROP CONSTRAINT payments_ibfk_1;

ALTER TABLE Payments
ADD CONSTRAINT payments_ibfk_1 FOREIGN KEY(customerNumber) REFERENCES customers(customerNumber)
ON DELETE CASCADE ON UPDATE CASCADE;

DELETE customers
FROM customers
INNER JOIN orders
USING(customerNumber)
INNER JOIN payments
USING(customerNumber)
WHERE orders.status = 'Cancelled';
SELECT distinct STATUS FROM orders;
SELECT * FROM orders WHERE orders.`status`='Cancelled';