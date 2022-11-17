USE appseminar;

-- Nomor 1

SELECT m.nama AS 'Nama', m.nim AS 'NIM/NIP', p.nama
FROM ss_mahasiswa m
JOIN ss_prodi p
USING (id_prodi)
WHERE id_prodi LIKE 'H07'
UNION 
SELECT d.nama, d.nip, p.nama
FROM ss_dosen d
JOIN ss_prodi p
USING (id_prodi)
WHERE id_prodi LIKE 'H07';

-- Nomor 2

SELECT `Nama Dosen`, `Nama Prodi`, GROUP_CONCAT( " ", stat) AS `Riwayat Status`
FROM (SELECT DISTINCT ss_dosen.nama AS `Nama Dosen`, ss_prodi.nama AS `Nama Prodi`, (
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
		) AS Riwayat
GROUP BY `Nama Dosen`
HAVING `Riwayat Status` IS NOT NULL
ORDER BY `Nama Dosen` DESC;

-- Nomor 3

USE classicmodels;

SELECT city AS Kota, COUNT(city) AS Jumlah, GROUP_CONCAT(d.nama) AS Nama
FROM (
	SELECT city, c.customerName AS `nama` FROM customers c
	WHERE c.customerName LIKE 'L%'
	UNION 
	SELECT o.city,(SELECT CONCAT(e.firstName, ' ', e.lastName)) AS f FROM employees e
	JOIN offices o
	USING (officeCode)
	HAVING f LIKE 'L%'
	) AS d
GROUP BY city
ORDER BY COUNT(city) DESC 
;

-- SOAL TAMBAHAN 1 & 9

-- NO 1

SELECT e.firstName, o.phone, REPLACE(o.phone, RIGHT(o.phone, 8),'*** ****') AS no_telp FROM employees e
JOIN offices o
USING (officeCode)
WHERE o.phone LIKE '+33%';

-- NO 9

(SELECT c.customerName,p.productName, (SELECT p.buyPrice * SUM(od.quantityOrdered)) AS `modals` 
	FROM customers c
	JOIN orders o USING(customerNumber)
	JOIN orderdetails od USING(orderNumber)
	JOIN products p USING(productCode)
	GROUP BY customerName
	ORDER BY modals DESC
	LIMIT 3)
UNION
(SELECT customerName,p.productName, (SELECT p.buyPrice * SUM(od.quantityOrdered)) AS `modals` 
	FROM customers c
	JOIN orders o USING(customerNumber)
	JOIN orderdetails od USING(orderNumber)
	JOIN products p USING(productCode)
	GROUP BY customerName
	ORDER BY modals ASC
	LIMIT 3);