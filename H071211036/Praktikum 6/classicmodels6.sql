	#NOMOR1
-- SELECT c.customerName AS `Nama Pelanggan`, SUM(p.amount) AS `Total Belanja`,
-- c.creditLimit AS `Batas Kredit`, ((SUM(p.amount)) - c.creditLimit) AS `Selisih`
-- FROM customers AS c
-- JOIN payments AS p
-- USING(customerNumber)
-- GROUP BY c.customerName
-- HAVING `Total Belanja` > `Batas Kredit`
-- ORDER BY `Selisih` DESC

	#NOMOR2
-- SELECT CONCAT(c.customerName, " : ", c.contactFirstName, " ", c.contactLastName, "@", c.AddressLine1)
-- AS `Pelanggan`, SUM(od.quantityOrdered) AS `Jumlah Orderan`
-- FROM customers AS c
-- JOIN orders AS o
-- USING(customerNumber)
-- JOIN orderdetails AS od
-- USING(orderNumber)
-- GROUP BY c.customerName, c.contactFirstName, c.contactLastName, c.AddressLine1
-- ORDER BY `Jumlah Orderan` DESC
-- LIMIT 1

	#NOMOR3
-- SELECT CONCAT(MONTHNAME(p.paymentDate), " ", YEAR(p.paymentDate)) AS `Hari Pembayaran`, count(c.customerNumber) AS `Jumlah Pelanggan`,
-- GROUP_CONCAT(c.customerName SEPARATOR ",") AS `List Pelanggan`,
-- SUM(p.amount) AS `Jumlah Pembayaran`
-- FROM customers AS c
-- JOIN payments AS p
-- USING(customerNumber)
-- WHERE MONTH(p.paymentDate) = 02
-- GROUP BY `Hari Pembayaran`
-- ORDER BY `Jumlah Pembayaran` DESC

	#NOMOR4
-- SELECT UPPER(p.productname) AS `Nama Produk`, COUNT(*) AS `Jumlah Di Order`,
-- GROUP_CONCAT(o.orderDate ORDER BY o.orderDate) AS `Waktu Orderan`,
-- p.buyPrice AS `Harga Beli`, od.priceEach AS `Harga Jual`, SUM(od.quantityOrdered) AS `Total Jumlah Orderan`,
-- CONCAT((od.priceEach*SUM(od.quantityOrdered)), " - ", (p.buyPrice*SUM(od.quantityOrdered)), " = ",
-- ((SUM(od.priceEach*od.quantityOrdered))-(SUM(p.buyPrice*od.quantityOrdered)))) AS `Pendapatan - Modal = Keuntungan`
-- FROM products AS p
-- JOIN orderdetails AS od
-- USING(productCode)
-- JOIN orders AS o
-- USING(orderNumber)
-- WHERE p.productName LIKE "%ENZO%"
-- GROUP BY `Harga jual`
-- HAVING ((SUM(od.priceEach*od.quantityOrdered))-(SUM(p.buyPrice*od.quantityOrdered))) > 5000
-- ORDER BY ((SUM(od.priceEach*od.quantityOrdered))-(SUM(p.buyPrice*od.quantityOrdered))) DESC

	#NOMOR5
-- SELECT o.addressLine1 AS `Alamat`, CONCAT(LEFT(o.phone, 9), '* ****') AS `Nomor Telp`,
-- COUNT(DISTINCT e.employeeNumber) AS `Jumlah Karyawan`, COUNT(DISTINCT c.customerName) AS `Jumlah Pelanggan`,
-- ROUND(AVG(p.amount), 2) AS `Rata-rata Penghasilan`
-- FROM customers AS c
-- JOIN employees AS e
-- ON e.employeeNumber = c.salesRepEmployeeNumber
-- JOIN offices AS o
-- USING(officeCode)
-- JOIN payments AS p
-- USING(customerNumber)
-- GROUP BY `Nomor Telp`