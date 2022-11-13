USE classicmodels;
 
 -- nomor 1
SELECT amount FROM payments;
SELECT c.customerName AS 'Nama Pelanggan',
SUM(p.amount) AS 'Total Belanja',
c.creditLimit AS 'Batas Kredit',
SUM(p.amount) - c.creditLimit AS `Selisih`
FROM customers c 
JOIN payments p 
USING (customerNumber)
GROUP BY c.customerName
HAVING 'Total Belanja' > 'Batas Kredit'
ORDER BY `Selisih` DESC;

-- nomor 2
SELECT * FROM orderDetails;
SELECT CONCAT(c.customerName,' : ', c.contactFirstName,' ', c.contactLastName,' @ ', c.addressLine1) AS `Pelanggan`,
SUM(od.quantityOrdered) AS `Jumlah Orderan`  
FROM customers c
JOIN orders o
USING (customerNumber)
JOIN orderdetails od 
USING (orderNumber)
GROUP BY customerName
ORDER BY `Jumlah Orderan` DESC LIMIT 1;
;

-- Nomor 3
SELECT DATE_FORMAT(p.paymentDate, '%M %Y') AS `Hari Pembayaran`,
COUNT(DISTINCT p.customerNumber) AS `Jumlah Pelanggan`, 
GROUP_CONCAT(DISTINCT c.customerName ORDER BY c.customerName SEPARATOR ' , ') AS `List Pelanggan`,
SUM(DISTINCT p.amount) AS `Jumlah Pembayaran`
FROM payments p
JOIN customers c
USING (customerNumber)
GROUP BY `Hari Pembayaran`
HAVING `Hari Pembayaran` LIKE "Feb%"
ORDER BY `Jumlah Pembayaran` DESC;

-- Nomor 4

SELECT UPPER(p.productName) AS `Nama Produk`, COUNT(od.orderNumber) AS `Jumlah Di Order`, GROUP_CONCAT(o.orderDate, ' ') AS `Waktu Orderan`, p.buyPrice AS `Harga Beli`,  od.priceEach AS `Harga Jual`, SUM(od.quantityOrdered) AS `Total Jumlah Orderan`,
CONCAT(od.priceEach * SUM(od.quantityOrdered), ' - ', p.buyPrice * SUM(od.quantityOrdered), ' = ', SUM(od.quantityOrdered) * (od.priceEach - p.buyPrice)) AS `Pendapatan - Modal = Keuntungan`
FROM orders o
JOIN orderdetails od
USING (orderNumber)
JOIN products p
USING (productCode)
GROUP BY `Harga Jual`
HAVING `Nama Produk` LIKE '%ENZO'
AND SUM(od.quantityOrdered) * (od.priceEach - p.buyPrice) > 5000
ORDER BY SUM(od.quantityOrdered) * (od.priceEach - p.buyPrice) DESC;

-- Nomor 5

SELECT o.addressLine1 AS Alamat,
REPLACE (o.phone, RIGHT(o.phone, 6), '* ****') AS `Nomor Telpon`, COUNT(DISTINCT e.employeeNumber) AS 'Jumlah Karyawan',
COUNT(DISTINCT c.customerNumber) AS `Jumlah Pelanggan`, ROUND(AVG(p.amount), 2) AS `Rata Rata Penghasilan`
FROM customers c
JOIN employees e
ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN offices o
USING (officeCode)
JOIN payments p
USING (customerNumber)
GROUP BY o.phone;