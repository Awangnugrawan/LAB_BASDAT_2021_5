USE appseminar;

SELECT m.nama, p.nama, m.nim
FROM ss_mahasiswa m
JOIN ss_prodi p
USING (id_prodi)
WHERE p.nama LIKE '%Komp%'
UNION
SELECT d.nama, p.id_prodi, d.nip
FROM ss_dosen d
JOIN ss_prodi p
USING (id_prodi)
WHERE p.nama LIKE '%Komp%';

SELECT `Nama Dosen`, `Nama Prodi`, GROUP_CONCAT( " ", stat) AS `Riwayat Status`
FROM (
		SELECT DISTINCT ss_dosen.nama AS `Nama Dosen`, ss_prodi.nama AS `Nama Prodi`, (
			SELECT 'Penguji 1' WHERE ss_penguji.id_penguji_1 = ss_dosen.id_dosen) AS stat
		FROM ss_dosen LEFT JOIN ss_prodi USING(id_prodi), ss_penguji 
		UNION 
		SELECT DISTINCT ss_dosen.nama AS `Nama Dosen`, ss_prodi.nama AS `Nama Prodi`, (
			SELECT 'Penguji 2' WHERE ss_penguji.id_penguji_2 = ss_dosen.id_dosen) AS stat
		FROM ss_dosen LEFT JOIN ss_prodi USING(id_prodi), ss_penguji
		UNION 
		SELECT DISTINCT ss_dosen.nama AS `Nama Dosen`, ss_prodi.nama AS `Nama Prodi`, (
			SELECT 'Penguji 3' WHERE ss_penguji.id_penguji_3 = ss_dosen.id_dosen) AS stat
		FROM ss_dosen LEFT JOIN ss_prodi USING(id_prodi), ss_penguji
		UNION 
		SELECT DISTINCT ss_dosen.nama AS `Nama Dosen`, ss_prodi.nama AS `Nama Prodi`, (
			SELECT 'Pembimbing Utama' WHERE ss_pembimbing.id_pembimbing_utama = ss_dosen.id_dosen) AS stat
		FROM ss_dosen LEFT JOIN ss_prodi USING(id_prodi), ss_pembimbing
		UNION 
		SELECT DISTINCT ss_dosen.nama AS `Nama Dosen`, ss_prodi.nama AS `Nama Prodi`, (
			SELECT 'Pembimbing Pertama' WHERE ss_pembimbing.id_pembimbing_pertama = ss_dosen.id_dosen) AS stat
		FROM ss_dosen LEFT JOIN ss_prodi USING(id_prodi), ss_pembimbing
		UNION 
		SELECT DISTINCT ss_dosen.nama AS `Nama Dosen`, ss_prodi.nama AS `Nama Prodi`, (
			SELECT 'Pembimbing Kedua' WHERE ss_pembimbing.id_pembimbing_kedua = ss_dosen.id_dosen) AS stat
		FROM ss_dosen LEFT JOIN ss_prodi USING(id_prodi), ss_pembimbing
	) AS riwayat
GROUP BY `Nama Dosen`
HAVING `Riwayat Status` IS NOT NULL 
ORDER BY `Nama Dosen` DESC;

-- Nomor 3
USE classicmodels;

SELECT city, count(*), group_concat(nama) 
FROM (SELECT customerName AS `Nama` , c.city 
	FROM customers c 
	WHERE customerName LIKE 'l%'
	UNION
	SELECT concat(e.firstName, ' ', e.lastName) AS `Name`, o.city 
	FROM employees e 
	JOIN offices o USING (officeCode)
	HAVING `Name` LIKE 'l%') AS sembarang
GROUP BY city
ORDER BY count(*) DESC;

SELECT customerName, quantityOrdered, productName, amount  
FROM customers
JOIN orders USING(customerNumber)
JOIN orderdetails USING(orderNumber)
JOIN products USING(productCode)
JOIN payments USING(customerNumber)
WHERE quantityOrdered < (SELECT avg(quantityOrdered) FROM orderdetails ) AND 
		amount > (SELECT avg(amount) FROM payments)
GROUP BY customerNumber 
ORDER BY amount DESC;