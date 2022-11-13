USE classicmodels;

-- no 1
SELECT 
	c.customerName AS `Nama Pelanggan`, 
	SUM(p.amount) AS `Total Belanja`, 
	c.creditLimit AS `Batas Kredit`, 
	(SUM(p.amount)-c.creditLimit) AS `Selisih`
FROM customers AS c 
JOIN payments AS p 
USING (customerNumber)
GROUP BY c.customerName
HAVING `Total Belanja` > `Batas Kredit`
ORDER BY `Selisih` DESC;

-- no 2
SELECT 
	CONCAT(c.customerName,' : ', c.contactFirstName,' ', c.contactLastName,' @ ', c.addressLine1) AS `Pelanggan`, 
	SUM(od.quantityOrdered) AS `Jumlah Orderan`  
FROM orders o
JOIN customers c
USING (customerNumber)
JOIN orderdetails od 
USING (orderNumber)
HAVING MAX(`Jumlah Orderan`);

-- no 3
SELECT 
	DATE_FORMAT(p.paymentDate, '%M %Y') AS `Hari Pembayaran`, 
	COUNT(DISTINCT p.customerNumber) AS `Jumlah Pelanggan`,
	GROUP_CONCAT(DISTINCT c.customerName ORDER BY c.customerName SEPARATOR ' , ') AS `List Pelanggan`, 
	SUM(DISTINCT p.amount) AS `Jumlah Pembayaran`
FROM payments AS p
JOIN customers AS c
USING (customerNumber)
GROUP BY `Hari Pembayaran`
HAVING `Hari Pembayaran` LIKE "Fe%"
ORDER BY `Jumlah Pembayaran` DESC;

-- no 4
SELECT 
	UPPER(pr.productName) AS `Nama Produk`, 
	COUNT(od.orderNumber) AS `Jumlah Diorder`,
	GROUP_CONCAT(o.orderDate, ' ') AS `Waktu Orderan`, 
	pr.buyPrice AS `Harga Beli`, 
	od.priceEach AS `Harga Jual`,
	SUM(od.quantityOrdered) AS `Total Jumlah Orderan`,
	CONCAT(od.priceEach*SUM(od.quantityOrdered), ' - ', pr.buyPrice*SUM(od.quantityOrdered), ' = ',
		SUM(od.quantityOrdered) * (od.priceEach - pr.buyPrice)) AS `Pendapatan - Modal = Keuntungan`
FROM orders AS o
JOIN orderdetails AS od
USING (orderNumber)
JOIN products AS pr
USING (productCode)
GROUP BY `Harga Jual`
HAVING `Nama Produk` LIKE '%ENZO'
AND SUM(od.quantityOrdered) * (od.priceEach - pr.buyPrice) > 5000
ORDER BY SUM(od.quantityOrdered) * (od.priceEach - pr.buyPrice) DESC;

-- no 5
SELECT 
	o.addressLine1 AS Alamat, 
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
-- ORDER BY `Nomor Telp`;
