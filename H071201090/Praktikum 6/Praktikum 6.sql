#Jawaban No.1
-- SELECT c.customerName,SUM(p.amount) AS Total_Belanja,c.creditLimit,(SUM(p.amount)-c.creditlimit)AS Selisih
-- FROM customers AS c
-- INNER JOIN payments AS p
-- ON c.customerNumber = p.customerNumber
-- GROUP BY p.customerNumber
-- HAVING SUM(p.amount)>c.creditlimit
-- ORDER BY Selisih desc
#Jawaban No.2
-- SELECT CONCAT(c.customerName,' : ' , c.contactFirstName, c.contactLastName, '@', c.addressLine1) AS Pelanggan,
-- SUM(quantityOrdered) AS Jumlah_Orderan
-- FROM customers AS c
-- INNER JOIN orders AS o
-- USING(customerNumber)
-- INNER JOIN orderdetails AS od
-- USING(orderNumber)
-- GROUP BY c.customerName
-- ORDER  BY SUM(quantityOrdered) DESC LIMIT 1;
#Jawaban No.3
-- SELECT CONCAT(MONTHNAME(paymentDate), " " , YEAR(paymentDate)) AS 'Hari Pembayaran',
-- COUNT(c.customerNumber) AS 'Jumlah Pelanggan',
-- group_CONCAT(distinct c.customerName ) AS 'List Pelanggan',
-- SUM(p.amount) AS 'Jumlah Pembayaran'
-- FROM customers AS c
-- INNER JOIN payments AS p
-- USING(customerNumber)
-- GROUP BY `Hari Pembayaran`
-- HAVING `Hari Pembayaran` LIKE "Feb%" 
-- ORDER BY `Jumlah Pembayaran` DESC;
#Jawaban No.4
-- SELECT UPPER (pn.productName) AS 'Nama Produk',COUNT(o.orderDate) AS 'Jumlah di Order',
-- GROUP_CONCAT(o.orderDate) AS 'Waktu Orderan',pn.buyPrice AS 'Harga Beli',od.priceEach AS 'Harga Jual',
-- SUM(od.quantityOrdered) AS 'Total Jumlah Orderan',
-- CONCAT((od.priceEach * SUM(od.quantityOrdered)), ' - ', (pn.buyPrice * SUM(od.quantityOrdered)), ' = ', 
-- (od.priceEach * SUM(od.quantityOrdered)) - (pn.buyPrice * SUM(od.quantityOrdered))) AS 'Pendapatan - Modal = Keuntungan' 
-- FROM products AS pn
-- INNER JOIN orderdetails AS od
-- USING(productCode)
-- INNER JOIN orders AS o
-- USING(orderNumber)
-- WHERE productName LIKE  '%Enzo'
-- GROUP BY `priceEach`
-- ORDER BY (priceEach * SUM(od.quantityOrdered)) - (buyPrice * SUM(od.quantityOrdered)) DESC;
#Jawaban No.5
-- SELECT o.addressLine1 AS 'Alamat',
-- REPLACE(o.phone, RIGHT(o.phone, 6), '* ****') AS 'Nomor Telp',
-- COUNT(DISTINCT em.employeeNumber) AS 'Jumlah Karyawan',
-- COUNT(distinct c.customerNumber) AS 'Jumlah Pelanggan',
-- AVG(p.amount) AS `Rata-rata penghasilan`
-- FROM offices AS o
-- JOIN employees AS em
-- USING(officeCode)
-- JOIN customers AS c
-- ON c.salesRepEmployeeNumber = em.employeeNumber
-- JOIN payments AS p
-- USING(customerNumber)
-- GROUP BY `Nomor Telp`;



