#Nomor 1
SELECT c.customerName AS `Nama Pelanggan`, 
SUM(p.amount) AS `Total Belanja`, 
c.creditLimit AS `Batas Kredit`, 
(SUM(p.amount) - c.creditLimit) AS `Selisih`
FROM customers c
JOIN payments p 
USING(customerNumber)
GROUP BY customerName
ORDER BY `Selisih` DESC
LIMIT 5
;



#Nomor 2
SELECT CONCAT(c.customerName, ' : ', c.contactFirstName, c.contactLastName, '@', c.addressLine1) AS `Pelanggan`, 
SUM(od.quantityOrdered) AS `Jumlah Orderan`
FROM customers c
JOIN orders o USING (customerNumber)
JOIN orderdetails od USING (orderNumber)
GROUP BY c.customerNumber
ORDER BY `Jumlah Orderan` DESC
LIMIT 1;



#Nomor 3
SELECT CONCAT(MONTHNAME(p.paymentDate), ' ', YEAR(p.paymentDate)) AS `Hari Pembayaran`, 
COUNT(*) AS `Jumlah Pelanggan`, 
GROUP_CONCAT(c.customerName ORDER BY c.customerName) AS `List Pelanggan`, 
SUM(p.amount) AS `Jumlah Pembayaran`
FROM payments p 
JOIN customers c 
USING(customerNumber)
GROUP BY `Hari Pembayaran`
HAVING `Hari Pembayaran` LIKE 'February%'
ORDER BY `Jumlah Pembayaran` DESC;

SELECT * FROM payments



#Nomor 4
SELECT UPPER(p.productName) AS `Nama Produk`, 
COUNT(*) AS `Jumlah diorder`, 
GROUP_CONCAT(o.orderDate) AS `Waktu Orderan`, 
p.buyPrice AS `Harga Beli`,
od.priceEach AS `Harga Jual`,
SUM(od.quantityOrdered) AS `Total Kuantitas Orderan`,
CONCAT(od.priceEach * SUM(od.quantityOrdered), ' - ', p.buyPrice * SUM(od.quantityOrdered), ' = ', (od.priceEach * SUM(od.quantityOrdered)) - (p.buyPrice * SUM(od.quantityOrdered))) AS `Pendapatan - Modal = Keuntungan`
FROM products p
JOIN orderdetails od 
USING (productCode)
JOIN orders o 
USING (orderNumber)
WHERE p.productName = '2001 Ferrari Enzo'
GROUP BY od.priceEach
HAVING ((od.priceEach * SUM(od.quantityOrdered)) - (p.buyPrice * SUM(od.quantityOrdered))) > 5000
ORDER BY (od.priceEach * SUM(od.quantityOrdered)) - (p.buyPrice * SUM(od.quantityOrdered)) DESC 
;



#Nomor 5
SELECT o.addressLine1 AS Alamat, 
	REPLACE(o.phone, RIGHT(o.phone, 6),'* ****') AS `Nomor Telp`,
	COUNT(DISTINCT e.employeeNumber) AS `Jumlah Karyawan`, 
	COUNT(DISTINCT c.customerNumber) AS `Jumlah Pelanggan`,
	ROUND(AVG(p.amount), 2) AS `Rata-rata Penghasilan`
FROM customers AS c 
JOIN employees AS e
ON e.employeeNumber = c.salesRepEmployeeNumber 
JOIN offices AS o
USING (officeCode)
JOIN payments AS p
USING (customerNumber)
GROUP BY o.phone;




