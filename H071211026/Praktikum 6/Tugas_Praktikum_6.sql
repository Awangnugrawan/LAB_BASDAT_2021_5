USE classicmodels;

-- NO 1
SELECT c.customerName AS 'Nama Pelanggan', 
		 SUM(p.amount) AS 'Total Belanja', 
		 c.creditLimit AS 'Batas Kredit', 
		 (SUM(p.amount) - c.creditLimit) AS 'Selisih'
FROM customers c
JOIN payments p
USING (customerNumber)
GROUP BY c.customerName
HAVING SUM(p.amount) > c.creditLimit
ORDER BY Selisih DESC;

-- NO 2
SELECT CONCAT(c.customerName, ' : ', c.contactFirstName, ' ', c.contactLastName, ' @ ', c.addressLine1) AS `Pelanggan`, 
		 SUM(d.quantityOrdered) AS `Jumlah Orderan`
FROM customers c
JOIN orders o
USING (customerNumber)
JOIN orderdetails d
USING (orderNumber)
GROUP BY c.customerName
ORDER BY `Jumlah Orderan` DESC
LIMIT 1;

-- NO 3
SELECT CONCAT(MONTHNAME(p.paymentDate), ' ', YEAR(p.paymentDate)) AS 'Hari Pembayaran', 
		 COUNT(*) AS 'Jumlah Pelanggan', 
		 GROUP_CONCAT(c.customerName ORDER BY c.customerName) AS 'List Pelanggan', 
		 SUM(p.amount) AS 'Jumlah Pembayaran'
FROM payments p
JOIN customers c
USING (customerNumber)
GROUP BY `Hari Pembayaran`
HAVING `Hari Pembayaran` LIKE 'February%'
ORDER BY `Jumlah Pembayaran` DESC;

-- NO 4
SELECT UPPER(pr.productName) AS 'Nama Produk',
		 COUNT(*) AS 'Jumlah di Order', 
		 GROUP_CONCAT(o.orderDate) AS 'Waktu Orderan',
		 pr.buyPrice AS 'Harga Beli',
		 d.priceEach AS 'Harga Jual',
		 SUM(d.quantityOrdered) AS 'Total Kuantitas Orderan',
		 CONCAT(SUM(d.priceEach * d.quantityOrdered), ' - ', SUM(pr.buyPrice * d.quantityOrdered), ' = ', (SUM(d.priceEach * d.quantityOrdered) - SUM(pr.buyPrice * d.quantityOrdered ))) AS 'Pendapatan - Modal = Keuntungan'
FROM customers c
JOIN orders o
USING (customerNumber)
JOIN orderdetails d
USING (orderNumber)
JOIN products pr
USING (productCode)
WHERE pr.productName LIKE '%Enzo%'
GROUP BY `Harga Jual`
ORDER BY SUM(pr.buyPrice * d.quantityOrdered) DESC;

-- NO 5
SELECT o.addressLine1 AS 'Alamat', 
	REPLACE(o.phone, RIGHT(o.phone, 6), '* ****') AS 'Nomor Telp', 
	COUNT(DISTINCT employeeNumber) AS 'Jumlah Karyawan',
	COUNT(DISTINCT c.customerNumber) AS 'Jumlah Pelanggan',
	ROUND(AVG(amount), 2) AS 'Rata - Rata Pengahasilan'
FROM employees e
JOIN customers c
ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN offices o
USING(officeCode)
JOIN payments p
ON c.customerNumber = p.customerNumber
WHERE e.jobTitle = 'Sales Rep'
GROUP BY officeCode
ORDER BY `Nomor Telp`;