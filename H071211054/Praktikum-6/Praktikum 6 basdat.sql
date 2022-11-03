USE classicmodels;
-- Nomor 1
SELECT c.customerName AS 'Nama Pelanggan',
SUM(amount) AS 'Total Belanja',
c.creditLimit AS 'Batas Kredit', 
SUM(amount) - c.creditLimit AS 'Selisih'
FROM customers AS c
INNER JOIN payments AS p
USING(customerNumber)
GROUP BY c.customerName
ORDER BY `Selisih` DESC;

-- Nomor 2
SELECT CONCAT(c.customerName, " ", ":", " ", c.contactFirstName, " ", c.contactLastName, "@", c.addressLine1) AS 'Pelanggan',
SUM(quantityOrdered) AS 'Jumlah Orderan'
FROM customers AS c
INNER JOIN orders AS o
USING(customerNumber)
INNER JOIN orderdetails AS od
USING(orderNumber)
GROUP BY c.customerName
ORDER  BY SUM(quantityOrdered) DESC LIMIT 1;

-- Nomor 3
SELECT CONCAT(MONTHNAME(paymentDate), " " , YEAR(paymentDate)) AS 'Hari Pembayaran',
COUNT(c.customerNumber) AS 'Jumlah Pelanggan',
group_CONCAT(distinct c.customerName SEPARATOR ",") AS 'List Pelanggan',
SUM(p.amount) AS 'Jumlah Pembayaran'
FROM customers AS c
INNER JOIN payments AS p
USING(customerNumber)
GROUP BY `Hari Pembayaran`
HAVING `Hari Pembayaran` LIKE "February%" 
ORDER BY `Jumlah Pembayaran` DESC;

-- Nomor 4
SELECT UPPER (pr.productName) AS 'Nama Produk',
COUNT(o.orderDate) AS 'Jumlah di Order',
GROUP_CONCAT(o.orderDate) AS 'Waktu Orderan',
pr.buyPrice AS 'Harga Beli',
od.priceEach AS 'Harga Jual',
SUM(od.quantityOrdered) AS 'Total Jumlah Orderan',
CONCAT((od.priceEach * SUM(od.quantityOrdered)), ' - ', (pr.buyPrice * SUM(od.quantityOrdered)), ' = ', 
(od.priceEach * SUM(od.quantityOrdered)) - (pr.buyPrice * SUM(od.quantityOrdered))) AS 'Pendapatan - Modal = Keuntungan' 
FROM products AS pr
JOIN orderdetails AS od
USING(productCode)
JOIN orders AS o
USING(orderNumber)
WHERE productName LIKE  '%Enzo'
GROUP BY `priceEach`
ORDER BY (priceEach * SUM(od.quantityOrdered)) - (buyPrice * SUM(od.quantityOrdered)) DESC;

-- Nomor 5
SELECT oc.addressLine1 AS 'Alamat',
REPLACE(oc.phone, RIGHT(oc.phone, 6), '* ****') AS 'No Telp',
COUNT(DISTINCT em.employeeNumber) AS 'Jumlah Karyawan',
COUNT(distinct c.customerNumber) AS 'Jumlah Pelanggan',
AVG(p.amount) AS `Rata-rata penghasilan`
FROM offices AS oc
JOIN employees AS em
USING(officeCode)
JOIN customers AS c
ON c.salesRepEmployeeNumber = em.employeeNumber
JOIN payments AS p
USING(customerNumber)
GROUP BY `No Telp`;